# EC2 configuraton and Teardown instructions
### These instructions will walk you through setting up and tearing down an EC2 instance in AWS. 
### You will need: 
#### *open AWS console
#### *Template web script from Theo's repo. 

1. **Create a Security group**
   *  In AWS search for EC2
   *  In the left pannel, look for **Security Groups** and select it. 
   *  Look for and click the **orange** button that says **create security group**.
   *  Provide a name and description(optional).
   *  Under **inbound rules**, click **add rule**
        - Select **HTTP**
        - Select Port **80**
        - Select Source **Anywhere (0.0.0.0/0)**
    * Leave **outbound rules** as default (do not touch!)
    * Tags (optional)
    * Click **Create**

2. **Deploying an EC2 Instance**
    * 
    * In the console, select instances and click **launch instances**
    * Name your instance. 
    * Leave the AMI as default
    * Leave the instance type as default
    * in the **key pair** section select:
        - **create a new key pair**
        - Give it a name
        - Leave everything else alone
        - Select **Create key pair**
    * Under **Network settings** select **Selet existing security group**.
    * Select the security group you created.

