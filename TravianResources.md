
---

# NAME #

Travian::Resources - a package that defines Travian resources.



---

# SYNOPSIS #

```
  use Travian::Resources;
  my $resources = Travian::Resources->new();
  $resources->wood(100);
  $resources->clay(200);
  $resources->iron(300);
  $resources->wheat(400);
  $resources->wheat_consumption(50);
```


---

# DESCRIPTION #

This package is for the resources in Travian.



---

# METHODS #


## new() ##

```
  use Travian::Resources;

  my $resources = Travian::Resources->new(100, 200, 300, 400, 50);
```


---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com> Martin Robertson, <marley@wasters.com>



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar, Martin Robertson

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.