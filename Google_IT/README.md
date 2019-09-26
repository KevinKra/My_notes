## GOOGLE IT COURSE

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
