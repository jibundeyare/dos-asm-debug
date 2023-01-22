# Assembly for `debug.exe`

This repo contains aseembly code and tools that can be used to compile code with MS DOS `debug.exe`.

## Prerequisites

- MS-DOS 6.21
- a VirtualBox vm running MS-DOS 6.21
- a blank floppy disk image that can be mounted as a loop device with the `mount` command

## How to create a blank floppy disk image

Run these commands to make a blank floppy disk image:

```bash
dd bs=512 count=2880 if=/dev/zero of=floppy.img
mkfs.msdos floppy.img
```

Now run this command to mount the blank floppy disk image:

```bash
mount -o loop -o uid=username -o gid=groupname floppy.img /mnt/floppy/
```

Note: change username and groupname with yours.

Run this command to find out your group name if yo don't knwo :

```bash
id
```

## Usage

1. Write an assembly code script that can be fed to `debug.exe`
2. Use the `asm.bat` script to output a `.log` file
3. Use the python script `parser.py` to resolve address segments and offsets and generate a `.d` file
4. Use the `d.bat` script to compile a `.com` file

### Example

We will use the `hello.asm` script.

In the host machine:

```
$ ./push.sh
```

In the DOS machine:

```
C:\> asm hello
```

This outputs `hello.log`.

In the host machine:

```
$ ./pull.sh && python parser.py hello.log && ./push.sh
```

This outputs `hello.d`.

In the DOS machine:

```
C:\> d hello
```

This outputs `hello.com`.

In the DOS machine:

```
C:\> hello
Hello World!
```

In the host machine:

```
$ ./pull.sh
```

