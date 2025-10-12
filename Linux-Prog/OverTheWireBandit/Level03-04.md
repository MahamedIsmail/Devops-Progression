### Bandit - Level 4

Objecktive
The password for the next level is stored in the only human-readable file in the `inhere` directory. The challenge is that there are many files, most of which are binary or non-readable, so you need to identify which one is readable.

My path to a solution
At first, I was unsure how to check if a file was readable. After some research, I learned that the `file` command shows the type of a file for example, whether it’s a binary, compiled program, or plain ASCII text (which is human-readable).

Since there were many files, checking each one manually with `file` would be too slow. Instead, I combined `find` with `file` to automate the process. The `find` command searches for files that match certain conditions, and with the `-exec` option, I can run a command (like `file`) on each result.

I used the following command to scan all files and check their types:

```bash
find . -type f -exec file {} \;
```

This listed the type of each file. I then identified the one that was ASCII text (human-readable) and used `cat` to display its contents:

```bash
cat ./<filename>
```

This revealed the password. From this level, I learned how to combine `find` and `file` to filter files efficiently and identify readable ones a useful approach when working with many files on a Linux system.

