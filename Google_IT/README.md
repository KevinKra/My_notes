# GOOGLE IT COURSE

- Q: Why am I working through Google's IT certification?

- A: Because having a stronger understanding of how computers, systems, and networks work, makes me a better team member and engineer.

# Fundamentals

## Introduction to IT

**What does an IT specialist do?**

- Ensure that technology and computer systems operate correctly as well as protecting systems from vulnerabilities and attacks.

### History of Computing

A computer is a device that stores and processes data by performing calculations. The Abacus is often considered the first "computer", in so much that it calculated numbers for the user. Over the centuries computers continued to developed. By the 19th century, Joseph Jacquard developed punch cards for looms that determined how looms would handle the process for manufacturing textiles. Charles Babbage, a gifted engineer, built the first modern computer. The machine he built, called a **difference engine** was a mechanical calculator that could perform complicated mathematical calculations. Babbage's follow-up invention was called an **analytical engine**. Inspired by Jacquard, he allowed users to predefine a series of calculations they wanted to perform. Despite how advanced Babbage's machine was, it was still none-the-less a mechanical calculator. Mathematician Ada Lovelace took the analytical calculator to the next level. She realized that the analytical calculator could be developed to accomplish far more than just pure calculations. Ada Lovelace developed the first algorithm for the engine (the first example of computer programming), transforming the analytical engine from being a complex mechanical calculator to become the first general purpose computing machine in history.

Until the 1950s, punch cards were the mainstay in providing algorithms to a computer. Innovations like **magnetic tape** worked by magnetizing data onto a tape and solved several issues surrounding the traditional punch card approach. **Vacuum Tubes** controlled the electrical voltages of equipment but were bulky and constantly broke. The phrase **debugging** originated from renowned computer scientist Admiral Grace Hopper when she discovered a literal bug, a moth, to be the source of the problem with their computer relays. The wall-to-wall convolution of electronics and wires, the **ENIAC**, was one of the earliest forms of general purpose computers. Eventually, the industry moved away from vacuum tubes and started using transistors for the role of managing electricity voltages. **Transistors** are more compact and efficient than vacuum tubes and are still used today, albeit so small and efficient that they exist in the billions on modern machines.

The Xerox Alto was the first modern computer, it also was the first computer to use a GUI. In the 1970s Steve Wozniak, along with Steve Jobs, invented the Apple I, a single-board computer for hobbyists. Their follow-up the Apple II, was ready for commercial use and became a massive success. In the 1980s IBM introduced the personal computer along with a primitive OS called **MS DOS** or **Microsoft Disk Operating System**. Eventually, Microsoft went on to create their own OS called **Microsoft Windows** which dominated the market because it could run on any compatible hardware. With Apple and Microsoft taking over the operating system space, an engineer named Richard Stallman started developing a free Unix-like operating system, Stallman created an OS that he called **GNU**, it was meant to be free to use and accessible to everyone with similar functionality to Unix. It was intended to evolve into a fully open-source OS that was not owned by Apple or Microsoft. It set the foundation for one of the largest modern operating systems, **Linux**, that was developed by Linus Torvalds.

In the 1990s as computers became even smaller a new game changer hit the scene: **PDAs** or **Personal Digital assistants**. PDAs allowed computing to go mobile and eventually led to the portable media devices we have today: smartphones.

_What is cryptography?_

- The art of writing and solving codes, the enigma machine used by the german military and is a great example of a cryptographic machine. Alan Turing helped decipher this machine during WW2.

_What is a compiler?_

- Invented by Admiral Grace Hopper, compilers translate the human language via a programming language into machine code. This made programming for more accessible because engineers no longer had to write in machine code to give instructions to a machine.

#### Key Technologies:

- Abacus
- Punch cards
- the difference engine
- the analytical engine
- algorithms
- magnetic tape
- vacuum tubes
- transistors
- debugging
- ENIAC
- Xerox Alto + GUI
- MS DOS
- Microsoft Windows
- GNU
- Linux
- PDAs
- compilers
- cryptography

#### Key figures

- Joseph Jacquard
- Charles Babbage
- Ada Lovelace
- Grace Hopper
- Steve Wozniak
- Bill Gates
- Richard Stallman
- Linus Torvalds

### Digital Logic

