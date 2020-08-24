#!/usr/bin/perl -w

# Модуль для хранения констант

use strict;
use warnings;

package constants;

$INC{'constants.pm'}++;
use base 'Exporter';
our @EXPORT_OK = qw( DRIVER_NAME DB_NAME USERNAME PASSWORD HOST );

use constant
{
  DRIVER_NAME => 'mysql',
  DB_NAME     => 'webprog1x4_tgbot',
  USERNAME    => 'webprog1x4_tgbot',
  PASSWORD    => 'JX1PMDTiitLefv7W',
  HOST        => 'localhost'
};

1;
