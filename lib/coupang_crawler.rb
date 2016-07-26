require 'nokogiri'
require 'open-uri'


class CoupangCrawler
  def crawl(url)
    doc = Nokogiri::HTML(open(url))

    doc.css(".product-list ul li").map do |li_element|
      title = li_element.at_css("strong.title").text.strip
      price = li_element.at_css("strong.price").text
      url = li_element.at_css("a.detail-link")['href']

      {
        title: title,
        price: clean_price_text(price),
        url: "http://www.coupang.com" + url
      }
    end
  end

  def clean_price_text(price_text)
    price_text.gsub(/[^0-9]+/, '').to_i
  end
end