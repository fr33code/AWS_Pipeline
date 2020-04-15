aws s3 cp /var/jenkins_home/workspace/aws_pipeline/target/datasearch_app.war s3://sonuajayin/apps/datasearch_app.war
aws elasticbeanstalk create-application-version \
    --application-name "datasearch_eb" \
    --version-label "v3" \
    --source-bundle "S3Bucket=sonuajayin,S3Key=apps/datasearch_app.war" \
    --process \
    --auto-create-application \
    --query 'ApplicationVersion.VersionLabel' \
    --output text
aws elasticbeanstalk update-environment --environment-name dataSearch-dev --application-name datasearch_eb --version-label v3