
---

# NAME #

Travian::Report::Header - a package that defines a Travian report header.



---

# SYNOPSIS #
```
  use Travian::Report::Header;
  my $header = Travian::Report::Header->new('A attacks B', '28/12/07 04:42 pm');
  print $header->subject();
  print $header->sent();
```


---

# DESCRIPTION #

This package is for a single report header in Travian.



---

# METHODS #


## new() ##
```
  use Travian::Report::Header;

  my $header = Travian::Report::Header->new($subject, $sent);
```


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