use Test::More;
use Probe::Perl;
plan skip_all => "Skipping author tests" if not $ENV{AUTHOR_TESTING};

my $p = Probe::Perl->new;

$ENV{PATH} = join( $p->config('path_sep'), 'scripts', 
                   split( $p->config('path_sep'), $ENV{PATH} ) );

my $min_tpc = 1.08;
eval "use Test::Pod::Coverage $min_tpc";
plan skip_all => "Test::Pod::Coverage $min_tpc required for testing POD coverage"
    if $@;

my $min_pc = 0.17;
eval "use Pod::Coverage $min_pc";
plan skip_all => "Pod::Coverage $min_pc required for testing POD coverage"
    if $@;

all_pod_coverage_ok();
__END__
use Test::Pod::Coverage; # Fake CPANTS
