apiVersion: karpenter.k8s.aws/v1
kind: EC2NodeClass
metadata:
  name: ${name}
spec:
  amiFamily: AL2023
  role: ${node_iam_role_name}
  amiSelectorTerms:
    - id: "ami-0aeb366c5c9cc142f"
    - id: "ami-0c543fb17f968465d"
  subnetSelectorTerms:
    - tags:
        karpenter.sh/discovery: ${cluster_name}
  securityGroupSelectorTerms:
    - tags:
        karpenter.sh/discovery: ${cluster_name}
  tags:
    karpenter.sh/discovery: ${cluster_name}