A computer only communicates in **binary**, in the **binary system**, or aka **base-2 numeral system**. In computing terms, we group binary into 8 numbers (a **byte**), or bits with each bit being a **binary digit**. Each byte can store one character. Historically, we used 8 bits because in the early days of computing, hardware used the base-2 numeral system to move bits around. 2^8 provided a large enough range of values to satisfy all the computing needed by a machine. Initially, 8-bit computing was not the de-facto standard, but as the technology developed it became an industry standard.

**Character encoding** is used to assign our binary values to human-readable characters. Think of character encoding as a dictionary, it's a means for a computer to look up which human characters should be represented by a given binary value. The oldest encoding standard is **ASCII**, it represents the English alphabet punctuation, letters, digits, and all. ASCII was great because it only needed to use 127 of the 256 potential variations. However, eventually that was not enough. Other encoding standards were used to represent other languages, different character amounts, etc, eventually resulting in the need for more than 256 total options. **UTF-8** solved this problem. Not only did it have the same ASCII table, but it also also let engineers use a variable number of bytes. In essence, the UTF-8 encoding standard allows us to store a character in _more than_ one byte, which allowed for tremendously more character assignments. UTF-8 is built off the Unicode Standard. How do we represent colors? Well, one method is to use the RGB model in which each character represents a shade of a color and then changes the color of a pixel on the screen. With nothing but combinations of zeros and ones organized in bytes, everything interacted with in modern machines is represented predictably and reliably.

How does a computer even create and handle the ones and zeros represented in the binary system? By utilizing the two states of "on" and "off", a series of signals can be sent to the machine via electrical voltages passed through transistors. It's an interesting evolution from the punch cards used in the 19th century looms to what we currently have with modern machines, it's truly the same technique just with different means of accomplishment. An electric signal is denoted as a one (on), while no signal is denoted as a zero (off). **Logic gates** allow transistors do more complex tasks than simply turning things on or off, they decide where to send electrical signals depending on logical conditions. More in depth, a logic gate is an electronic component that conducts electricity based on a rule. The **output gate** is the result of applying this rule to one or more **inputs**. Inputs may be two wires or the output of other logic gates. There are three types of logic gates: AND, OR, NOT.

_What values can a byte hold?_

- A combination of eight zeros and ones.

_How many potential values can a byte have?_

- A byte can have up to 256 potential values.

_How many bits are in a byte?_

- There are 8-bits in a byte.

_What is the UTF encoding standard?_

- A predictable model to determine the appropriate representations of the base-2 numeral system or binary system in human readable characters.

_What are the three types of logic gates and what unique characteristics do they each have?_

- **AND** gates have two inputs and only releases an "on" input if both inputs are on. **OR** gates have two inputs, only one input needs to be "on" for the signal to pass. **NOT** logic gates have only one input, if the input is "on" the output is "off" and vice-versa.

_What is the highest decimal value we can represent with a byte?_

- 255. 1 + 2 + 4 + 8 + 16 + 32 + 64 + 128 = 255. Total would be 255 including 0, or 256 total potential variables.

_What is the binary solution to the numbers 248, 71, 4, 54?_

- 11111000 01000111 00000100 00110110

#### Key technologies:

- binary, binary system, base-2 numeral system
- base-10 numeral system
- byte
- bit, binary digit
- ASCII
- UTF-8
- character encoding
- logic gates
- inputs
- output gate
- AND, OR, NOT logic gates
- decimal values

### Computer Abstraction Layer

**Abstraction** is the process of tucking away the complexities of a topic and making it more accessible for use. In computing, we use abstraction make computing processes more simple by extracting isolated concepts and then stacking them in layers for a more comprehensive understanding.

_What is an abstraction?_

- To take a relatively complex system and simplify it for our use.

_What is an example of abstraction regarding computers?_

- An abstraction of a computer can be cut into four main layers: hardware, operating system, software, and users.

_What is an example of a common abstraction?_

- Error messages are a great example of a regularly occurring abstraction. The error message itself, may say `"Error: File not found"`, this helpful message informs us in a simple and approachable manner where or what the issue with our current executing code may be. Imagine troubleshooting without errors simplifying the process for us.

#### Key Technologies:

- Hardware layer
- Operating system layer
- Software layer
- User layer

## Hardware

### The Modern Computer

