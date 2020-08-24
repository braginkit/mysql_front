#!/usr/bin/perl -w

# Модуль для соединения с базой данных

use DBI;
use strict;
use lib '.';
use warnings;
use io_cgi;

package db_connect;
use constants qw( DRIVER_NAME DB_NAME USERNAME PASSWORD HOST );
use autouse 'Data::Dumper' => qw(Dumper);
my $login = undef;
my $dbh = undef;

sub new
{
  my $class = shift;
  $login  = {};
  bless $login, $class;

  $login->{driver_name} = DRIVER_NAME;
  $login->{db_name}     = DB_NAME;
  $login->{username}    = USERNAME;
  $login->{password}    = PASSWORD;
  $login->{host}        = HOST;
}

sub connection
{
  my $self = shift;
  my $attr = {PrintError => 0, RaiseError => 0};
  my $data_source = "DBI:$login->{driver_name}:$login->{db_name}:$login->{host}";
  $dbh = DBI->connect($data_source, $login->{username}, $login->{password}, $attr);
  if (!$dbh) { die $DBI::arrstr; }
  $dbh->do('SET NAMES cp1251');
  return $dbh;
}

sub lazy_connection
{
  my $self = shift;
  if (!$dbh)
  {
      $dbh = connection;
  }
  return $dbh;
}

sub disconnect
{
  $dbh->disconnect;
  $dbh = undef;
  $login = undef;
}

1;
