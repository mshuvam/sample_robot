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
                        
                        // Execute Robot Framework tests
                        sh 'robot -d ../../results login_tests.robot'
                    }
                }
            }
        }
    }
    
    post {
        always {
            // Integrate with the Robot Framework plugin for detailed reports
            robot(
                outputPath: 'myproject/results',
                logFileName: 'results/log.html',
                reportFileName: 'results/report.html'
            )
        }
    }
}

