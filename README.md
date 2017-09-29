# shinyproxyTemp

<!--
![Badge Status](https://ci-as-a-service)
-->
A package of ShinyProxy and Shiny apps.

## Description
shinyproxyTemp is a template that users can deploy Shiny Appliations in the Docker environment

<!--
***DEMO:***
![Demo](https://image-url.gif)
-->
## Features

- You only need to prepare ui.R, server.R, and global.R files on your local machine
- After you build a Docker image, your Shiny apps should be online within a short time

## Requirement

- Java
- Docker

## Usage

0. Run Docker opening port 2375. Refer to the Getting Started page of ShinyProxy site;
https://www.shinyproxy.io/getting-started/

1. Pull Docker images
````
sudo docker pull openanalytics/shinyproxy-demo
sudo docker pull noguchit/shinyproxytemp
````

2. Download shinyproxy jar file from
https://github.com/openanalytics/shinyproxy/releases

3. Run shinproxy
````
java -jar shinyproxy-1.0.0.jar 
````

4. Open your browser to http://YOURHOSTIP:8080
and logn in using cream for username, and crimson for password

Note. application.yml (shinyproxy config. file) should be on the same direcotry of shinyproxy-1.x.x.jar file.
## Installation
```
    $ git clone git@github.iu.edu:tnoguchi/shinyproxyTemp.git
```
    
## Further info
[https://shinyproxy.io](https://shinyproxy.io)
## Author
tnoguchi@iu.edu
## License