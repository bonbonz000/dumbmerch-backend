def branch = "master"
def remote = "origin"
def dir = "~/dumbmerch-backend"
def server = "bon@103.193.176.113"
def credi = "appserver"
def imagename = "dumbmerch-be"
 
pipeline {
	agent any
	stages {
		stage ('Pull From Git'){
			steps{
				sshagent ([credi]){
					sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
					cd ${dir} 
					git pull ${remote} ${branch}
					exit
					EOF"""
				}

			}

		}

	stage ('docker build'){
                        steps{
                                sshagent ([credi]){
					sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
					cd ${dir}
					docker build -t ${imagename} .
					exit
					EOF"""
                                }

                        }

                }

	stage ('docker run'){
                        steps{
                                sshagent ([credi]){
                                        sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                                        cd ${dir}
                                        docker container stop ${imagename}
                                        docker container rm ${imagename}
                                        docker run -d -p 5000:5000 --name="${imagename}"  ${imagename}:latest
                                        docker container stop ${imagename}
                                        docker container rm ${imagename}
                                        exit
                                        EOF"""
                              }

                      }
              }

	stage ('docker push'){
                        steps{
                                sshagent ([credi]){
                                        sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                                        cd ${dir}
					docker tag dumbmerch-be:latest bonbonz000/final:be-latest
                                        docker push bonbonz000/final:be-latest
					exit
                                        EOF"""
                              }

                      }
              }



	}
}
