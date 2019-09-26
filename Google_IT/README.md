# GOOGLE IT COURSE

# Fundamentals

## Introduction to IT

**What does an IT specialist do?**

- Ensure that technology and computer systems operate correctly as well as protecting systems from vulnerabilities and attacks.

### History of Computing

A computer is a device that stores and processes data by performing calculations. Abacus is often considered the first "computer", it calculated numbers for a user, over the centuries computers continued to developed. By the 19th century, Joseph Jacquard developed punch cards for looms that determined how looms would handle the process for manufacturing textiles. Charles Babbage, a gifted engineer, built the first modern computer. The machine he built, called a **difference engine** was a mechanical calculator that could perform complicated mathematical calculations. Babbage's follow-up invention was called an **analytical engine**. Inspired by Jacquard, he allowed users to predefine a series of calculations they wanted to perform. Despite how advanced Babbage's machine was, it was still none-the-less a mechanical calculator. Mathematician Ada Lovelace took the analytical calculator to the next level. She realized that the analytical calculator could be developed to accomplish far more than just pure calculations. Ada Lovelace developed the first algorithm for the engine (the first example of computer programming), transforming the analytical engine from being a complex mechanical calculator to become the first general purpose computing machine in history.

Until the 1950s, punch cards will still the mainstay in providing algorithms to a computer. Innovations like **magnetic tape** worked by magnetizing data onto a tape, and solved several issues surrounding the traditional punch card approach. **Vacuum Tubes** controlled the controlled the electricity voltages of equipment but were bulky and constantly broke. The phrase **debugging** originated from renowned computer scientist Admiral Grace Hopper when she discovered a literal bug, a moth, to be the source of the problem with their computer relays. The wall-to-wall convolution of electronics and wires, the **ENIAC**, was one of the earliest forms of general purpose computers. Eventually, the industry moved away from vacuum tubes and started using transistors for the role of managing electricity voltages. **Transistors** are more compact and efficient than vacuum tubes and are still used today, albeit so small and efficient that they exist in the billions on modern machines.

The Xerox Alto was the first modern computer, it also was the first computer to use a GUI. In the 1970s Steve Wozniak, along with Steve Jobs, invented the Apple I, a single-board computer for hobbyists. Their follow-up the Apple II, was ready for commercial use and became a massive success. In the 1980s IBM introduced the personal computer along with a primitive OS called **MS DOS** or **Microsoft Disk Operating System**. Eventually Microsoft went on to create their own OS called **Microsoft Windows** which dominated the market because it could run on any compatible hardware. With Apple and Microsoft taking over the operating system space, an engineer named Richard Stallman started developing a free Unix-like operating system, Stallman created an OS that he called **GNU**, it was meant to be free to use and accessible to everyone with similar functionality to Unix. It was intended to evolve into a fully open-source OS that was not owned by Apple or Microsoft. It set the foundation for one of the largest modern operating systems, **Linux**, that was developed by Linus Torvalds.

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

A computer only communicates in **binary**, **binary system**, or **base-2 numeral system**. In computing terms, we group binary into 8 numbers (a **byte**), or bits with each bit being a **binary digit**. Each byte can store one character. Historically, we used 8 bits because in the early days of computing, hardware used the base-2 numeral system to move bits around. 2^8 numbers provided a large enough range of values to all the computing needed by a machine. Initially, 8-bit computing was not the de-facto standard, but as the technology developed it became an industry standard.

**Character encoding** is used to assign our binary values to human-readable characters. Think of character encoding as a dictionary, it's a means for a computer to look up which human characters should be represented by a given binary value. The oldest encoding standard is **ASCII**, it represents the English alphabet punctuation, letters, digits, and all. ASCII was great because it only needed to use 127 of the 256 potential variations. However, eventually that was not enough. Other encoding standards were used to represent other languages, different character amounts, etc, eventually resulting in the need for more than 256 total options. **UTF-8** solved this problem, not only did it have the same ASCII table, but it also also let engineers use a variable number of bytes. In essence, the UTF-8 encoding standard allows us to store a character in _more than_ one byte, which allowed for tremendously more character assignments. UTF-8 is built off the Unicode Standard. How do we represent colors? Well, one method is to use the RGB model in which each character represents a shade of a color and then changes the color of a pixel on the screen. With nothing but combinations of zeros and ones organized in bytes, everything interacted with in modern machines is represented predictably and reliably.

How does a computer even get the ones and zeros represented in the binary system? By utilizing the two states of on and off, a series of signals can be sent to the machine via electrical signals passed through transistors. It's an interesting evolution from the punch cards used in the 19th century looms to what we currently have with modern machines, same technique just with different means of accomplishment. An electric signal is denoted as a one (on), while no signal is denoted as a zero (off). **Logic gates** allow transistors do more complex tasks than simply turn things on or off, they decide where to send electrical signals depending on logical conditions. More in depth, a logic gate is an electronic component that conducts electricity based on a rule. The **output gate** is the result of applying this rule to one or more **inputs**. Inputs may be two wires or the output of other logic gates. There are three types of logic gates: AND, OR, NOT.

