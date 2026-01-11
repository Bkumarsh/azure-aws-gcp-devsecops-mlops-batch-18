# Deploy Netflix Clone (StreamFlix) on Nginx Server

## 1. **Access the Killerkoda Ubuntu Playground**

* Open your browser and go to:
  👉 [https://killercoda.com/playgrounds/scenario/ubuntu](https://killercoda.com/playgrounds/scenario/ubuntu)

---

## 2. **Initialize the Playground**

* Click on the **Start** button to launch the Ubuntu environment.

---

## 3. **Update the System**

* Update the package list:

```sh
sudo apt update
```
---

## 4. **Install Nginx**

* Install the Nginx web server:

```sh
sudo apt install nginx -y
```
---

## 5. **Clone the Netflix (StreamFlix) Repository**

* Clone the StreamFlix (Netflix clone) repository:

```sh
git clone https://github.com/devopsinsiders/StreamFlix.git
```

---

## 6. **Copy Build Files to Nginx Directory**

* Navigate into the cloned repository:

```sh
cd StreamFlix
```

* Copy all project files to Nginx’s default web root:

```sh
sudo cp -r * /var/www/html/
```
---

## 7. **Check Nginx Status**

* Verify that Nginx is running:

```sh
sudo systemctl status nginx
```

---

## 8. **Expose Port 80**

* In the Killerkoda UI, find the **Expose Port** option
* Expose **port 80**

---

## 9. **Access Netflix Clone (StreamFlix)**

* Click on the generated URL after exposing port 80
* Your **Netflix-style StreamFlix application** should now be live 🎬🍿

---

### ✅ Result

You have successfully deployed the **Netflix Clone (StreamFlix)** on an **Nginx web server** using the Killerkoda Ubuntu playground.
