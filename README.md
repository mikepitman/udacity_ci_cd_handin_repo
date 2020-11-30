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

#### Setup Azure Environment, Create WebApp
After cloning the project to Azure Cloud Shell, change directory to the newly created directory. Then setup the virtual environment, and switch to that environment.
```
cd udacity_ci_cd_handin_repo
make setup
source ~/.udacity-devops/bin/activate
```

Run the 'make all' utility to install the required packages and lint the code. Then, create an app service and initially deploy the app in Cloud Shell.
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
Because of the existing configuration, GitHub actions will validate the code in commits. Ensure that your commits are built 
successfully by GitHub Actions. 

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
Select the forked repository in your GitHub account. Devops Pipelines uses the existing azure-pipelines.yml file to configure the pipeline.

In the final 'Review' step, review the contents of the azure-pipelines.yml file. Change the `webAppName` and `environmentName` parameters to 
something applicable to your setup.
![Azure Devops - New pipeline - review .yaml config file](/screenshots/handin_PipelineReview.PNG)
 

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment
 
* Output of streamed log files from deployed application

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