_What values can a byte hold?_

- Zeros and Ones.

_How many potential values can a byte have?_

- A byte can have up to 256 potential values.

_How many bits are in a byte?_

- There are 8-bits in a byte.

_What is the UTF encoding standard?_

- A predictable model to determine the appropriate representations of base-2 numeral system or binary system in human readable characters.

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

**Abstraction** is the process of tucking away the complexities of an topic and making make it more accessible for use. In computing, we use abstraction make computing processes simple by extracting isolated concepts and then stacking them in layers for a more comprehensive understanding.

A computer can be cut into four main layers: hardware, operating system, software, and users.

_What is an abstraction?_

- To take a relatively complex system and simplify it for our use.

_What is an example of a common abstraction?_

- Error messages are a great example of a regularly occurring abstraction. The error message itself, may say `"Error: File not found"`, this helpful message informs us in a simple and approachable manner where or what the issue with our current executing code may be. Imagine troubleshooting without errors simplifying the process for us.

#### Key Technologies:

- Hardware layer
- Operating system layer
- Software layer
- User layer

## Hardware

### The Modern Computer

- Modern computers consist of many different pieces of hardware including but not limited to: the mouse, monitor, keyboard, desktop, webcam, and printer. **Ports** are connection points in which we can connect devices to a machine to extend its functionality. Computers are made up of several components. The **CPU, or Central Processing Unit** serves as the brains of the computer, it handles all of the calculations and ata processing. **RAM, or Random Access Memory** holds the short-term memory of the computer. The **Hard Drive** is where we store data for the long-term. The **Motherboard** holds everything in place that allows all the separate components to communicate with one another, it essentially serves as the nexus of the computer.

_What is a good succinct summary of a Program?_

- A program is a series of instructions that tells a computer what to do.

_CPU_

- The Central Processing Unit reads the instructions from our program and processes them. It interprets the instructions (at this point compiled into binary) stored in our RAM because it can access those instructions significantly faster than it would need to if it were stored in the hard drive.

_RAM_

- The Random Access Memory of a machine is where we can store our short-term memory to rapidly relay it to the CPU where it gets processed. Because it's "Random Access" the CPU can access any memory addresses in the RAM just as fast as any other parts. We _don't_ actually send data from the RAM to the CPU over the EDB.

_EDB_

- External Data Bus it's a row of wires that interconnect the parts of our computer. When a voltage is sent to one of the wires, the is changed to 1, or on. If there is no voltage, it is 0, or off. This is how our bits physically travel around the computer, they come in many different sizes: 8-bit, 16-bit, 32-bit, 64-bit, the larger the bit-size the more data can be moved around at any given time. An 8-bit EDB sends 1 byte of data, or one line of data, around at a time.

_Registers_

- Components inside the CPU the store the data that our CPU needs to work with. If the CPU needed to add two numbers, one number would be stored in register "a", the other would be stored in register "b", and the result would be stored in register "c".

_MCC_

- Memory Controller Chip is a bridge between the CPU and the RAM. CPU requests data, MCC locates the relevant data, MCC sends the data through the EDB.

_Address Bus_

- Connects the CPU to the MCC. The CPU sends the location of the data (but not the data itself) to the MCC, then the MCC uses that memory location address to look up the data in the RAM, then the MCC forwards the correct data over the EDB to the CPU.

_Cache_

- An even faster means of getting data than RAM that exists on the CPU. It's utilized for data that was recently used and/or frequently used. There are three different cache levels in a CPU: **L1, L2, L3**. L1 is the smallest and fastest cache. They store data that is otherwise being frequently used from the main memory location, this results in a reduction in the cost of time and energy. All modern (fast) CPUs have different levels of caches, most of which split their L1 cache. Every core of a multi-core processor has dedicated L2 cache that is not shared amongst the cores. L3 and higher level caches are usually split, but like L2 caches L3 caches are not share between cores. L4 caches are uncommon and is usually on DRAM and not SRAM like other caches.

_Clock wire_

- An internal clock that CPU uses to know when one operation ends and the next one starts, this keeps the operations in sync. When a voltage is send over the clock wire, the CPU knows it can start doing calculations. Think of the clock wire as a clock, for every "tick" the CPU does one cycle of operations. A **Clock Cycle** is what occurs when a voltage is sent to the clock wire. The `clock speed` of a CPU (for example 3.4GHz) represents the total number of clock cycles a CPU can handle in a set period. 3.4Ghz is 3.4 billion cycles per second, pretty fast. Though, if a CPU has a clock speed of 3.4GHz, that does not mean it will run at that speed, rather it's the ceiling speed. **Overclocking** is the process of increasing the clock cycle rate of your CPU to increase operations and performance.
