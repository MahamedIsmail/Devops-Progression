### Bandit - Level 9

Objecktiv
The password for the next level is stored in the file `data.txt` in one of the few **human-readable strings**, preceded by several `=` characters.

My path to a solution
The goal was to find a readable string inside a file that mostly contained non-printable data. Since most of the content wasn’t human-readable, I used the `strings` command, which extracts only the printable (human-readable) characters from a file.

Here’s the solution I used:

```bash
cat data.txt | strings | grep "="
```

**Explanation:**

* `cat data.txt` – outputs the content of the file.
* `strings` – filters and displays only human-readable text sequences from binary or mixed data.
* `grep "="` – searches the output for lines containing the `=` character, which helps locate the password.

This quickly revealed the line with the password. From this level, I learned how `strings` can be used to extract readable data from otherwise unreadable files — a useful technique for inspecting binary data or hidden text in files.
