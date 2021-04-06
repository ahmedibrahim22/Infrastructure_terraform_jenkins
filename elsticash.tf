resource "aws_elasticache_cluster" "els-cashe" {
  cluster_id           = "mu-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name = aws_elasticache_subnet_group.bar.name
  security_group_ids = [aws_security_group.redis.id]
}

resource "aws_elasticache_subnet_group" "bar" {
  name       = "tf-test-cache-subnet"
  subnet_ids = [module.iti.private1_id, module.iti.private2_id]
}