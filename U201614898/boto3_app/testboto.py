import botocore
import boto3

# Let's use Amazon S3
s3 = boto3.resource('s3')

for bucket in s3.buckets.all():
    print(bucket.name)


boto3.session.Session(aws_access_key_id=None, aws_secret_access_key=None, aws_session_token=None,region_name=None,botocore_session=None,     profile_name=None)

s3 = boto3.resource('s3')
s3.create_bucket(Bucket='mybucket')
s3.create_bucket(Bucket='mybucket',CreateBucketConfiguration={'LocationConstraint': 'us-west-1'})
bucket = s3.Bucket('mybucket')
exists = True
try:
    s3.meta.client.head_bucket(Bucket='mybucket')
except botocore.exceptions.ClientError as e:
    # If a client error is thrown, then check that  it was a 404 error.
    # If it was a 404 error, then the bucket does   not exist.
    error_code = int(e.response['Error']['Code'])
    if error_code == 404:
        exists = False