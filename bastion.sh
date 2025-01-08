#!/bin/bash
yum update -y
yum install jq curl -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

ln -s /usr/local/bin/aws /usr/bin/
ls -s /usr/local/bin/aws_completer /usr/bin/




aws s3 rm --recursive s3://wsi-101-test-etl/result/
aws s3 rm --recursive s3://wsi-101-test-etl/data/raw/
aws s3 cp ./SampleLogData.json s3://wsi-101-test-etl/data/raw/2022/
aws glue start-job-run --job-name wsi-glue-job

aws s3 cp --recursive s3://wsi-101-test-etl/result/ ./result

cat ./result/* | wc -

cat ./result/* | jq -r 'keys[]' | sort -u

aws glue get-table --database-name wsi-glue-database --name result --query "Table.Name"

aws glue get-table --database-name wsi-glue-database --name result \
  --query "Table.StorageDescriptor.Columns[].Name"

aws glue get-workflow --name wsi-glue-workflow --query "Workflow.Name

aws glue delete-table --database-name wsi-glue-database --name ref
aws glue delete-table --database-name wsi-glue-database --name raw
aws glue start-workflow-run --name wsi-glue-workflow

aws glue get-table --database-name wsi-glue-database --name ref \
--query "Table.StorageDescriptor.Columns[].Name"

aws glue get-table --database-name wsi-glue-database --name raw \
--query "Table.StorageDescriptor.Columns[].Name"

aws glue delete-table --database-name wsi-glue-database --name result
aws glue start-workflow-run --name wsi-glue-workflow

aws glue get-table --database-name wsi-glue-database --name result \
--query "Table.StorageDescriptor.Columns[].Name"