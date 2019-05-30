#!/usr/bin/env groovy

pipeline {
    agent any
    tools {
        maven 'maven-default'
        jdk 'openjdk8-zulu'
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn install'
            }
        }
        stage ('Deploy') {
            when {
                anyOf {
                    not {
                        anyOf {
                            changeRequest()
                            buildingTag()
                            changelog '.*\\[maven-release-plugin\\].*'
                        }
                    }
                    allOf {
                        not {
                            changeRequest()
                        }
                        buildingTag()
                        changelog '.*\\[maven-release-plugin\\].*'
                    }
                }
            }
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'ossrh', usernameVariable: 'OSSRH_USERNAME', passwordVariable: 'OSSRH_TOKEN'),
                    usernamePassword(credentialsId: 'gpg', usernameVariable: 'GPG_KEY_NAME', passwordVariable: 'GPG_PASSPHRASE'),
                    file(credentialsId: 'mavensigningkey', variable: 'MAVEN_SIGNING_KEY')
                ]) {
                    sh "gpg --batch --fast-import ${env.MAVEN_SIGNING_KEY}"
                    sh 'mvn clean deploy -s cd/settings.xml -P sign'
                }
            }
        }
    }
}