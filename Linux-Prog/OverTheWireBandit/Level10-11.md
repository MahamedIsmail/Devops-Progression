### Bandit - Level 10

Objecktive
The password for the next level is stored in the file `data.txt`, which contains **base64-encoded data**.

My path to a solution
The goal was to decode the contents of the file, which were encoded in Base64 — a common encoding format used to represent binary data as text. To solve this, I used the `base64` command with the `-d` option, which decodes the data back into its original form.

Here’s the solution I used:

```bash
cat data.txt | base64 -d
```

**Explanation:**

* `cat data.txt` – outputs the file’s contents.
* `base64 -d` – decodes the Base64-encoded text and returns the original readable content.

This revealed the password for the next level. From this level, I learned how to use the `base64` command for decoding and how common encoding methods like Base64 can be reversed using built-in Linux tools.
