workflow "New workflow" {
  on = "push"
  resolves = ["docker"]
}

action "docker" {
  uses = "actions/docker/cli@aea64bb1b97c42fa69b90523667fef56b90d7cff"
  args = "build -t test Hello1"
}
