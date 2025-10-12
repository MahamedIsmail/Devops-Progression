### Bandit - Level 6

Objective
The password for the next level is stored **somewhere on the server** and has the following properties:

* Owned by user: `bandit7`
* Owned by group: `bandit6`
* Exactly `33` bytes in size

My path to a solution

**Step 1  Searching with `find`**
I started by using the `find` command with specific test options to search the entire filesystem (`/`) for files that matched all the given conditions:

```bash
find / -type f -user bandit7 -group bandit6 -size 33c
```

This command searches for:

* `-type f` → regular files
* `-user bandit7` → files owned by user `bandit7`
* `-group bandit6` → files owned by group `bandit6`
* `-size 33c` → files exactly 33 bytes in size (`c` = bytes)

**Step 2  Dealing with “Permission denied” errors**
While running the command, I encountered many “Permission denied” messages. These happen when:

* The search tries to access directories or files I don’t have permission to read.
* Certain system directories are restricted for security reasons.

**Step 3  Suppressing error messages**
To clean up the output and ignore these errors, I learned about **I/O redirection** in Linux:

* `0` → stdin (input)
* `1` → stdout (standard output)
* `2` → stderr (error messages)

Using `2>/dev/null` redirects error messages (`stderr`) into `/dev/null`  a special “black hole” file that discards anything sent to it.

**Step 4 Final solution**
I combined everything into a single command that not only searches for the file but also reads its contents:

```bash
find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null -exec cat {} \;
```

This command:

* Searches the entire filesystem for files that match all the conditions.
* Hides permission errors.
* Uses `cat` to print the contents of the matching file.

✅ This revealed the password for the next level.

From this level, I learned how powerful `find` becomes when combined with options for user, group, size, and error redirection. I also deepened my understanding of file permissions, error streams, and how to handle restricted access when searching the Linux filesystem.
