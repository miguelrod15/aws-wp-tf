output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_a_id" {
  value = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
  value = aws_subnet.private_b.id
}

output "private_subnet_id_a" {
  description = "ID of the private subnet A"
  value       = aws_subnet.private_a.id
}

output "private_subnet_id_b" {
  description = "ID of the private subnet B"
  value       = aws_subnet.private_b.id
}
