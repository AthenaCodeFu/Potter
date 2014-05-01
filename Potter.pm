package Potter;

use Athena::Lib;

use List::AllUtils qw(
	any
	sum
);

my $discount_map = {
	1 => 0.00,
	2 => 0.05,
	3 => 0.10,
	4 => 0.20,
	5 => 0.25,
};

sub price {
	my (@basket) = @_;

	my $price = scalar(@basket) * 8;

	my @sets_of_unique_books;

	# book type : first index
	# book itself: second index
	my @grouped_books;
	foreach my $book (@basket) {
		push @{ $grouped_books[$book] }, $book;
	}

	# go through lists of books
	# and pull off each index
	my @all_discount_groups;
	while (any { @$_ } @grouped_books) {
		my @group_of_unique_books;
		foreach my $book_type (keys $discount_map) {
			my $next_book = shift @{ $grouped_books[$book_type] };
			push @group_of_unique_books, $next_book if $next_book;
		}
		push @all_discount_groups, \@group_of_unique_books
			if @group_of_unique_books;
	}

	my @group_costs;
	foreach my $group (@all_discount_groups) {
		my $discount = $discount_map->{scalar @$group};
		my $group_cost = 8 * scalar @$group * (1 - $discount);
		push @group_costs, $group_cost;
	}

	return sum @group_costs;
}



1;
