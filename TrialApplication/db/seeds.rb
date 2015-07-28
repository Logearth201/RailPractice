table_names = %w(member article)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
    puts "Finish"
  else
    puts "Not Found #{path}"
  end
end