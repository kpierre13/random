version 1.0

task test_equality {

  command {
    echo "hi!"
  }

  Array[Pair[String, Int]] test = [ (1, 1), ("two", 2), ("three", 3) ]

  output {
    Array[Pair[String, Int]] testOut = test
  }

  meta {
    volatile: true
  }
  
  runtime {
    docker: "ubuntu:latest"
    maxRetries: 5
  }
}

workflow eqality_testing {
  call test_equality
  output {
    Array[Pair[String, Int]] s1 = test_equality.testOut
  }
}
