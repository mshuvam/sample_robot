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
                    // Assuming tests are in a subdirectory called 'tests'
                    // Print current directory and list contents
                    sh 'pwd'
                    sh 'ls -la'
                    
                    // Change directory to 'myproject/tests'
                    dir('myproject/tests') {
                        // Print current directory and list contents
                        sh 'pwd'
                        sh 'ls -la'
                        
                        // Execute Robot Framework tests and generate report
                        sh 'robot -d ../../results login_tests.robot'
                        
                        // Store the path of the generated report
                        def reportPath = '../../results/report.html'
                        
                        // Archive the report
                        archiveArtifacts artifacts: reportPath, onlyIfSuccessful: false
                        
                        // Store the path of the build log file
                        def logFilePath = env.BUILD_ID + '.log'
                        
                        // Archive the build log
                        archiveArtifacts artifacts: logFilePath, onlyIfSuccessful: false
                    }
                }
            }
        }
    }
    
    post {
        always {
            // Send email notifications with test report and build log as attachments
            emailext attachmentsPattern: '../../results/*, ${env.BUILD_ID}.log',
                      subject: 'Jenkins build for sample robot code',
                      body: '',
                      to: 'mshuvam@telaverge.com'
        }
    }
}

