package Potter;


sub price {
	my (@basket) = @_;

	my $price = scalar(@basket) * 8;

	my @unique_elements = keys {
		map { $_ => 1 } @basket
	};

	my $discount = {
		1 => 0.00,
		2 => 0.05,
		3 => 0.10,
		4 => 0.20,
		5 => 0.25,
	}->{scalar @unique_elements};

	$price *= (1.0 - $discount);

	return $price;
}



1;
