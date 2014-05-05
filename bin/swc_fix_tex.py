"""
This fix some issues at the LaTeX file get when using pandoc to convert HTML
into LaTeX.
"""

import sys
import re

def fix_glossary(lines):
    """
    Fix glossary adding hyperdef.

    :param list lines: lines to fix
    :return: lines fixed
    """
    in_glossary = False
    fixed_lines = []

    for i  in range(len(lines)):
        line = lines[i]

        # Check for begin of glossary
        if re.search('subsection{Glossary}', line):
            in_glossary = True
        elif re.search('subsection{The Rules}', line):
            in_glossary = False
        elif in_glossary:
            line = re.sub('^.textbf\{(.*)\}:', '\\hyperdef{}{\\1}{\\1}:', line)

        fixed_lines.append(line)
    return fixed_lines

if __name__ == "__main__":
    filename = sys.argv[1]

    with open(filename, 'r') as file_:
        lines = file_.readlines()

    fixed_lines = fix_glossary(lines)

    print(''.join(fixed_lines))
    """
    with open(filename, 'w') as file_:
        pass
    """
