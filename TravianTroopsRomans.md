
---

# NAME #

Travian::Troops::Romans - a package that defines Travian Roman troops.



---

# SYNOPSIS #

```
  use Travian::Troops::Romans;
  my $romans = Travian::Troops::Romans->new();
  $romans->legionnaire(10);
  $romans->praetorian(20);
  $romans->imperian(30);
  $romans->equites_legati(40);
  $romans->equites_imperatoris(50);
  $romans->equites_caesaris(60);
  $romans->battering_ram(70);
  $romans->fire_catapult(80);
  $romans->senator(90);
  $romans->settler(100);
  $romans->hero(1);
```


---

# DESCRIPTION #

This package is for the Roman troops in Travian.



---

# METHODS #


## new() ##

```
  use Travian::Troops::Romans;

  my $romans = Travian::Troops::Romans->new(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 1);
```


---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com>



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.