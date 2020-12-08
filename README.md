![Python application test with Github Actions](https://github.com/mikepitman/udacity_ci_cd_handin_repo/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)

# Overview

This project outlines the process of building a CI/CD (Continuous Integration/Continuous Deployment) pipeline, leveraging 
GitHub as the code repository and Azure pipelines to build and deploy the application. The project forms the handin requirement
for the CI/CD Pipeline project for the Udacity Devops Nanodegree.

## Project Plan
These resources provide timelines and a task breakdown for implementing this project.

* [Trello board](https://trello.com/b/PafhzaZe/lpr-mobile-app-dev-board)
* [Scheduling spreadsheet](https://docs.google.com/spreadsheets/d/1HbHKXZVIE0PdvfDRzTfFPq-L95pWg8ykViw20-7eCrw/edit?usp=sharing)

## Instructions

The diagram below outlines the how the configured components interact to provide a CI/CD pipeline.
![Architectural diagram](/screenshots/handin_DevOpsComponentDiagram.png)

You will need a profile on Github.com and an account with Microsoft Azure. There are free tiers for each service that can be used. 

#### Fork the Repository
To get started, fork the GitHub repository [here](https://github.com/mikepitman/udacity_ci_cd_handin_repo) to your Github profile. 
You can clone it from your profile into your IDE. You can also clone the repository into Azure Cloud Shell:
'git clone git@github.com:(your Github profile name)/udacity_ci_cd_handin_repo.git'
![Clone GitHub repo into Azure Cloud Shell](/screenshots/handin_CloneGithubRepoIntoAzure.PNG)
Delete, or add `.backup` to the end of the azure-pipelines.yml file - it will be created at a later stage for your Azure DevOps profile.

#### Setup Azure Environment, Create WebApp
After cloning the project to Azure Cloud Shell, change directory to the newly created directory. Then setup the virtual environment, and switch to that environment.
```
cd udacity_ci_cd_handin_repo
make setup
source ~/.udacity-devops/bin/activate
make test
```
![Makefile - 'make test' to test code](/screenshots/handin_MakeTestOutput.PNG)

Run the 'make all' utility to install the required packages, test and lint the code. 
![Makefile - 'make all' install required packages, lints and tests code](/screenshots/handin_MakeAllOutput.PNG)
Then, create an app service and initially deploy the app in Cloud Shell.
Give it a name that is unique in Azure, in place of the placeholder (your-appservice)
```
make all
az webapp up -n (your-appservice)
```

You can verify the app service is running by visiting the URL 'https://(your-appservice).azurewebsites.net/'
![Project running on Azure App Service](/screenshots/handin_AppWorkingInBrowser.PNG)

You can also verify the predictions in the CLI using the shell script 'make_predict_azure_app.sh'
You will need to update permissions on the shell script in order to execute it:
```
chmod 744 make_predict_azure_app.sh
./make_predict_azure_app.sh
```
![Flask app prediction from testing script](/screenshots/handin_CliPredictionTest.PNG)  

#### Configure Github Actions
In GitHub, open your forked repository. 
![Actions tab in GitHub](/screenshots/handin_GithubActionsTab.PNG)
The forked repository contains the following file, which configures GitHub Actions: `.github/workflows/pythonapp.yml`
Through the existing configuration, GitHub Actions will run configure a test environment and execute various tests to validate 
the code in commits. Ensure that your commits are built successfully by GitHub Actions. 

Successful builds get a green 'tick' indicator. The steps undertaken during the CI build can be viewed by category/step: 
![GitHub Actions successful build of committed code](/screenshots/handin_GithubActionsBuildDetail.PNG)

#### Setup Azure Pipelines
To set up Azure Pipelines, you'll need to configure your repository in GitHub to interface to Azure Pipelines. If you do not 
have the Azure Pipelines app installed in GitHib, you can install it by following steps 5-14 of Exercise 1, Task 1 in [this guide](https://www.azuredevopslabs.com/labs/azuredevops/github-integration/).
Task 2 in the guide continues with the configuration in Azure Devops, but take note of the following instructions:

Ensure that you log into your Azure account associated with your DevOps account (if you have/use multiple accounts), and change to your DevOps account.
![Azure Devops Account Page](/screenshots/handin_DevopsPage.PNG)

Create a new new project, using the New Project button in the top-right corner of the browser page.
![Azure Devops New Project button](/screenshots/handin_DevopsNewProject.PNG)

Provide a project name (required field) and meaningful description if desired, and click 'Create'.

On the landing page for a blank new project, select 'Pipelines' in the left menubar, or the 'Pipelines' button (both circled in red) under the 
'Welcome to the Project' image, and then 'Create Pipeline'. 
Select the code source - in this instance, the code is in GitHub (NOT GitHub Enterprise Server).
![Azure Devops - New pipeline - select code source](/screenshots/handin_CreatePipelineSelectRepo.PNG)

Select the forked repository in your GitHub account. For 'Configure your pipeline', select 'Python to Linux Web App on Azure'. 
![Azure Devops - Select pipeline](/screenshots/handin_SelectPipelineOption.PNG)

Select the correct Azure subscription, and the web app name created earlier. Then click 'Validate and Configure', and review the generated pipeline YAML. Ensure that
the parameter for 'Trigger' on line 6/7 matches the name of the GitHub branch that will trigger builds. 
![Azure Devops - New pipeline - review .yaml config file](/screenshots/handin_PipelineReview.PNG)
 
Click 'Run' to save and run the pipeline.
The pipeline should build successfully, and deploy the app. Test the entire configuration by editing the HTML header in app.py and commit the change.
Github Actions will run, and the Azure pipeline will detect the change, and run the pipeline as well. Once completed, validate the change by reloading
the application in the browser and verifying the change appears in the HTML header.
Build and Deploy summary:
![Azure Devops - successful pipeline run](/screenshots/handin_AzurePipelineBuild.PNG)
Pipeline breakdown detail:
![Azure Devops - successful pipeline run](/screenshots/handin_AzurePipelineBuild2.PNG)

To view the log stream from the Azure landing page, search for 'App Services' to display the current App Services running. Select the app service you created earlier,
and scroll down the App Service menu ribbon to the 'Log Stream' option. It may take a minute or two to connect, but once connected it will stream the App Service log.
Reload the app in the browser to check that HTTP GET requests come through, as shown below.
![Azure AppService - log stream](/screenshots/handin_LogStream.PNG)

#### Test Load Capacity
The repo contains a [locust](https://locust.io/) file for load testing the deployed application.
![Azure Devops - load testing](/screenshots/handin_LocustLoadTest.PNG)
With the web application running, run this command from the Azure CLoud Shell command line (Edit the command for your app URL).
`locust -f locust.py --headless --host https://udacity-mike-cicd-handin.azurewebsites.net --users 500 --run-time 12s --spawn-rate 50`
It will create 500 users at a rate of 50 per second, querying the page root and the /predict path, for 12 seconds. The output will mirror the screenshot above.

## Enhancements

Project is a good demonstration of setting up CI and CD pipelines, for GitHub and Azure. An improvement would be to have a HTTP POST with the JSON required for a 
web-based prediction from the ML application.

## Demo 

<TODO: Add link Screencast on YouTube>


