variable "app-region" {
  type = map(string)

  default = {
    default = "ap-south-1"
    game_launch_region = "us-east-1"
    ngnix_server_region = "eu-west-1"
  }
}
