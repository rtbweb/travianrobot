
---

# NAME #

Travian::Troops::Gauls - a package that defines Travian Gallic troops.



---

# SYNOPSIS #

```
  use Travian::Troops::Gauls;
  my $gauls = Travian::Troops::Gauls->new();
  $gauls->phalanx(10);
  $gauls->swordsman(20);
  $gauls->pathfinder(30);
  $gauls->theutates_thunder(40);
  $gauls->druidrider(50);
  $gauls->haeduan(60);
  $gauls->battering_ram(70);
  $gauls->trebuchet(80);
  $gauls->chieftian(90);
  $gauls->settler(100);
  $gauls->hero(1);
```


---

# DESCRIPTION #

This package is for the Gallic troops in Travian.



---

# METHODS #


## new() ##

```
  use Travian::Troops::Gauls;

  my $gauls = Travian::Troops::Gauls->new(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 1);
```


---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com>



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.