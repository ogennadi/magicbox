require 'csv'
require 'rexml/document'

usernames = Dir.entries('games') - ['.', '..']
#usernames = ["Nafmi", "matt_k", "zefquaavius"]
user_collections = {} # key: username, value: titles hash
all_titles = {}

usernames.each do |username|
	doc_name = "games/#{username}"
	xml_data = File.open(doc_name, 'rb').read
	doc = REXML::Document.new(xml_data)

	titles = {}  # key: game id, value: game name

	doc.elements.each('items/item') do |element|
		titles[element.attributes["objectid"]] = element.elements['name'].text
	end

	user_collections[username] = titles
	all_titles = all_titles.merge(titles)
	puts titles.length
end

CSV.open('results.csv', 'wb') do |csv|
	csv << [""] + all_titles.values

	usernames.each do |username|
		row = [username]
		all_titles.each do |id, name|
			if user_collections[username][id]
				row << 'X'
			else
				row << ''
			end
		end

		csv << row
	end
end

puts all_titles