- Modern computers consist of many different pieces of hardware including but not limited to: the mouse, monitor, keyboard, desktop, webcam, and printer. **Ports** are connection points in which we can connect devices to a machine to extend its functionality. Computers are made up of several components. The **CPU, or Central Processing Unit** serves as the brains of the computer, it handles all of the calculations and processes. **RAM, or Random Access Memory** holds the short-term memory of the computer. The **Hard Drive** is where we store data for the long-term. The **Motherboard** holds everything in place that allows all the separate components to communicate with one another, it essentially serves as the nexus of the computer.

_What is a good succinct summary of a Program?_

- A program is a series of instructions that tells a computer what to do.

**CPU**

- The Central Processing Unit reads the instructions from our program and processes them. It interprets the instructions (at this point compiled into binary) stored in our RAM because it can access those instructions significantly faster than it would need to if it were stored in the hard drive.

**Heat Sink**

- Dissipates the heat from the CPU.

**RAM**

- The Random Access Memory of a machine is where we can store our short-term memory to rapidly relay it to the CPU where it gets processed. Because it's "Random Access" the CPU can access any memory addresses in the RAM just as fast as any other parts. We _don't_ actually send data directly from the RAM to the CPU, rather it travels over the EDB.

**EDB**

- The External Data Bus is a row of wires that interconnect the parts of our computer. When a voltage is sent to one of the wires, the respective transistor is changed to 1, or on. If there is no voltage, it is 0, or off. This is how our bits physically travel around the computer. EDBs come in many different sizes: 8-bit, 16-bit, 32-bit, 64-bit, the larger the bit-size the more data can be moved around at any given time. An 8-bit EDB sends 1 byte of data, or one line of data, around at a time.

**Registers**

- Components inside the CPU that store the data our CPU needs to work with. If the CPU needed to add two numbers together, one number would be stored in register "a", the other would be stored in register "b", and the result would be stored in register "c".

**MCC**

- Memory Controller Chip is a bridge between the CPU and the RAM. CPU requests data, MCC locates the relevant data, then the MCC sends the data through the EDB to the CPU.

**Address Bus**

- Connects the CPU to the MCC. The CPU sends the location of the data (but not the data itself) to the MCC, then the MCC uses that memory location address to look up the data in the RAM, then the MCC forwards the correct data over the EDB to the CPU.

**Cache**

- An even faster means of getting data than RAM that exists on the CPU. It's utilized for data that was recently used and/or frequently used. There are three different cache levels in a CPU: **L1, L2, L3**. L1 is the smallest and fastest cache. They store data that is otherwise being frequently used from the main memory location, this results in a reduction in the cost of time and energy. All modern (fast) CPUs have different levels of caches, most of which split their L1 cache. Every core of a multi-core processor has dedicated L2 cache that is not shared amongst the cores. L3 and higher level caches are usually split, but like L2 caches L3 caches do not share data between cores. L4 caches are uncommon and is usually on DRAM and not SRAM like other caches.

**Clock wire**

- An internal clock that CPU uses to know when one operation ends and the next one starts, this keeps the operations in sync. When a voltage is sent over the clock wire, the CPU knows it can start doing calculations. Think of the clock wire as a clock, for every _tick_ the CPU does one cycle of operations. A **Clock Cycle** is what occurs when a voltage is sent to the clock wire. The `clock speed` of a CPU (for example 3.4GHz) represents the total number of clock cycles a CPU can handle in a set period. 3.4Ghz is 3.4 billion cycles per second, pretty fast. Though, if a CPU has a clock speed of 3.4GHz, that does not mean it will run at that speed, rather it's the ceiling speed. **Overclocking** is the process of increasing the clock cycle rate of your CPU to increase operations and performance.

### Components

> A deeper dive into each machine component

#### CPU

The **instruction set** is hard-coded into the CPU and represents a list of instructions that the CPU is able to carry out. Every program on a computer is inevitably broken down into small and simple instructions defined in the instruction set. Different CPUs have different instruction sets because they're are hard-coded, manufacturers may use different instruction sets on their chips each with their own respective strengths and weaknesses.

Not all components can necessarily fit together, for instance a CPU may not be compatible with a motherboard. There are currently two types of CPU sockets that need to be able to connect to the motherboard: **LGA** or **Land Grid Arrays** and the **PGA** or **Pin Grid Array**. Make sure your motherboard and CPU sockets both match. CPUs have either a 32-bit or 64-bit architecture, these architecture specifications specify how much data it can efficiently handle.

