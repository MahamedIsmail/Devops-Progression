# Bandit Wargame – Level 17: Finding the Changed Password

##  Objective
There are two files in the home directory: `passwords.old` and `passwords.new`.  
The password for the next level is in `passwords.new` and is the **only line** that has been changed compared to `passwords.old`.

---

## My Path to a Solution
  
The task was to identify the difference between two seemingly identical password files. The valid password was stored in `passwords.new`, while `passwords.old` contained the previous one.

To solve this, I used the `diff` command, which compares two files line by line and shows the differences:

```bash
diff passwords.new passwords.old
