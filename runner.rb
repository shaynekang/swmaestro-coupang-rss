require 'sinatra'
require './lib/coupang_crawler'
require './lib/coupang_builder'

URL = "http://www.coupang.com/np/todayopen?eventCategory=GNB&eventLabel=todayopen"

get '/' do
  crawler = CoupangCrawler.new
  builder = CoupangBuilder.new

  list = crawler.crawl(URL)

  builder.build(list)
  # "Hello World!"
end