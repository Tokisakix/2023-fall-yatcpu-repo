# Copyright 2022 Canbin Huang
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

.globl _start
_start:
  csrr a0, cycle

  addi t0, zero, 1
  sub t1, zero, t0
  and t2, t0, t1
  sw t2, 4(zero)
  j skip1
  or t2, t0, t1
  xor t2, t0, t1

skip1:
  addi t1, t2, 1
  add t2, t1, t2
  and t2, t1, t2
  lw t2, 2(t2)
  or t3, t1, t2
  blt t2, t3, skip2
  or t3, t0, t0
  xor t3, t0, t1

skip2:
  addi t4, zero, 3
  bne t3, t4, skip1
  sw t3, 8(zero)
  auipc t4, 0
  jalr t4, 8(t4)
  jalr t4, 4(t4)
  csrr a1, cycle
  sub ra, a1, a0

loop:
  j loop