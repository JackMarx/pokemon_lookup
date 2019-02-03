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
- `query_amount` is the number of pokemon on a page and has a default of 20

You can use a string or integer for `page` and `query_amount`.

```ruby
Pokemon.print_list(1, 20)
```

To see an individual Pokemon, you can pass in the id or name of the Pokemon with the code below.

```ruby
print "Type the name or id of the pokemon you want to see: "
pokemon_input = gets.chomp

pokemon = Pokemon.catch(pokemon_input)
pokemon.print_info
```

or 

```ruby
pokemon = Pokemon.catch("Pikachu")
pokemon.print_info
```

or 

```ruby
pokemon = Pokemon.catch(25)
pokemon.print_info
```

#### Methods on a Pokemon

- `raw_data`, returns all data from the PokéAPI request in ruby
- `id`, returns PokéAPI reference id
- `name`, returns name of the pokemon
- `weight`, returns weight of the pokemon
- `types`, returns all types for this pokemon
- `abilities`, returns all abilities for this pokemon
- `moves`, returns all moves for this pokemon
- `stats`, returns all stats for this pokemon, includes the stat's name, effort and base stat
- `print_types`, prints a formatted display of this pokemon's types
- `print_abilities`, prints a formatted display of this pokemon's abilities
- `print_moves`, prints a formatted display of this pokemon's moves
- `print_stats`, prints a formatted display of this pokemon's stats
- `print_info`, prints all formatted information for a pokemon.

The formatted printing methods assume a terminal width of 60 columns, if you want to configure a different terminal width you can use the following code.

```ruby
Pokemon.terminal_width # returns current terminal size configuration
Pokemon.terminal_width = 80 # new terminal size
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
