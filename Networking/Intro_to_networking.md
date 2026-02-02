

Networking Fundamentals
=======================

## 1. What is Networking?
Networking is the connection of devices to share information and resources.

- Wi-Fi: A common method that enables devices to communicate and share resources wirelessly.

- LAN (Local Area Network): A small network for a limited area, such as a home or office.

- WAN (Wide Area Network): A large network covering cities or countries; it is essentially a collection of connected LANs.

### Components & Function
| Components | Description 
|-------------|-----------|
|Switch |Operates in a LAN connects devices via Ethernet and manages data flow between them.|
|Router | Connects different networks (e.g., your home LAN to the Internet) and routes data.|
|Firewall | The network's defense monitors and blocks traffic based on predefined rules.|
|IP Address| A unique address for identification (IPv4 = 32-bit decimal IPv6 = 128-bit hex).|
|MAC Address |A unique, permanent physical address assigned to a network interface card (NIC).|
|Port | A logical endpoint for a specific service or application (e.g., HTTP = Port 80).|

### 2. Protocols: TCP vs. UDP
A Protocol is a set of rules for how data is formatted and transmitted.

**TCP (Transmission Control Protocol)**
- Connection-oriented: Uses a Three-Way Handshake (SYN, SYN-ACK, ACK) before sending data.

- Reliable: Features error handling, retransmission of lost packets, and flow control.

  
- Use Case: Web apps, Email (where data integrity is vital).


**UDP (User Datagram Protocol)**
- Connectionless: Just sends data without checking if the receiver is ready.

- Fast but Unreliable: No error handling or flow control.

- Use Case: Live streaming, Gaming (where speed is more important than 100% accuracy)




