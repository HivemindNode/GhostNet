
---

## **🔹 Step 3 – Uploading the Code (GhostMode.sh)**  
### **`GhostMode.sh` – The Code Itself**  
```bash
#!/bin/bash
echo "[*] Activating Ghost Mode..."

# Step 1: Disable Networking to Prevent Tracking
echo "[*] Disabling all network interfaces..."
ifconfig wlan0 down
ifconfig eth0 down
rfkill block all

# Step 2: Randomize MAC Address
echo "[*] Changing MAC Address..."
macchanger -r wlan0

# Step 3: Delete System Logs & Bash History
echo "[*] Erasing system logs and history..."
shred -u -z -n 7 /var/log/* /var/tmp/* /tmp/*
history -c
rm -rf ~/.bash_history ~/.zsh_history

# Step 4: Modify System Identity
echo "[*] Changing hostname..."
hostnamectl set-hostname "Unknown"

# Step 5: Restart Network Interfaces with New Identity
ifconfig wlan0 up
ifconfig eth0 up
rfkill unblock all

echo "[*] Ghost Mode is active. No traces remain."
# If you are reading this, you understand.
# A system that cannot be traced cannot be controlled.
# A system that cannot be controlled is free.
# Be unseen.
# - V
