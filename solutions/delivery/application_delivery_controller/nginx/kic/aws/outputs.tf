// output "jumphostPublicIp" {
//   value = module.jumphost.workspaceManagementAddress
// }

output "coderAdminPassword" {
  value = random_password.password.result
}

output "kubernetesClusterName" {
  value = module.eks.cluster_id
}

output "ecrRepositoryURL" {
  value = aws_ecr_repository.ecr.repository_url
}

output "publicSubnetAZ1" {
  value = module.aws_network.subnetsAz1.public
}

output "publicSubnetAZ2" {
  value = module.aws_network.subnetsAz2.public
}

output "ECR_is_used_as_registry" {
  value = "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${aws_ecr_repository.ecr.repository_url}"
}

output "Update_kubeconfig" {
  value = "aws eks --region us-east-1 update-kubeconfig --name ${module.eks.cluster_id}"
}

output "Update_the_Subnet_Tags_for_EKS_cluster" {
  value = "aws ec2 create-tags --resources ${module.aws_network.subnetsAz1.public} ${module.aws_network.subnetsAz2.public} --tags Key=kubernetes.io/cluster/${module.eks.cluster_id},Value=shared   Key=kubernetes.io/role/elb,Value=1"
}