resource "aws_elasticache_subnet_group" "redis_subnet" {
  name       = "${upper(var.environment)}-${upper(var.cache_identifier)}-REDIS-SUBNET-GRP"
  subnet_ids = data.aws_subnet_ids.private.ids
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "storage"
  replication_group_description = "App storage cache"
  automatic_failover_enabled    = var.automatic_failover_enabled
  number_cache_clusters         = var.desired_clusters
  node_type                     = var.instance_type
  engine_version                = var.engine_version
  parameter_group_name          = var.parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.redis_subnet.name
  security_group_ids            = [aws_security_group.redis_sg.id]
  maintenance_window            = var.maintenance_window
  notification_topic_arn        = aws_sns_topic.redis_sns_topic.arn
  port                          = var.port
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               =  var.snapshot_window
  
  tags = merge(
  var.common_tags, {
    Name        = "${upper(var.environment)}-${upper(var.cache_identifier)}-REDIS-REPLICA"
  })

  depends_on                    = [aws_security_group.redis_sg]
}