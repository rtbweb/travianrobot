
---

# NAME #

Travian::Report - a package that defines a Travian report.



---

# SYNOPSIS #
```
  use Travian::Report;
  my $report = Travian::Report->new('A attacks B', '28/12/07 04:42 pm');
  print $report->header()->subject();
  print $report->header()->sent();

  $report->attacker();
  $report->defender();
```


---

# DESCRIPTION #

This package is for a single report in Travian.



---

# METHODS #


## new() ##
```
  use Travian::Report;

  my $report = Travian::Report->new($subject, $sent);
```

## parse\_report() ##
```
  $report->parse_report($report_html);
```

Parses the given report html and populates this report. Returns this report.



---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com> Martin Robertson, <marley@wasters.com>



---

# SEE ALSO #

Travian::Report::Header, Travian::Report::Unit



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar, Martin Robertson

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.