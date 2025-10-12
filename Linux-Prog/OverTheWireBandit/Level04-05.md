Bandit - Level 5

Objecktive
The password for the next level is stored in a file somewhere under the inhere directory. The file has the following properties:

It is human-readable

It is exactly 1033 bytes in size

It is not executable

My path to a solution
This was the hardest level so far, and I solved it after several attempts and experiments.

At first, I focused on the recommended commands:

du – shows how much disk space a file uses

file – tells you the type of a file (text, binary, etc.)

I tried using multiple -exec options with find, combining file (to check if the file is human-readable) and du (to check size). The main challenge was figuring out how to filter out executable files. I looked into -x and even considered writing a script to combine all the conditions.

After some research, I learned that I could solve this with a single find command using test expressions:

-readable → ensures the file is human-readable

-size 1033c → ensures the file is exactly 1033 bytes (c = bytes)

! -executable → ensures the file is not executable (! means NOT)

I also learned that:

A space between expressions acts as AND

-o means OR

With that knowledge, I wrote a single command that satisfied all conditions and printed the password:

find . -type f ! -executable -readable -size 1033c -exec cat {} \;


This command searched all files in the current and subdirectories, filtered based on the given conditions, and displayed the contents of the correct file.


