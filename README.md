# Simple-Pi-Hotspot
Docker image to create a basic hotspot on Raspberry Pi

Container created for my Recoverybox Project : https://github.com/mr-dgidgi/RecoveryBox

It can be use outside of this environnement

By default it create an SSID named 'default' with 'default0' as WPA Passphrase and the DCHP is configured to use 192.168.200/24 network.

You'll maybe need to setup some NAT if you want to allow the AP user to access to a wired network

## Setup and installation
1. enable IP Forward
```shell
sysctl net.ipv4.ip_forward=1
sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf
```
2. check if rfkill is not activated
```shell
rfkill list
sudo rfkill unblock wifi
```
3. disable wpa_supplicant
```shell
sudo systemctl stop wpa_supplicant
sudo systemctl disable wpa_supplicant
```
4. build the image
```shell
sudo docker build -t mrdgidgi/simple-pi-hotspot .
```
3. run the container
```shell
docker run --rm --net=host --cap-add=NET_ADMIN --cap-add=NET_RAW --privileged mrdgidgi/simple-pi-hotspot
```

## Customization
1. Create folder with custom config 
```shell
mkdir /etc/ap_config
cd /etc/ap_config
```
2. Customize the configuration
Create hostapd.conf and dnsmasq.conf with your custom configuration in /etc/ap_config directory

3. Run the container
```shell
docker run --rm --net=host --cap-add=NET_ADMIN --cap-add=NET_RAW --privileged -v /etc/ap_config/:/etc/conf mrdgidgi/simple-pi-hotspot
```


