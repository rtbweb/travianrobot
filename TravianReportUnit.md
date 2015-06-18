
---

# NAME #

Travian::Report::Unit - a package that defines a Travian report's units.



---

# SYNOPSIS #
```
  use Travian::Report::Unit;
  my $unit = Travian::Report::Unit->new('magicrat', 'magicrat Village');
  print $unit->name();
  print $unit->village();

  $unit->troops();
  $unit->casualties();
  $unit->prisoners();
  
  $unit->bounty();
  $unit->resources();

  print $unit->info();
```


---

# DESCRIPTION #

This package is for a single report unit in Travian.



---

# METHODS #


## new() ##
```
  use Travian::Report::Unit;

  my $unit = Travian::Report::Unit->new();
```

## parse\_unit() ##
```
  $unit->parse_unit($unit_html);
```

Parses the given unit html and populates this unit. Returns this unit.


## parse\_unit\_header() ##
```
  $unit->parse_unit_header($unit_header_html);
```

Parses the given unit header html and populates this unit. Returns this unit. Called by $unit->parse\_unit().


## parse\_unit\_resources() ##
```
  $unit->parse_unit_resources($unit_resources_html);
```

Parses the given unit resources html and populates this unit. Returns this unit. Called by $unit->parse\_unit().



---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com> Martin Robertson, <marley@wasters.com>



---

# SEE ALSO #

Travian::Report



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar, Martin Robertson

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.