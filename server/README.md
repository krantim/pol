
## How to start mobile server

21 April. 2015
Authors : Ter & Joe

1. build stub service by calling command
	cd test/stub_service
	gradle fatjar
	
2. build mobile server by using command
	cd server
	grable fatjar

3. then you should be able to start server by using script
	./server start 
	./server stop

4. After mobile server start then you should be able to call the service
	http://localhost:8080



	 
