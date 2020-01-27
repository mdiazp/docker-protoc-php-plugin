echo "Generating files"
#protoc -I ../proto/ --proto_path=../proto/third_party ../proto/translator.proto --go_out=plugins=grpc:./v2/translatorpb
mkdir -p /grpc/api/php

protoc  --proto_path=/grpc/api/protos/ \
        --php_out=/grpc/api/php/ \
        --grpc_out=/grpc/api/php \
        --plugin=protoc-gen-grpc=/grpc_php_plugin/grpc_php_plugin \
        /grpc/api/protos/service.proto
 
