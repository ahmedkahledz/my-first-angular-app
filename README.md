# Jenkins Pipeline for Angular App

This repository demonstrates how to automate the build and deployment of an Angular application using Jenkins and Docker. The Jenkins pipeline is configured to build the application, package it into a Docker image, and push the image to Docker Hub.

## Table of Contents
- [Project Overview](#project-overview)
- [Prerequisites](#prerequisites)
- [Pipeline Setup](#pipeline-setup)
- [Jenkinsfile](#jenkinsfile)
- [Repository URL](#repository-url)

## Project Overview
This project involves automating the build and deployment of a simple Angular application using a Jenkins pipeline. The pipeline performs the following steps:
1. **Clones the repository from GitHub.**
2. **Builds the Angular application.**
3. **Packages the application into a Docker image.**
4. **Pushes the Docker image to Docker Hub.**

## Prerequisites
Before setting up the Jenkins pipeline, ensure the following:
- **Jenkins** is installed and configured.
- **Docker** is installed and the Docker daemon is running.
- A **Docker Hub account** with valid credentials.
- GitHub repository containing the Angular application and `Dockerfile`.

## Pipeline Setup
Follow these steps to configure the Jenkins pipeline:

1. **Push the Repository**
   - Ensure the Angular application and the `Dockerfile` are pushed to a GitHub repository.

2. **Create a New Pipeline**
   - Log in to Jenkins.
   - Click on **New Item**.
   - Choose **Pipeline** as the project type.
   - Name the pipeline as `jenkins-assignment`.

3. **Configure the Pipeline**
   - Under the **Pipeline** section, select **Pipeline script from SCM**.
   - Set the SCM to **Git**.
   - Provide the repository URL: `https://github.com/ahmedkahledz/simple-angular-app`.
   - Add the credentials for Docker Hub to enable Jenkins to push the Docker image.
   - Specify the Jenkinsfile path in the repository: `jenkinsfile`.

4. **Run the Pipeline**
   - Save the pipeline configuration.
   - Trigger the pipeline to build, package, and push the Docker image.

## Jenkinsfile
The `jenkinsfile` in this repository contains the pipeline definition, which automates the entire process of building and deploying the Angular application. Ensure the file is correctly located in the root directory of the repository.

## Repository URL
The GitHub repository for this project is located at:
[https://github.com/ahmedkahledz/simple-angular-app](https://github.com/ahmedkahledz/simple-angular-app)

## Notes
- Make sure to update the **Docker Hub credentials** in Jenkins whenever they change.
- Ensure that the **Dockerfile** is properly configured to build the Angular application.

## Author
**Ahmed Khaled**
