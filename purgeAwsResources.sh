aws s3 rm s3://serverless-mapreduce/finalReduction/ --recursive --profile=chrisamido
aws s3 rm s3://serverless-mapreduce/ingested/ --recursive --profile=chrisamido
aws s3 rm s3://serverless-mapreduce/mapped/ --recursive --profile=chrisamido
aws s3 rm s3://serverless-mapreduce/reduced/ --recursive --profile=chrisamido
aws s3 rm s3://serverless-mapreduce/workerRecord/ --recursive --profile=chrisamido
aws sqs purge-queue --queue-url https://sqs.eu-west-1.amazonaws.com/525470265062/serverless-mapreduce-finalreduced.fifo --profile=chrisamido
aws sqs purge-queue --queue-url https://sqs.eu-west-1.amazonaws.com/525470265062/serverless-mapreduce-ingested.fifo --profile=chrisamido
aws sqs purge-queue --queue-url https://sqs.eu-west-1.amazonaws.com/525470265062/serverless-mapreduce-mapped.fifo --profile=chrisamido
aws sqs purge-queue --queue-url https://sqs.eu-west-1.amazonaws.com/525470265062/serverless-mapreduce-rawdata.fifo --profile=chrisamido
aws sqs purge-queue --queue-url https://sqs.eu-west-1.amazonaws.com/525470265062/serverless-mapreduce-reduced.fifo --profile=chrisamido
aws sqs purge-queue --queue-url https://sqs.eu-west-1.amazonaws.com/525470265062/serverless-mapreduce-commandQueue.fifo --profile=chrisamido
aws sqs purge-queue --queue-url https://sqs.eu-west-1.amazonaws.com/525470265062/serverless-mapreduce-remoteCommandQueue.fifo --profile=chrisamido
