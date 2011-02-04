import re

from mercurial import patch


def commit_no_print(ui, repo, hooktype, node, parent1, **kwargs):
    """
    Intended for running on commit. I take no responsibility for what might
    happen if attached to other events.

    This hook inspects the diff that was just committed and looks for inserted
    print statements. It does so fairly naively, not caring about the filetype
    or anything.

    Also, it does not fail if a print statement is found, as sometimes you
    might actually mean to do it.
    """
    regex = re.compile(r'^\+\s*print')
    for line, label in patch.diffui(repo, parent1, node):
        if regex.match(line):
            print "YOU COMMITTED A PRINT STATEMENT"
            return
