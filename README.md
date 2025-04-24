# CSYE6225_NetworkStructures_CloudComputing

## Table of Contents

| 📝 [Midterm Summary](./docs/midterm.md) | 📘 [Final Summary](./docs/final.md) |
|-------------------------------------------------------------------------------------------|--------------------------------------------|

## M1

### Linux
- Open-source OS kernel created by Linus Torvalds in 1991.
- Built using GNU utilities, forming a complete OS.
- Used in servers, desktops, embedded systems for stability, security, flexibility.

### AWS Certified Cloud Practitioner Actual Exam Questions

#### Question #1  
**A company is planning to run a global marketing application in the AWS Cloud. The application will feature videos that can be viewed by users. The company must ensure that all users can view these videos with low latency. Which AWS service should the company use to meet this requirement?**  

- A. AWS Auto Scaling  
- B. Amazon Kinesis Video Streams  
- C. Elastic Load Balancing  
- D. Amazon CloudFront ✅  

**Explanation:**  
Amazon **CloudFront** is a Content Delivery Network (CDN) that caches and delivers videos from **edge locations** closest to users, reducing latency.

---

#### Question #2  
**Which pillar of the AWS Well-Architected Framework refers to the ability of a system to recover from infrastructure or service disruptions and dynamically acquire computing resources to meet demand?**  

- A. Security  
- B. Reliability ✅  
- C. Performance efficiency  
- D. Cost optimization  

**Explanation:**  
The **Reliability** pillar ensures **fault tolerance, failover, and automatic resource scaling**, which helps recover from disruptions.

---

#### Question #3  
**Which of the following are benefits of migrating to the AWS Cloud? (Choose two.)**  

- A. Operational resilience ✅  
- B. Discounts for products on Amazon.com  
- C. Business agility ✅  
- D. Business excellence  
- E. Increased staff retention  

**Explanation:**  
- **Operational resilience** ensures high availability and disaster recovery.  
- **Business agility** allows companies to **quickly scale and deploy** new applications.

---

#### Question #4  
**A company is planning to replace its physical on-premises compute servers with AWS serverless compute services. The company wants to be able to take advantage of advanced technologies quickly after the migration. Which pillar of the AWS Well-Architected Framework does this plan represent?**  

- A. Security  
- B. Performance efficiency ✅  
- C. Operational excellence  
- D. Reliability  

**Explanation:**  
The **Performance Efficiency** pillar focuses on **scalable compute solutions**, such as AWS Lambda and serverless computing.

---

#### Question #5  
**A large company has multiple departments. Each department has its own AWS account. Each department has purchased Amazon EC2 Reserved Instances. Some departments do not use all the Reserved Instances that they purchased, and other departments need more Reserved Instances than they purchased. The company needs to manage the AWS accounts for all the departments so that the departments can share the Reserved Instances. Which AWS service or tool should the company use to meet these requirements?**  

- A. AWS Systems Manager  
- B. Cost Explorer  
- C. AWS Trusted Advisor  
- D. AWS Organizations ✅  

**Explanation:**  
AWS **Organizations** enables **consolidated billing**, allowing **unused Reserved Instances** to be shared across multiple accounts.

---

#### Question #6  
**Which component of the AWS global infrastructure is made up of one or more discrete data centers that have redundant power, networking, and connectivity?**  

- A. AWS Region  
- B. Availability Zone ✅  
- C. Edge location  
- D. AWS Outposts  

**Explanation:**  
An **Availability Zone (AZ)** consists of **one or more data centers** with **redundant power and networking**.

---

#### Question #7  
**Which duties are the responsibility of a company that is using AWS Lambda? (Choose two.)**  

- A. Security inside of code ✅  
- B. Selection of CPU resources  
- C. Patching of operating system  
- D. Writing and updating of code ✅  
- E. Security of underlying infrastructure  

**Explanation:**  
- Customers **manage their code and security** within the code.  
- AWS **handles OS patching and infrastructure security**.

---

#### Question #8  
**Which AWS services or features provide disaster recovery solutions for Amazon EC2 instances? (Choose two.)**  

- A. EC2 Reserved Instances  
- B. EC2 Amazon Machine Images (AMIs) ✅  
- C. Amazon Elastic Block Store (Amazon EBS) snapshots ✅  
- D. AWS Shield  
- E. Amazon GuardDuty  

**Explanation:**  
- **AMIs** allow entire EC2 instances to be **backed up and restored**.  
- **EBS Snapshots** create **point-in-time backups** of EC2 storage.

---

#### Question #9  
**A company is migrating to the AWS Cloud instead of running its infrastructure on premises. Which of the following are advantages of this migration? (Choose two.)**  

- A. Elimination of the need to perform security auditing  
- B. Increased global reach and agility ✅  
- C. Ability to deploy globally in minutes ✅  
- D. Elimination of the cost of IT staff members  
- E. Redundancy by default for all compute services  

**Explanation:**  
- AWS allows for **global scalability** and rapid deployments.  
- **Compute and storage resources** are available worldwide **within minutes**.

---

