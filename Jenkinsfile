pipeline {
	agent {
		docker {
			image 'environ:1.0.0'
		}
	}
	stages {
	    stage ('clone configuration repo') {
	        steps {
	             sh 'git clone https://github.com/boleque/bf_deploy.git .'
	        }
	    }
	    stage ('create Amazon ec2 instances'){
	        steps{
	            sh 'terraform init'
	            sh 'terraform plan'
	            sh 'terraform apply -auto-approve'
	        }
	    }
	    stage ('provisioning Amazon ec2 instances'){
	        steps{
	            ansiblePlaybook(
	                disableHostKeyChecking: true, 
	                credentialsId: '0ca3fce2-45aa-49a3-8274-e60d6c6655d8', 
	                installation: 'ansible', 
	                inventory: 'aws_ec2.yaml', 
	                playbook: 'provisioning_ec2_instances.yaml', 
	                vaultCredentialsId: 'ab715d90-70f2-4ba2-a11b-19402d49bb30')
	        }
	    }
	}
}
