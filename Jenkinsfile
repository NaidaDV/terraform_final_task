pipeline {
    agent any
    
    stages {
    
        stage('Terraform init') {
            steps {
                      sh 'cd terraform; terraform init'
            }
        }
        
        stage('Terraform plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_creds', accessKeyVariable: 'TF_VAR_access_key', secretKeyVariable: 'TF_VAR_secret_key']]){
                    withCredentials([string(credentialsId: 'git-token', variable: 'TF_VAR_git_token')]) {
                        withCredentials([sshUserPrivateKey(credentialsId: 'ssh-instance', keyFileVariable: 'TF_VAR_private_key', usernameVariable: 'TF_VAR_ssh_user')]) {
                            sh 'cd terraform; terraform plan'
                        }
                    }
                }
            }
        }
        
        
        stage('Terraform apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_creds', accessKeyVariable: 'TF_VAR_access_key', secretKeyVariable: 'TF_VAR_secret_key']]){
                    withCredentials([string(credentialsId: 'git-token', variable: 'TF_VAR_git_token')]) {
                        withCredentials([sshUserPrivateKey(credentialsId: 'ssh-instance', keyFileVariable: 'private_key', usernameVariable: 'TF_VAR_ssh_user')]) {
                            
                            sh 'cd terraform; cp $("echo $privat_key") ./privat_key.ppk'
                            sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }
        

                
        
        
   
        

        
       
        
        
    }
}
