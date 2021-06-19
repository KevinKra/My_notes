# Learn Linux

**What is Linux?**

Just like Windows, iOS, and Mac OS, Linux is an operating system. In fact, one of the most popular platforms on the planet, Android, is powered by the Linux operating system. An operating system is software that manages all of the hardware resources associated with your desktop or laptop. To put it simply, the operating system manages the communication between your software and your hardware. Without the operating system (OS), the software wouldn't function. [source](https://www.linux.com/what-is-linux/)

**NOTE:** The content below is derived from this [acloudguru course](https://learn.acloud.guru/course/f9945b67-499d-4e79-80bd-580074fbecdd/dashboard) that preps for the Linux Foundation Certified System Administrator (LFCS). If you would like to access the source videos and content that these notes are based on you will need an acloudguru account.

## Directory

## Directory

### [Essential Commands](#essential-commands)

- [Searching for files](#searching-for-files)

---

# Essential Commands

## Searching for files

commands covered in this section: `find`, `locate`, `where`, `whereis`, `type`

options/commands used in this section: `-i`, `-iname`, `sudo`, `-type c d l f`, `ls`, `ls -l`, `updatedb`, `man`, `echo $PATH`, `type -a`, `| tr " " '/n'`

### Using: `find` and `locate`

- `find` (most common)

  1. very powerful command used to search for files and directories.
  1. can search by name, file type, timestamp, and many other file attributes.
  1. supports expressions and blobbing for advanced searches.
  1. searches in realtime, so it can be slow on machines with lots of files.

- `locate`

  1. faster search than `find`.
  1. limited search options: can't search by attributes or metadata.
  1. searches default to the full filesystem.
  1. relies on a database for the search, which must be refreshed regularly.

- `find -name "<file_name>"`: by default, this command will look for any files in the **present working directory** that match the file name provided.
- `find / -name "<file_name>"`: this command will scan the entire filesystem. After running this command, you may find you're receiving "Permission denied" messagings. This is because you are running the command as a **regular user** and don't have permission to access some of the directories.
- `sudo find / -name "<file_name>"`: using the `sudo` (super-user do) command we now can perform the find command with elevated permissions.
- `sudo find /my-directory -name "<file_name>"`: find matching files within a specific directory.
- `sudo find /my-directory -iname "<file_name>"`: **Linux is case-sensitive by default**, in order to perform a case-insensitive search we append "i" to the `-name` option.
- `sudo find / -type f -name "*.log"`: by searching with the `-type` option, we are able to locate input devices or character devices `c`, directories `d`, links `l`, or files `f`.
- `sudo find /some-directory -type f -user cloud_user`: this command allows us to find all files within a directory that are owned by the user "cloud_user".
- `ls -l /some-directory/file.txt`: this command lists the directory contents in list format `-l`, using this command we can see information related to the "file.txt" file, like who the owner is, creation date, etc.
- `man find`: man pages (manual pages) provide a lot of information about the command, what it's used for, options, and even in some cases examples.
- `locate -i "<file_name>"` : using this command, it uses the database to find the queried file (with a case-insensitive option provided).
- `sudo updatedb`: in the event that the `locate` command does not work, it's possible that the database needs to be updated. This command provides that service (provided you have the database setup in the first place).

### Using: `which`, `whereis`, and `type`

- `which`
  1. returns the location of a command based on the PATH settings.
- `whereis`
  1. returns the location of the binary, source file(s) and man pages.
  1. will return multiple versions of a file if they exist.
- `type`

  1. returns information about the command type.
  1. details are based on how command relates to the shell configuration.

- `which python`: this command example provides information about the `python` command. It returns the path variable (unique to your shell configuration).
- `echo $PATH`: this command shows each of the locations defined in the PATH. This means that the shell will look in each of the folders provided to look for the command typed in.
- `whereis python`: returns every version that is installed existing within the PATHs directories.
- `whereis python | tr " " '\n'`: in the event that you have a lot of responses, you can use the translate option `tr` to convert each empty space `" "` in your response to new lines `'\n'` instead. It's a nice solution that can make responses more readable.
- `type -a ls`: shows us information about the `ls` command (it's an alias) _as well as_ the location of the `ls` command due to the `-a` option.

### QUIZ

#### Questions:

1. what two commands can be used to locate content on a linux machine?
1. what are the key differences between `find` and `locate`?
1. what command would you use to _find_ a file in the pwd by its name?
1. you want to _find_ a file in a specific directory to narrow your search. How would you write this command?
1. you may notice a response of `Permission Denied` returning in the results of a find operation. What is the cause of this and what command can be used to resolve it?
1. what does `sudo` stand for?
1. is Linux case sensitive by default? What options can we use to reverse this behavior?
1. what are the following called: `-i`, `-a`, etc.
1. what option can we use you define a general category of results from the `find` command, what is an example of this command?
1. what command allows us to find all files within the directory "hello-world" that are owned by the user "cloud_user".
1. what command allows us to list the contents of a current directory, what option can we use to expose additional information in the list?
1. what command would you enter to see the information about a command?
1. if you want to perform a case-insensitive lookup using the `locate` command, how would you write it?
1. the `which` and `whereis` commands both serve what purpose?
1. describe the `which` utility.
1. describe the `whereis` utility.
1. what's the manual way to convert spaces to new lines in the terminal?
1. what does the `type ls` command do?

#### Answers:

<details>
  <summary>show answers</summary>
  
1. `find` and `locate`.
1. `find` is very versatile tool for performing lookups, it's able to use many different searching parameters. `locate` can provide faster results, however it requires it's database to be up-to-date and has limited search options.
1. `find -name "some_file.txt"`
1. `find /directory -name "some_file.txt"`
1. `Permission Denied` returns as a result of the user performing the find operation as a regular user in linux and lack the permissions to access some directories. To resolve this, use the `sudo` command.
1. Sudo stands for "Super-User do".
1. Yes, Linux commands are case-sensitive by default. `-i` and `-iname` are two options that allow case-insensitive results.
1. options or flags.
1. using the `-type` option, we are able to limit our results to input devices or character devices `c`, directories `d`, links `l`, or files `f`. **Example:** `sudo find /my-directory -type f -name *.log`
1. `sudo find /hello-world -type f -user cloud_user`
1. `ls` or `ls -l` to show additional information per each file.
1. `man <command>`
1. `locate -i "<file_name>"`
1. they are both used to find the locations of either commands (`which`) or binaries, files, man pages, etc. (`whereis`)
1. the `which` utility takes a list of command names and searches the path for each **executable file** that would be run had these commands actually been invoked.
1. the `whereis` utility checks the standard binary directories for the specified programs, printing out the paths of any it finds.
1. `t " " '/n'`
1. it shows us information about a command, `ls` in this case, and where it exists.
  
  </details>

---

## Evaluating File Systems, Features, and Options

- EXT4 is the most popular filesystem used in Linux. It has been around the longest, has extensive production testing, and a wide support base.
- `Block device`: is the medium that is used to store data (SSD, HDD, CD, flashdrive, floppy desk, etc.)
- `Filesystem`: sits on top of the block device and allows the OS interact with data on the the block device.
- `Journaling`: can be found most modern operating system and plays an important role in preventing data loss caused by power loss and other incidents. With journaling when you start to write a file, the OS will know that a file is being written to disk. Once the file is written, the OS will remove the entry from the journal. With Linux, when the power comes back on, the OS would check the journal and complete any partially completed jobs. Note: journaling is not required on the operating system, not having it allows for certain optimizations and speed benefits.

### EXT (Extended File System)

- `EXT`: originally created in 1992 specifically for Linux.
- `EXT2`: created in 1993, no journaling, but supported extended attributes and 2TB storage.
- `EXT3`: created in 2001, included journaling and was an in-place upgrade from EXT2.
- `EXT4`: created in 2008, backwards compatible, increased filesystem size (1EB), increased max file size (16TB), journal checksums, and delayed allocation.

### BTRFS (B-Tree Filesystem)

- Often called "BetterFS" or "ButterFS".
- Created by Oracle in 2007, stable released in 2013.
- Includes online FS expansion and reduction, read-only snapshots for faster backups, more efficient handling of small files and directory indexes, online defragmentation, and in place conversion of EXT FS.
- Considered by many to be the future replacement for EXT4.

### ReiserFS

- Introduced in 2001.
- Offered several improvements over EXT4(?, perhaps EXT3 or EXT2).
- Reiser4 was delivered in 2004 and was once thought to be the replacement of EXT4.
- Development stalled when the main developer was sent to prison in 2008 for murder.

### ZFS (formerly Zettabyte Filesystem)

- Created by Sun Microsystems for Solaris, now owned by Oracle.
- Supports drive pooling, FS snapshots, filesystem striping.
- Each file has a checksum, making it easy to tell if a file has been corrupted.
- Made available under the CDDL (which means it can't be included in the Linux kernel, but can be easily added).

### XFS (Extents Filesystem)

- Developed by Silicon Graphics for Irix in 1994, ported to Linux in 2001.
- Similar to EXT4 in many ways, with dynamic allocation and other features.
- Can be expanded on the fly, but can't be reduced.
- Handles large files well, but does suffer performance issues with many small files.

### JFS (Journaled Filesystem)

- Developed by IBM in 1990 for AIX, ported to Linux in 1999.
- Offers good performance across small and large files, along with a small CPU footprint.
- Many helpful features, but lacks the extensive Linux production testing that other filesystems have which causes concern amongst some SysAdmins when put on production systems.

### SWAP

- **Used to format a drive, but not technically a filesystem.**
- Used for virtual memory (memory swapping) and doesn't have a viewable structure.
- Temporary place for items in memory to be stored in low RAM situations.

### FAT/FAT32/exFAT (File Allocation Table)

- Filesystem developed by Microsoft.
- Does not offer journaling, but is supported by most OSes making it very compatible.
- Cross-OS compatibility and lack of journaling make it a good use for USB drives, or other media shared between systems.
- ExFAT most recent variant and is the best choice as it supports larger file and partition sizes.

### QUIZ

#### Questions:

1. what is the most popular Linux filesystem?
1. what is a `Block device`?
1. what is a `filesystem`?
1. what is `journaling`, what service does it provide, and is it required and present on all Linux filesystems?
1. what does `EXT` stand for, what years did each iteration come out, and what features does EXT4 bring.
1. what is `BTRFS`'s official name and unofficial names?
1. when was `BTRFS` created and who created it?
1. what is `ReiserFS`, when was it released, and what happened to the main developer causing it to stall?
1. what company build `ZFS` and who are they owned by now?
1. when was `XFS` created?
1. describe some characteristics about `XFS`.
1. when was `JFS` created?
1. is `SWAP` a filesystem?
1. what does `FAT` stand for, what's the latest version, and who developed it?
1. what is `FAT` ideal for and why?

#### Answers:

<details>
  <summary>show answers</summary>

1. EXT4 is the most popular Linux system.
1. a `Block device` is a storage medium like SSD, HHD, floppy disks, etc.
1. a `filesystem` is a solution that allows the Linux OS (in this case) to interface with the contents of the Block device(s).
1. `journaling` is a process in which a filesystem records, or _journals_, its latest operations. The intention behind this is to protect data integrity and prevent loss in the event of a power outage or otherwise. Without journaling an OS has no way of knowing what processes were running prior to the crash. It is not required, or even present, on all Linux filesystem flavors. In some specific cases, it may not be ideal to have journaling as a feature since it can reduce OS speed.
1. `EXT` stands for "Extended File System". It was originally created for Linux in 1992. Release: EXT-1991, EXT2-1993, EXT3-2001, EXT4-2008. EXT4: is backwards compatible, increased filesystem size (1EB), increased max file size (16TB), journal checksums, and delayed allocation.
1. `BTRFS` or "B-Tree Filesystem" officially. It's called "Better-FS" or "Butter-FS" unofficially.
1. `BTRFS` was created by Oracle in 2007 and is considered by many to be the eventual replacement of EXT4.
1. `ReiserFS` is a Linux filesystem, created in 2001 it stalled when its founder was sent to prison in 2008 for murdering his wife.
1. Sun Microsystems created `ZFS` for Solaris, they are now owned by Oracle.
1. `XFS` was developed by Silicon Graphics for Irix in 1994, ported to Linux in 2001.
1. it can be expanded on, but not reduced. It's also good at handling large files but struggles with many smaller files.
1. `JFS` was developed by IBM in 1990 for AIX, ported to Linux in 1999.
1. `SWAP` is used to format a drive, but not technically a filesystem.
1. `FAT` stands for "File Allocation Table", it's developed by Microsoft with its latest version being `exFAT`.
1. Cross-OS compatibility and lack of journaling make it a good use for USB drives, or other media shared between systems.

  </details>

> at this point, with the level of detail above, it will take me ages to complete this content so I'm going to put it on hold and explore other ways of building on this learning.
