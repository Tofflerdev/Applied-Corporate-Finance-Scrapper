require 'mechanize'
require 'date'
require 'json'
require 'watir'
x = 1
agent = Mechanize.new
page = agent.get("http://onlinelibrary.wiley.com/doi/10.1111/jacf.1988.1.issue-1/issuetoc")
#while next_link = page.link_with(css: 'a.next') do
   p page.search(".citation")#.at("p:contains('DOI:')").text
    #page = next_link.click
#end

#issues_links.each do |l|
 #   l.click
#end

#volume_links = page.links_with(css: 'div.issue')

#puts volume_links.inspect