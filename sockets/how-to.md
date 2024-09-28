### sockets
- [SOCKETS - SERVER & CLIENT - 2020](https://www.bogotobogo.com/cplusplus/sockets_server_client.php) 
### Linux Firewall 
- [How to Open Ports on Ubuntu](https://www.malibal.com/guides/how-to-open-ports-on-ubuntu/#:~:text=By%20default%2C%20Ubuntu%20comes%20with,incoming%20traffic%20to%20specific%20ports.)

#### To open ports on Ubuntu, you can follow these steps:

Step 1: Open Terminal

Open the terminal by pressing Ctrl + Alt + T on your keyboard or by searching for it in the applications menu.

Step 2: Check Firewall Status

Ubuntu comes with the UFW firewall by default. You can check the current status of the firewall by running:

        sudo ufw status

If the firewall is not enabled, you can skip to step 4. If the firewall is enabled, continue to step 3.

Step 3: Allow the Port

To allow incoming traffic to a specific port, you need to add a rule to the firewall. For example, to allow incoming traffic on port 80 (HTTP), you can run the following command:

        sudo ufw allow 80/tcp

You can replace 80 with the port number you want to allow. By default, TCP protocol will be allowed, but you can specify the protocol using /protocol syntax, for example:

        sudo ufw allow 80/udp

for UDP.

Step 4: Verify Firewall Status

After adding the rule, verify that the port is allowed by running:

        sudo ufw status
       

You should see a line that shows the status of the port you just allowed. Repeat step 3 for any additional ports you want to open.