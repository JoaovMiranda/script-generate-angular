#!/bin/sh

# INSTALL ANGULAR CLI
echo "Do you already have Angular Cli installed globally? [s/n]"
read haveInstalled
if [ $haveInstalled != "s" ]; then
    npm install -g @angular/cli
else
    echo "Right!"
fi

# GENERATE PROJECT
echo "Enter the project name: "
echo "Ex: my-app or other-app"
read projectName

# WILL THERE BE TESTS?
echo "Do you need to generate 'spec.ts' test files for the project? [s/n]"
read haveTests
if [ $haveTests != "s" ]; then
    ng n $projectName --skip-tests
else
    ng n $projectName
fi

# STRUCTURE PATTERN? 
echo "Do you need a generic structure pattern for your project? [s/n]"
read haveStructure
if [ $haveStructure != "s" ]; then
    cd $projectName
else
    cd $projectName/src/assets
    mkdir img
    mkdir styles
    mkdir svg
    mkdir icon
    mkdir media
    cd ..
    cd app/
    ng g m core
    ng g s core/auth/auth
    ng g s core/token/token
    ng g s core/services/example
    ng g g core/guards/auth
    ng g i core/interceptors/example
    ng g m modules/example --routing
    ng g c modules/example/example
    ng g m shared
    ng g p shared/pipes/example
    ng g c shared/components/example
    ng g d shared/directives/example 
    cd shared/
    mkdir models
    mkdir mocks
    mkdir helpers
    mkdir utils
    mkdir widgets
    cd ../..
fi

# RUN PROJECT
# ng s
