require 'net/http'

users_file = "users.txt"
usernames = []

File.open(users_file).each_line do |line|
	usernames << line.strip
end


usernames.each do |username|
	puts username

	command = "wget --output-document games/#{username} http://www.boardgamegeek.com/xmlapi/collection/#{username}?own=1"
	#puts command
	`#{command}`
end