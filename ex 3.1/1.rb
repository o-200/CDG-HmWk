LOREMIPSUM = 'lorem.txt'
BUFFER = 'buffer.txt'

def index
  File.foreach(LOREMIPSUM) { |n| puts n }
end

def find(id)
  content = File.open(LOREMIPSUM).read
  file_array = content.split("\n")
  File.close(LOREMIPSUM)

  file_array[id]
end

def where(pattern)
  File.foreach(LOREMIPSUM) do |n|
    if n.include?(pattern)
      puts n
    end
  end
end

def update(id, text)
  buffer = File.open(BUFFER, 'w')
  File.foreach(LOREMIPSUM).with_index do |value, index|
    buffer.puts(id == index ? text : value)
  end

  File.write(LOREMIPSUM, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  buffer = File.open(BUFFER, 'w')
  File.foreach(LOREMIPSUM).with_index do |value, index|
    buffer.puts(value) if id != index
  end

  buffer.close

  File.write(LOREMIPSUM, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def create(value)
  File.open(LOREMIPSUM, 'a') { |f| f.write value }
end

# index
# find(1)
# where("Lorem")
# update(0, "shsha")
# delete(0)
# create("TESTTEXT")
