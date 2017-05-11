require 'mechanize'

doi_numbers = []
repeat = true
agent = Mechanize.new
page = agent.get("http://onlinelibrary.wiley.com/doi/10.1111/jacf.1988.1.issue-1/issuetoc")
while repeat == true
   page.search(".citation").search("p").each do |p|
      if p.text.include? "DOI:"
        arr = p.text.split('|')
        doi_numbers << arr.last
      end
    end
    if next_link = page.link_with(css: 'a.next')
    page = next_link.click
else
    repeat = false
    end
end
puts doi_numbers