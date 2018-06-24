use strict;
use warnings;
use utf8;

my @repetitions;
my $log = "access.log";
my %IPs;

open(my $fh, "<", $log) 
	or die "Can't open < $log!";
while ( my $str = <$fh> ) {
	chomp($str);
	push @repetitions,($str =~ m/(\d+\.\d+.\d+.\d+)/);
	$IPs{
		$repetitions[-1]
		}=0
}
close $fh;

foreach my $i (@repetitions){
	$IPs{$i}=$IPs{$i}+1
}

my @top10IPs=sort {$IPs{$a} < $IPs{$b}} keys %IPs;

for (my $i=0; $i<10; $i++){
	my $address=@top10IPs[$i];
	print $address, " : ", $IPs{$address}, " times ","\n";
}