#!/usr/bin/env groovy

pipeline {
    agent any
    tools {
        maven 'maven-default'
        jdk 'openjdk8-zulu'
    }
    stages {
        stage ('Checking commit message') {
            when {
                allOf {
                    not {
                        buildingTag()
                    }
                    changelog '.*\\[maven-release-plugin\\].*'
                }
            }
            steps {
                script {
                  currentBuild.result = 'NOT_BUILT'
               }
            }
            error('Skipping release build')
        }
        stage ('Build') {
            steps {
                sh 'mvn install'
            }
        }
        stage ('Deploy') {
            when {
                not {
                        changeRequest()
                }
            }

            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'ossrh', usernameVariable: 'OSSRH_USERNAME', passwordVariable: 'OSSRH_TOKEN'),
                    usernamePassword(credentialsId: 'gpg', usernameVariable: 'GPG_KEY_NAME', passwordVariable: 'GPG_PASSPHRASE'),
                    file(credentialsId: 'mavensigningkey', variable: 'MAVEN_SIGNING_KEY')
                ]) {
                    sh "gpg --batch --fast-import ${env.MAVEN_SIGNING_KEY}"
                    sh 'mvn deploy -s cd/settings.xml -P sign'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}