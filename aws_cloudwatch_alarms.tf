resource "aws_sns_topic" "redis_sns_topic" {
  name = "${var.environment}-REDIS-SNS-TOPIC"
}

resource "aws_cloudwatch_metric_alarm" "cache_cpu" {
  count = var.desired_clusters
  alarm_name          = "${var.environment}-${var.cache_identifier}-CACHE-${count.index + 1}-CPUUTILIZATION"
  alarm_description   = var.alarm_description
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.cache_cpu_metric_alarm_period
  statistic           = var.cache_cpu_metric_alarm_statistic

  threshold = var.alarm_cpu_threshold

  dimensions = {
    CacheClusterId = "${aws_elasticache_replication_group.redis.id}-${count.index + 1}"
  }

  alarm_actions = [aws_sns_topic.redis_sns_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "cache_memory" {
  count               = var.desired_clusters
  alarm_name          = "${var.environment}-${var.cache_identifier}-CACHE-${count.index + 1}-FREEABLEMEMORY"
  alarm_description   = var.cloudwatch_metric_alarm_description
  comparison_operator = var.cloudwatch_metric_alarm_comparison_operator
  evaluation_periods  = var.cloudwatch_metric_alarm_evaluation_periods
  metric_name         = var.cloudwatch_metric_alarm_metric_name
  namespace           = var.cloudwatch_metric_alarm_namespace
  period              = var.cloudwatch_metric_alarm_period
  statistic           = var.cloudwatch_metric_alarm_statistic

  threshold = var.alarm_memory_threshold

  dimensions = {
    CacheClusterId = "${aws_elasticache_replication_group.redis.id}-${count.index + 1}"
  }

  alarm_actions = [aws_sns_topic.redis_sns_topic.arn]
}