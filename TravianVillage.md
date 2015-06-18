
---

# NAME #

Travian::Village - a package that defines a Travian village.



---

# SYNOPSIS #

```
  use Travian::Village;
  my $village = Travian::Village->new('My Village');
  $village->village_name();
  $village->village_id();
  $village->x();
  $village->y();

  $village->current_resources();
  $village->max_resources();
  $village->production_resources();

  foreach my $building (@{$village->buildings()})
  {
    print $building->name();
  }
  $village->buildings($building_id);
```


---

# DESCRIPTION #

This package is for a single village in Travian.



---

# METHODS #


## new() ##

```
  use Travian::Village;

  my $village = Travian::Village->new('My Village');
```

## current\_resources() ##

```
  $village->current_resources();
  $village->current_wood();
  $village->current_clay();
  $village->current_iron();
  $village->current_wheat();
  $village->current_wheat_consumption();
```

Returns the current resources.


## max\_resources() ##

```
  $village->max_resources();
  $village->max_wood();
  $village->max_clay();
  $village->max_iron();
  $village->max_wheat();
  $village->max_wheat_consumption();
```

Returns the maximum values of resources.


## production\_resources() ##

```
  $village->production_resources();
  $village->production_wood();
  $village->production_clay();
  $village->production_iron();
  $village->production_wheat();
```

Returns the production rate of resources.

## buildings() ##
```
  $village->buildings();
  $village->buildings($building_id);
```
Returns the building for the given id.
Return value is of type Travian::Building.
If no argument is given returns an array ref of all buildings.

## parse\_village\_overview() ##

```
  $village->parse_village_overview($village_overview_html);
```

Parse the village overview html and populate this village.

## parse\_village\_centre() ##
```
  $village->parse_village_centre($village_centre_html);
```
Parse the village centre html and populate this village.


---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com> Martin Robertson, <marley@wasters.com>



---

# SEE ALSO #

Travian::Resources



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar, Martin Robertson

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.