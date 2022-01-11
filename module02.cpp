#include <iostream>
#include <sstream>
#include <string>
#include <cstdlib>
#include <iomanip>
#include "Fixed.hpp"

#define RED "\e[31m"
#define GREEN "\e[32m"
#define NORMAL "\e[00m"

void	log_success (std::string msg)
{
	std::cout << GREEN << "✔ " << msg << NORMAL << std::endl;
}

void	log_failure (std::string msg)
{
	std::cout << RED << "✖ " << msg << NORMAL << std::endl;
}

void	test_major(int nbr, int anbr, int bnbr)
{
	std::cout << "TEST";
	std::cout << std::setw(2) << std::setfill('0') << nbr << " ";
	Fixed const a(anbr);
	Fixed const b(bnbr);

	bool assert = a > b;
	bool expected = anbr > bnbr;

	std::ostringstream stream;
	stream << a;
	std::string str = stream.str();
	str.append(" > ");
	stream.str("");
	stream << b;
	str.append(stream.str());

	if (assert == expected)
		log_success(str);
	else
		log_failure(str);
}

int		main (void)
{
	test_major(1, 45, 2);
	test_major(2, -45, 2);

	return (0);
}