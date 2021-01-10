# sap-webide-docker
Docker image for SAP WebIDE personal edition

SAP Web IDE lets you develop, test, deploy, and extend your role-based apps. Create applications more rapidly and deliver a better experience for business users. [[More Info]](https://developers.sap.com/topics/web-ide.html)



## SAP Web IDE Personal Edition
SAP Web IDE personal edition is intended as a complementary IDE, to be installed by a single developer on a personal workstation, for offline development (not on a server). [[More Info]](https://help.sap.com/viewer/825270ffffe74d9f988a0f0066ad59f0/CF/en-US/5b8bca3147ee4dfd99be8aaf6bd4f421.html)

### The following features are not available if you are using SAP Web IDE personal edition:
 - SAP Cloud features:
    - Deploying to SAP Cloud Platform
    - Running applications on SAP Cloud Platform
    - Extending applications on SAP Cloud Platform
    - Importing applications from SAP Cloud Platform
    - Registering to SAP Fiori launchpad on SAP Cloud Platform
 - Proxy Authentication
 - Extension development
 - Template development
 - Use of optional extensions

> Note:  
> The SAP Fiori Overview Page extension is enabled by default in the personal edition.

 - Git stash option
 - Code check before Git push
 - Problem view
 - Run configurations advanced settings
 - Learning Center perspective
 - Notification alerts
 - Customizing performance measures
 - Client build
 - Grunt build
 - Translation Hub



## Building the image
> Being a docker image, there is a basic requirement that you need to have [docker](https://www.docker.com/) installed in your system.

Clone this repository and run the below command to build the image
```shell
docker build --tag sap-webide:latest .
```

## Running the image
The image is published to the docker hub, so all you need to do is run the following command (change the port if needed).
```shell
docker run -d -p 8080:8080 --rm sarathm09/sap-webide
```

## Credits
 - The docker image was possible because of the steps to repackage the windows version of webide, as mentioned in [this article by Aydin Tekin](https://blogs.sap.com/2017/04/25/how-to-run-sap-webide-personal-edition-on-linux/)
