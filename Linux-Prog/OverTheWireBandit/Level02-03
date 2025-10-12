### Bandit - Level 3

Objecktive
The password for the next level is stored in a file called "--spaces in this filename--" located inside the "inhere" directory. The challenge is that the file name contains spaces, which can cause issues when running commands if not handled correctly.

My path to a solution
I navigated into the `inhere` directory using:


cd inhere


At first, running "ls" didn’t show anything unusual, so I suspected the file might be hidden. I then used the "-a" option with "ls" to list all files, including hidden ones:


ls -a


This revealed the file with spaces in its name. To read its contents, I used "cat" but enclosed the filename in quotes to handle the spaces correctly:


cat '--spaces in this filename--'


This displayed the password. From this level, I learned how to handle files with spaces and special characters in their names and how the -a flag helps reveal hidden files in Linux.
