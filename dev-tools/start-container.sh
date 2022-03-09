#!/bin/bash

docker build -t log-export-container .
docker run -p 5140:5140 \
  -e LOG_EXPORT_CONTAINER_INPUT=$LOG_EXPORT_CONTAINER_INPUT \
  -e LOG_EXPORT_CONTAINER_OUTPUT="$LOG_EXPORT_CONTAINER_OUTPUT" \
  -e LOG_EXPORT_CONTAINER_DECODE_CHUNK_EVENTS=$LOG_EXPORT_CONTAINER_DECODE_CHUNK_EVENTS \
  -e LOG_EXPORT_CONTAINER_EXTRACT_AUDIT_ACTIVITIES=$LOG_EXPORT_CONTAINER_EXTRACT_AUDIT_ACTIVITIES \
  -e LOG_EXPORT_CONTAINER_EXTRACT_AUDIT_ACTIVITIES_INTERVAL=$LOG_EXPORT_CONTAINER_EXTRACT_AUDIT_ACTIVITIES_INTERVAL \
  -e REMOTE_SYSLOG_HOST=$REMOTE_SYSLOG_HOST \
  -e REMOTE_SYSLOG_PORT=$REMOTE_SYSLOG_PORT \
  -e REMOTE_SYSLOG_PROTOCOL=$REMOTE_SYSLOG_PROTOCOL \  
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_REGION=$AWS_REGION \
  -e S3_BUCKET=$S3_BUCKET \
  -e S3_REGION=$S3_REGION \
  -e S3_PATH=$S3_PATH \
  -e CLOUDWATCH_LOG_GROUP_NAME=$CLOUDWATCH_LOG_GROUP_NAME \
  -e CLOUDWATCH_LOG_STREAM_NAME=$CLOUDWATCH_LOG_STREAM_NAME \
  -e SPLUNK_HEC_HOST=$SPLUNK_HEC_HOST \
  -e SPLUNK_HEC_PORT=$SPLUNK_HEC_PORT \
  -e SPLUNK_HEC_TOKEN=$SPLUNK_HEC_TOKEN \
  -e DATADOG_API_KEY=$DATADOG_API_KEY \
  -e AZURE_LOGANALYTICS_CUSTOMER_ID=$AZURE_LOGANALYTICS_CUSTOMER_ID \
  -e AZURE_LOGANALYTICS_SHARED_KEY=$AZURE_LOGANALYTICS_SHARED_KEY \
  -e SUMOLOGIC_ENDPOINT=$SUMOLOGIC_ENDPOINT \
  -e SUMOLOGIC_SOURCE_CATEGORY=$SUMOLOGIC_SOURCE_CATEGORY \
  -e KAFKA_BROKERS=$KAFKA_BROKERS \
  -e KAFKA_TOPIC=$KAFKA_TOPIC \
  -e KAFKA_FORMAT_TYPE=$KAFKA_FORMAT_TYPE \
  -e MONGO_URI=$MONGO_URI \
  -e SDM_ADMIN_TOKEN=$SDM_ADMIN_TOKEN \
  -e LOGZ_ENDPOINT=$LOGZ_ENDPOINT \
  -e LOKI_URL=$LOKI_URL \
  -e TAIL_FILE_PATH=$TAIL_FILE_PATH \
  log-export-container &

ssh -N -R 5140:localhost:5140 -i $LOG_EXPORT_CONTAINER_SSH_CREDENTIALS $LOG_EXPORT_CONTAINER_SSH_DESTINATION
