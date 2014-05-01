package Potter;


sub price {
	my (@basket) = @_;

	my $base_price = scalar(@basket) * 8;
	my $real_price = $base_price;

	my @unique_elements = keys {
		map { $_ => 1 } @basket
	};
	if (@unique_elements == 2) {
		$real_price = $real_price * 0.95;
	}

	return $real_price;
}



1;
