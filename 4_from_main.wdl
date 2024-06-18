task task_4_from_main {
  String addressee
  command {
    echo "Hello ${addressee}!"
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow four_from_main {
  call task_4_from_main
}