#### Question #10  
**A user is comparing purchase options for an application that runs on Amazon EC2 and Amazon RDS. The application cannot sustain any interruption. The application experiences a predictable amount of usage, including some seasonal spikes that last only a few weeks at a time. It is not possible to modify the application. Which purchase option meets these requirements MOST cost-effectively?**  

- A. Review the AWS Marketplace and buy Partial Upfront Reserved Instances to cover the predicted and seasonal load.  
- B. Buy Reserved Instances for the predicted amount of usage throughout the year. Allow any seasonal usage to run on Spot Instances.  
- C. Buy Reserved Instances for the predicted amount of usage throughout the year. Allow any seasonal usage to run at an On-Demand rate. ✅  
- D. Buy Reserved Instances to cover all potential usage that results from the seasonal usage.  

**Explanation:**  
- **Reserved Instances** cover the **predictable** base load at a lower cost.  
- **On-Demand Instances** handle **seasonal spikes** without long-term commitments.

---

#### Question #11  
**A company wants to review its monthly costs of using Amazon EC2 and Amazon RDS for the past year. Which AWS service or tool provides this information?**  

- A. AWS Trusted Advisor  
- B. Cost Explorer ✅  
- C. Amazon Forecast  
- D. Amazon CloudWatch  

**Explanation:**  
AWS **Cost Explorer** provides **historical cost data** (up to 12 months), **forecasting**, and **detailed AWS spending analysis**.

---

#### Question #12  
**A company needs to migrate a critical application to AWS. The application has a short runtime. The application is invoked by changes in data or by shifts in system state. The company needs a compute solution that maximizes operational efficiency and minimizes the cost of running the application. Which AWS solution should the company use to meet these requirements?**  

- A. Amazon EC2 On-Demand Instances  
- B. AWS Lambda ✅  
- C. Amazon EC2 Reserved Instances  
- D. Amazon EC2 Spot Instances  

**Explanation:**  
AWS **Lambda** is **serverless**, automatically scales, and is **cost-effective** for **short-lived, event-driven applications**.

---

#### Question #13  
**Which AWS service or feature allows users to connect with and deploy AWS services programmatically?**  

- A. AWS Management Console  
- B. AWS Cloud9  
- C. AWS CodePipeline  
- D. AWS Software Development Kits (SDKs) ✅  

**Explanation:**  
AWS **SDKs** provide APIs for integrating **AWS services into applications**, enabling **programmatic deployment**.

---

#### Question #14  
**A company plans to create a data lake that uses Amazon S3. Which factor will have the MOST effect on cost?**  

- A. The selection of S3 storage tiers ✅  
- B. Charges to transfer existing data into Amazon S3  
- C. The addition of S3 bucket policies  
- D. S3 ingest fees for each request  

**Explanation:**  
**S3 storage tier selection** significantly affects costs. **Glacier** and **Intelligent-Tiering** are **cheaper for long-term storage**, while **S3 Standard** is optimized for frequent access.

---

#### Question #15  
**A company is launching an eCommerce application that must always be available. The application will run on Amazon EC2 instances continuously for the next 12 months. What is the MOST cost-effective instance purchasing option that meets these requirements?**  

- A. Spot Instances  
- B. Savings Plans ✅  
- C. Dedicated Hosts  
- D. On-Demand Instances  

**Explanation:**  
**Savings Plans** provide **cost savings of up to 72%** for **long-term, predictable workloads** without the rigidity of Reserved Instances.

---

#### Question #16  
**Which AWS service or feature can a company use to determine which business unit is using specific AWS resources?**  

- A. Cost allocation tags ✅  
- B. Key pairs  
- C. Amazon Inspector  
- D. AWS Trusted Advisor  

**Explanation:**  
**Cost allocation tags** help **track AWS usage and expenses** by **department, project, or team** in **Cost Explorer**.

---

#### Question #17  
**A company wants to migrate its workloads to AWS but lacks expertise in AWS Cloud computing. Which AWS service or feature will help the company with its migration?**  

- A. AWS Trusted Advisor  
- B. AWS Consulting Partners ✅  
- C. AWS Artifact  
- D. AWS Managed Services  

**Explanation:**  
AWS **Consulting Partners** provide **cloud migration expertise**, helping businesses with **architecture and deployment**.

---

#### Question #18  
**Which AWS service or tool should a company use to centrally request and track service limit increases?**  

- A. AWS Config  
- B. Service Quotas ✅  
- C. AWS Service Catalog  
- D. AWS Budgets  

**Explanation:**  
**Service Quotas** allows companies to **track, request, and manage AWS service limits** in a **centralized** way.

---

#### Question #19  
**Which documentation does AWS Artifact provide?**  

- A. Amazon EC2 terms and conditions  
- B. AWS ISO certifications ✅  
- C. A history of a company's AWS spending  
- D. A list of previous-generation Amazon EC2 instance types  

**Explanation:**  
AWS **Artifact** provides **compliance and security documentation**, including **ISO certifications, SOC reports, and GDPR-related agreements**.

---

#### Question #20  
**What task requires using AWS account root user credentials?**  

