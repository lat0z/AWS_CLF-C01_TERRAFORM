#todo to assign the IAM role to have iam read only access 
resource "aws_iam_role" "iam_role" {
  name                = "terraform_ec2_role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/IAMReadOnlyAccess"]
  assume_role_policy  = data.aws_iam_policy_document.instance-assume-role-policy.json
}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_instance_profile" "iam_profile" {
  name = "terraform_iam_profile"
  role = aws_iam_role.iam_role.name
}