# IAM

#### Questions:

1. What is the `IAM policy simulator`, what does it do?
1. What are the three categories that IAM consists of? Describe each.
1. What does the following policy allow:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
```

4. Is IAM regional or global?
1. What is the root account?
1. Do users have permissions when first created?
1. New users are assigned an `access key ID` and a `secret access key` when their accounts are created. Where are these used and not used?
1. How many times can you view/access the secret access key after creating a new account?
1. Which IAM entity can you use to delegate access to your AWS resources to users, groups or services?
1. Does AWS recommend that EC2 instances have credentials stored on them so that the instances can access other resources (such as S3 buckets).
1. What is a suitable way to enable your EC2 instance to read files in an S3 bucket?
1. What is the difference between a group and a role?

#### Answers:

1. The `IAM policy simulator` allows you to easily and quickly test (or simulate) the permissions setup for your Roles, Groups, and Policies.
1. Users, Groups, and Roles.
1. The policy allows full access to all s3 resources.
1. IAM provides global policies, however regional policies _can_ be implemented.
1. The root account is created when you first setup your AWS account. It has complete admin access.
1. No. New users need to be assigned permissions.
1. The access keys granted to a new user are _only_ for accessing AWS through APIs and the command line. Separate permissions are required to use the AWS console directly.
1. Only once, when you first create the new user. New credentials will need to be generated if you wish to regain access.
1. IAM Roles.
1. No, this creates a security vulnerability since sensitive information is stored on an EC2 machine instead of being managed in the secure cloud.
1. Create an IAM role with read-access to S3 and assign the role to the EC2 instance. IAM roles allow applications to securely make API requests from instances, without requiring you to manage the security credentials that the applications use.
1. Like most security models you can think of a group as a group of users or Security Principles or entities. A Role however is a set of permissions or rights that can be attached to a User / Group / or other entity such as an EC2 instance.

# Developer Theory

#### Questions:

1. What is CI/CD?
1. What does continuous integration workflow generally look like?
1. What is the difference between continuous delivery and continuous deployment?
1. What is `CodeCommit`?
1. What is `CodeBuild`?
1. What is `CodeDeploy`?
1. What is `CodePipeline`?

#### Answers:

1. CI/CD stands for continuous integration, continuous delivery/deployment. It is a Software Development best practice that encourages making small continuous code changes and automating as much as possible through code integration, building, testing, and deployment.
1. After successful tests, the `code gets merged` into the master repository. Then it's `prepared for deployment` (code is built, tested, and packaged for deployment), then there is a manual (**continuous delivery**) or automated (**continuous deployment**) process to deploy the code.
1. Continuous Delivery is manual deployment, whereas Continuous Deployment is the automated variant of the process.
1. `CodeCommit`: Source & Version Control
1. `CodeBuild`: Automated Build
1. `CodeDeploy`: Automated Deployment
1. `CodePipeline`: Manages the Workflow

## CodeDeploy

#### Questions:

1. What are the two deployment approaches?
1. What is `In-Place` deployment and what are the new versions called?
1. What is `Blue/Green` deployment?
1. If you discover an issue in production, is it easy to roll back after doing an `in-place` deployment?
1. If you discover an issue in production, is it easy to roll back after doing a `blue/green` deployment?
1. What are some additional differences between each deployment solution? Consider: capacity impacts, price, lambda.
1. Can you do a blue/green deployment on your first setup?
1. Which deployment option is safe: in-place or blue/green?
1. Explain: `ssh -i privatekey.pem ec2-user@18.117.83.46`
1. What is a `Deployment Group`?
1. Explain the difference between `CodeDeploy` and `CodePipeline`

#### Answers:

1. They are "In-Place" and "Blue/Green".
1. **In-Place:** The application is stopped on each instance and the new release is installed. Also known as a rolling update. When CodeDeploy installs the new version, it's known as a **revision**.
1. **Blue/Green**: New instances are provisioned and the new release is installed on the new instances. Blue represents the active (current) version, and green is the new release. With this deployment variant, the new instances created by CodeDeploy are considered "green". Once initialized, the Green instances are registered with the Elastic Load Balancer and traffic is then routed away from the old environment. After everything is setup and working, we can terminate the old (blue) instances.
1. No, with an In-Place deployment, you'll need to re-deploy the previous version which can be time consuming.
1. Yes. with Blue/Green, provided you haven't terminated the Blue environment, you simply set the load-balancer to redirect traffic back to the original (blue) environment and unregister it from the green environment.
1. Since your rolling through and updating instances in "in-place", you lose some capacity (throughput) during this window. This issue does not apply to "blue/green". You would be paying for both the blue and green instances until one or the other is terminated. Lambda is not supported in "in-place".
1. No, since you don't have different version to switch between. First deployment is always going to be "in-place".
1. Blue/Green is safer. There is no capacity loss and roll-backs are much easier (provided the old versions aren't terminated).
1. We ssh into our ec2 instance through the public ipv4 address using our `-i` (case insensitive lookup) of the `.pem` private-key on our local machine.
1. The host, or group of hosts, that we are going to deploy our application to.
1. `CodeDeploy` is a fully managed deployment service that automates software deployments to compute services such as EC2, Lambda, and on-premise servers. `CodePipeline` is a CI/CD pipeline that provides fast and reliable infrastructure updates. CodePipeline builds, tests, and deploys (using CodeDeploy) every time there is a code change, based on the release models you define. **In short, CodePipeline automates the entirety of the CI/CD process and CodeDeploy can be integrated into that automated process to _automatically_ deploy to your compute resources.**

### EC2 AppSpec File Structure

#### Questions:

1. What are the four parts of the appspec file structure?
1. What purpose do each of the parts serve?
1. Where would an `appspec.yml` file typically live?
1. What is the `appspec.yml` file?
1. Do Hooks have a specific order, what is it called?
1. What are the three (general) phases of the CodeDeploy LifeCycle Event for an `In-Place` deployment?
1. Explain the lifecycle event hook: `BeforeBlockTraffic`.
1. Explain the lifecycle event hook: `BlockTraffic`.
1. Explain the lifecycle event hook: `AfterBlockTraffic`.
1. Explain the lifecycle event hook: `ApplicationStop`.
1. Explain the lifecycle event hook: `DownloadBundle`.
1. Explain the lifecycle event hook: `BeforeInstall`.
1. Explain the lifecycle event hook: `Install`.
1. Explain the lifecycle event hook: `AfterInstall`.
1. Explain the lifecycle event hook: `ApplicationStart`.
1. Explain the lifecycle event hook: `ValidateService`.
1. Explain the lifecycle event hooks: `BeforeAllowTraffic`,`AllowTraffic`,`AfterAllowTraffic`.
1. Rehearse the order of the lifecycle hooks.

#### Answers:

1. Version, OS, files, hooks.
1. **Version:** reserved for future use, currently only able to be `0.0`. **OS:** the operating system you are using, either windows or linux. **Files:** config files, packages. the location of any application files that need to be copied and where they should be copied to. **Hooks:** Lifecycle event hooks, scripts which need to run at set points in the deployment lifecycle. Hooks have a very specific run order.
1. the `appspec` file **must live in the root** of the directory of your revision, otherwise the deployment will fail. Typical folder setup looks like: `appspec.yaml` (root), `/Scripts`, `/Config`, `/Source`, these are all used to create relative paths for your yml file to locate the needed files.
1. It's a configuration file the defines the parameters to be used by CodeDeploy.
1. Yes, the hooks provide a means to hook-in selected scripts to run at specific times within the lifecycle of the deployment. It's called the `Run Order`.
1. Broadly three phases: de-registering, installation, re-registering with a Load Balancer. Phase 1: De-register instances from a load balancer. Phase 2: The majority of the application deployment. Phase 3: Re-register instances with the load balancer.
1. `BeforeBlockTraffic`: tasks you want to run on instances _before_ they are de-registered from a load balancer.
1. `BlockTraffic`: scripts related de-registering instances from a load balancer.
1. `AfterBlockTraffic`: tasks you want to run on instances _after_ they are de-registered from a load balancer.
1. `ApplicationStop`: scripts used to gracefully stop the application.
1. `DownloadBundle`: CodeDeploy agent copies the application revision files (new version) to a temporary location.
1. `BeforeInstall`: pre-installation scripts, e.g. backing up the current version, decrypting files.
1. `Install`: copy application revision files to final location.
1. `AfterInstall`: post-install scripts e.g. configuration, file permissions.
1. `ApplicationStart`: start any services that were stopped during ApplicationStop.
1. `ValidateService`: run tests to validate the service.
1. These lifecycle hooks mirror the block traffic hooks.
1. Useful for the exam.

## CodePipeline

#### Questions:

1. What is CodePipeline?
1. What can CodePipeline integrate with?
1. Describe an example of CodePipeline workflow.
1. Describe the process used to in the lab to setup the CloudFormation, S3, CodeDeploy, and CodePipeline tasks that resulted in a deploying + automated CI/CD pipeline?

#### Answers:

1. A fully managed CI/CD service. It orchestrates the Build, Test, and Deployment of your application. The Automated Release Process allows for fast and consistent deployments.

1. CodeCommit, CodeBuild., ElasticBeanstalk, CloudFormation, Lambda, Elastic Container Service, as well as third-party services like Github and Jenkins.

1. `CodePipeline` workflow is defined, new code appears in your repo, `CodeBuild` builds and tests the code, `CodeDeploy` deploys the application in staging or production.

1. First, CloudFormation requires it's templates to exist as a file within S3, this file is referenced in the script entered in the AWS CLI. Run the script in the CLI. Once the stack is created, we want to log into the instance and verify that our CodeDeploy agent was installed correctly. To do that, we ssh into our new EC2 instance via its public IPv4 address: `ssh -i my_private_key.pem ec2-user@34.238.240.42` **(Note: the pem-key you provided in the CloudFormation script template is the same one you use in the previous CLI ssh command).** We check our CodeDeploy status with: `sudo service codedeploy-agent status`. We then create a new bucket in S3 and upload the v1 `mywebapp.zip` file to the bucket. Then we go onto to `CodeDeploy` and "create application", then "create deployment group" (note: we may need to create a service role for the deployment group which allows CodeDeploy to call AWS services such as Auto Scaling on your behalf.) Among other steps, you'll need to target the _tagged_ EC2 instance we made with CloudFormation in the `Environment Configuration` panel. Add the s3 revision location. **If successful, test the EC2 address.** Now, go onto `CodePipline` can build a pipeline, if your s3 bucket is set to detect updates, your revisions will trigger a `CloudWatchEvent` which will rerun the pipeline.

## MicroServices

#### Questions:

1. What is a microservice?
1. What are three important advantages of microservice architecture?
1. Explain `Serviceability`
1. Explain `Flexibility`
1. Explain `Scalability`
1. Where do microservices run?
1. How many things does a microservice do?

#### Answers:

1. A microservice is an architectural and organizational approach to software development, where software is composed of small, independent services that communicate over well defined APIs.

1. **Serviceability**, it's easier to fix problems. **Flexibility**, it's easier to make changes. **Scalability**, it simplifies the scaling process; you scale the elements you need to scale, instead of the entire application.

1. Microservice serviceability allows you to mitigate the impact of a failing microservice within an application. For instance, since microservices are independent, if one service goes down, the whole application doesn't go down with it. It's quick to fix, if a container goes wrong, simply deploy a new instance of the microservice to fix the broken one.

1. Microservice patterns provide much greater flexibility. Upgrading a microservices within an application simply involves deploying a new version of that microservice. Likewise, it's easy to add new features -- simply add them as new microservice.

1. A microservice architecture makes scaling a lot simpler and easier. If one specific feature (a microservice) is really in-demand, simply scale up that service.

1. Microservices run in containers.

1. They are intended to do _one thing_ and it really well.

## Elastic Container Service (ECS)

#### Questions:

1. What is Elastic Container Service?
1. What is a container?
1. What two types of containers are there? Does ECS support both?
1. Describe the architecture of a Docker Container.
1. What are some really important advantages to using Containers/Microservices?
1. Advantage of ECS over Kubernetes?
1. Do containers need to be on EC2 instances?
1. What is an advantage of EC2 over Fargate for container management?
1. What is `ECR` (Elastic Container Registry)
1. Describe `ECS`, `Fargate`, and `ECR`

#### Answers:

1. Amazon Elastic Container Service (Amazon ECS) is a container orchestration service that runs and manages Docker containers. It runs clusters of virtual machines on the Amazon cloud, while managing, scaling, and scheduling groups of containers on those machines across multiple Availability Zones (AZs).
1. It's a standardized virtual operating environment with everything software needs to run (libraries, system tools, code, and run time.) The use of containers goes hand-in-hand with the microservice approach to building software. Applications are created using independent stateless components or microservices running in containers.
1. Linux containers (Docker) and Windows containers (Windows). ECS supports both container services.
1. A (Docker) container consists of: code, libraries, and the virtual kernel. The container runs on Docker which is installed on our OS.
1. It's highly scalable, if the application gets overloaded you only need to scale required services. It's fault tolerant, a single error in one container wont bring down the whole app. It's much easier to maintain and update than large monolithic applications.
1. It's integrated with other AWS services.
1. No. You have the option of having ECS run your microservices on clusters of virtual machines (EC2 instances) **OR** you can use `AWS Fargate` to manage it in a serverless manner, though it will still be provisioned on EC2 resources, they'll simply be managed by AWS.
1. Using ECS with direct EC2 integration allows for greater configuration and management of your compute environment. However, since you're essentially choosing to manage the compute resources yourself, the greater flexibility means you will also need to secure and manage your resources.
1. ECS (Elastic Container Service) is an orchestration platform build by and integrated into AWS. ECR, or Elastic Container Registry, is where you can store your Docker images. It's a registry for your container images. Fargate is a managed service that abstracts away the complexities of EC2 compute resource management.

---

## General AWS Commands

#### Questions:

1. How can you set/configure the current local aws user in the CLI?
1. What CLI command can be used to get the current IAM user information?
1. What CLI command can be used to list the current user details (including default region)

#### Answers:

1. `aws configure`
1. `aws iam get-user`
1. `aws configure list`

---

# General Questions

> Questions or interesting things I learned alongside of the above lessons.

#### Questions:

1. SSh'ing into an EC2 instance for the first time, I received the error: `WARNING: UNPROTECTED PRIVATE KEY FILE!`. What triggered this, and how was it resolved?
1. What's the difference between `chmod 400` and `chmod 600`?
1. What is the linux command: `sudo`?
1. What is the linux command: `yum`?
1. What is the linux command: `chmod`?
1. When you use `chmod {target}`, does it require a relative path to the file?
1. What is the command `curl`?
1. What is `ssh`?

#### Answers:

1. When I downloaded the `.pem` file to access my newly created EC2 instance, I put the file in my `Desktop` directory. This meant that the `.pem` file was "publicly visible" on my machine and as such, vulnerable to malicious attacks (it had a permission code of 0644). That is not acceptable for the EC2 instance. To make the key **NOT** accessible to others you open terminal and add enter `chmod 400 /path/to/your/accessKey.pem`. This overrides the permission code and sets it to `read-only`. [source](https://99robots.com/how-to-fix-permission-error-ssh-amazon-ec2-instance/)

1. `chmod 400` sets a file to only allow the owner to read (read-only access) it, whereas `chmod 600` allows the owner read-write access. `chmod 400` is the more secure of the options.

1. There are two ways to run administrative applications in Linux. You can either switch to the super user (root) with the su command, or you can take advantage of sudo. `Sudo` stands for "super user do". [source](https://www.linux.com/training-tutorials/linux-101-introduction-sudo/)

1. **YUM** is the primary package management tool for installing, updating, removing, and managing software packages in Red Hat Enterprise Linux. [source](https://www.redhat.com/sysadmin/how-manage-packages)

1. The **chmod** command changes the file's permissions. [source](https://linuxize.com/post/chmod-command-in-linux/)

1. Yes. A quick way to provide a relative path is to drag and drop the file from the finder and it will populate the terminal with `the/relative/path/to/yourfile.txt`.

1. cURL, which stands for client URL, is a command line tool that developers use to transfer data to and from a server. [source](https://developer.ibm.com/devpractices/api/articles/what-is-curl-command/)

1. SSH, also known as Secure Shell or Secure Socket Shell, is a network protocol that gives users, particularly system administrators, a secure way to access a computer over an unsecured network. [source](https://searchsecurity.techtarget.com/definition/Secure-Shell)

---

### sub-title

#### Questions:

#### Answers:
