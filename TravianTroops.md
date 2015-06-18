
---

# NAME #

Travian::Troops - a package that defines Travian troops.



---

# SYNOPSIS #

```
  use Travian::Troops;
  my $troops = Travian::Troops->new(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 1);
  
  $troops->as_arrayref();
  $troops->send_troops_args();
```


---

# DESCRIPTION #

This package is for the troops in Travian.



---

# METHODS #


## new() ##

```
  use Travian::Troops;

  my $troops = Travian::Troops->new(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 1);
```

## as\_arrayref() ##

```
  $troops->as_arrayref();
```

Returns an array ref of the troops.

## send\_troops\_args() ##

```
  $troops->send_troops_args();
```

Returns an array ref of the troops for passing to send troops forms.



---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com> Martin Robertson, <marley@wasters.com>



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar, Martin Robertson

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.