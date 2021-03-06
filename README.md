# ElastiCache

## This is the terraform code for provisioning & managing ElastiCache clusters in AWS.

ElastiCache is a managed service by AWS that provides access to resources such as Redis or Memcache.
AWS will handle all of the backup and disaster recovery requirements and users simply have to just plug their applications into the service to get it up and running.

## Redis - Creating a Manual Backup (Console)

Sign in to the AWS Management Console and open the ElastiCache console at https://console.aws.amazon.com/elasticache/.

From the navigation pane, choose Redis. The Redis clusters screen appears.

Choose the box to the left of the name of the Redis cluster you want to back up.

Choose Backup.

In the Create Backup dialog, type in a name for your backup in the Backup Name box. We recommend that the name indicate which cluster was backed up and the date and time the backup was made.

Cluster naming constraints are as follows:

-Must contain 1–40 alphanumeric characters or hyphens.

-Must begin with a letter.

-Can't contain two consecutive hyphens.

-Can't end with a hyphen.

Choose Create Backup.

The status of the cluster changes to snapshotting. When the status returns to available the backup is complete.

### Performance Impact of Backups
Redis backups choose between two methods. If there isn't enough memory to support a forked backup, ElastiCache use a forkless method that uses cooperative background processing. If there is enough memory to support a forked save process, the same process is used as in earlier Redis versions.

## Restoring From a Backup (Console)

Sign in to the AWS Management Console and open the ElastiCache console at https://console.aws.amazon.com/elasticache/.

From the navigation pane, choose Backups.

In the list of backups, choose the box to the left of the backup name you want to restore from.

Choose Restore.

Complete the Restore Cluster dialog box. Be sure to complete all the "Required" fields and any of the others you want to change from the defaults.

More information at https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-describing.html

