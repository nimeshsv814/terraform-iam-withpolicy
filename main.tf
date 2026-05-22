resource "aws_iam_user" "user" {
    for_each = var.users
    name = each.key
}

resource "aws_iam_user_policy_attachment" "attach" {
    for_each = var.users
    user = aws_iam_user.user[each.key].name
    policy_arn = each.value
}