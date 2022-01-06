#include <iostream>
#include <sstream>
#include <string>
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

void	test_ex02_01(void)
{
	std::cout << "TEST01";
	Fixed const a(2);
	Fixed const b(45);

	bool assert = b > a;
	// bool assert = false;
	
	std::ostringstream stream;
	stream << a;
	std::string str = stream.str();
	str.append(" > ");
	stream << b;
	str.append(stream.str());

	if (assert)
		log_success(str);
	else
		log_failure(str);




}

int		main (void)
{
	test_ex02_01();


	return (0);
}