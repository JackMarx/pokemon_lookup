# PokemonLookup

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/pokemon_lookup`. To experiment with that code, run `bin/console` for an interactive prompt.

Classroom example of a wrapper gem. Using OOP to wrap the PokéAPI at https://pokeapi.co/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pokemon_lookup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pokemon_lookup

## Usage

To see a list of Pokemon by id, try this code.

```ruby
print "How many Pokemon would you like to see?: "
query_amount = gets.chomp

print "Which page would you like to see?: "
page = gets.chomp

Pokemon.print_list(page, query_amount)
```
- `page` is for pagination and has a default of 1
- `query_amount` is the number of pokenmon on a page and has a default of 20

To see an individual Pokemon, you can pass in the id or name of the Pokemon with the code below.

```ruby
print "Type the name or id of the pokemon you want to see: "
pokemon_input = gets.chomp

pokemon = Pokemon.new(pokemon_input)
pokemon.print_info
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
