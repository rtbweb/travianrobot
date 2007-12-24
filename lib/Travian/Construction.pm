package Travian::Construction;

use 5.008008;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(&gid2name &name2gid);

use Carp;
use Travian::Construction::Cost;

our $VERSION = '0.01';
our $AUTOLOAD;

our @GID2NAME = (
	'Woodcutter', 'Clay Pit', 'Iron Mine', 'Cropland',
	'Sawmill', 'Brickyard', 'Iron Foundry', 'Grain Mill',
	'Bakery', 'Warehouse', 'Granary', 'Blacksmith',
	'Armoury', 'Tournament Square', 'Main Building', 'Rally Point',
	'Marketplace', 'Embassy', 'Barracks', 'Stable',
	'Workshop', 'Academy', 'Cranny', 'Town Hall',
	'Residence', 'Palace', 'Treasury', 'Trade Office',
	'Great Barracks', 'Great Stable', 'City Wall', 'Earth Wall',
	'Palisade', 'Stonemason', 'Brewery', 'Trapper',
	'Hero\'s Mansion', 'Great Warehouse', 'Great Granary', 'Wonder of the World'
);

our %NAME2GID = (
	'Woodcutter' => 1, 'Clay Pit' => 2, 'Iron Mine' => 3, 'Cropland' => 4,
	'Sawmill' => 5, 'Brickyard' => 6, 'Iron Foundry' => 7, 'Grain Mill' => 8,
	'Bakery' => 9, 'Warehouse' => 10, 'Granary' => 11, 'Blacksmith' => 12,
	'Armoury' => 13, 'Tournament Square' => 14, 'Main Building' => 15, 'Rally Point' => 16,
	'Marketplace' => 17, 'Embassy' => 18, 'Barracks' => 19, 'Stable' => 20,
	'Workshop' => 21, 'Academy' => 22, 'Cranny' => 23, 'Town Hall' => 24,
	'Residence' => 25, 'Palace' => 26, 'Treasury' => 27, 'Trade Office' => 28,
	'Great Barracks' => 29, 'Great Stable' => 30, 'City Wall' => 31, 'Earth Wall' => 32,
	'Palisade' => 33, 'Stonemason' => 34, 'Brewery' => 35, 'Trapper' => 36,
	'Hero\'s Mansion' => 37, 'Great Warehouse' => 38, 'Great Granary' => 39, 'Wonder of the World' => 40,
);

my %construction_fields = (
	gid => 0,
);

=head1 NAME

Travian::Construction - a package that defines a Travian construction.

=head1 SYNOPSIS

  use Travian::Construction;
  my $construction = Travian::Construction->new(35);
  print $construction->gid();
  print $construction->name();

  print $construction->costs($level)->wood();
  foreach my $cost (@{$construction->costs()})
  {
    print $cost->wood();
  }

=head1 DESCRIPTION

This package is for a single construction in Travian.

=head1 METHODS

=head2 new()

  use Travian::Construction;

  my $construction = Travian::Construction->new($gid);

=cut

sub new
{
	my $class = shift;
	my $self = {
		_permitted => \%construction_fields,
		%construction_fields,
	};

	bless $self, $class;

	if (@_)
	{
		$self->gid(shift);
	}
	
	$self->{'costs'} = [];

	return $self;
}

=head2 gid()

  $construction->gid();

Returns the gid of this construction.

=head2 name()

  $construction->name();

Returns the name of this construction.

=cut

sub name
{
	my $self = shift;

	return &gid2name($self->gid());
}

=head2 costs()

  $construction->costs();
  $construction->costs($level);

Returns the construction costs for the given level.
Return value is of type Travian::Construction::Cost.
If no argument is given returns an array ref for all levels of construction.

=cut

sub costs
{
	my $self = shift;

	if (@_)
	{
		my $level = shift;

		if ($level > 0 && $level <= $self->max_lvl())
		{
			return $self->{'costs'}->[$level - 1];
		}

		return;
	}

	return $self->{'costs'};
}

=head2 max_lvl()

  $construction->max_lvl();

Returns the maximum construction level listed for this construction.

=cut

sub max_lvl
{
	my $self = shift;

	return $#{$self->{'costs'}} + 1;
}

=head2 total_cost()

  $construction->total_cost();
  $construction->total_cost(25);
  $construction->total_cost(1, 25);

Returns the total construction costs for the given construction levels.
The above examples are all interchangeable.