#### RAM

RAM is constantly being updated and changed, it is also **volatile data** meaning once the computer is shut down, all the memory stored in RAM is lost, or cleared. Our computer is a comprised of programs, our programs need to be copied into RAM so our CPU can process them. When a computer says it has 16GB of RAM, that means it can run 16GBs worth of programs at any given time. There are lots of types of RAM, the most commonly found variant found in computers is **DRAM** or **Dynamic Random Access Memory**. The faster the RAM, the quicker programs can be run and subsequently more programs can be run during any given period of time. Like the CPU, RAM needs to have a compatible motherboard with the appropriate alignment of pin slots.

**DRAM**

- When a one or zero is sent to DRAM, it stores each bit in a **microscopic capacitor**, this charge or discharge represents the one/zero
  binary value. These semiconductors are stored on the RAM and represent our data. There are also different types of memory sticks that DRAM can be put on. Common modern **DIMM sticks** or **Dual Inline Memory Modules**, have different sized of pins on them.

**SDRAM**

- Synchronous DRAM, this type of RAM is synchronized to the systems CPU clock speed which results in faster processing speed.

**DDR SDRAM**

- Double Data Rate SDRAM, or _DDR_. DDR is faster, more efficient, and has a larger capacity than earlier versions of RAM like SDRAM or DRAM. The current iteration: DDR4, is currently the fastest form of short-term memory that is available for computers.

#### Motherboard

The motherboard is the central hub of the computer. It connects different parts of the computer together and allows the expansion of our computer's functionality by adding **expansion cards**. All motherboards have a few key characteristics:

- **The Chipset**: determines how components, like the CPU, RAM, and peripherals, communicate amongst one another on the machine. Motherboards are composed of two chip sets: the **Northbridge** that interconnects components like the RAM and video cards. The other, the **Southbridge**, handles the **I/O or input/output** components of the machine like hard rives and USBs that output data. Some CPUs completely integrate the Northbridge, so there is no separate Northbridge on the motherboard.

- **Expansion Slots**: allow us to expand on the functionality of our computer. For instance, if you wanted to install a GPU you would install it onto the expansion slot. The standard for expansion slots today is called the **PCIe**, or **Peripheral Component Interconnect Express**. The PCIe looks like an expansion slot on the motherboard.

- **Form Factor**: The size of a motherboard. ATX, Advanced Technology Extended, is the most common Form Factor. ITX, Information Technology Extended is a smaller form factor than the ATX. The form factor of a motherboard is important in determining the amount of functionality and computational power you eventually want in your machine.

_What is the purpose of the Chipset?_

- The chipset helps determine how components like the CPU, RAM, and peripherals work together.

_What do the Southbridge and Northbridge handle?_

- The Southbridge handles the I/O behaviors of the machine, whereas the Northbridge handles components like the RAM, GPU, etc. Some CPUs integrate the Northbridge functionality internally.

#### Storage

**Data Sizes**

- 1 bit
- 1 byte (8 bits)
- 1 kilobyte (1024 bytes)
- 1 megabyte (1024 kilobytes)
- 1 gigabyte (1024 megabytes)
- 1 terabyte (1024 gigabytes)

**Hard Drive**

- HHD, **Hard Disk Drives**, use a mechanical arm and spinning platform to read and write information. The speed of the platform/platter determines how quickly data can be written and read, commonly referred to as **RPM**. Because of the moving parts, HDDs are more prone to damage than SSDs.

**Solid State Drive**

- SSDs have no moving parts. Information is stored on microchips so data is able to travel much quicker when compared to an HDD. Additionally, their form factor is much more compact than that of an HDD.

**ATA**

- The most common interface for connecting a hard drive. The most common of the ATA interfaces is SATA, which uses one cable for data transfers. SATA drives are **hot swappable** and don't require the computer to be shut down to plug one in. They are move data faster and are more efficient than their precursors. Despite the speed of the **SATA cable** it was not fast enough to keep up with the demands of SSDs. So another interface standard was created called **NVM express** or **NVMe**, instead of using another cable an NVMe was added as an expansion slot allow for greater throughput and efficiency.

_What are the key differences between an HDD and SDD?_

