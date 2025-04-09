pipeline{
    agent any
    tools {
        terraform "Terraform"
        ansible "Ansible"
    }
// environment {
//         AWS_SHARED_CREDENTIALS_FILE = ''
        
//     }
    stages {
        stage  ("apply the terraform"){
            steps{
            sh "pwd"
                dir ("terraform"){
            sh "pwd"
                    sh "terraform  init "
                    sh "terraform apply --auto-approve"
                }
            }
        }
    }
}