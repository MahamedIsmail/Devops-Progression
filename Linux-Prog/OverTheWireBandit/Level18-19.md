

# Bandit Wargame – Level 18: Using SSH to Run Commands Non-Interactively

## Objective
The password for the next level is stored in a file called `readme` in the home directory.  
Unfortunately, someone has modified `.bashrc` to **log you out immediately** when you log in with SSH.

---

##  My Path to a Solution

The password for this level was stored in the `readme` file. When I first connected with SSH, the session immediately closed, which prevented me from interacting directly with the shell.

I then remembered that `ssh` can execute commands **remotely without opening an interactive shell**, so I used that approach to solve the challenge. I ran a single remote command to read the file and retrieve the password:

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme
````

✅ This worked perfectly — the password was displayed directly in the terminal without needing an interactive session.

This reinforced the idea that SSH is useful not only for logging in interactively but also for **running commands non-interactively** on remote systems.

```

Would you like me to continue with **Level 19** next so it matches the same style?
```
