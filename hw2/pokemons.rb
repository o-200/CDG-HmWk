class Pokemonchiki
  def initialize
    @pokebase = [{ name: 'pikachu', colour: 'yellow' }]
  end

  # colorising text in total result!
  def green
    "\e[32m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def reverse_colour
    "\e[7m#{self}\e[27m"
  end

  def create
    puts 'how many pokemons do you want to add?'
    count = gets.chomp.to_i

    count.times do
      puts 'Set a name of poke'
      pokemon = gets.chomp

      puts 'Set a colour of poke ✨'
      colour = gets.chomp

      @pokebase.push({ name: pokemon, colour: colour })
      puts "Your pokemon #{pokemon.upcase.green} with colour #{colour.upcase.blue} was added to database <3"
    end

    show_all
  end

  def show_all
    puts 'Total result:'.reverse_colour
    puts @pokebase
  end
end
