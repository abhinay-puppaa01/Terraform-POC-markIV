/*payload = [
      {
        "host_name" : "amraeld00010181",
        "ami" : "ami-0cff7528ff583bf9a",
        "instance_type" : "t2.micro",
        "subnet_id" : "subnet-c9b14995",
        "tenancy" : "default",
        "host_resource_group_arn" : "",
        "availability_zone" : "us-east-1a",
        "iam_instance_profile" : "",
        "key_name" :"TF_key",
        "tags" : { 
          "CostCenterID" : "CostCenterID"
          "Centrify" : "Centrify"
          "Description" : "Description"
          "ProjectCode" : "ProjectCode"
          "SharedInfrastructure" : "SharedInfrastructure"
          "ApplicationDeploymentCIID" : "ApplicationDeploymentCIID"
          "ProvisionType" : "ProvisionType"
          }
        "vpc_security_group_ids" : ["sg-020b807bdccc81145"],
        "ebs_block_devices" : [
          {
            "device_name" : "xvdf"
            "volume_size" : "10"
            "volume_type" : "gp3"
            "iops": "3000"
            "tags" : {
              "FileSystem" : "/data/ebs1"
            }
          },
          {
            "device_name" : "xvdg"
            "volume_size" : "20"
            "volume_type" : "gp3"
            "iops": "3000"
            "tags" : {
              "FileSystem" : "/data/ebs2"
            }
          },
        ]
      }
]
