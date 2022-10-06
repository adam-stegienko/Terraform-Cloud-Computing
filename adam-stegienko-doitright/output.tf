output "aws_lb" {
  description = "ID of the Application Load Balancer"
  value       = aws_lb.adam-lb.id
}