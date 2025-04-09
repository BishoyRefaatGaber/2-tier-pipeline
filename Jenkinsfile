pipeline{
    agent any
    tools {
        terraform "Terraform"
        ansible "Ansible"
    }

    stages {
        stage  ("apply the terraform"){
            steps{
                sh terraform init
                sh terraform apply --auto-approve
            }
        }
    }
}