#echo "deb [trusted=yes] https://mirror.yandex.ru/mirrors/elastic/7/ stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
#docker run -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node,cluster.name=es-neto-cluster" docker.elastic.co/elasticsearch/elasticsearch:7.17.23


#ghcr.io/hirotasoshu/elasticsearch:7.17.7 

#docker pull elasticsearch:8.7.1

docker run -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" -e "cluster.name=es-neto-cluster" docker.io/library/elasticsearch:7.17.23
curl -X GET 'localhost:9200/_cluster/health?pretty'


#docker.io/library/elasticsearch:8.7.1