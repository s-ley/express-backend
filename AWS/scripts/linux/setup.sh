aws cloudformation create-stack --stack-name ${APP_NAME}stack \
  --template-url $TEMPLATE_URL \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters ParameterKey=AppName,ParameterValue=$APP_NAME \
    ParameterKey=DBRootPassword,ParameterValue=$DB_ROOT_PASSWORD \
    ParameterKey=VPCID,ParameterValue=$VPC_ID \
    ParameterKey=Subnet1ID,ParameterValue=$SUBNET_ID_1 \
    ParameterKey=Subnet2ID,ParameterValue=$SUBNET_ID_2 \
    ParameterKey=SubDomainName,ParameterValue=$SUBDOMAIN_NAME