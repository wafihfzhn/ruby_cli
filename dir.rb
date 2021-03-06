puts 'Please enter your directory ?'
dir = gets.strip

if Dir.exist?(dir)
  files = Dir.glob(File.join(dir, '**', '*')).select { |file| File.file?(file) }
  files_contents = [] 

  files.each do |file|
    File.foreach(file) do |content|
      files_contents << content
    end
  end

  files_contents.tally.each do |key, value|
    puts "#{key} #{value}"
  end
else
  puts 'Your directory not found'
end