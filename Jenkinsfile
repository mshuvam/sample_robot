pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/mshuvam/sample_robot.git'
            }
        }
        
        stage('Run Tests') {
            steps {
                script {
                    // Assuming tests are in a subdirectory called 'tests'
                    sh 'cd tests && robot -d ../results login_tests.robot'
                }
            }
        }
    }
    
    post {
        always {
            // Publish Robot Framework test results
            robot(
                outputPath: 'results/output.xml',
                logFileName: 'results/log.html',
                reportFileName: 'results/report.html'
            )
            // Send email notifications
            emailext(
                subject: 'Robot Framework Test Execution Report',
                body: 'Please find the test execution report attached.',
                attachmentsPattern: 'results/log.html,results/report.html',
                to: 'mshuvam@telaverge.com'
            )
        }
    }
}

