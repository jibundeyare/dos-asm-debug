import os
import re
import sys

# the key is the identifier
# the value is a tuple made of the segment and the offset
identifiers = {}

def usage():
    print("usage:")
    print(f"{sys.argv[0]} HELLO.LOG")

args = sys.argv[1:]

if len(args) != 1:
    print(f"error: no log file specified")
    print()
    usage()
    sys.exit(1)

log_file = args[0]
basename = os.path.splitext(log_file)[0]
asm_file = basename.lower() + '.asm'
com_file = basename.lower() + '.com'
d_file = basename.lower() + '.d'

if not os.path.isfile(log_file):
    print(f"error: the log file {log_file} does not exist")
    print()
    usage()
    sys.exit(1)

if not os.path.isfile(asm_file):
    print(f"error: the asm file {asm_file} does not exist")
    print()
    usage()
    sys.exit(1)

with open(log_file, 'r') as file_handler:
    log_lines = file_handler.readlines()

with open(asm_file, 'r') as file_handler:
    asm_lines = file_handler.readlines()

# remove line feeds
log_lines = [s.rstrip('\n') for s in log_lines]
asm_lines = [s.rstrip('\n') for s in asm_lines]

# @debug
# print(log_lines)
# print(asm_lines)
# print()

print(f'parsing {log_file}')

# search in the log file
for log_line in log_lines:
    # identifier declarations
    m = re.search('([0-9A-F]{4}):([0-9A-F]{4}) ; #(\w+)', log_line)

    if m:
        print(f'identifier: {m.group(3)} {m.group(1)}:{m.group(2)}')
        identifiers[m.group(3)] = (m.group(1), m.group(2))

    # assembler exit line
    m = re.search('([0-9A-F]{4}):([0-9A-F]{4}) $', log_line)

    if m:
        print(f'identifier: end {m.group(1)}:{m.group(2)}')
        identifiers['end'] = (m.group(1), m.group(2))

print()

# @debug
# print(identifiers)
# print()

if 'end' not in identifiers:
    print(f'error: identifier "end" not found')
    sys.exit(1)

print(f'parsing {asm_file}')

# search in the asm file
for i, asm_line in enumerate(asm_lines):
    # references to identifiers
    m = re.search('.+ ; (SEGMENT|OFFSET) (\w+)', asm_line)

    if m:
        print(f'reference: {m.group(2)} {m.group(1)}')

        reference_type = m.group(1)
        identifier = m.group(2)

        is_byte = False
        search_string = '0100'

        if asm_line.find(search_string) == -1:
            is_byte = True
            search_string = '00'

        if identifier in identifiers:
            if reference_type == 'SEGMENT':
                asm_lines[i] = asm_line.replace(search_string, identifiers[identifier][0])
            elif reference_type == 'OFFSET':
                asm_lines[i] = asm_line.replace(search_string, identifiers[identifier][1])
        else:
            print(f'error: identifier {identifier} not found')

    # exit code
    if asm_line == 'q':
        break
print()

# remove exit instructions
asm_lines = asm_lines[:i]

# append recording and exit instructions
asm_lines.append(f'n {com_file}')
asm_lines.append('r cx')
asm_lines.append(identifiers['end'][1])
asm_lines.append('w')
asm_lines.append('q')
asm_lines.append('')
asm_lines.append('')

# @debug
# for asm_line in asm_lines:
#     print(asm_line)

print(f'saving {d_file}')

# save debug file
with open(d_file, 'w', newline='') as file_handler:
    file_handler.write('\r\n'.join(asm_lines))

