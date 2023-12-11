package riscv.singlecycle

import board.basys3.BootStates
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

import riscv.{Parameters, TestAnnotations}

import board.z710.Top


class BoardSayGoodbyeTest extends  AnyFlatSpec with ChiselScalatestTester {
  behavior of "Board Single"
  it should "say goodbye" in {
    test(new Top("say_goodbye.asmbin")).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) 
    { c =>
      for (i <- 1 to 200) {
        c.clock.step(1000)
        c.io.rx.poke((i % 2).B) // Avoid timeout
      }
    } 
  }
}

