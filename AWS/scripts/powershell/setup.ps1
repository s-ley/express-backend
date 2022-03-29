aws cloudformation create-stack --stack-name ${env:APP_NAME}stack `
  --template-url $env:TEMPLATE_URL `
  --capabilities CAPABILITY_NAMED_IAM `
  --parameters ParameterKey=AppName,ParameterValue=$env:APP_NAME `
    ParameterKey=DBRootPassword,ParameterValue=$env:DB_ROOT_PASSWORD `
    ParameterKey=VPCID,ParameterValue=$env:VPC_ID `
    ParameterKey=Subnet1ID,ParameterValue=$env:SUBNET_ID_1 `
    ParameterKey=Subnet2ID,ParameterValue=$env:SUBNET_ID_2 `
    ParameterKey=SubDomainName,ParameterValue=$env:SUBDOMAIN_NAME