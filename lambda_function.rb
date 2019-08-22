require 'json'
require 'aws-sdk-s3'

def lambda_handler(event:, context:)
    dump_name = "db_dump_#{Date.today}.sql"
    system "bin/pg_dump --dbname=postgresql://#{ENV["DB_USERNAME"]}:#{ENV["DB_PASSWORD"]}@#{ENV["DB_HOST"]}/#{ENV["DB_NAME"]} --verbose --clean --no-owner --no-acl --format=c  > /tmp/#{dump_name}"

    s3 = Aws::S3::Resource.new
    obj = s3.bucket(ENV["BUCKET_NAME"]).object("db_backups/#{dump_name}")

    # I/O object
    File.open("/tmp/#{dump_name}", 'rb') do |file|
      obj.put(body: file)
    end

end
