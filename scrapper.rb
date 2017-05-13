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

doi_numbers.each do |doi|

  agent = Mechanize.new
  page = agent.get("http://sci-hub.cc/#{doi.split(' ').last}")
  link = page.search("#save").search('a').attribute('onclick').value.gsub('location.href=\'','')
  link = link.gsub('?download=true\'','')
  agent.pluggable_parser.default = Mechanize::Download
  agent.get(link).save(File.join('./pdfs/', "#{doi}.pdf"))
  puts "#{doi}.pdf saved"
  sleep 600

end