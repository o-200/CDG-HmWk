pokebase = [{ name: 'pikachu', colour: 'yellow' }]

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

loop do
  puts 'how many pokemons do you want to add?'
  count = gets.chomp.to_i

  count.times do
    puts 'Set a name of poke'
    pokemon = gets.chomp

    puts 'Set a colour of poke ✨'
    colour = gets.chomp

    pokebase.push({ name: pokemon, colour: colour })
    puts "Your pokemon #{pokemon.upcase.green} with colour #{colour.upcase.blue} was added to database <3"
  end

  puts 'Total result:'.reverse_colour
  puts pokebase

  puts 'Do you want add new pokemons? Yes or No'
  gets.chomp.downcase == "yes" ? "okay!" : break
end
