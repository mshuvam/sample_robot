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
                    sh 'cd tests && robot -d results login_tests.robot'
                }
            }
        }
    }
    
    post {
        always {
            // Integrate with the Robot Framework plugin for detailed reports
            robot publisherName: 'results/output.xml'
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