- HDD have more moving parts, including a mechanical arm and platter, and therefor are more prone to failure, however when compared to an SSD they are cheaper. SSDs have no moving parts, instead relying on internal microchips to read and write data. In addition to being much faster in transferring in data than their HDD cousins, they also have a more compact and efficient form factor.

_What is an ATA / SATA drive?_

- They are interfaces for connecting to the hard drive. SATA drives are hot swappable, use one cable for data transfers, and are more efficient than ATA drives.

_Are SATA cables suitable for SSDs?_

- No, they are unable to keep up with transfer speed of an SSD and therefor not suitable when compared to an NVMe (NVM express) which provides a faster throughput and greater efficiency.

#### Power Supply

- Two types of electricity: **DC, direct current / AC, alternating current**.

_Computers use DC voltage_ so we need to convert it from _AC_ that flows in. The power supply does exactly that, it converts AC power to low voltage DC power.

- The _flow_ or _pressure_ of power is regarded as to as **voltage**. **AMPS, or Amperage** is the pulling of electricity, as opposed to the "pushing" analogy for voltage. Voltage gives you every, per the flow, AMPs is the pulling of just enough that is needed. The more amperage a charger pulls, the faster it will charge a device. **Wattage** is the amount of voltage and amperage a system needs. It's better to have more **power supply** than less, since having too little will fail to start the machine.

_Explain the differences between AC / DC and what the computer uses_

- AC (alternating current) is the power the is sent out on the grid, the computer needs to use DC (direct current) which flows unidirectionly.

_Explain voltage, amperage, and wattage_

- Voltage is the pressure of the electrical current, amperage is the power of the current coming into a machine, wattage is the amount of power needed by a machine.

#### Peripherals

- Anything that can be added to a computer, externally, is considered a **peripheral**. **USBs or Universal Serial Bus**'s are one of the most popular peripherals. There are 3 modern versions of the USB: _USB 2.0 (transfer speed of 480 Mb/s), USB 3.0 (5 Gb/s), and USB 3.1 (10 Gb/s)_. There is an important distinction to make between _MB_ and _Mb/s_. MB or megabyte is a unit of storage, while **Mb/s or megabit per second, is a unit of data transfer rate.** Port sizes matter, if you plug a USB 2.0 into a 3.1 port, you will not get the 3.1's transfer speed, but it still is backward compatible. Generally, USB 2.0 ports are black, USB 3.0 ports are blue, and USB 3.1 ports are teal.

There are many types of USB connectors, the most popular and recent one is the **type-C** connector, used for many types of connections including display and data transfer. **DVI cables** are a bit older than type-c connectors, generally just output video. Two standards that output both audio and display are the **HDMI** cable and the **Display Port**. Type-C connectors do more than just video and audio output, they can also transfer data and power.

_What is the transfer speed of a USB 2.0, 3.0, and 3.1_

- USB 2.0 (transfer speed of 480 Mb/s), USB 3.0 (5 Gb/s), and USB 3.1 (10 Gb/s)

_What is the difference between MB and Mb/s?_

- MB is an expression of actual size, Megabit per second is the representation of data transferring per second.

#### Key Technologies:

- Ports
- CPU
- Heat Sink
- RAM
- DRAM
- SDRAM
- DDR SDRAM, DDR
- EDB
- Registers
- MCC
- Address bus
- Cache, L1, L2, L3, L4
- Clock wire
- Hard Drive
- Motherboard
- Clock cycles
- Overclocking
- LGA / PGA
- 32-bit / 64-bit architecture
- Volatile data
- Instruction set
- DIMM sticks
- Form Factor
- Northbridge
- Southbridge
- PCIe
- ATA / SATA / NVMe
- hot swappable
- voltage, amperage, wattage
- USB
- type-c, hdmi, div-cables, display port

### Start up

#### BIOS

How do mouse clicks and keyboard presses reach the CPU? Clicking a key on a keyboard would only send a single byte to the cpu, and well, the cpu wouldnt know how to handle that information. Devices themselves have programs that tell the CPU how to process their inputs, these programs are called **services** or **drivers**. Drivers contain instructions that our CPU needs in order to understand external devices like keyboards, webcams, printers, etc.

