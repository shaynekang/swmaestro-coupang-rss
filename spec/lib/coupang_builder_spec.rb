require 'spec_helper'
require './lib/coupang_builder'

describe CoupangBuilder do
  it "should builder rss from list of products @Coupang" do
    list = [{
      title: "베니바니 여름샌들 균일 초특가!!",
      price: 5000,
      url: "http://www.coupang.com/np/products/106356896"
    }, {
      title: "여름휴가 물놀이아이템 아쿠아샌들&슬리퍼",
      price: 8900,
      url: "http://www.coupang.com/np/products/106359070"
    }]

    builder = CoupangBuilder.new
    rss = builder.build(list)

    feed = RSS::Parser.parse(rss)

    first_item = feed.items.first
    expect(first_item.title).to eq("베니바니 여름샌들 균일 초특가!! - 5000 원")
    expect(first_item.link).to eq("http://www.coupang.com/np/products/106356896")

    last_item = feed.items.last
    expect(last_item.title).to eq("여름휴가 물놀이아이템 아쿠아샌들&슬리퍼 - 8900 원")
    expect(last_item.link).to eq("http://www.coupang.com/np/products/106359070")
  end
end
