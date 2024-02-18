function handler () {
  EVENT_DATA=$1
  DATE=$(date +"%Y-%m-%d")
  BACKUP_FILE_NAME="wood-labeler-db-backup-$DATE.sql"
  bin/pg_dump --dbname=postgresql://$DB_USERNAME:$DB_PASSWORD@$DB_HOST/$DB_NAME --verbose --clean --no-owner --no-acl --format=c  > /tmp/$BACKUP_FILE_NAME
  aws s3 cp /tmp/$BACKUP_FILE_NAME s3://$BUCKET_NAME/db_backups/$BACKUP_FILE_NAME
  RESPONSE="{\"statusCode\": 200, \"body\": \"Hello from Lambda!\"}"
  echo $RESPONSE
}
