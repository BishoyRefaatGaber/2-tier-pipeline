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
        SSH_CREDENTIALS_ID = credentials("ansible-ssh")
    }
    stages {
        stage  ("apply the terraform"){
            steps{
                dir ("terraform"){
                    // sh "terraform destroy --auto-approve"
                    sh "terraform  init "
                    sh "terraform apply --auto-approve"
                    sh "echo >> ../ansible/inventory"
                    sh "terraform output"
                    sh "terraform output  | awk -F'\"' '{print \$2}'  | sed -n \"1,2p\">> ../ansible/inventory "
                    sh "echo"
                    sh "echo"
                    sh "echo [nginx-proxy:vars] >>  ../ansible/inventory"
                    sh "echo"
                    sh "echo nlb-dns= >> ../ansible/inventory"
                    sh "terraform output  | awk -F'\"' '{print \$2}'  | sed -n \"3p\">> ../ansible/inventory "
                    sh "echo >> ../ansible/inventory"
                    sh "echo [weblogic-servers:vars] >> ../ansible/inventory"
                    sh "echo >> ../ansible/inventory"
                    sh "echo \"ansible_user=ec2-user\" >>../ansible/inventory"
                }
            }
        }

        stage  ("install weblogic"){
            steps{
                sshagent(["ansible-ssh"]) {
                    
                    dir('ansible') {
                        sh 'ansible-playbook -i inventory playbook.yml'
                    }
                }
            }
        }
    }
}