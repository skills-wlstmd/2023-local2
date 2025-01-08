module "vpc" {
  source = "./modules"

  vpc_name = local.vpc.name
  vpc_cidr = local.vpc.cidr

  public_subnet_a_name = "wsi-public-a"
  public_subnet_a_cidr = "10.0.2.0/24"

  public_subnet_b_name = "wsi-public-b"
  public_subnet_b_cidr = "10.0.3.0/24"

  private_subnet_a_name =  "wsi-private-a"
  private_subnet_a_cidr = "10.0.0.0/24"

  private_subnet_b_name =  "wsi-private-b"
  private_subnet_b_cidr = "10.0.1.0/24"

  igw_name = "wsi-igw"

  nat_a_name = "wsi-nat-a"
  nat_b_name = "wsi-nat-b"

  public_rt_name = "wsi-public-rtb"
  private_a_rt_name = "wsi-private-rtb-a"
  private_b_rt_name = "wsi-private-rtb-b"
}