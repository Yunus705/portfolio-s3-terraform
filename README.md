# 🌐 Portfolio Website Hosting on AWS S3 using Terraform

This project demonstrates how to **host a static portfolio website** on **AWS S3** using **Terraform**.  
It provisions the required AWS resources, uploads the website files, applies public access policies, and outputs the website endpoint.

---

## 🚀 Features
- Hosted a **personal portfolio website** on AWS S3.  
- Automated infrastructure provisioning using **Terraform (IaC)**.  
- Configured:
  - **S3 bucket**  
  - **Ownership controls**  
  - **Public access settings**  
  - **Bucket policy** (for public read access)  
  - **Static website hosting** with custom `index.html` and `error.html`.  
- Uploaded website files:  
  - `index.html`  
  - `error.html`  
  - `style.css`  

---

## 🛠️ Tech Stack
- **AWS S3** – Static Website Hosting  
- **Terraform** – Infrastructure as Code  
- **HTML & CSS** – Portfolio Website  

---

## ⚙️ Deployment Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/portfolio-s3-terraform.git
   cd portfolio-s3-terraform

2. **Initialize Terraform**
    ```bash
    terraform init

3. **Validate configuration**

terraform validate

4. **Apply changes**
    ```bash
    terraform apply -auto-approve

5. **Get the website endpoint**
Terraform will output the S3 static website endpoint after deployment.
Open it in your browser to view the portfolio.
