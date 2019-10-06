# CLI & SSH

## CLI

> Command Line Interface

- **CLI, Command Line Interface.** An interface that allows you to control your computer via commands.
- **GUI, Graphical User Interface.** An interface that lets you control your computer by interacting with graphical elements.
- **Shell**, a program that provides a CLI to a user. Examples: Bash, oh-my-zsh, etc.
- **Terminal**, sometimes used interchangeable with "CLI" and "Shell". It is the program that runs your shell.
- **Command Prompt**: `my-iMac:~ steven$`

#### Commands

- ls
- pwd
- cd
- clear
- cp
- mkdir
- touch
- mv
- rm

## SSH

> Secure Shell

- Designed to be a secure protocol to allow the transferring of data.
- An SSH comes in two parts: the private half and the public half.
- Private half: stays on our machine and needs to be kept secret.
- Public half: exist on any machine we want to connect and communicate with.
- When a connection is made between both halves the SSH protocol creates a cryptographically secure connection to the server.
- There is no way to retrieve a passphrase if it is forgotten.
- SSH connects on port 22.

#### SSH into a system

> need to know two things:

1. User account. example:
2. IP Address _or_ Hostname

`<username>@<ip_address>` - `ec2-user@18.223.122.145`

`ec2-user@18.223.122.145 -i ~/.ssh/id_rsa_example`

#### Commands:

- `ssh-keygen -C <your_email> -f ~/.ssh/id_rsa_example` - creates an SSH key pair in a hidden .ssh file.

- `ls -l ~/.ssh` - list files in hidden .ssh file.

- `exit` || ctrl+D - exit SSH session.
