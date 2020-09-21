# Linux on windows via Centos container

## Docker on windows

I am on windows, this is good actually for my daily work, but I am missing badly a real shell for my day-to-day workflow.

For this purpose, I have been working with a Centos container for some time now. Here is just an automated bring up, noticeably with shell access so I can ssh locally from my windows computer.

I am using the following:
* ssh (dedicated port 1022) to connect to the container
* shared volume to exchange file with my windows computer

## Docker installation

* Install  docker desktop from <https://www.docker.com/get-started>
* Allow file sharing in docker setup menu as per screen capture below

![](pictures/docker-fs.jpg)


## Container launch

* Clone this where you want it to be and access the dockerwindows folder.

```
PS C:\Users\rroberts\Documents\test> git clone https://github.com/robric/dockerwindows
Cloning into 'dockerwindows'...
remote: Enumerating objects: 14, done.
remote: Counting objects: 100% (14/14), done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 14 (delta 3), reused 11 (delta 2), pack-reused 0
Unpacking objects: 100% (14/14), done.
PS C:\Users\rroberts\Documents\test> ls


    Directory: C:\Users\rroberts\Documents\test


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----        9/21/2020   5:00 PM                dockerwindows


PS C:\Users\rroberts\Documents\test> cd .\dockerwindows\
PS C:\Users\rroberts\Documents\test\dockerwindows> ls


    Directory: C:\Users\rroberts\Documents\test\dockerwindows


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        9/21/2020   5:00 PM            363 dockerfile
-a----        9/21/2020   5:00 PM           1223 README.md


PS C:\Users\rroberts\Documents\test\dockerwindows>
```

* Build the image

There is dockerfile with all instruction to have ssh working from scratch (and some extra useful software installed such as git and ansible.... feel free to add more)
  
```
C:\Users\rroberts\Documents\GitHub\dockerwindows>docker build .
Sending build context to Docker daemon  79.87kB
Step 1/10 : FROM centos:latest
 ---> 0d120b6ccaa8
Step 2/10 : RUN yum update -y   && yum install -y   sudo   git   openssh-server   && yum clean all
 ---> Running in 78a9f022b46f
CentOS-8 - AppStream                            4.4 MB/s | 5.8 MB     00:01    
```

* List images

List images to find the modified docker image and tag it so it is easy to find it again - should you need to recreate the containers

```
C:\Users\rroberts\Documents\GitHub\dockerwindows>docker image list
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              53ea8643b691        4 minutes ago       324MB
centos              latest              0d120b6ccaa8        5 weeks ago         215MB

C:\Users\rroberts\Documents\GitHub\dockerwindows>docker image tag 53ea8643b691 centos-ssh:latest  

C:\Users\rroberts\Documents\GitHub\dockerwindows>docker image list
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
centos-ssh          latest              53ea8643b691        43 minutes ago      324MB
centos              latest              0d120b6ccaa8        5 weeks ago         215MB


```

* Start your container with attributes

Here I am using a port redirection from 1022 to 22 and map a shared volume to a pre-defined "drive" volume.

```
C:\Users\rroberts\Documents\GitHub\dockerwindows>docker run -itd --restart always -p 1022:22 -v C:/Users/rroberts/docker:/root/drive centos-ssh  
dd1ae25265fac6612891edd72c6df84e73165673d2622940d46a9a56e1d4beaf
```




# dockerwindows

In docker setup, define shared folder with windows to so as to leverage great linux tool (git/ansible/programmation)


