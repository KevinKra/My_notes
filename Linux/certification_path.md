# Learn Linux

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
