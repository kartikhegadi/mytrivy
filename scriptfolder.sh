#!/bin/bash

folders=(
"trivy-installation"
"trivy-main-flags"
"trivy-security-fix-local"
"trivy-security-fix-dockerhub"
"trivy-alternative"
"trivy-report-generation"
"trivy-fs-demo"
"trivy-automation-shell"
"trivy-artifact-project"
"trivy-image-scan-shell"
)

count=1

for folder in "${folders[@]}"
do
    mkdir -p "$(printf "%02d" $count)-$folder"
    ((count++))
done
