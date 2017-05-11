require 'mechanize'
require 'date'
require 'json'

agent = Mechanize.new
page = agent.get("http://onlinelibrary.wiley.com/journal/10.1111/(ISSN)1745-6622/issues")
issues_links = page.links_with(css: 'a.issuesInYear')

p issues_links