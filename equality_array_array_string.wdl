task test_equality {
  Array[Array[String]] test = [ ["hello"], ["goodbye", "or", "hello"], ["hello again"] ]

  command {
    echo "hi!"
  }

  output {
      Array[Array[String]] testOut = test
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow eqality_testing {
  call test_equality

  output {
    Array[Array[String]] s1 = test_equality.testOut
  }
}
