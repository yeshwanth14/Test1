node {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/wakaleo/game-of-life.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'Maven-3.3'
	  jdk 'JAVA8'
      environment {

      sonar_url = 'http://localhost:9000'
      sonar_username = 'admin'
      sonar_password = 'admin'
}
   stage("build & SonarQube analysis") {
           
              withSonarQubeEnv('SonarQube') {
                 sh 'mvn clean package sonar:sonar'
              }
         }
          
    stage("publish artifactory") {
        
    nexusArtifactUploader artifacts: [[artifactId: 'gameoflife', classifier: '', file: '/var/lib/jenkins/workspace/test-pipeline1/gameoflife-build/target/gameoflife-build-1.0-SNAPSHOT.jar', type: 'jar']], credentialsId: 'cf437001-0947-42a3-884a-7035432cdc04', groupId: 'com.wakaleo.gameoflife', nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'yeshwanth', version: '4.0.0'
    }
        
        
    }
}



