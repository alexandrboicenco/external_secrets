variable "namespace" {
  type        = string
  description = "Namespace to deploy External Secrets"
  default     = "external-secrets"
}

variable "db_user" {
  type        = string
  description = "DB user"
  default     = "admin"
}

variable "db_host" {
  type        = string
  description = "DB host"
  default     = "wordpress-mysql"
}

variable "db_password" {
  type        = string
  description = "DB password"
  default     = "password"
}

variable "db_name" {
  type        = string
  description = "DB name"
  default     = "wordpress"
}