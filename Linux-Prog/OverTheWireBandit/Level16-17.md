

# Bandit Wargame – Level 16: Finding the Correct TLS Port and Using a Private Key

## Objective
The credentials for the next level can be retrieved by submitting the password of the current level to a port on `localhost` in the range **31000–32000**.  
First, find out which of these ports have a server listening on them. Then, determine which of those support **SSL/TLS** and which do not. There is only **one** server that will return the next credentials — the others will simply echo back whatever you send to them.

---

## My Path to a Solution step by step

  
The goal was to send the current password to an **open listening port** between `31000` and `32000`.

---

###  Step 1 – Scan the Port Range with Nmap  
I started by scanning my local network using **nmap** to find all open ports in that range. I specifically focused on **TCP** ports since **SSL/TLS** runs on top of TCP:

```bash
nmap -p 31000-32000 localhost
````

This helped me identify which ports were actively listening.

---

###  Step 2 – Test Ports Manually with Ncat

After finding a few open ports, I tested them **manually** using **ncat**, a versatile networking tool that can send and receive **TCP** or **UDP** packets.

I noticed an option in `ncat` to connect using **SSL/TLS**, so I used:

```bash
ncat --ssl localhost 31790
```

This allowed me to securely connect to the correct service that was expecting TLS communication.

---

### Step 3 – Retrieve and Save the Private Key

Once connected to the correct port, the server responded with a **private SSH key**. I saved this key into a file (for example, `/tmp/key.txt`).

---

###  Step 4 – Fix File Permissions

When I tried using the key to connect, I received an error saying the file was **too open**.
SSH requires strict permissions on private keys, so I fixed this with:

```bash
chmod 700 /tmp/key.txt
```

Here:

* `7` = `111` in binary (`2^2 + 2^1 + 2^0 = 7`), meaning:

  * ✅ **Read**, **Write**, and **Execute** permissions for the **owner**
  * ❌ No permissions for group or others

---

###  Step 5 – Connect Using the Private Key

With the correct permissions set, I successfully used the private key to log in to the next level:

```bash
ssh -i /tmp/key.txt bandit17@bandit.labs.overthewire.org -p 2220
```

---

✅ This level was one of the most challenging but also one of the most interesting. It taught me how to scan ports, differentiate between TCP and TLS services, use `ncat` for encrypted communication, and manage SSH key permissions correctly.

```

Would you like me to combine **Level 15** and **Level 16** into one final `README.md` file (ready to upload to GitHub)? (I can also add a small table of contents at the top.)
```
