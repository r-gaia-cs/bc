"""
Test fix for LaTeX.
"""

import swc_fix_tex as fix

def test_fix_glossary():
    lines = ["\\hyperdef{}{glossary}{\\subsection{Glossary}\\label{glossary}}",
            "\\textbf{absolute path}: A \\hyperref[g:path]{path} that refers to a",
            "\\hyperdef{}{the-rules}{\\subsection{The Rules}\\label{the-rules}}"
            ]
    fixed_lines = fix.fix_glossary(lines)
    print(fixed_lines[1])
    assert fixed_lines[1] == '\\hyperdef{}{absolute path}{absolute path}: A \\hyperref[g:path]{path} that refers to a'

if __name__ == "__main__":
    test_fix_glossary()
