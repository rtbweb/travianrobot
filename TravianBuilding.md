
---

# NAME #

Travian::Building - a package that defines a Travian building.



---

# SYNOPSIS #
```
  use Travian::Building;
  my $building = Travian::Building->new(35);
  print $building->gid();
  print $building->name();
  print $building->level();

  print $building->costs($level)->wood();
  foreach my $cost (@{$building->costs()})
  {
    print $cost->wood();
  }

  print $building->times($level, $mb_level);
```


---

# DESCRIPTION #

This package is for a single building in Travian.



---

# METHODS #


## new() ##
```
  use Travian::Building;

  my $building = Travian::Building->new($gid);
```

## gid() ##
```
  $building->gid();
```
Returns the gid of this building.


## name() ##
```
  $building->name();
```
Returns the name of this building.


## costs() ##
```
  $building->costs();
  $building->costs($level);
```
Returns the building costs for the given level. Return value is of type Travian::Building::Cost. If no argument is given returns an array ref for all levels of build.


## times() ##
```
  $building->times();
  $building->times($level);
  $building->times($level, $mb_level);
```
Returns the build time for the given level and main building level. If no main building level is given returns an array ref of build times for $level. If no argument is given returns an array ref for all levels of build.


## max\_lvl() ##
```
  $building->max_lvl();
```
Returns the maximum build level listed for this building.


## total\_cost() ##
```
  $building->total_cost();
  $building->total_cost(25);
  $building->total_cost(1, 25);
```
Returns the total build costs for the given build levels. The above examples are all interchangeable.


## parse\_construction() ##
```
  $building->parse_construction($construction_html);
```

Parses the given construction html and populates this building with costs and times. Returns this building.



---

# PARSE FUNCTIONS #


## parse\_construction\_costs() ##
```
  &parse_construction_costs($construction_costs_html);
```

Parses the given construction costs html and returns an array ref of costs. Used by $building->parse\_construction().


## parse\_construction\_times() ##
```
  &parse_construction_times($construction_times_html);
```

Parses the given construction times html and returns an array ref of times. Used by $building->parse\_construction().



---

# FUNCTIONS #


## gid2name() ##
```
  &gid2name($gid);
```

Returns the building's name for the given gid.


## name2gid() ##
```
  &name2gid($name);
```

Returns the building's gid for the given name.


## time2secs() ##
```
  &time2secs($time);
```

Given a time in format h:m:s returns number of seconds.



---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com> Martin Robertson, <marley@wasters.com>



---

# SEE ALSO #

Travian::Building::Cost



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar, Martin Robertson

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.