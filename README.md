# CSYE6225_NetworkStructures_CloudComputing

## Table of Contents

## M1

### Linux
- Open-source OS kernel created by Linus Torvalds in 1991.
- Built using GNU utilities, forming a complete OS.
- Used in servers, desktops, embedded systems for stability, security, flexibility.

### Essential Linux Commands

#### A. Network Commands
| Command | Description | Example |
|---------|------------|---------|
| `ssh user@host` | Securely log into a remote system | `ssh student@server.com` |
| `scp file user@host:/path` | Securely copy files between systems | `scp notes.txt user@remote:/home/user/` |
| `ping domain` | Test network connectivity | `ping google.com` |
| `nslookup domain` | Get DNS info | `nslookup google.com` |
| `wget URL` | Download a file from the internet | `wget http://example.com/file.zip` |

#### B. File System Commands
| Command | Description | Example |
|---------|------------|---------|
| `ls` | List directory contents | `ls -l` (detailed view) |
| `cd directory` | Change directory | `cd /var/log` |
| `pwd` | Print working directory | `pwd` |
| `cp source destination` | Copy files | `cp file.txt /backup/` |
| `mv old new` | Move/rename files | `mv old.txt new.txt` |
| `rm file` | Remove files | `rm -r /old/` |

#### C. System Information Commands
| Command | Description | Example |
|---------|------------|---------|
| `whoami` | Print current user | `whoami` |
| `df -h` | Show disk usage | `df -h` |
| `free -h` | Show memory usage | `free -h` |
| `uptime` | Show system uptime | `uptime` |

#### D. File Viewing and Editing
| Command | Description | Example |
|---------|------------|---------|
| `cat file` | Display file content | `cat notes.txt` |
| `more file` | View file one page at a time | `more longfile.txt` |
| `head -n 5 file` | Show first 5 lines of file | `head -n 5 notes.txt` |
| `tail -n 5 file` | Show last 5 lines of file | `tail -n 5 logs.txt` |
| `nano file` | Open file in Nano editor | `nano script.sh` |
| `vim file` | Open file in Vim editor | `vim config.conf` |

#### E. Process Management
| Command | Description | Example |
|---------|------------|---------|
| `ps aux` | Show running processes | `ps aux | grep apache` |
| `top` | Show real-time system processes | `top` |
| `kill PID` | Terminate a process | `kill 1234` |
| `killall process` | Terminate all instances | `killall firefox` |