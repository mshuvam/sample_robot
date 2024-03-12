pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Print current directory and list contents
                    sh 'pwd'
                    sh 'ls -la'
                    
                    // Checkout the repository
                    git 'https://github.com/mshuvam/sample_robot.git'
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                script {
                    // Assuming tests are in a directory called 'tests' outside 'myproject'
                    // Print current directory and list contents
                    sh 'pwd'
                    sh 'ls -la'
                    
                    // Execute Robot Framework tests
                    sh 'robot -d ../results tests/login_tests.robot'
                }
            }
        }
    }
    
    post {
        always {
            // Archive the Robot Framework test report
            archiveArtifacts artifacts: '../results/*.html', onlyIfSuccessful: true
            
            // Send email notifications with the test report as an attachment
            emailext attachmentsPattern: '../results/*.html',
                      subject: 'Jenkins build for sample robot code',
                      body: '',
                      to: 'mshuvam@telaverge.com'
        }
    }
}

