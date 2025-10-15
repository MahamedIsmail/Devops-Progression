# OverTheWire — Bandit Level 20

## Objective

There is a setuid binary in the home directory that connects to **localhost** on a port you supply. It reads one line from that connection and compares it to the **bandit20** password. If it matches, it transmits the **bandit21** password back.

## Theory / Background

* **setuid**: A program with the setuid bit runs with the file owner's privileges while executing. That means when *you* run the program, the OS temporarily gives the process the owner's rights.
* This setuid binary is owned by `bandit21`, so when executed it can read files and do actions that only `bandit21` can.
* The binary acts as a **client**: it connects to `localhost:<port>` and expects a single line containing the previous level's password. If the password matches, the binary sends the next level's password back over the connection.
* We will act as the **server** and send the bandit20 password when the binary connects.

## My path to the solution step by- step



 1.  Copy previous level's password we will send it to the setuid program.

2. **Start a server that sends the bandit20 password**

   In one terminal (server side), run a netcat listener that will print the previous password once a client connects. Use a port bigger than 1024(all ports >1024 none sudo based) (I used `3780`):

   ```bash
   echo "**********************" | nc -l -p 3780 
   ```

   Explanation:

   * `echo` prints the bandit20 password.
   * `| nc -l -p 3780 ` starts nc in listen mode on port 3780 and sends the echo output to the client.

3. **Run the setuid program (client)**

   In another terminal (client side), run the setuid program and point it to the port your server is listening on:

   ```bash
   ./suconnect 3780
   ```

   The program will connect to `localhost:3780`, read the password you sent, and if it matches the bandit20 password, it will send the bandit21 password back over the connection.


# Solution

* **Server terminal (listener):**

```bash
# send the previous-level password when a client connects
echo "*********************" | nc -l -p 3780 -N
```

* **Client terminal (run the setuid program):**

```bash
./suconnect 3780
```

* **What appears in the server terminal after the client connects (example output):**

```text
E**************************************
```



The line printed in the server terminal is the `bandit21` password.

