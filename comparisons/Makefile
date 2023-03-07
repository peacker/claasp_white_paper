DOCKER_IMG_NAME=claasp_experiments
CONTAINER_NAME=claasp_container
CLAASP_LOCAL_PATH=/home/juan/Repos/tii-cryptalib
builddocker:
	docker build  -f docker/Dockerfile -t $(DOCKER_IMG_NAME) docker/
rundocker: builddocker
	[ ! "$(docker ps -a | grep ${CONTAINER_NAME})" ] && docker rm -f ${CONTAINER_NAME} && \
	docker run --name ${CONTAINER_NAME} -i -v ${CLAASP_LOCAL_PATH}:/home/sage/tii-cryptalib -v `pwd`:/home/sage/docker_claasp_white_paper_experiments -t $(DOCKER_IMG_NAME)
install_claasp:
	docker exec -t ${CONTAINER_NAME} bash -c  'cd /home/sage/tii-cryptalib ; make clean' && \
	docker exec -t ${CONTAINER_NAME} bash -c  'cd /home/sage/tii-cryptalib ; make install'
