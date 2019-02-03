require "pokemon_lookup/version"
require 'http'

class Pokemon
  @@terminal_width = 60
  attr_reader :raw_data, :id, :name, :weight, :types, :abilities, :moves, :stats

  def initialize(pokemon_input)
      sanitized_input = pokemon_input.to_s.downcase
      response = HTTP.get("https://pokeapi.co/api/v2/pokemon/#{ sanitized_input }")
      @raw_data = response.parse

      @id = @raw_data["id"]
      @name = @raw_data["name"].capitalize
      @weight = @raw_data["weight"]
      @types = format_types
      @abilities = format_abilities
      @moves = format_moves
      @stats = format_stats

  end

  def self.catch(pokemon_input)
    begin
      new(pokemon_input)
    rescue HTTP::Error
      puts "Unkown Pokemon, try catching a different Pokemon"
      nil
    end
  end

  def print_types
    puts "Types"
    puts "=" * @@terminal_width
    types.each { |type| puts "  • #{ type }" }
  end

  def print_abilities
    puts "Abilities"
    puts "=" * @@terminal_width
    abilities.each { |ability| puts "  • #{ ability }" }
  end

  def print_moves
    column_size = 20

    puts "Moves"
    puts "=" * @@terminal_width

    moves.each_slice(@@terminal_width / column_size ) do |move_slice| 
      puts move_slice.map { |move| "  • #{ move }".ljust(column_size) }.join
    end
  end

  def print_stats
    puts "Stats"
    puts "=" * @@terminal_width
    stats.each do |stat| 
      puts "  • #{ stat[:name] }"
      puts "      - Effort: #{ stat[:effort] }"
      puts "      - Base Stat: #{ stat[:base_stat] }"
    end
  end

  def print_info
    puts
    puts "Name: #{name}"
    puts "Weighs: #{weight}"

    puts 
    print_types

    puts
    print_abilities

    puts 
    print_moves

    puts 
    print_stats

    puts
  end

  def self.terminal_width
    @@terminal_width
  end

  def self.terminal_width=(new_terminal_width)
    @@terminal_width = new_terminal_width
  end

  def self.print_list(page=1, amount=20)
    offset = (page.to_i - 1) * amount.to_i
    response = HTTP.get("https://pokeapi.co/api/v2/pokemon?offset=#{ offset }&limit=#{ amount }")
    pokemon_hashes = response.parse["results"]

    pokemon_hashes.each do |pokemon_hash|
      number = pokemon_hash["url"].split("/")[-1]
      name = pokemon_hash["name"]
      puts "  #{ number.rjust(4) } - #{ name }"
    end
    nil
  end

private

  def format_types
    raw_data["types"].map { |type_hash| type_hash["type"]["name"] }
  end

  def format_abilities
    raw_data["abilities"].map { |ability_hash| ability_hash["ability"]["name"] }
  end

  def format_moves
    raw_data["moves"].map { |move_hash| move_hash["move"]["name"] }.sort
  end

  def format_stats
    raw_data["stats"].map do |stats_hash| 
      {
       name: stats_hash["stat"]["name"],
       effort: stats_hash["effort"],
       base_stat: stats_hash["base_stat"]
      }
    end
  end
end
