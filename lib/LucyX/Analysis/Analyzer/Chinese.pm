package LucyX::Analysis::Analyzer::Chinese;

our $VERSION = "0.01";

use v5.10;
use Encode qw(decode_utf8);
use Lingua::ZH::Jieba;

use base qw( Lucy::Analysis::Analyzer );

my $jieba = Lingua::ZH::Jieba->new;

sub new {
    my $self = shift->SUPER::new;
    return $self;
}

sub equals {
    my ( $self, $other ) = @_;
    return $other->isa(__PACKAGE__);
}

sub transform {
    my ($self, $inversion)= @_;
    return $inversion;
}

sub transform_text {
    my ($self, $text) = @_;
    my $inversion = Lucy::Analysis::Inversion->new;
    my $tokens = $jieba->cut_for_search_ex(($text));
    $inversion->append(
       Lucy::Analysis::Token->new(text =>$_->[0],
                                  start_offset=> $_->[1] ,
                                  # end_offset + start_offset + size
                                  end_offset=> $_->[1] + $_->[2] 
        )
        
    ) for @$tokens;
    return $inversion;
}

1;
__END__

=encoding utf-8

=head1 NAME

LucyX::Analysis::Analyzer::Chinese - It's new $module

=head1 SYNOPSIS

    use LucyX::Analysis::Analyzer::Chinese;

=head1 DESCRIPTION

LucyX::Analysis::Analyzer::Chinese is ...

=head1 LICENSE

Copyright (C) Hao Wu.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Hao Wu E<lt>echowuhao@gmail.comE<gt>

=cut

