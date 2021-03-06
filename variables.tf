variable "environment" {
  description = "Environment descriptor."
  type = string
}

variable "port" {
  default = 6379
  type = number
}

variable "cache_identifier" {
  description = "Name of cluster"
}

variable "parameter_group_name" {
  default = "default.redis5.0"
}

variable "maintenance_window" {}

variable "desired_clusters" {
  default = "1"
}

variable "instance_type" {
  default = "cache.t2.micro"
}

variable "engine_version" {
  default = "5.0.6"
}

variable "automatic_failover_enabled" {
  default = false
}

variable "alarm_cpu_threshold" {
  default = "75"
}

variable "alarm_memory_threshold" {
  # 10MB
  default = "10000000"
}

variable "common_tags" {
  type        = map(string)
  description = "Implements the common tags scheme."
}

variable "private_subnet_tag" {
  type        = string
  description = "The tag to get the private subnet."
  default = "private"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC for the elastic cache to be deployed."
}

variable "aws_region" {
  type        = string
  description = "The aws region for ElasticCache to be deployed in."
}

variable "snapshot_window" {
  type = string
  description = "The day/time to create a snapshot."
}

variable "at_rest_encryption_enabled" {
  type        = bool
  description = "To enable encrypt data on rest."
  default     = false
}

variable "transit_encryption_enabled" {
  type        = bool
  description = "To enable transit encryption."
  default     = false
}

variable "snapshot_retention_limit" {
  type        = number
  description = "The rention period to hold the snapshot for."
  default     = 1
}

variable "alarm_description" {
  type        = string
  description = "The alarm description."
}

variable "comparison_operator" {
  type         = string
  description = "Comparison operator."
  default      = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  type        = string
  description = "The evaluation period."
  default     = "1"
}

variable "metric_name" {
  type        = string
  description = "The name metric name."
  default     = "CPUUtilization"
}

variable "namespace" {
  type        = string
  description = "The namespace for the metric."
  default     = "AWS/ElastiCache"
}

variable "cache_cpu_metric_alarm_period" {
  type        = string
  description = "The amount of time for a metric alarm."
}

variable "cache_cpu_metric_alarm_statistic" {
  type        = string
  description = "The statistic for the metric alarm."
  default     = "Average"
}

variable "cloudwatch_metric_alarm_description" {
  type        = string
  description = "The description for the cloudwatch alarm."

}

variable "cloudwatch_metric_alarm_comparison_operator" {
  type        = string
  description = "The comparison operator for the metric alarm."
  default     = "LessThanThreshold"
}

variable "cloudwatch_metric_alarm_evaluation_periods" {
  type        = string
  description = "Evaluation period for the alarm."
  default     = "1"
}

variable "cloudwatch_metric_alarm_metric_name" {
  type        = string
  description = "The name for the metric alarm."
  default     = "FreeableMemory"
}

variable "cloudwatch_metric_alarm_namespace" {
  type        = string
  description = "the namespace for the metric."
  default     = "AWS/ElastiCache"
}

variable "cloudwatch_metric_alarm_period" {
  type        = string
  description = "The alarm period for the metric."
  default     = "60"
}

variable "cloudwatch_metric_alarm_statistic" {
  type        = string
  description = "The statistic for the alarm."
  default     = "Average"
}