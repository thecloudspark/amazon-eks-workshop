# module "ebs_csi_driver" {
#   source = "./modules/aws_ebs_csi"

#   cluster_name = module.eks.cluster_name

#   depends_on = [
#     helm_release.karpenter
#   ]
# }

# module "aws_load_balancer_controller" {
#   source = "./modules/aws_load_balancer_controller"

#   addon_version  = "1.11.0"
#   namespace      = "kube-system"
#   cluster_name   = module.eks.cluster_name
#   cluster_vpc_id = module.vpc.vpc_id
#   region         = var.region

#   depends_on = [
#     helm_release.karpenter
#   ]
# }

# module "metrics_server" {
#   source = "./modules/metrics_server"

#   addon_version = "3.12.2"
#   cluster_name  = module.eks.cluster_name

#   depends_on = [
#     helm_release.karpenter
#   ]
# }

# module "grafana" {
#   count  = var.enable_grafana ? 1 : 0
#   source = "./modules/grafana"

#   addon_version = "8.10.0"
#   cluster_name  = module.eks.cluster_name

#   depends_on = [
#     helm_release.karpenter,
#     module.ebs_csi_driver
#   ]
# }

# module "prometheus" {
#   count  = var.enable_prometheus ? 1 : 0
#   source = "./modules/prometheus"

#   addon_version = "27.3.1"
#   cluster_name  = module.eks.cluster_name

#   depends_on = [
#     helm_release.karpenter,
#     module.ebs_csi_driver
#   ]
# }
