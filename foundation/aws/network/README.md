### aws self-define terraform.tfvars

```
subnets = {
    subnet1 = {
        cidr = ""
        name = ""
    }
}

security_group_rules = {
    expamle1 = {
      name        = "ssh"
      type        = "ingress"
      from_port   = "22"
      to_port     = "22"
      ip_protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    expamle2 = {
      name        = "egress_rules"
      type        = "egress"
      from_port   = "0"
      to_port     = "0"
      ip_protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
```