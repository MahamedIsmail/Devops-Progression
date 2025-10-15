# OverTheWire — Bandit Level 19 

**Objective**

To gain access to the next level, use the setuid binary in the home directory. Execute it without arguments to learn how to use it. The password for the next level will be in `/etc/bandit_pass` after you run the setuid binary.

---

## My path to the solution

The task was to run the setuid binary, observe what it does, and read the password from `/etc/bandit_pass`.

I reviewed setuid/setgid: these let a program run with the file owner’s (or group’s) privileges so other users can perform specific actions. For example, `passwd` is setuid so it can update `/etc/shadow`.

### Steps I took

1. **Check permissions and owner**

```bash
ls -l
# found a binary in my home directory with an `s` in the permission bits, owned by bandit20
# e.g. -rwsr-xr-x 1 bandit20 bandit20 ... bandit20-do
```

This means the binary runs with **bandit20**’s privileges when executed.

2. **Confirm the target file**

The password for the next level is stored at:

```
/etc/bandit_pass/bandit20
```

Only user `bandit20` can read that file.

3. **Run the setuid program and give it the target file**

```bash
./bandit20-do /etc/bandit_pass/bandit20
```

The program runs with `bandit20`’s effective UID and can read the target file. It prints the next-level password.
---
