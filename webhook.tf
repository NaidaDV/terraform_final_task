resource "github_repository_webhook" "jenkins_hook" {
  repository = "biotestmine"

#  name = "web"

  configuration {
    url          = "http://${aws_instance.ci.public_ip}:8080/github-webhook/"
    content_type = "form"
    insecure_ssl = false
  }


  events = ["push"]
}
