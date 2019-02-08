workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Docker"]
}

action "docker" {
  uses = "actions/docker/cli@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  args = "build -t tettaji/hello:${GITHUB_SHA} Hello1"
}

action "docker-1" {
  uses = "actions/docker/login@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  needs = ["docker"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  needs = ["docker-1"]
  args = "push tettaji/hello"
}

workflow "Second workflow" {
  on = "repository_dispatch"
  resolves = ["Pull"]
}

action "Pull" {
  uses = "actions/docker/cli@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  args = "pull tettaji/hello"
}
