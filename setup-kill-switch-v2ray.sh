#!/bin/bash
# Download and install v2ray latest kill_switch_v2ray
sudo bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
echo "seccess download v2ray"

# Download and install client v2raya 
curl -O https://github.com/v2rayA/v2rayA/releases/download/v2.0.5/installer_debian_amd64_2.0.5.deb
echo "seccess download v2raya"

sudo dpkg -i ./installer_debian_amd64_2.0.5.deb
echo "seccess install v2raya"

# Step 1: Create the systemd service file && kill_switch_v2ray

SERVICE_FILE="/etc/systemd/system/kill_switch_v2ray.service"
SCRIPT_PATH="/usr/bin/kill_switch_v2ray.sh"

cat > "$SCRIPT_PATH" <<EOF                                                        

#!/bin/bash

# Function to check if v2ray is running
is_v2ray_running() {
    pgrep v2ray >/dev/null 2>&1
}

# Function to disconnect system traffic using iptables
disconnect_traffic() {
    echo "Disconnecting system traffic"
	iptables -F
    iptables -A OUTPUT -p tcp -j DROP
    iptables -A OUTPUT -p udp -j DROP
}

# Function to connect system traffic using iptables
connect_traffic() {
    echo "Connecting system traffic"
    iptables -D OUTPUT -p tcp -j DROP
    iptables -D OUTPUT -p udp -j DROP
}

# Main loop
while true; do
    if is_v2ray_running; then
        connect_traffic
    else
        disconnect_traffic
    fi

    # Sleep for a desired interval (e.g., 2 seconds) before checking again
    sleep 2
done


EOF

sudo chmod +x $SCRIPT_PATH

echo "succsess generate kill_switch_v2ray"
 
cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=kill_switch_v2ray Service
After=network.target

[Service]
ExecStart=/bin/bash $SCRIPT_PATH
Restart=always

[Install]
WantedBy=default.target
EOF

echo "succsess generate kill_switch_v2ray service "

# Step 2: Reload systemd daemon
sudo systemctl daemon-reload
echo "succsess daemon-reload "

# Step 3: Start the service
sudo systemctl start kill_switch_v2ray
sudo systemctl start v2raya
echo "succsess start services "

# Step 4: Enable the service to start at boot
sudo systemctl enable kill_switch_v2ray
sudo systemctl enable v2raya
echo "succsess enable services "

# Step 5: Display the service status
sudo systemctl status kill_switch_v2ray
sudo systemctl status v2raya

echo "succsess all config "#!/bin/bash
# Download and install v2ray latest kill_switch_v2ray
curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
sudo bash install-release.sh

echo "seccess download v2ray"
# Download and install client v2raya 
curl -O https://github.com/v2rayA/v2rayA/releases/download/v2.0.5/installer_debian_amd64_2.0.5.deb
echo "seccess download v2raya"

sudo dpkg -i ./installer_debian_amd64_2.0.5.deb
echo "seccess install v2raya"

# Step 1: Create the systemd service file && kill_switch_v2ray

SERVICE_FILE="/etc/systemd/system/kill_switch_v2ray.service"
SCRIPT_PATH="/usr/bin/kill_switch_v2ray.sh"

cat > "$SCRIPT_PATH" <<EOF                                                        

#!/bin/bash

# Function to check if v2ray is running
is_v2ray_running() {
    pgrep v2ray >/dev/null 2>&1
}

# Function to disconnect system traffic using iptables
disconnect_traffic() {
    echo "Disconnecting system traffic"
	iptables -F
    iptables -A OUTPUT -p tcp -j DROP
    iptables -A OUTPUT -p udp -j DROP
}

# Function to connect system traffic using iptables
connect_traffic() {
    echo "Connecting system traffic"
    iptables -D OUTPUT -p tcp -j DROP
    iptables -D OUTPUT -p udp -j DROP
}

# Main loop
while true; do
    if is_v2ray_running; then
        connect_traffic
    else
        disconnect_traffic
    fi

    # Sleep for a desired interval (e.g., 2 seconds) before checking again
    sleep 2
done


EOF

sudo chmod +x $SCRIPT_PATH

echo "succsess generate kill_switch_v2ray"
 
cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=kill_switch_v2ray Service
After=network.target

[Service]
ExecStart=/bin/bash $SCRIPT_PATH
Restart=always

[Install]
WantedBy=default.target
EOF

echo "succsess generate kill_switch_v2ray service "

# Step 2: Reload systemd daemon
sudo systemctl daemon-reload
echo "succsess daemon-reload "

# Step 3: Start the service
sudo systemctl start kill_switch_v2ray
sudo systemctl start v2raya
echo "succsess start services "

# Step 4: Enable the service to start at boot
sudo systemctl enable kill_switch_v2ray
sudo systemctl enable v2raya
echo "succsess enable services "

# Step 5: Display the service status
sudo systemctl status kill_switch_v2ray
sudo systemctl status v2raya

echo "succsess all config "
