# Image Preparation

* Install docker on windows from docker.com

Install the docker desktop <https://www.docker.com/get-started>

* Get latest centos image

```
PS C:\Users\rroberts\Documents> docker image pull centos
Using default tag: latest
latest: Pulling from library/centos
3c72a8ed6814: Pull complete                                                       Digest: sha256:76d24f3ba3317fa945743bb3746fbaf3a0b752f10b10376960de01da70685fbd
Status: Downloaded newer image for centos:latest
docker.io/library/centos:latest
```

* Check image 
  
```
PS C:\Users\rroberts\Documents> docker image list
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
centos              latest              0d120b6ccaa8        5 weeks ago         215MB
```

* Start the centos container

```
PS C:\Users\rroberts\Documents> docker run -itd centos bash
24ea51ba16921e06b4f21bf6c3fa021811e068f491d6510b7cce0941f44fb02c
```

* 

PS C:\Users\rroberts\docker\dockerbuild> docker build .



# dockerwindows

In docker setup, define shared folder with windows to so as to leverage great linux tool (git/ansible/programmation)


