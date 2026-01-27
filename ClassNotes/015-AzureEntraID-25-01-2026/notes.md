# 📘 Comprehensive Notes – Business Use Case & Azure Fundamentals

---

## 1️⃣ Objective & Learning Direction

### 🎯 Primary Target

* **Deploy a 1-Tier Application on Azure Cloud**
* Focus on **strong fundamentals**, not shortcuts

### 🧠 Learning Philosophy

* **Manual first, Automation later**
* Don’t rush into Terraform / ARM / Bicep
* Feel the manual process → automation becomes natural

---

## 2️⃣ Business Use Case Preparation

### 🔥 Strong Emphasis

* Everyone must build **solid business use cases** in:

  * **Next 15 days to 1 month**
* Create **3–4 use cases from different industries**

  * Example industries:

    * E-commerce
    * Banking
    * Healthcare
    * Education
    * OTT / Media

### 📌 Why Business Use Case Matters

* Real-world clarity
* Interview confidence
* Architecture understanding
* Not just “tool operators” but **problem solvers**

---

## 3️⃣ Registration & Onboarding Process

* Registration form will arrive on **Monday / Tuesday**
* Fill it:

  * Calmly
  * Correct details only
* ❗ **Do NOT create Azure account on your own**
* Azure account will be created **after grouping**
* Grouping is important for:

  * Cost control
  * Access management
  * Learning discipline

---

## 4️⃣ 1-Tier Application – Basics

### 🧩 What is a 1-Tier Application?

* Application + Server in the same layer
* Example:

  * Website hosted directly on VM
* No separation of frontend/backend/database (yet)

### 🖥 Deployment Environments

* Windows Laptop
* Killercoda
* Azure Cloud

---

## 5️⃣ Manual vs Automation (Very Important)

### 🚶 Manual First

* Understand:

  * What is being created?
  * Why it is needed?
  * Dependencies
* Manual steps build **confidence & clarity**

### 🤖 Automation Later

* Automation without manual understanding = ❌ Danger
* Automation tools come later:

  * Azure CLI
  * PowerShell
  * ARM / Bicep
  * Terraform

---

## 6️⃣ Imperative vs Declarative

### 🔹 Imperative

* “How to do”
* Step-by-step commands
* Tools:

  * Azure CLI
  * PowerShell

### 🔹 Declarative

* “What I want”
* State-based
* Tools:

  * ARM Templates (JSON)
  * Bicep
  * Terraform (HCL)

---

## 7️⃣ Infrastructure as Code (IaC) Tools

### 🔷 ARM / Bicep

* Microsoft native tools
* Written in **JSON**
* Azure-specific
* Code usually **not available on GitHub**
* Used internally by Microsoft

### 🔷 Terraform

* Open-source
* Written in **HCL**
* Developed by **HashiCorp (IBM company)**
* Supports **multi-cloud**
* CNCF aligned
* Preferred because:

  * Customers don’t want vendor lock-in
  * Multi-cloud strategy is common

---

## 8️⃣ Cloud Account & Access Basics

### ☁ Cloud Entry Rule

* To buy anything in cloud → **Account required**
* Access control is mandatory

---

## 9️⃣ Authentication & Authorization (Core Concept)

### 🔐 Authentication

> “Tu kaun hai be?”

* Identity verification
* Username, password, token

### 🔓 Authorization

> “Tu karega kya?”

* What actions are allowed
* Controlled by roles

---

## 🔟 Azure Entra ID (Azure AD)

### 📛 Naming

* **Azure AD** → Old name
* **Entra ID** → New name

### 🧠 What is Entra ID?

* Azure’s **Identity & Access Management (IAM)** system
* Manages:

  * Users
  * Groups
  * Roles
  * Permissions

---

## 1️⃣1️⃣ RBAC – Role Based Access Control

### RBAC = 3 Questions

1️⃣ **Who?**
→ User (Authentication)

2️⃣ **What?**
→ Role (What actions allowed)

3️⃣ **Where?**
→ Scope

### 🔍 Scope Levels

* Management Group
* Subscription
* Resource Group
* Resource

---

## 1️⃣2️⃣ Real-Life Examples (Very Important for Understanding)

### 🎬 Multiplex Example

* Gate → Authentication
* Ticket → Authorization
* Screen access → Role-based
* Lobby / Popcorn / Screen = Scope

### 🏠 Home Example

* Husband has token
* Kitchen / Bedroom access depends on role

---

## 1️⃣3️⃣ Azure Account Creation Behavior

* First Azure account automatically creates:

  * A **new Entra ID (Directory)**
* Directory contains:

  * Users
  * Groups
  * Roles

### Example Users

* [dhondhu@tinku.com](mailto:dhondhu@tinku.com)
* [tondu@tinku.com](mailto:tondu@tinku.com)
* [tommy@tinku.com](mailto:tommy@tinku.com)
* [zoie@tinku.com](mailto:zoie@tinku.com)

---

## 1️⃣4️⃣ Azure Portal

* URL: **portal.azure.com**
* Login via Entra ID
* Token-based authentication
* Role decides:

  * What you can see
  * What you can create/delete
