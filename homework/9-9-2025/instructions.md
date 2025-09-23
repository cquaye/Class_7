# EC2 configuraton and Teardown instructions
### These instructions will walk you through setting up and tearing down an EC2 instance in AWS. 

1. Create a Security group
   * i. In AWS search for EC2
   * ii. In the left pannel, look for **Security Groups** and select it. 
   * iii. Look for and click the **orange** button that says **create security group**.
   * iv. Provide a name and description(optional).
   * v. Under **inbound rules**, click **add rule**
        - Select **HTTP**
        - Select Port **80**
        - Select Source **Anywhere (0.0.0.0/0)**
    vi. Leave **outbound rules** as default (do not touch!)
    vii. Tags (optional)
    vii. Click **Create**

2. 