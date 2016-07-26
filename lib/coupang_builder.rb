require 'rss'

class CoupangBuilder
  def build(product_list)
    RSS::Maker.make("2.0") do |maker|
      maker.channel.title = "쿠팡 RSS 리더"
      maker.channel.link = "http://www.coupang.com/np/todayopen?eventCategory=GNB&eventLabel=todayopen"
      maker.channel.description = "소프트웨어 마에스트로에서 쿠팡 RSS 리더를 만들었음"

      product_list.each do |product|
        maker.items.new_item do |item|
          item.title = "#{product[:title]} - #{product[:price]} 원"
          item.link = product[:url]
        end
      end
    end.to_s
  end
end