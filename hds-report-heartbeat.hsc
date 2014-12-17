=setup

[Configuration]
ListFileExtension = TXT

[Window]
Name = HAS
Head = HAS - Report Heartbeat

[Labels]
OUT         = END  20  2 Report Output

[Fields] 
OUT         = 21  2 INPUT   CHAR       10  0  FALSE   FALSE  0.0 0.0 'S' $OP

[Perl]

=cut


=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

  Report heartbeat for autojob test
 
=cut


use strict;
use warnings;

use FileHandle; 
use DateTime;
use Time::localtime;

#Hydstra libraries
require 'hydlib.pl';


main: {
  my (%ini);
  
  #Gather parameters and config
  IniHash($ARGV[0],\%ini, 0, 0);
  
  my $reportfile    = $ini{perl_parameters}{out};  
  
  my $dt = DateTime->now(time_zone => 'local');
  my $nowdat = $dt->ymd(''); 
  my $nowtim = $dt->hms('');
  $nowtim = substr ($nowtim,0,4); 
 
  open my $io, ">>", $reportfile;
  print $io "$nowdat$nowtim - HEARTBEAT: System ok.\n";
  close ($io);
}

1; # End of importer
