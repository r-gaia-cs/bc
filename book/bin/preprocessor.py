#! /usr/bin/python3
"""
Preprocessor for (La)TeX files of Software Carpentry.
"""

import re
import sys

# Global variables
VERBSTART = r'\\begin\{(VerbIn|VerbOut|VerbErr)\}'
VERBEND = r'\\end\{(VerbIn|VerbOut|VerbErr)\}'

def main(in_file_name, out_file_name):
    inside_verb = False
    previous_env_is_verb= False
    lines = []

    with open(in_file_name, 'r') as file_:
        for line in file_:
            match = re.match(VERBSTART, line)
            if match:
                if not previous_env_is_verb:
                    lines.append("\\begin{VerbGroup}\n")
                inside_verb = True
                lines.append(line)
                continue

            match = re.match(VERBEND, line)
            if match:
                inside_verb = False
                previous_env_is_verb = True
                lines.append(line)
                continue

            if inside_verb == False and previous_env_is_verb == True:
                if len(line) != 0  and not line.startswith('\n') and not line.startswith('%'):
                    previous_env_is_verb = False
                    lines.append("\\end{VerbGroup}\n")
                    lines.append("\n")
                    lines.append(line)
            else:
                lines.append(line)

    with open(out_file_name, 'w') as file_:
        file_.write(''.join(lines))

if __name__ == "__main__":
    if len(sys.argv) == 3:
        in_file_name = sys.argv[1]
        out_file_name = sys.argv[2]
        main(in_file_name, out_file_name)
    else:
        print("Usage:\n\n./preprocessor.py in-file out-file")
