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
![Architectural diagram](/DevOpsDiagramForHandin.png)

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


