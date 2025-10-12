 Bandit - Level 7

Objective 
The password for the next level is stored in the file `data.txt` next to the word `millionth`.

My path to a solution
This level was much easier compared to the previous ones. The task was simply to search through a large file and find the line containing the word `millionth`. Since manually scanning such a large file would be inefficient, I used the `grep` command, which searches for patterns in text files.

The solution was straightforward:

```bash
grep "millionth" data.txt
```

`grep` quickly scanned the file and printed the line containing the word `millionth`, along with the password next to it.

From this level, I learned how useful `grep` is for searching through large files — a fundamental tool for text processing, log analysis, and data inspection in Linux.
