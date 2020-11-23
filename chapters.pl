######################################################################
# Extract chapters from PDF.
#
# Call:
# perl chapters.pl <basename>
#
# Reads $basename.aux to access document structure
#
# Extracts pages by chapter from $basename.pdf
#
# Offset is such that the latex page beginning of the first chapter
# equals the corrrect PDF page
######################################################################

my $offset = 2;

my $basename = $ARGV[0];
$basename =~ s/\..*//;

my @begin, @end;
my $chap;

open (my $aux, "<", "$basename.aux");
while (<$aux>)
{
    if (m/\{(\d+)\}\{chapter.(\d+)\}/)
    {
	$chap = $2;
	$begin[$chap] = $1+$offset;
	$end[$chap-1] = $1-1+$offset;
    }

    if (m/\{(\d+)\}\{appendix/)
    {
	++$chap;
	$begin[$chap] = $1+$offset;
	$end[$chap-1] = $1-1+$offset;
	last;
    }
}


for (my $i=1;$i<$chap;++$i)
{
    print "Chapter $i: $begin[$i] - $end[$i]\n";
    system ("qpdf", "$basename.pdf",
	    "--pages", ".", "$begin[$i]-$end[$i]",
	    "--", "chapter-$i.pdf");
}

system ("qpdf", "$basename.pdf",
	"--pages", ".", "$begin[$chap]-z",
	"--", "appendix.pdf");
