#!/usr/bin/perl -w

use lib '../lib/';
use Travian;
use Carp;

my $ATTACK_REPORTS_PATH = '/home/ade/Development/perl/travianrobot/reports/attacks/';

my $server = shift;
my $user = shift;
my $pass = shift;

die "usage: $0 [server] [user] [pass]\n" unless $server && $user && $pass;

my $USERAGENT = 'Mozilla/5.0 (X11; U; Linux x86_64; en-GB; rv:1.8.1.11) Gecko/20071204 Ubuntu/7.10 (gutsy) Firefox/2.0.0.11';
#my $USERAGENT = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.11) Gecko/20071127 Firefox/2.0.0.11";

my $travian = Travian->new($server, agent => $USERAGENT);
if (!$travian->login($user, $pass))
{
	croak $travian->error_msg();
}

my $report_attacks = $travian->report_headers(Travian::REPORT_ATTACKS);
while (@{$report_attacks})
{
	my @report_ids = ();

	foreach my $header (@{$report_attacks})
	{
		my $report = $travian->report($header->id());
		croak "Cannot retrieve report " . $header->id() . "." unless ($report);

		if ($report->attacker()->name() eq $user)
		{
			print 'Saving (' . $header->id() . ') ' . $report->defender()->village() . ' ... ';
			if (&save_attack($report))
			{
				print "Success.\n";
				my $header_id = $header->id();
				push(@report_ids, $header_id);
			}
			else { print "Failed.\n"; }
		}
	}

	$travian->delete_reports(@report_ids);

	$report_attacks = $travian->report_headers(Travian::REPORT_ATTACKS);
}

sub save_attack
{
	my $report = shift;

	my $filename = $ATTACK_REPORTS_PATH . $report->defender()->village() . '.tab';
	my @report_lines = &read_report_file($filename);

	my $new_report_line = &convert_date($report->header()->sent()) . "\t" .
				$report->attacker->resources()->wood() . "\t" .
				$report->attacker->resources()->clay() . "\t" .
				$report->attacker->resources()->iron() . "\t" .
				$report->attacker->resources()->wheat() . "\n";

	push(@report_lines, $new_report_line);
	@report_lines = sort(@report_lines);

	return &write_report_file($filename, @report_lines);
}

sub convert_date
{
	my $sent = shift;

	
	#on 11/01/08 at 07:54:19 pm

	$sent =~ m#^on (\d+?)/(\d+?)/(\d+?) at (\d+?):(\d+?):(\d+) (.m)$#msgi;
	my $day = $1;
	my $month = $2;
	my $year = $3;
	my $hour = $4;
	my $min = $5;
	my $sec = $6;
	my $ampm = $7;

	#print "$day $month $year $hour $min $sec $ampm\n";

	if ($ampm eq 'pm' && $hour != 12) { $hour += 12; }
	if ($ampm eq 'am' && $hour == 12) { $hour = '00'; }

	return "$day/$month/$year $hour:$min:$sec";	
}

sub read_report_file
{
	my $filename = shift;
	my @lines = ();

	if (-w $filename)
	{
		if (open(REPORT, $filename))
		{
			@lines = <REPORT>;

			close(REPORT);
		}
	}

	return @lines;
}

sub write_report_file
{
	my $filename = shift;
	my @lines = @_;

	if (open(REPORT, ">$filename"))
	{
		print REPORT @lines;
		close(REPORT);

		return 1;
	}

	return;
}

