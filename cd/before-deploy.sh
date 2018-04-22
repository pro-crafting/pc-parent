#!/usr/bin/env bash
cp cd/.travis.settings.xml $HOME/.m2/settings.xml
if [ "$TRAVIS_BRANCH" = 'master' ] && [ "$TRAVIS_PULL_REQUEST" == 'false' ]; then
    openssl aes-256-cbc -K $encrypted_0109d4654fe5_key -iv $encrypted_0109d4654fe5_iv -in cd/codesigning.asc.enc -out cd/codesigning.asc -d
    gpg --fast-import cd/codesigning.asc
fi
