#!/usr/bin/env bash

git clone git@github.com:mikepitman/udacity_ci_cd_handin_repo.git
cd udacity_ci_cd_handin_repo/
ls -lh
make setup
source ~/.udacity-devops/bin/activate
make all
# Change the web app name to your choice
az up -n udacity-mike-cicd-handin
chmod 744 make_predict*
# Edit the script, set the URL to your app name for HTTP POST
vi make_predict_azure_app.sh
./make_predict_azure_app.sh
pip install locust
# Edit the command, set the URL to your app name for --host
locust -f locust.py --headless --host https://udacity-mike-cicd-handin.azurewebsites.net --users 10 --run-time 60s --spawn-rate 2
