/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Fixed.cpp                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aalcara- <aalcara-@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/15 10:32:45 by aalcara-          #+#    #+#             */
/*   Updated: 2021/12/31 15:54:53 by aalcara-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


#include "Fixed.hpp"
#include <cmath>

const int Fixed::_frac_bits = 8;

Fixed::Fixed(void)
{
	std::cout << "Default Constructor Called" << std::endl;
	this->setRawBits(0);
	return ;
}

Fixed::Fixed(const Fixed &MyObject)
{
	std::cout << "Copy constructor called" << std::endl;
	Fixed::operator=(MyObject);
	return ;
}

Fixed::Fixed(const int nbr)
{
	std::cout << "Int Constructor Called" << std::endl;
	this->_raw_bits = nbr << Fixed::_frac_bits;
	return ;
}

Fixed::Fixed(const float nbr)
{
	std::cout << "Float Constructor Called" << std::endl;
	this->_raw_bits = roundf(nbr * (1 << Fixed::_frac_bits));
	return ;
}

Fixed::~Fixed(void)
{
	std::cout << "Destructor called" << std::endl;
}

Fixed &Fixed::operator= (Fixed const &MyObject)
{
	std::cout << "Assignation operator called" << std::endl;
	this->_raw_bits = MyObject._raw_bits;
	return (*this);
}

int Fixed::getRawBits(void)const
{
	std::cout << "getRawBits member function called" << std::endl;
	return (this->_raw_bits);
}

void Fixed::setRawBits(int const raw)
{
	this->_raw_bits = raw;
	return ;
}

float Fixed::toFloat( void ) const
{
	float	value;

	value = (float)((float)this->_raw_bits / (float)(1 << Fixed::_frac_bits));
	return (value);
}

 int Fixed::toInt( void ) const
 {
	 int	value;

	value = (int)((float)this->_raw_bits / (float)(1 << Fixed::_frac_bits));
	return (value);
 }

 bool Fixed::operator> (Fixed const &MyObject)
{
	std::cout << "> operator called" << std::endl;
	if (this->_raw_bits > MyObject._raw_bits)
		return (true);
	return (false);
}

std::ostream &operator<< (std::ostream &os, const Fixed &f)
{
	os << f.toFloat();
	return (os);
}