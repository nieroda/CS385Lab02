
all: network sqlserver minibank

allslim: network sqlserver minibankslim cleandangling

minibank:
	docker build -t minibank ./go
	docker run -d --name minibank -p 8080:8080 --net testnet minibank

minibankslim:
	docker build -t minibankslim ./go1
	docker run -d --name minibankslim -p 8080:8080 --net testnet minibankslim

sqlserver:
	docker build -t mysql ./mysql
	docker run -d --name mysql --net testnet mysql

network:
	docker network create testnet

cleandangling:
	docker images -qf dangling=true | xargs docker rmi

clean:
	docker stop mysql | true
	docker stop minibank | true
	docker stop minibankslim | true
	#docker container rm $(docker container ls -a -q)
	#docker image rm $(docker image ls -a -q)
	#docker network rm $(docker network ls -q)
