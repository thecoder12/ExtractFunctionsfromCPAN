#	my $url = 'http://aws.amazon.com/ec2/pricing/';
	my $url = 'http://search.cpan.org/dist/Sys-Virt/lib/Sys/Virt.pm';
	# Just an example: the URL for the most recent /Fresh Air/ show

	my @functions;
	use LWP::Simple;
	my $content = get $url;
	die "Couldn't get $url" unless defined $content;
	#print "= $content=";
	### ->new_stream($flags)
	my $pattern = ' \$vmm-\&#62\;';
	if($content =~ /$pattern([a-zA-Z0-9_]{1,55})\(/gsi){
		# print "==$1=";
		push(@functions,$1);
	}
	
	my @funct = $content =~ /$pattern([a-zA-Z0-9_]{1,55})\(/gsi;
	
	# print "==@functions==";exit();
	# print "=={scalar @funct}==";

	# open (MYFILE, '>Virt.html'); 
	# print MYFILE $content; 
	# close (MYFILE);
	
	use CGI qw(:standard);
	use DBI;
	use DBD::CSV;

	open (FH, ">functions.csv") or die "$!";
	print FH "Function Name, Description
	";
	foreach (@funct){
		print FH "$_, No description
		";
	}
	
	close(FH);
	
	