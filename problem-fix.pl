# /bin/perl
#
# In files describing problems and solutions, take the solution
# environment out of the stheorem.
#
use feature 'state';
state $sol = 0;
state $ends = 0;

# At the beginning of each file, set the state variables to zero
if (m/begin\s*{stheorem/)
{
    $sol = 0;
    $ends = 0;
}

# If a line \begin{solution is found:
#
# 1. Put an \end{stheorem } on the line before, unless you have already seen it.
# 2. Set the state that a solution environment has been found
if (m/begin\s*\{solution/)
{
    print "\\end {stheorem}\n" if ($ends==0);
    $sol = 1;
}

if (m/end\s*\{stheorem/)
{
# Only print, if there was no solution environment. This is for the
# case of an stheorem at the end of a file
    print if ($sol==0);
# If the stheorem environment ends before the solution environment,
# for instance, if we had run this script before, set a state to
# inform the other if about it.
    $ends = 1;
}
else
{
# Print all lines not containing and \end{stheorem}
    print;
}