**BIOS**, or **Basic Input Output Services**, is what the CPU uses to communicate with device drivers. The BIOS is software that initializes the computer's hardware and gets our operating system up and running. The BIOS isnt stored on a hard drive, rather its stored on the motherboard itself in a chip called the **Read-Only Memory chip** or **ROM chip**. Unlike RAM, ROM is _non-volatile_, meaning it wont erase data on shutdown. Once the OS loads, we are able to run non-essential device drivers.

**UEFI**, or **Unified Extensible Firmware Interface**, is a new technology that serves the same purpose as the BIOS, but it's newer and has better support for newer hardware. Most hardware now has UEFI integration. Eventually, UEFI will become the dominant variant of BIOS.

One occasion, when turning on a computer you may here beeping. The beeping is the result of a **Power On Self Test** or **POST**. During this process the computer's BIOS tests that hardware is working correctly. BIOS will run the essential drivers first, if there is an issue (and your video driver has not yet been loaded), it will play a series of specific sounds to indicate what exactly is not working. For instance, two beeps could be a POST error.

the **CMOS chip** on the motherboard stores basic data like the the date, time, and how you want to start up. It can be changed in the BIOS settings menu. The process of using the BIOS to **reimage** a computer is a common IT task, the term refers to a disk image, which is a copy of an operating system. So, in short reimaging is the process of wiping and reinstalling an operating system. The procedure is normally handled using a program stored on a USB, CD ROM, or even a network accessible server.

## Networks

A network is a connection between n computers. A network can be as simple two computers connected to one another or well into the millions and billions, eventually evolving into what is called the **internet**. The internet is the physical connection of computers and wires around the world, the **web** on the other hand is the information that is getting passed around the internet network. **Networking** is the process of managing, building, and designing networks.

The internet is a massive network of cables, satellites, cellular networks, etc. We as users don't actually directly connect to the internet, rather we go through servers that connect to the internet. **Servers** store the websites that we use, they serve content. The machines we use, **clients**, request the content from servers. Clients don't directly connect to the internet, instead they connect to a network run by an **ISP**, or **Internet Service Provider**. ISPs set up the infrastructure used to connect to the internet, they connect to other networks and ISPs, and together they form a giant network called the internet.

Computers are able to connect to servers through addresses called **IP addresses**. Computers on a network have identifiers called IP Addresses that directly connect clients to the resources they requested like a website. Websites IP addresses are composed of digits like `172.217.6.46` and when a client makes a request to a server, with the desired address, the network connected server responds with the appropriate resources per client request. Devices that can connect to a network have a unique (generally) permanent hard-coded identifier called a **MAC addresses**. When you send or receive data through a network you need to have both an IP and a MAC address. a MAC address is the address of the "recipient". Data is sent through a network using **packets**, while data is sent out over a network, it is broken down into smaller pieces of data (1s and 0s) and once the packet gets to its destination it gets rearranged back in order.

### Networking Hardware

Ethernet cables, WIFI, and fiber-optic cables allow us to connect to the internet. Fiber optic cables are the fastest means of connecting to the internet, the cables themselves are made of glass and send light signals, rather than an electrical current through a copper wire, to send data (1s and 0s) through the cables.

**Router**

Routers connects lots of different devices together and helps manage network traffic. If a user wanted to send data from one computer to another computer in the same network, a router would use **network protocol** rules to determine where to send the packet. If we wanted to send data to someone outside of the network, the router would direct the traffic to our ISP's network that would have it's own network protocols to leverage. During the process our packet would travel through many different routers, switches, and hubs.

A **Network Stack** is what we would troubleshoot in the event of a networking issue. In short, a network stack is a set of hardware or software that provides infrastructure for a computer network.

### The Language of the Internet

The networking protocols we use help get our packets from one place to the next. There are many different variants of network protocols but they all do the have the same objectives: route efficiently, aren't corrupted, secure, go to the right machine, and are named appropriately. The **IP** in **TCP/IP** or **Transmission Control Protocol / Internet Protocol**, makes sure we deliver the right packets of data to the correct computers, essentially it helps us route our traffic correctly. The TCP, is a protocol that handles the reliable delivery of information from one network to another. This protocol is important because it handles how we share information across networks.

### The Web

All websites can be accessed through the web. The **URL, or Uniform Resource Locator** consists of a `www` `domain-name` `com` . `DNS or Domain Name System` allows us to write human readable addresses like `www.google.com` to map to the relevant IP address. When you got on your browser and search for a website, you program does a DNS lookup to find the correct IP address for the name you entered.
