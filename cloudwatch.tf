resource "aws_cloudwatch_dashboard" "ec2_dashboard" {
  dashboard_name = "ec2-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric",
        x      = 0,
        y      = 0,
        width  = 12,
        height = 6,
        properties = {
          metrics = [
            ["CWAgent", "mem_used_percent", "InstanceId", aws_instance.wordpress.id],
            ["CWAgent", "disk_used_percent", "InstanceId", aws_instance.wordpress.id],
            ["AWS/EC2", "CPUUtilization", "InstanceId", aws_instance.wordpress.id]
          ],
          view    = "timeSeries",
          stacked = false,
          region  = var.region,
          title   = "EC2 - Custom Metrics"
        }
      }
    ]
  })
}

resource "aws_cloudwatch_dashboard" "rds_dashboard" {
  dashboard_name = "RDS-Dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric",
        x      = 0,
        y      = 0,
        width  = 12,
        height = 6,
        properties = {
          title  = "RDS CPU Utilization",
          view   = "timeSeries",
          region = var.region,
          metrics = [
            ["AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", aws_db_instance.wordpress_db.id]
          ],
          stat   = "Average",
          period = 300
        }
      },
      {
        type   = "metric",
        x      = 12,
        y      = 0,
        width  = 12,
        height = 6,
        properties = {
          title  = "RDS Database Connections",
          view   = "timeSeries",
          region = var.region,
          metrics = [
            ["AWS/RDS", "DatabaseConnections", "DBInstanceIdentifier", aws_db_instance.wordpress_db.id]
          ],
          stat   = "Average",
          period = 300
        }
      },
      {
        type   = "metric",
        x      = 0,
        y      = 6,
        width  = 12,
        height = 6,
        properties = {
          title  = "RDS Freeable Memory",
          view   = "timeSeries",
          region = var.region,
          metrics = [
            ["AWS/RDS", "FreeableMemory", "DBInstanceIdentifier", aws_db_instance.wordpress_db.id]
          ],
          stat   = "Average",
          period = 300
        }
      },
      {
        type   = "metric",
        x      = 12,
        y      = 6,
        width  = 12,
        height = 6,
        properties = {
          title  = "RDS Free Storage Space",
          view   = "timeSeries",
          region = var.region,
          metrics = [
            ["AWS/RDS", "FreeStorageSpace", "DBInstanceIdentifier", aws_db_instance.wordpress_db.id]
          ],
          stat   = "Average",
          period = 300
        }
      }
    ]
  })
}

resource "aws_cloudwatch_log_group" "wordpress_logs" {
  name              = "/ec2/wordpress"
  retention_in_days = 7
}

