
# Bandit Wargame – Level 14: Sending Data to a Port

##  Objective
The password for the next level can be retrieved by submitting the password of the current level to port **30000** on `localhost`.

## My Path to a Solution

My task was to send the current password to `localhost` on port `30000`.  

I used **nc (netcat)**, a networking tool that can scan ports and send data using **TCP** or **UDP**. It is very versatile. The format for using it is:

```

nc <destination_ip> <port>

````

Since `localhost` always translates to your **own local machine**, I used the following command:

```bash
echo "current password" | nc localhost 30000
````

✅ This command sent the current level’s password directly to the server with all the information it needed. Once the data was received, the server responded with the password for the next level — and the task was complete.

```

Would you like me to now merge **Level 14**, **15**, and **Hexdump level** into **one complete README.md** file? (That’s the most common format for a GitHub project walkthrough.)
```
