#!/usr/bin/perl -w

# Диспетчер

use strict;
use lib '.';
use warnings;
use io_cgi;
use constants;

eval
{
  my $io_cgi = io_cgi->new;
  $io_cgi->get_params;

  my $class = $io_cgi->param('class');
  my $event = $io_cgi->param('event');
  require $class.'.pm';
  my $obj = $class->new;
  $obj->$event();
};
if ($@)
{
  print "Content-Type: text/html\n";
  print "Charset: windows-1251\n\n";
  print 'OK';
  print '<br>';
  print $@;
};

1;
