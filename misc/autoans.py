#!/usr/bin/env python3
"""
Code Auto-Filler Tool

This tool reads a YAML configuration file containing code snippets and operations,
then applies them to target files. It supports two main operations:
1. Adding import statements at the beginning of files
2. Inserting code blocks after specific anchor comments
"""

import yaml
import os
import sys
import argparse
from pathlib import Path
from typing import Dict, List, Optional


class CodeFiller:
    def __init__(self, config_file: str, base_path: str = "."):
        """
        Initialize the code filler.
        
        Args:
            config_file: Path to the YAML configuration file
            base_path: Base directory for resolving relative target file paths
        """
        self.config_file = config_file
        self.base_path = Path(base_path).resolve()
        self.config = self._load_config()
    
    def _load_config(self) -> Dict:
        """Load and parse the YAML configuration file."""
        try:
            with open(self.config_file, 'r', encoding='utf-8') as f:
                config = yaml.safe_load(f)
            return config
        except FileNotFoundError:
            print(f"Error: Configuration file '{self.config_file}' not found.")
            sys.exit(1)
        except yaml.YAMLError as e:
            print(f"Error parsing YAML file: {e}")
            sys.exit(1)
    
    def _resolve_target_path(self, target_file: str) -> Path:
        """Resolve the target file path relative to base path."""
        if os.path.isabs(target_file):
            return Path(target_file)
        return self.base_path / target_file
    
    def _backup_file(self, file_path: Path) -> None:
        """Create a backup of the original file."""
        backup_path = file_path.with_suffix(file_path.suffix + '.backup')
        if file_path.exists():
            with open(file_path, 'r', encoding='utf-8') as src:
                with open(backup_path, 'w', encoding='utf-8') as dst:
                    dst.write(src.read())
            print(f"  Backup created: {backup_path}")
    
    def _add_imports(self, lines: List[str], imports: List[str]) -> List[str]:
        """
        Add import statements after the package declaration.
        
        Args:
            lines: Original file lines
            imports: List of import statements to add
            
        Returns:
            Modified file lines with imports added
        """
        # Find the insertion point (after package declaration)
        insert_index = 0
        
        # Find package declaration
        for i, line in enumerate(lines):
            stripped = line.strip()
            if stripped.startswith('package '):
                insert_index = i + 1
                break
        
        # Insert imports after package declaration
        new_lines = lines[:insert_index]
        
        # Add the imports
        for import_stmt in imports:
            new_lines.append(import_stmt + '\n')
        
        # Add a blank line after imports if there are remaining lines
        if insert_index < len(lines):
            new_lines.append('\n')
        
        new_lines.extend(lines[insert_index:])
        
        print(f"    Added {len(imports)} import statement(s)")
        
        return new_lines
    
    def _insert_after_anchor(self, lines: List[str], anchor: str, code: str) -> List[str]:
        """
        Insert code after a specific anchor comment.
        
        Args:
            lines: Original file lines
            anchor: The anchor comment to search for
            code: The code block to insert
            
        Returns:
            Modified file lines with code inserted
            
        Raises:
            ValueError: If the anchor comment is not found in the file
        """
        anchor_found = False
        new_lines = []
        
        for i, line in enumerate(lines):
            new_lines.append(line)
            
            if anchor.strip() in line.strip():
                anchor_found = True
                
                # Extract indentation from the anchor line
                anchor_indent = ""
                for char in line:
                    if char in [' ', '\t']:
                        anchor_indent += char
                    else:
                        break
                
                # Add the code block after the anchor with proper indentation
                code_lines = code.strip().split('\n')
                for code_line in code_lines:
                    # Apply anchor indentation to non-empty lines
                    if code_line.strip():
                        indented_line = anchor_indent + code_line
                    else:
                        indented_line = code_line  # Keep empty lines as-is
                    new_lines.append(indented_line + '\n')
                print(f"    Inserted code after anchor: {anchor.strip()}")
        
        if not anchor_found:
            raise ValueError(f"Anchor '{anchor.strip()}' not found in file")
        
        return new_lines
    
    def _replace_between_anchors(self, lines: List[str], begin_anchor: str, end_anchor: str, code: str) -> List[str]:
        """
        Replace the contents between begin_anchor and end_anchor with the given code.
        Preserves indentation of the begin_anchor.
        Raises ValueError if anchors are not found or in wrong order.
        """
        begin_idx = end_idx = None
        anchor_indent = ""
        for i, line in enumerate(lines):
            if begin_anchor.strip() == line.strip():
                begin_idx = i
                # Extract indentation from the begin anchor line
                for char in line:
                    if char in [' ', '\t']:
                        anchor_indent += char
                    else:
                        break
            if end_anchor.strip() == line.strip():
                end_idx = i
                break
        if begin_idx is None:
            raise ValueError(f"Begin anchor '{begin_anchor}' not found in file")
        if end_idx is None:
            raise ValueError(f"End anchor '{end_anchor}' not found in file")
        if end_idx <= begin_idx:
            raise ValueError(f"End anchor '{end_anchor}' @ {end_idx=} found before begin anchor '{begin_anchor} @ {begin_idx=}'")
        
        # Build new lines
        new_lines = lines[:begin_idx+1]
        code_lines = code.strip().split('\n')
        for code_line in code_lines:
            if code_line.strip():
                indented_line = anchor_indent + code_line
            else:
                indented_line = code_line
            new_lines.append(indented_line + '\n')
        new_lines.extend(lines[end_idx:])
        
        print(f"    Replaced code between anchors: {begin_anchor.strip()} ... {end_anchor.strip()}")
        
        return new_lines
    
    def _process_file(self, target_file: str, operations: Dict) -> None:
        """
        Process a single target file with the specified operations.
        
        Args:
            target_file: Path to the target file
            operations: Dictionary containing imports and anchors operations
        """
        file_path = self._resolve_target_path(target_file)
        print(f"Processing: {file_path}")
        
        # Check if file exists
        if not file_path.exists():
            raise FileNotFoundError(f"Target file '{file_path}' does not exist")
        
        # Create backup
        self._backup_file(file_path)
        
        # Read the original file
        with open(file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        modified_lines = lines[:]
        
        # Process imports
        if 'imports' in operations and operations['imports']:
            modified_lines = self._add_imports(modified_lines, operations['imports'])
        
        # Process anchor insertions and replacements
        if 'anchors' in operations and operations['anchors']:
            for anchor, config in operations['anchors'].items():
                if 'code' in config and 'end_anchor' in config:
                    try:
                        modified_lines = self._replace_between_anchors(
                            modified_lines, anchor, config['end_anchor'], config['code']
                        )
                    except ValueError as e:
                        raise ValueError(f"Failed to process file '{target_file}': {e}") from e
                elif 'code' in config:
                    try:
                        modified_lines = self._insert_after_anchor(
                            modified_lines, anchor, config['code']
                        )
                    except ValueError as e:
                        raise ValueError(f"Failed to process file '{target_file}': {e}") from e
        
        # Write the modified file
        with open(file_path, 'w', encoding='utf-8') as f:
            f.writelines(modified_lines)
        
        print(f"  ✓ File processed successfully")
    
    def fill_codes(self, dry_run: bool = False) -> None:
        """
        Execute the code filling process for all files in the configuration.
        
        Args:
            dry_run: If True, only show what would be done without making changes
        """
        if 'files' not in self.config:
            print("Error: No 'files' section found in configuration")
            return
        
        if dry_run:
            print("DRY RUN MODE - No files will be modified\n")
        
        print(f"Base directory: {self.base_path}")
        print(f"Configuration: {self.config_file}\n")
        
        for target_file, operations in self.config['files'].items():
            if dry_run:
                print(f"Would process: {target_file}")
                if 'imports' in operations:
                    print(f"  Would add {len(operations['imports'])} import(s)")
                if 'anchors' in operations:
                    print(f"  Would process {len(operations['anchors'])} anchor(s)")
                print()
            else:
                try:
                    self._process_file(target_file, operations)
                    print()
                except ValueError as e:
                    print(f"  ✗ {e}")
                    print(f"\nExecution stopped due to configuration error.")
                    sys.exit(1)
                except Exception as e:
                    print(f"  ✗ Unexpected error processing file: {e}")
                    print(f"\nExecution stopped due to unexpected error.")
                    sys.exit(1)
        
        if not dry_run:
            print("Code filling completed!")


def main():
    parser = argparse.ArgumentParser(
        description="Automatically fill code into target files based on YAML configuration"
    )
    parser.add_argument(
        'config_file',
        help='Path to the YAML configuration file'
    )
    parser.add_argument(
        '-b', '--base-path',
        default='.',
        help='Base directory for resolving target file paths (default: current directory)'
    )
    parser.add_argument(
        '-d', '--dry-run',
        action='store_true',
        help='Show what would be done without making any changes'
    )
    parser.add_argument(
        '-v', '--version',
        action='version',
        version='Code Auto-Filler 1.0.0'
    )
    
    args = parser.parse_args()
    
    # Create and run the code filler
    filler = CodeFiller(args.config_file, args.base_path)
    filler.fill_codes(dry_run=args.dry_run)


if __name__ == '__main__':
    main()
