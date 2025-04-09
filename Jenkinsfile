pipeline{
    agent any
    tools {
        terraform "Terraform"
        ansible "Ansible"
    }
environment {
        AWS_ACCESS_KEY_ID = credentials("AWS_ACCESS_KEY_ID") 
        AWS_SECRET_ACCESS_KEY = credentials("AWS_SECRET_ACCESS_KEY") 
        AWS_SESSION_TOKEN = credentials("AWS_SESSION_TOKEN") 
        SSH_CREDENTIALS_ID = credentials("ec2-ssh-key")
    }
    stages {
        stage  ("apply the terraform"){
            steps{
                dir ("terraform"){
                    sh "terraform  init "
                    sh "terraform apply --auto-approve"
                    sh "terraform output  | awk -F'\"' '{print \$2}' >> ../ansible/inventory "
                }
            }
        }        
        stage  ("install weblogic"){
            steps{
                sshagent(['ec2-ssh-key']) {
                    dir('ansible') {
                        sh 'ansible-playbook -i inventory install_weblogic.yml'
                    }
                }
            }
        }
    }
}