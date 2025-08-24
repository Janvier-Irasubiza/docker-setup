# 🐳 Docker + Docker Compose Setup Script

A simple **one-command installer** for Docker and Docker Compose on **Ubuntu (20.04, 22.04, and newer)**.
Works on bare metal, VMs, and WSL2 (with `systemd` enabled).

---

## 🚀 Quick Install

Run this one-liner to install **Docker + Docker Compose**:

```bash
curl -fsSL https://raw.githubusercontent.com/Janvier-Irasubiza/docker-setup/main/install-docker.sh | bash
```
---

## 📋 Features

* Installs the latest **Docker Engine**
* Installs the latest **Docker Compose v2**
* Configures Docker to start on boot
* Adds your user to the `docker` group (no more `sudo docker`)
* Works on **Ubuntu + WSL2**

---

## 🔍 Troubleshooting

### ❌ `Could not execute systemctl` in WSL2

Enable `systemd` in WSL2:

```bash
sudo nano /etc/wsl.conf
```

Add:

```
[boot]
systemd=true
```

Restart WSL:

```powershell
wsl --shutdown
wsl
```

---

## ✅ Verify Installation

Check Docker:

```bash
docker --version
```

Check Docker Compose:

```bash
docker-compose --version
```

Run test container:

```bash
docker run hello-world
```

---

## 🤝 Contributing

Pull requests and issues are welcome!

---
