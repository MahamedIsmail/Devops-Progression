
### Bandit - Level 0

Objecktive 
The password for the next level is stored in a file called "readme" located in the home directory. Once you find it, you use that password to log into "bandit1" via SSH on port 2220.

My path to a solution 
I started by listing the files in the home directory using the "ls" command. I then used "cat" to open the "readme" file and display its contents:


ls
cat readme


This revealed the password for the next level. I then used SSH to log into "bandit1" by specifying the username, host, and port:


ssh bandit1@bandit.labs.overthewire.org -p 2220