- A. Viewing billing information  
- B. Changing the AWS Support plan ✅  
- C. Starting and stopping Amazon EC2 instances  
- D. Opening an AWS Support case  

**Explanation:**  
Only the **AWS root user** can perform **high-privilege tasks**, including **changing AWS Support plans, closing accounts, and modifying certain account settings**.

---

#### Question #21  
**A company needs to simultaneously process hundreds of requests from different users. Which combination of AWS services should the company use to build an operationally efficient solution?**  

- A. Amazon Simple Queue Service (Amazon SQS) and AWS Lambda ✅  
- B. AWS Data Pipeline and Amazon EC2  
- C. Amazon Kinesis and Amazon Athena  
- D. AWS Amplify and AWS AppSync  

**Explanation:**  
**Amazon SQS** queues messages for **asynchronous processing**, while **AWS Lambda** scales automatically to handle high traffic efficiently.

---

#### Question #22  
**What is the scope of a VPC within the AWS network?**  

- A. A VPC can span all Availability Zones globally.  
- B. A VPC must span at least two subnets in each AWS Region.  
- C. A VPC must span at least two edge locations in each AWS Region.  
- D. A VPC can span all Availability Zones within an AWS Region. ✅  

**Explanation:**  
A **VPC is region-specific** and can **span multiple Availability Zones (AZs) within that region**.

---

#### Question #23  
**Which of the following are components of an AWS Site-to-Site VPN connection? (Choose two.)**  

- A. AWS Storage Gateway  
- B. Virtual private gateway ✅  
- C. NAT gateway  
- D. Customer gateway ✅  
- E. Internet gateway  

**Explanation:**  
An **AWS Site-to-Site VPN** requires a **Virtual Private Gateway (AWS side)** and a **Customer Gateway (on-premises side)** to establish a secure connection.

---

#### Question #24  
**A company needs to establish a connection between two VPCs. The VPCs are located in two different AWS Regions. The company wants to use the existing infrastructure of the VPCs for this connection. Which AWS service or feature can be used to establish this connection?**  

- A. AWS Client VPN  
- B. VPC peering ✅  
- C. AWS Direct Connect  
- D. VPC endpoints  

**Explanation:**  
**VPC Peering** allows **secure communication between VPCs**, even across **different AWS Regions**, without needing additional infrastructure.

---

#### Question #25  
**According to the AWS shared responsibility model, what responsibility does a customer have when using Amazon RDS to host a database?**  

- A. Manage connections to the database ✅  
- B. Install Microsoft SQL Server  
- C. Design encryption-at-rest strategies ✅  
- D. Apply minor database patches  

**Explanation:**  
AWS manages **database software and patching**, but customers are responsible for **managing connections and encryption strategies**.

---

#### Question #26  
**What are some advantages of using Amazon EC2 instances to host applications in the AWS Cloud instead of on premises? (Choose two.)**  

- A. EC2 includes operating system patch management.  
- B. EC2 integrates with Amazon VPC, AWS CloudTrail, and AWS Identity and Access Management (IAM). ✅  
- C. EC2 has a 100% service level agreement (SLA).  
- D. EC2 has a flexible, pay-as-you-go pricing model. ✅  
- E. EC2 has automatic storage cost optimization.  

**Explanation:**  
- **EC2 integrates with AWS services** for **networking, security, and monitoring**.  
- **Flexible, pay-as-you-go pricing** eliminates **upfront costs**.

---

#### Question #27  
**A user needs to determine whether an Amazon EC2 instance's security groups were modified in the last month. How can the user see if a change was made?**  

- A. Use Amazon EC2 to see if the security group was changed.  
- B. Use AWS Identity and Access Management (IAM) to see which user or role changed the security group.  
- C. Use AWS CloudTrail to see if the security group was changed. ✅  
- D. Use Amazon CloudWatch to see if the security group was changed.  

**Explanation:**  
**AWS CloudTrail** logs **security group modifications**, including **who made the changes and when**.

---

#### Question #28  
**Which AWS service will help protect applications running on AWS from DDoS attacks?**  

- A. Amazon GuardDuty  
- B. AWS WAF  
- C. AWS Shield ✅  
- D. Amazon Inspector  

**Explanation:**  
AWS **Shield Standard** provides **automatic DDoS protection**, while **Shield Advanced** offers **enhanced protection** with monitoring and cost safeguards.

---

#### Question #29  
**Which AWS service or feature acts as a firewall for Amazon EC2 instances?**  

- A. Network ACL  
- B. Elastic network interface  
- C. Amazon VPC  
- D. Security group ✅  

**Explanation:**  
**Security Groups** act as **stateful firewalls** for **Amazon EC2 instances**, controlling **inbound and outbound traffic**.

---

#### Question #30  
**How does the AWS Cloud pricing model differ from the traditional on-premises storage pricing model?**  

- A. AWS resources do not incur costs  
- B. There are no infrastructure operating costs  
- C. There are no upfront cost commitments ✅  
- D. There are no software licensing costs  

**Explanation:**  
AWS follows a **pay-as-you-go** pricing model with **no upfront infrastructure commitments**, unlike **on-premises investments**.

---