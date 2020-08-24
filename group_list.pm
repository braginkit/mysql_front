#!/usr/bin/perl -w

use strict;
use lib '.';
use warnings;
use HTML::Template;
use db_connect;

package group_list;

my $db = undef;

sub new
{
  my $self = shift;
  db_connect->new;
  $db = db_connect->lazy_connection;

  return $self;
}

sub show_all
{
  my $self = shift;

  my $all = $db->prepare("SELECT * FROM tgbot_admin_id");
  my $all_list = $all->execute;

  my $template = HTML::Template->new(filename => 'group_list.html');
  $template->param(HOME => $all_list);

  # печатаем страницу результатов
  print "Content-Type: text/html\n";
  print "Charset: windows-1251\n\n";
  print 'OK';
  print '<br>';
  print $template->output;

  $db->disconnect;
}

1;
