package Sort::Sub::filevercmp;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub gen_sorter {
    require Sort::filevercmp;
    my ($is_reverse, $is_ci) = @_;

    sub {
        no strict 'refs';

        my $caller = caller();
        my $a = @_ ? $_[0] : ${"$caller\::a"};
        my $b = @_ ? $_[1] : ${"$caller\::b"};

        my $cmp;

        if ($is_ci) {
            $cmp = Sort::filevercmp::filevercmp(lc $a, lc $b);
        } else {
            $cmp = Sort::filevercmp::filevercmp($a, $b);
        }
        $is_reverse ? -1*$cmp : $cmp;
    };
}

1;
# ABSTRACT: Sort using filevercmp

=for Pod::Coverage ^(gen_sorter)$

=head1 DESCRIPTION


=head1 ENVIRONMENT


=head1 SEE ALSO

L<Sort::Sub>

L<Sort::filevercmp>
