


# Bandit Wargame – Level 12: Hexdump and Repeated Compression

 # Objecktive
 
The password for the next level is stored in a file called `data.txt`. This file is a **hexdump** of a binary file that has been **repeatedly compressed** in different formats.  

 Hints from the challenge:
- Create a working directory under `/tmp` using `mktemp -d` to keep things clean.
- Copy `data.txt` into that directory using `cp`.
- Rename files when needed with `mv`.
- Use the `file` command to identify file types as you go.



## My path to a solution step my step

### 1. Create a Safe Working Directory
I started by creating a temporary directory where I could work freely without breaking anything:
```bash
mktemp -d
cd /tmp/tmp.ABCD1234    # example folder name
cp ~/data.txt .         # copy the data.txt into this directory
````



### 2. Convert Hexdump Back to Binary

Since `data.txt` was a **hexdump**, I needed to convert it back into a binary file:

```bash
xxd -r data.txt > Hex.bin
```

* `xxd -r` reverses the hexdump back into its original binary form.
* At first, I thought the filename I saw inside the binary meant an actual file existed — but I learned it was just metadata inside the header.

---

### 3.  Identify the File Type

Next, I checked what kind of file `Hex.bin` was:

```bash
file Hex.bin
```

It turned out to be a **gzip** compressed file.

---

### 4.  Repeatedly Decompress and Rename

The rest of the challenge was a cycle of identifying, renaming, and decompressing files.
Here’s how it looked step by step:

#### a. Gzip → `.gz`

```bash
mv Hex.bin Hex.gz
gzip -d Hex.gz
```

#### b. Bzip2 → `.bz2`

```bash
file Hex
mv Hex Hex.bz2
bzip2 -d Hex.bz2
```

This pattern continued multiple times. Each time I ran `file` to identify the new format, then renamed the file to the correct extension and decompressed it with the right tool.

---

### 5.  Encountering TAR (Archiving)

Eventually, I encountered a `tar` archive.
I learned that **tar is not a compression tool** – it just **bundles multiple files** together. Unlike `.zip` on Windows, in Linux the archiving (`tar`) and compression (`gzip`/`bzip2`) are separate steps.

I extracted the tar archive like this:

```bash
mv Hex Hex.tar
tar -xf Hex.tar
```

* `-x` → extract
* `-f` → specify the filename

---

### 6. ✅ Repeating Until Success

The process repeated several times:

* `file` → identify
* `mv` → rename
* `gzip -d` / `bzip2 -d` / `tar -xf` → decompress or extract

Finally, the `file` command reported:

```
ASCII text
```

And inside the file was the password for the next Bandit level

---

