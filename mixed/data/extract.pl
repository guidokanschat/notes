while (<>)
{
    if (m/DEAL::Step (\d+)/)
    {
	print "\n$1\t";
	$level = $1;
    }
    
    print "$2\t" if (m/DEAL::Error([^:]+): (.+)/);
}

print "\n";

