#Create config for Prod
# aws elasticbeanstalk create-configuration-template --application-name datasearch_demo --template-name datasearch_demo_prod_v1 --environment-id e-zj2duycgfx

#Have 2 versions for demo

#Upload New Version
aws s3 cp /var/jenkins_home/workspace/aws_pipeline/build/libs/java-sample-app-$1.jar s3://sonuajayin/apps/java-sample-app-$1.jar

#Create New Application Version
aws elasticbeanstalk create-application-version \
                        --application-name "datasearch_demo" \
                        --version-label "$1" \
                        --source-bundle "S3Bucket=sonuajayin,S3Key=apps/java-sample-app-$1.jar" \
                        --process \
                        --auto-create-application \
                        --query 'ApplicationVersion.VersionLabel' \
                        --output text

#Deploy Old Version to CLONE
aws elasticbeanstalk update-environment --environment-name DatasearchDemo-CLONE --application-name datasearch_demo --version-label $2
#sleep 4m

#Clone the PROD Environent
aws elasticbeanstalk create-environment --application-name datasearch_demo --environment-name DatasearchDemo-CLONE --cname-prefix datasearchdemo-clone --template-name datasearch_demo_prod_v1  --version-label v1.0

#Check Status
aws elasticbeanstalk describe-environments --environment-names DatasearchDemo-CLONE

#Swap URLS from PROD TO Clone now Traffic goes to CLONE
aws elasticbeanstalk swap-environment-cnames --source-environment-name DatasearchDemo-PROD --destination-environment-name DatasearchDemo-CLONE

#Deploy New Version to PROD Environment
aws elasticbeanstalk update-environment --environment-name DatasearchDemo-PROD --application-name datasearch_demo --version-label $1
sleep 4m
#Check Status
aws elasticbeanstalk describe-environments --environment-names DatasearchDemo-PROD

#TEST

#Swap Urls Again to PROD
aws elasticbeanstalk swap-environment-cnames --source-environment-name DatasearchDemo-CLONE --destination-environment-name DatasearchDemo-PROD

#Terminate Clone Environment
aws elasticbeanstalk terminate-environment --environment-name DatasearchDemo-CLONE