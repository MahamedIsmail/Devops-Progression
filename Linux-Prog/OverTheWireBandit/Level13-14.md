
# Bandit Wargame – Level 13: SSH Key Authentication

## Objecktive

Log in as `bandit14` (from `bandit13`) to read the file:
```

/etc/bandit_pass/bandit14

````
Only the `bandit14` user has permission to read this file.  
This time, you **don’t get the password directly**  instead, you’re given a **private SSH key** that can be used to log into the next level.

> **Hint:** `localhost` refers to the machine you’re currently on.  
> Use the SSH key with the `-i` option to authenticate.

---

##  Concept: SSH Key Authentication
Normally, when you log into a remote server using SSH, you provide a **password**.  
However, SSH also supports **public-key authentication**:
- The **server** stores your **public key**.
- You use your **private key** to authenticate.  
- This is considered **more secure** than passwords.

---

## My path to a solution  step by step

### 1.  Locate the Private Key
The challenge provides a private SSH key file (for example: `sshkey.private`).  
I first ensured I was in the correct working directory (e.g., `/tmp` or `~`) and confirmed the key file existed:
```bash
ls
````

---

### 2.  Connect to Bandit14 Using the Key

To log in as `bandit14`, I used the `ssh` command with the `-i` option (to specify the key) and the `-p` option (to specify the port):

```bash
ssh -i ./sshkey.private bandit14@localhost -p 2220
```

Breakdown:

* `-i ./sshkey.private` → tells SSH which private key to use
* `bandit14@localhost` → username and host (localhost means the same machine)
* `-p 2220` → specifies the port Bandit uses

✅ This successfully authenticated me as `bandit14`.

---

### 3.  Read the Password

Now that I was logged in as `bandit14`, I could finally read the password file:

```bash
cat /etc/bandit_pass/bandit14
```

This displayed the password for the **next level**.

---

## Troubleshooting

* ❌ Wrong permissions on key file → Run:

  ```bash
  chmod 600 sshkey.private
  ```

  SSH requires private keys to have restricted permissions.

---
