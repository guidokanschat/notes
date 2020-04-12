use open IO => ":encoding(UTF-8)";

while(<>)
{
    s/Lam\\IeC \{\\'e\}/Lamé/g;
    s/(\$[^\$]+\$)/---zzz---/;
    my $math = $1;
    if (m/writefile\{toc\}.*contentsline\s*\{([a-z]+).*numberline\s*\{([^}]+)\}([^}]+)/u)
    {
#	print STDERR "Found $1 $2: $3\n";
	my $t = $3;
	if ($1 eq 'chapter')
	{
	    if ($3 eq 'Appendix')
	    {
		print"\\appendix\n";
	    }
	    else
	    {
		$t =~ s/---zzz---/$math/;
		print "\\section{$t}\n\\frame{\\sectoc}\n";
	    }
	    next;
	}
	if ($1 eq 'section')
	{
	    $t =~ s/---zzz---/$math/;
	    print "\\subsection{$t}\n\\frame{\\subtoc}\n";
	    next;
	}
	if ($1 eq 'subsection')
	{
	    $t =~ s/---zzz---/$math/;
	    print "\\subsubsection{$t}\n\\frame{\\subsubtoc}\n";
	    next;
	}
    }
    if (m/newlabel\{([[:upper:]][[:lower:]]+):([\w-]+)\}/)
    {
	# print STDERR "Found $1 $2\n";
	print "\\frame{\\input{blocks/$1-$2}}\n";
    }
}
