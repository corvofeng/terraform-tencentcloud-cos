variable "create_bucket" {
  description = "Controls if COS bucket should be created."
  type        = bool
  default     = true
}

variable "create_bucket_domain_certificate" {
  description = "Controls if COS bucket domain certificate should be created."
  type        = bool
  default     = false
}

variable "create_bucket_policy" {
  description = "Controls if COS bucket policy should be created."
  type        = bool
  default     = false
}

###############
# COS Bucket
###############

variable "appid" {
  description = "Your appid."
  type        = string
  default     = ""
}

variable "bucket_name" {
  description = "The name of the bucket."
  type        = string
  default     = ""
}

variable "bucket_acl" {
  description = "Access control list for the bucket."
  type        = string
  default     = "private"
}

variable "acl_body" {
  description = "The XML format of Access control list for the bucket."
  type        = string
  default     = null
}

variable "cors_rules" {
  description = "A rule of Cross-Origin Resource Sharing for the bucket."
  default     = []
}

variable "encryption_algorithm" {
  description = "The server-side encryption algorithm to the bucket."
  type        = string
  default     = "AES256"
}

variable "force_clean" {
  description = "Whether to force cleanup all objects before delete bucket."
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "List of lifecycle rules for the COS bucket"
  type = list(object({
    filter_prefix = optional(string, "") # Prefix to filter objects for the rule
    expiration = optional(list(object({
      date = optional(string, null) # Expiration date in ISO 8601 format
      days = optional(number, null) # Number of days after object creation to expire
    })), [])
    transition = optional(list(object({
      storage_class = optional(string, null) # Storage class to transition to
      date          = optional(string, null) # Transition date in ISO 8601 format
      days          = optional(number, null) # Number of days after object creation to transition
    })), [])
  }))
  default = []
}

variable "log_enable" {
  description = "Indicate the access log of this bucket to be saved or not."
  type        = bool
  default     = false
}

variable "log_prefix" {
  description = "The prefix log name which saves the access log of this bucket per 5 minutes. Eg. MyLogPrefix/. The log access file format is log_target_bucket/log_prefix{YYYY}/{MM}/{DD}/{time}{random}{index}.gz. Only valid when log_enable is true."
  type        = string
  default     = ""
}

variable "log_target_bucket" {
  description = "The target bucket name which saves the access log of this bucket per 5 minutes. The log access file format is log_target_bucket/log_prefix{YYYY}/{MM}/{DD}/{time}{random}{index}.gz. Only valid when log_enable is true. User must have full access on this bucket."
  type        = string
  default     = ""
}

variable "multi_az" {
  description = "Indicates whether to create a bucket of multi available zone. NOTE: If set to true, the versioning must enable."
  type        = bool
  default     = false
}

variable "origin_domain_rules" {
  description = "Bucket Origin Domain settings"
  type        = list(map(string))
  default     = []
}

variable "origin_pull_rules" {
  description = "Bucket Origin-Pull settings."
  default     = []
}

variable "replica_role" {
  description = "Request initiator identifier, format: qcs::cam::uin/<owneruin>:uin/<subuin>. NOTE: only versioning_enable is true can configure this argument."
  type        = string
  default     = ""
}

variable "replica_rules" {
  description = "List of replica rule. NOTE: only versioning_enable is true and replica_role set can configure this argument."
  type        = list(map(string))
  default     = []
}

variable "versioning_enable" {
  description = "Enable bucket versioning."
  type        = bool
  default     = false
}

variable "website" {
  description = "A website object"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

###############
# domain certificate attachment
###############

variable "domain_certificate" {
  description = "The certificate of specified doamin."
  default     = []
}

###############
# Bucket policy
###############

variable "policy" {
  description = "The text of the policy."
  type        = string
  default     = ""
}