=cut

sub total_cost
{
	my $self = shift;
	my $min_lvl = shift;
	my $max_lvl = shift;

	if ($min_lvl)
	{
		$min_lvl = 1 unless $min_lvl > 0;
		$min_lvl = $self->max_lvl() unless $min_lvl <= $self->max_lvl();

		if ($max_lvl)
		{
			$max_lvl = 1 unless $max_lvl > 0;
			$max_lvl = $self->max_lvl() unless $max_lvl <= $self->max_lvl();

			if ($min_lvl > $max_lvl)
			{
				return $self->total_cost($max_lvl, $min_lvl);
			}

			my $total_cost = Travian::Construction::Cost->new();
			for (my $lvl = $min_lvl; $lvl <= $max_lvl; $lvl++)
			{
				my $cost = $self->costs($lvl);
				$total_cost->wood($total_cost->wood() + $cost->wood());
				$total_cost->clay($total_cost->clay() + $cost->clay());
				$total_cost->iron($total_cost->iron() + $cost->iron());
				$total_cost->wheat($total_cost->wheat() + $cost->wheat());
				$total_cost->wheat_consumption($total_cost->wheat_consumption() + $cost->wheat_consumption());
				$total_cost->culture_points($total_cost->culture_points() + $cost->culture_points());
			}

			return $total_cost;
		}

		return $self->total_cost(1, $min_lvl);
	}

	return $self->total_cost(1, $self->max_lvl());
}

=head2 parse_construction()

  $construction->parse_construction($construction_html);
  
Parses the given construction html and populates this construction.
Returns this construction.

=cut

sub parse_construction
{
	my $self = shift;

	if (@_)
	{
		my $construction_html = shift;
		chomp($construction_html);

		my $construction_tables = [ $construction_html =~ m#<table.*?>(.+?)</table>#mgs ];

		foreach my $construction_table (@{$construction_tables})
		{
			$construction_table =~ s/\s//g;
			$self->{'costs'} = &parse_construction_costs($construction_table) if ($construction_table =~ /CP/);
		}

		return $self;
	}

	return;
}

=head1 PARSE FUNCTIONS

=head2 parse_construction_costs()

  &parse_construction_costs($construction_costs_html);
  
Parses the given construction costs html and returns an array ref of costs.
Used by $construction->parse_construction().

=cut

sub parse_construction_costs
{
	my $costs_table_html = shift;
	my $costs = [];

	my $costs_rows = [ $costs_table_html =~ m#<tr>(.+?)</tr>#mgs ];
	foreach my $costs_row (@{$costs_rows})
	{
		my $cost = [ $costs_row =~ m#<td>(.+?)</td>#mgs ];
		next if (!$cost->[0] || $cost->[0] !~ /^\d+$/o);

		push @{$costs}, Travian::Construction::Cost->new($cost->[1], $cost->[2], $cost->[3], $cost->[4], $cost->[5], $cost->[6]);
	}

	return $costs;
}

sub parse_construction_times
{
}

=head1 FUNCTIONS

=head2 gid2name()

  &gid2name($gid);
  
Returns the construction's name for the given gid.

=cut

sub gid2name
{
	my $gid = shift;

	if ($gid && $gid > 0 && $gid < 41)
	{
		return $GID2NAME[$gid - 1];
	}

	return;
}


=head2 name2gid()

  &name2gid($name);
  
Returns the construction's gid for the given name.

=cut

sub name2gid
{
	my $name = shift;

	if ($name && $NAME2GID{$name})
	{
		return $NAME2GID{$name};
	}

	return;
}

sub AUTOLOAD
{
	my $self = shift;
	my $type = ref($self)
		or croak "$self is not an object";

	my $name = $AUTOLOAD;
	$name =~ s/.*://;   # strip fully-qualified portion

	unless (exists $self->{_permitted}->{$name}) 
	{
		croak "Can't access `$name' field in class $type";
	}

	if (@_)
	{
		return $self->{$name} = shift;
	}
	else
	{
		return $self->{$name};
	}
}

sub DESTROY { }

=head1 AUTHOR

Adrian D. Elgar, E<lt>ade@wasters.comE<gt>
Martin Robertson, E<lt>marley@wasters.comE<gt>

=head1 SEE ALSO

Travian::Construction::Cost

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2007 by Adrian Elgar, Martin Robertson

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut

1;