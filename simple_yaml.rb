require 'yaml'

def journal_entries
  [{id: 1,
    title: 'A Look Back: Huge Waves!',
    content: <<-CONTENT
    Today's waves are record setting! 10 foot waves coming from the south and heading to the north. Hide your kids, hide your wife. Don't come out without your board! It's a record setting day of surfing that went down in the history books. Don't miss this recount of the biggest surfing day in Carmel, CA.
    CONTENT
  },{id: 2,
      title: 'Feature Article: Johnny Smith',
      content: <<-CONTENT
      Listen to local professional surfer, Johnny Smith, talk about the ups and downs of having a career in professional surfing. Johnny shares insight into his surfing philosophy, how he ended up where he is, and where he's planning on going.
      CONTENT
  },{id: 3,
      title: 'Tips: How to Catch the Waves You Want',
      content: <<-CONTENT
      Local surfing instructor shares his secrets to watching the ocean and catching the waves that are worth your effort. Being choosy is an advantage with this strategy and will ensure a fun and fulfilling day of surfing.
      CONTENT
  },{id: 4,
      title: 'Feature Article: Attacked by a Shark and Still Surfing',
      content: <<-CONTENT
      Our own hometown hero shares the terrifying story about a nearly fatal shark attack that took an arm but only fanned the fire of passion for a surfer's craft. This article shows us that even in the face of adversity, there is much to live for and much to achieve.
      CONTENT
  }]
end

# Check if data directory exists. If it doesn't then create it
Dir.exist?('data') || Dir.mkdir('data')

# Serialize data into YAML format
yaml_data = YAML.dump(journal_entries)

# Store the serialized data in a file
File.open('data/journal_entries.yaml', 'w') do |file|
  file.write(yaml_data)
end

# Retrieve the yaml serialized data from the file
persisted_data = File.open('data/journal_entries.yaml', 'r') do |file|
  file.read
end

# Check if the peristed data is equal to the original object
if YAML.load(persisted_data) == journal_entries
  puts 'success!'
end

