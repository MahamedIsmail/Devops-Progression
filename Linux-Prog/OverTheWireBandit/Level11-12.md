### Bandit - Level 11

**Challenge description:**
The password for the next level is stored in the file `data.txt`, where all lowercase (`a-z`) and uppercase (`A-Z`) letters have been **rotated by 13 positions** (ROT13 encryption).

**What I did:**
In this level, I learned about **ROT13**, a simple letter substitution cipher that shifts each letter by 13 positions in the alphabet. For example:

* `A` → `N`, `B` → `O`, `C` → `P`
* `N` → `A`, `O` → `B`, `P` → `C`

Applying ROT13 twice returns the original text, which makes it useful for simple text obfuscation.

I also discovered the `tr` command, which can translate or replace characters in text. It’s often used for text transformation and works perfectly for decoding ROT13.

Here’s the command I used:

```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

**Explanation:**

* `cat data.txt` – outputs the encoded content of the file.
* `tr 'A-Za-z' 'N-ZA-Mn-za-m'` – translates all uppercase and lowercase letters by shifting them 13 places.

This decoded the scrambled text and revealed the password. From this level, I learned how `tr` can be used for character substitution and how ROT13 works as a basic encryption technique.
