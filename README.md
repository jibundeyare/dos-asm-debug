# Assembly for `debug.exe`

This repo contains aseembly code and tools that can be used to compile code with MS DOS `debug.exe`.

## Steps

1. Write a assembly code script that can be fed to `debug.exe`
2. Use the `asm.bat` script to output a `.log` file
3. Use the python script `parser.py` to resolve address segements and offsets and generate a `.d` file
4. Use the `d.bat` script to compile a `.com` file

## Example

Create `hello.asm`.

In the host machine:

```
$ ./push.sh
```

In the DOS machine:

```
C:\> asm hello
```

This outputs `HELLO.LOG`.

In the host machine:

```
$ ./pull.sh && python parser.py HELLO.LOG && ./push.sh
```

This outputs `hello.d`.

In the DOS machine:

```
C:\> d hello
C:\> hello
Hello World!
```

This outputs `hello.com`.

In the host machine:

```
$ ./pull.sh
```

