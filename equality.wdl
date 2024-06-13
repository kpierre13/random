task test_equality {
  Array[Pair[String, Int]] test = [ (1, 1), ("two", 2), ("three", 3) ]

  command {
    echo "hi!"
  }

  output {
      Array[Pair[String, Int]] testOut = test
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow eqality_testing {
  call test_equality

  output {
    Array[Pair[String, Int]] s1 = test_equality.testOut
  }
}
