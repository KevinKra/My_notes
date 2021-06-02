## IAM

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

#### Answers:

1. The `IAM policy simulator` allows you to easily and quickly test (or simulate) the permissions setup for your Roles, Groups, and Policies.
1. Users, Groups, and Roles.
1. The policy allows full access to all s3 resources.
1. IAM provides global policies, however regional policies _can_ be implemented.
1. The root account is created when you first setup your AWS account. It has complete admin access.
1. No. New users need to be assigned permissions.
1. The access keys granted to a new user are _only_ for accessing AWS through APIs and the command line. Separate permissions are required to use the AWS console directly.
1. Only once, when you first create the new user. New credentials will need to be generated if you wish to regain access.
1. IAM Role.
1. No, this creates a security vulnerability since sensitive information is stored on an EC2 machine instead of being managed in the secure cloud.
1. Create an IAM role with read-access to S3 and assign the role to the EC2 instance. IAM roles allow applications to securely make API requests from instances, without requiring you to manage the security credentials that the applications use.

## Developer Theory

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
