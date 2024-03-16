provider "aws" {
    region = "us-east-2"  
}
resource "awscc_ecr_repository" "second-repo" {
  repository_name      = "any-app2"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration = {
    scan_on_push = true
  }

}