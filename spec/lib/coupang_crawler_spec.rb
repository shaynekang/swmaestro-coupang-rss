require 'spec_helper'
require './lib/coupang_crawler'

describe CoupangCrawler do
  describe "#crawl" do
    # URL = "http://www.coupang.com/np/todayopen?eventCategory=GNB&eventLabel=todayopen"
    URL = "./spec/fixtures/list/2016_07_26.html"

    it "should crawl list of product @Coupang" do
      crawler = CoupangCrawler.new
      list = crawler.crawl(URL)

      first_product = list.first
      expect(first_product[:title]).to eq("베니바니 여름샌들 균일 초특가!!")
      expect(first_product[:price]).to eq(5000)
      expect(first_product[:url]).to eq("http://www.coupang.com/np/products/106356896")

      last_product = list.last
      expect(last_product[:title]).to eq("여름휴가 물놀이아이템 아쿠아샌들&슬리퍼")
      expect(last_product[:price]).to eq(8900)
      expect(last_product[:url]).to eq("http://www.coupang.com/np/products/106359070")
    end
  end

  describe "#clean_price_text" do
    it "should clearn price text" do
      crawler = CoupangCrawler.new

      price = crawler.clean_price_text("5,000원")
      expect(price).to eq(5000)

      price = crawler.clean_price_text("1,999,900원")
      expect(price).to eq(1_999_900)
    end
  end
end