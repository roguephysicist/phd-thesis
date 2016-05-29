#!/opt/local/bin/perl -w
# run: traduce.pl in.file > out.file
use strict;
my $deffile='../../base/bms.tex';
open DEFS, "< $deffile" or die "no pude abrir $deffile";
my %defs;
while(<DEFS>){
    my ($nom, $def);
    ($nom,$def)=($1,$2) if /\\def\s*(\\[a-zA-Z0-9]+)\s*\{(.*)\}/;
    ($nom,$def)=($1,$2) if /\\newcommand\s*\{(\\[a-zA-Z0-9]+)\s*\}\s*\{(.*)\}/;
    if(defined $nom and defined $def){
    $nom=~s/\\/\\\\/g;
    $def=~s/\\/\\/g;
    $defs{$nom}=$def;
    }
}
#foreach(keys %defs){
#    print "$_ => $defs{$_}\n";
#}

while(<>){
    foreach my $sub(keys %defs){
    while(s/$sub([^a-zA-Z0-9])/$defs{$sub}$1/){};
    }
    print;
}
