### Bandit - Level 2

Objecktive
The password for the next level is stored in a file called "--something" located in the home directory. The tricky part is that filenames starting with "--" can be interpreted by commands as options instead of file names.

My path to a solution 
At first, I thought I needed to use a more complex approach, like "find" or "grep" with pattern matching, to locate the file. But then I realized that I could simply execute it as a file in the current directory by prefixing it with "./". This tells the shell that I want to reference a file in the current directory, not pass an option to a command.

I started typing "./--" and pressed "Tab" for auto-completion, which completed the file name. Then I used the "cat" command to read the file:


cat ./--something


This displayed the password. From this level, I learned how Linux treats filenames that start with "--" and how using "./" is a simple way to reference them directly.
