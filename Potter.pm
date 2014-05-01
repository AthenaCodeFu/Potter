package Potter;


sub price {
	my (@basket) = @_;

	return scalar(@basket) * 8;
}



1;
