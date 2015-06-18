
---

# NAME #

Travian - a package for the web-based game Travian.



---

# SYNOPSIS #
```
  use Travian;
  my $travian = Travian->new(4, agent => 'Mozilla/5.0');

  if (!$travian->login($user, $pass))
  {
    print $travian->error_msg();
  }
  $travian->logged_in();

  print $travian->server();
  print $travian->base_url();

  my $village = $travian->village($village_id);
  $village = $travian->next_village();
  $village = $travian->village_overview();
  $village = $travian->village_centre();
  $travian->no_of_villages();

  $travian->send_troops($type, $x, $y, Travian::Troops::Gauls->new(10), $scout_type);

  my $woodcutter = $travian->construction(1);

  $travian->logout();
```


---

# DESCRIPTION #

This package defines routines for the web-based game Travian.



---

# CONSTANTS #


## ATTACK\_REINFORCEMENT ##

Constant for send troops. Send reinforcements.


## ATTACK\_NORMAL ##

Constant for send troops. Send a normal attack.


## ATTACK\_RAID ##

Constant for send troops. Send a raid attack.


## SCOUT\_RESOURCES ##

Constant for send troops. Scout for resources and troops.


## SCOUT\_DEFENCES ##

Constant for send troops. Scout for defences and troops.



---

# METHODS #


## new() ##
```
  use Travian;

  my $travian = Travian->new($server_no, $ua_args);
```
Create a new instance of the Travian object. If $server\_no is not given a default of 3 is used. The Travian package is sub-classed from LWP::UserAgent and so optional $ua\_args can be passed as second argument. See LWP::UserAgent for details.


## server() ##
```
  $travian->server();
```
Returns the current Travian server number.


## base\_url() ##
```
  $travian->base_url();
```
Returns the base url of the current Travian server.


## error\_msg() ##
```
  $travian->error_msg();
```
Returns the error message if any.


## login() ##
```
  $travian->login($user, $pass);
```
Log into Travian with given user and pass. Returns 1 on success. Use $travian->error\_msg() to retrieve error message on failure.


## logged\_in() ##
```
  $travian->logged_in();
```
Returns BOOLEAN.


## get\_login\_form() ##
```
  $travian->get_login_form();
```
Retrieves the Travian login form. Used by $travian->login().


## post\_login\_form() ##
```
  $travian->post_login_form($login_args);
```
Posts the Travian login form. Used by $travian->login().


## logout() ##
```
  $travian->logout();
```
Log out of Travian.


## village() ##
```
  $travian->village();
  $travian->village($village_id);
```
Returns the Travian village.


## next\_village() ##
```
  $travian->next_village();
```

Returns the next Travian village.


## no\_of\_villages() ##
```
  $travian->no_of_villages();
```
Returns the number of villages.


## village\_id2index() ##
```
  $travian->village_id2index($village_id);
```
Given a village id returns the index in the village array. Used by $travian->village().


## parse\_villages() ##
```
  $travian->parse_villages($village_overview_html);
```
Parses the villages from the given village overview html and returns the current village. Used by $travian->login().


## village\_overview() ##
```
  $travian->village_overview();
```
Retrieve the village overview and return the current village.

## village\_centre() ##
```
  $travian->village_centre();
```
Retrieve the village centre and return the current village.

## send\_troops() ##
```
  $travian->send_troops($attack_type, $x, $y, $troops, $scout_type);
```
Send the given troops on an attack of type $attack\_type to coordinates $x, $y. The attack type is 2 for reinforcements, 3 for normal and 4 for raid. The troops are of type Travian::Troops. The scout type is 1 for resources and 2 for defences. Only used when a spy type troop is sent. Defaults to resources.


## post\_send\_troops\_form() ##
```
  $travian->post_send_troops_form($type, $x, $y, $troops);
```
Posts the Travian send troops form. Used by $travian->send\_troops().


## construction() ##
```
  $travian->construction($gid);
```
Return the construction costs and times for the given gid. Returns a Travian::Construction object.



---

# PARSE FUNCTIONS #


## parse\_login\_form() ##
```
  &parse_login_form($login_form, $user, $pass);
```
Parse the login form html and return an array ref of the form input values.


## parse\_login\_error\_msg() ##
```
  &parse_login_error_msg($login_html);
```
Parse and return the error message in the login html page.


## parse\_send\_troops\_confirm\_form() ##
```
  &parse_send_troops_confirm_form($send_troops_confirm_form, $scout_type);
```
Parse the send troops confirm form html and return an array ref of the form input values.


## parse\_send\_troops\_error\_msg() ##
```
  &parse_send_troops_error_msg($send_troops_html);
```
Parse and return the error message in the send troops html page.



---

# FUNCTIONS #

## calc\_traveltime() ##
```
  &calc_traveltime($attacker_x, $attacker_y, $defender_x, $defender_y, $velocity);
```
Returns the travel time in seconds to go from coords $attacker\_x, $attacker\_y to coords $defender\_x, $defender\_y at given velocity.



---

# AUTHOR #

Adrian D. Elgar, <ade@wasters.com> Martin Robertson, <marley@wasters.com>



---

# SEE ALSO #

LWP::UserAgent, Travian::Village, Travian::Resources, Travian::Construction



---

# COPYRIGHT AND LICENSE #

Copyright (C) 2007 by Adrian Elgar, Martin Robertson

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.