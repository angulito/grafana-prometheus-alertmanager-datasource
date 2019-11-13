#!/bin/bash

name=new_alert_priority3
url='http://0.0.0.0:9093/api/v1/alerts'

echo "firing up alert $name" 

# change url o
curl -XPOST $url -d "[{ 
	\"status\": \"firing\",
	\"labels\": {
		\"alertname\": \"$name\",
		\"severity\":\"P2\"
	},
	\"annotations\": {
		\"summary\": \"High latency is high!\"
	},
	\"generatorURL\": \"http://prometheus.int.example.net/<generating_expression>\"
}]"

echo "press enter to resolve alert"
read

echo "sending resolve"
curl -XPOST $url -d "[{ 
	\"status\": \"resolved\",
	\"labels\": {
		\"alertname\": \"$name\",
		\"severity\":\"P2\"
	},
	\"annotations\": {
		\"summary\": \"High latency is high!\"
	},
	\"generatorURL\": \"http://prometheus.int.example.net/<generating_expression>\"
}]"