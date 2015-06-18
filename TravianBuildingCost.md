
---

# NAME #

Travian::Building::Cost - a package that defines Travian building costs.



---

# SYNOPSIS #
```
  use Travian::Building::Cost;
  my $cost = Travian::Building::Cost->new();
  $cost->wood(100);
  $cost->clay(200);
  $cost->iron(300);
  $cost->wheat(400);
  $cost->wheat_consumption(50);
  $cost->culture_points(6);

  print $cost->resources()->wood();
```


---

# DESCRIPTION #

This package is for a single level of build costs in Travian.



---

# METHODS #


## new() ##
```
  use Travian::Building::Cost;

  my $cost = Travian::Building::Cost->new(100, 200, 300, 400, 50, 6);
```


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