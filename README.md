# Ruby DB backup lambda task
This repo contains everything you need to create a lambda task which will create sql dumps for your database and store them in S3.


To run this task you will need docker installed

You might need to change `bin/deploy` file last line to suit your needs for deployment (e.g. add aws `--profile`, if you aren't using the default one or change the `--function-name` parameter to match the lambda task you create)

# TASK SETUP
To run this task you will need to set the following ENVIRONMENT VARIABLES:
* `DB_NAME`
* `DB_HOST`
* `DB_USERNAME`
* `DB_PASSWORD`
* `BUCKET_NAME`

Make sure that the execution role you assign, has policy to manage S3 buckets.



# SCHEDULING

To schedule lambda task to run daily or in some time period, you need to add a "Cloudwatch events" trigger and set the time period you need

# USING SECURITY GROUPS

If, like me, you have restricted your AWS resource access through security groups you might need to add one to lambda task, so it can connect to the database.

If you do so, make sure that in your VPC you add endpoint for s3 under VPC -> Endpoints. No need to add NAT Gateway as suggested by AWS.

