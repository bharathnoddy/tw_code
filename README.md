```
This terraform code assumes that the AWS security group , VPC , AMI , Region , keys etc already available in AWS. These variables can be changed in variables.tf
```


```
--I have used terraform code to build the infrastructure . The code under static will built the webserver which will hold the "static" content  and the code under "app" will hold the war file and its basically a tomcat server.
--For configuring these two server I have used a shell script which can be found under "static/filelist/user_data.sh" and "app/filelist/user_data.sh". Ideally some configuration management tools like Puppet or Ansible should have been used here to deal with the configuration part but since this is not the part of the assignment I went ahead with this simple Bash script.
--The only manual part here is once the static server is deployed we have to update the IP address of this server into "app/filelist/user_data.sh" under the "IP" variable before deploying the application webserver. This manual step can be avoided if we had DNS server in place since I am using this IP just to refer the static content from the application server.

```


```
DEPLOYING THE WEB SERVER:
--clone the repo
--go into the static directory and fire the following commands (assumed that terraform is installed and you have your AWS secret keys. Also make sure you change the private keys location in main.tf )
#terraform init
#terraform plan
#terraform apply

--Make a not of the IP address displayed once the apply is complete
```

```
DEPLOYING THE APPLICATION SERVER:
--Go into the app directory and fist change the "IP" variable inside app/filelist/user_data.sh with your static servers IP
#terraform init
#terraform plan
#terraform apply
```

```
Both your web server and the application server are up now.You should be able to access the application using.

https://<IP of the tomcat server>:8443/companyNews   
```

```
SCALING THE APPLICATION IF REQUIRED :
This can be taken care via Manual or automated process.
--Manual Process :
 We can host multiple application server across different AZ's and put these server behind a load balancer.
 in case if we feel line the application server needs scaling then we can add one more applications server and add it to the LB

 --Automatic Process:
 We can use Autoscaling here.The application server can be launched using Autoscaling with the desired number of application server behind a LB.We can configure some triggers like autoscaling should start the deploy more applications servers in case some application server goes down or if there is heavy load in the server 
```
