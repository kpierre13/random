import "sub_wdl.wdl" as sub

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

workflow main_workflow {
    call test_equality
    call sub.hello_and_goodbye { input: hello_and_goodbye_input = "sub world" }
    
    # call myTask { input: hello_and_goodbye.hello_output }
    
    output {
        Array[Pair[String, Int]] s1 = test_equality.testOut
        String main_output = hello_and_goodbye.hello_output
    }
}
