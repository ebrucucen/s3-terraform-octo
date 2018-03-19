provider "aws" {
  region     = "us-east-1"
}

resource "aws_s3_bucket" "wines" {
  bucket = "winesbucket20180319"
  acl    = "public-read"

  tags {
    Name        = "Wines"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_object" "redwine" {
  bucket = "${aws_s3_bucket.wines.bucket}"
  key    = "redwine_glass"
  source = "img/redwine.png"
  etag   = "${md5(file("img/redwine.png"))}"
  acl="public-read"
}

resource "aws_s3_bucket_object" "whitewine" {
  bucket = "${aws_s3_bucket.wines.bucket}"
  key    = "whitewine_glass"
  source = "img/whitewine.png"
  etag   = "${md5(file("img/whitewine.png"))}"
  acl="public-read"
}