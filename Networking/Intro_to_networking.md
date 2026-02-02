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
---
## 2. Protocols: TCP vs. UDP
A Protocol is a set of rules for how data is formatted and transmitted.

**TCP (Transmission Control Protocol)**
- Connection-oriented: Uses a Three-Way Handshake (SYN, SYN-ACK, ACK) before sending data.

- Reliable: Features error handling, retransmission of lost packets, and flow control.

  
- Use Case: Web apps, Email (where data integrity is vital).


**UDP (User Datagram Protocol)**
- Connectionless: Just sends data without checking if the receiver is ready.

- Fast but Unreliable: No error handling or flow control.

- Use Case: Live streaming, Gaming (where speed is more important than 100% accuracy)
---
  ## 3. The OSI Model vs. TCP/IP Model
**The 7 Layers of OSI**
1.**Physical**: Transmits raw bits over cables (Ethernet, Fiber) or Radio (Wi-Fi).

2.**Data Link**: Wraps data into Frames. Uses MAC addresses. (Switches live here).

3.**Network**: Handles global communication. Converts frames to Packets. Uses IP addresses and Routers.

4.**Transport**: Breaks data into Segments. Adds Source/Destination Ports. (TCP/UDP).

5.**Session**: Starts, manages, and ends communication sessions.

6.**Presentation**: Translates data into readable formats; handles encryption/decryption.

7.**Application**: Direct service to the user (HTTP, SMTP, FTP).




**The TCP/IP Model (The Practical Version)**

1.**Network Access Layer (OSI 1, 2)**

2.**Internet Layer (OSI 3)**

3.**Transport Layer (OSI 4)**

4.**Application Layer (OSI 5, 6, 7)**


---
## 4. DNS: The Internet’s Phonebook

The **Domain Name System (DNS)** translates human-readable domain names (e.g., `google.com`) into IP addresses used by computers.  


#### How DNS Resolution Works (Root → TLD → Authoritative)

1. **Recursive Resolver** – Your local “helper” (ISP or public DNS like Google) that performs lookups on your behalf.
2. **Root Servers** – Direct the resolver to the correct Top-Level Domain (TLD) server (e.g., `.com`, `.org`, `.net`).
3. **TLD Servers** – Point to the authoritative name servers for the specific domain.
4. **Authoritative Servers** – The **source** that returns the actual DNS records.

#### Common DNS Record Types

| Record | Purpose |
|-------|---------|
| **A** | Maps a domain to an IPv4 address |
| **AAAA** | Maps a domain to an IPv6 address |
| **CNAME** | Alias pointing one domain to another |
| **MX** | Specifies mail servers for the domain |
| **NS** | Lists authoritative name servers |
| **TXT** | Stores verification & security info |

---
### 5. Routing & Subnetting


**Routing**
- Static: Manually configured paths.

- Dynamic: Paths update automatically using protocols like OSPF (shortest path) or BGP (global scale).


**Subnetting & CIDR**
Subnetting divides a large network into smaller, manageable pieces.

- CIDR Notation: 192.168.1.1/24 means the first 24 bits are the Network, and the last 8 bits are for Hosts.
- Calculation: 8 bits for hosts = $2^8 = 256$ total addresses (254 usable,2 reserved).

---
## 6.NAT (Network Address Translation)
NAT allows private devices to use one public IP address to communicate with the internet.

- PAT (Port Address Translation): The most common form; it uses unique port numbers to map multiple private IPs to a single public IP.

---
 ## 7. Troubleshooting & Cloud
**Tools**
- ping: Tests connectivity.

- traceroute: Shows the path/hops to a destination.

- dig / nslookup: Troubleshoots DNS issues.
---

## 8. Cloud Networking
Cloud networking replaces physical home labs with digital infrastructure and tools to manage networks virtually.

| Component | Description |
|----------|-------------|
| **VPC (Virtual Private Cloud)** | An isolated private network in the cloud. Access is restricted unless a gateway is configured. |
| **Subnet** | A subdivision of a VPC used to segment traffic (e.g., separating public-facing servers from private databases). |
| **Gateway** | The entry and exit point that connects a VPC to the internet or other networks. |












