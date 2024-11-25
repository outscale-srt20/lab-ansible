variable "region" {
  default     = "cloudgouv-eu-west-1"
  type        = string
  description = "The outscale region"
}

variable "access_key_id" {
  type      = string
  sensitive = true
}

variable "secret_key_id" {
  type      = string
  sensitive = true
}

