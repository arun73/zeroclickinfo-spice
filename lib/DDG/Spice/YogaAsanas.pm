package DDG::Spice::YogaAsanas;
# ABSTRACT: Displays yoga asanas and sequences 

use strict;
use DDG::Spice;

spice to => 'http://jason.duckduckgo.com:8000/solr/staging/select?indent=on&version=2.2&defType=edismax&qt=dismax&q=$1 source_match:yoga_postures&fq=&wt=json&start=0&rows=75&json.wrf={{callback}}';
triggers any => qr{
	(?:\w+asanas?\b)|
	(?:\w+sahita\b)|
	(?:\bvinyasa\b)|
	(?:\w+pitham\b)|
	(?:samasthitih?)|
	(?:stplutih??)|
	(?:yoga\s+(?:postures?|poses?)|
	(?:sun\s+salutation)|
	(?:surya\s+namaskara)|
	(?:(?:ashtanga|yoga)\s+(primary|intermediate|advanced)\s+series)|
	(?:yoga[\s-]+ch?ikitsa)|
	(?:(?:standing|finishing)\s+(?:sequence|poses))|
	(?:nadi[\s-]+sh?odhana)|
	(?:sthira[\s-]+bhaga)
}xi;

handle query  => sub { $_ };

1;