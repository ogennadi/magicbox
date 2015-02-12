This program takes a list of boardgamegeek.com usernames and creates a CSV showing which users own which games. It uses the BGG version 1 API (http://boardgamegeek.com/wiki/page/BGG_XML_API).


Requirements
============
- Linux or OSX
- Curl
- Ruby 1.9


Usage
=====
- Clone this reposiotry
- cd into the directory
- Create a file called "users.txt" with one username per line
- Run this command

ruby analysis.rb users.txt

- After a few minutes, you'll be notified that the output CSV has been created in the results directory
