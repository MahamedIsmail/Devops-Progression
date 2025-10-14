
# Bandit Wargame – Level 15: TLS Connection with OpenSSL

# Objective

The password for the next level can be retrieved by submitting the password of the current level to
port 30000 on localhost.
---

## My path to a solution

I used the following command to connect to the TLS server:

```bash
openssl s_client -connect localhost:30001
````

When the server was listening, I pasted the **current level’s password** and then got this output:

```
read R BLOCK
8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
Correct!
********************************
Closed
```

✅ The last line is the **password for the next level**.

---
