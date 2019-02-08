workflow "Docker pipeline" {
  on = "push"
  resolves = ["push"]
}

action "build" {
  uses = "actions/docker/cli@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  args = "build -t tettaji/hello:${GITHUB_SHA} Hello1"
}

action "login" {
  uses = "actions/docker/login@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["build"]
}

action "push" {
  uses = "actions/docker/cli@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  args = "push tettaji/hello:${GITHUB_SHA}"
  needs = ["login"]
}

workflow "Second workflow" {
  on = "repository_dispatch"
  resolves = ["Pull"]
}

action "Pull" {
  uses = "actions/docker/cli@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  args = "pull tettaji/hello"
}
