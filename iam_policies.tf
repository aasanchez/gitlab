resource "aws_iam_policy" "policy" {
  name        = "gl-s3-policy"
  path        = "/"
  description = "As we will be using Amazon S3 object storage, our EC2 instances need to have read, write, and list permissions for our S3 buckets"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({   
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::ps-*/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:AbortMultipartUpload",
                "s3:ListMultipartUploadParts",
                "s3:ListBucketMultipartUploads"
            ],
            "Resource": "arn:aws:s3:::ps-*"
        }
    ]
  })
  tags = {
    accountable = "alexis"
    project     = "gitlab"
  }
}