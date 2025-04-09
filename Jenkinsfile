pipeline{
    agent any
    tools {
        terraform "Terraform"
        ansible "Ansible"
    }

    stages {
        stage  ("apply the terraform"){
            steps{
                sh "cd ./terraform; terraform  init "
                sh "cd ./terraform; terraform apply --auto-approve"
            }
        }
    }
}