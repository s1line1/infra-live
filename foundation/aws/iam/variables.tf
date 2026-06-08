variable "region" {
  type = string
  default = "us-west-1"
}

variable "github_org" {
  type        = string
  description = "GitHub Organization/User"
}

variable "github_repo" {
  type        = string
  description = "GitHub Repository Name"
}

variable "github_branch" {
  type        = string
  description = "GitHub Branch"
  default     = "feature_cloud"
}