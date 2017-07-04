use v5.10;
use LucyX::Analysis::Analyzer::Chinese;

use v5.10;
use utf8::all;
my $sentence = "他来到了我家";
say $sentence;
    
use Test::More 0.98;


my $chinese = LucyX::Analysis::Analyzer::Chinese->new();
my $in      = $chinese->transform_text($sentence);
while ( my $x = $in->next ) {
    say $x->get_text;
    say $x->get_start_offset;
    say $x->get_end_offset;
}

done_testing;
