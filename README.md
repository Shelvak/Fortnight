# Fortnight

Scope to difference by first and second half month.

The gem work separing the month of a year in two half, first - 15th and 16th - last day

## Installation

Add the gem to your Gemfile

    gem 'fortnight'

and run:

    $ bundle install/update

Add in the models that we want to use

    include Fortnight

## Usage

It's very simple, the syntax is the next:

Model.in_fortnight(year, month, options)

'options' for now are only :field and :half
:field ALWAYS HAVE TO BE A TIME FIELD
:half is to get the first (by default) or the second (as symbol)

Examples:

Customer.in_fortnight(2012, 04)
We'll get the customers created_at between 2012-04-01 00:00 AND 2012-04-15 23:59:59

Customer.in_fortnight(2012, 04, half: :second)
We'll get the customers created_at between 2012-04-15 23:59:59 AND 2012-04-30 23:59:59

Customer.in_fortnight(2012, 05, half: :second)
We'll get the customers created_at between 2012-05-15 23:59:59 AND 2012-05-31 23:59:59

Customer.in_fortnight(2012, 04, field: 'updated_at')
We'll get the customers updated_at between 2012-04-01 00:00 AND 2012-04-15 23:59

Customer.in_fortnight(2012, 04, half: :second, field: 'updated_at')
We'll get the customers updated_at between 2012-04-15 23:59:59 AND 2012-04-30 23:59:59

