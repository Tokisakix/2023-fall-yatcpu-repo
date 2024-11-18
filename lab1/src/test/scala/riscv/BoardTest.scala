package riscv

import board.z710.Top

import riscv.{Parameters, TestAnnotations}
import chisel3._
import chisel3.util.{is, switch}
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import board.{z710, z710v1_3, verilator}


class Z710_SayGoodbyeTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Z710 Board simulation"
  it should "say goodbye " in {
    test(new z710.Top("say_goodbye.asmbin")).withAnnotations(TestAnnotations.annos) { c => 
      
      for (i <- 1 to 50000) {
        c.clock.step(5)
        c.io.rx.poke((i % 2).U) // poke some useless value, since rx not yet used
      }  
    }
  }
}

class Z710v13_SayGoodbyeTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Z710v1.3 Board simulation"
  it should "say goodbye " in {
    test(new z710v1_3.Top("say_goodbye.asmbin")).withAnnotations(TestAnnotations.annos) { c => 
      
      for (i <- 1 to 50000) {
        c.clock.step(5)
        c.io.rx.poke((i % 2).U) // poke some useless value, since rx not yet used
      }  
    }
  }
}


