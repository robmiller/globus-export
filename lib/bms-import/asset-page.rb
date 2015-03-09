class AssetPage
  def initialize(url, agent)
    @url = url
    @agent = agent
    fetch
  end

  def fetched?
    !!@page
  end

  def fetch
    return if fetched?
    @page = agent.get(url)
  end

  def category
    menu_item.at_css("a")["href"][/category=(\d+)/, 1].to_i
  end

  def name
    page.search("div#layer_metainfo").at_css("td.lightcell b").text
  end

  def id
    url[/artwork_ID=(\d+)/, 1]
  end

  def download_url
    "/BMS/artwork/download.cfm?transform_ID=10&artwork_ID=#{id}&popupwidth=775&popupheight=500"
  end

  def asset_url
    download_page = agent.get(download_url)
    download_page.links_with(text: "HERE").first.uri.to_s rescue nil
  end

  private
  attr_reader :url, :agent, :page

  def menu_item
    page.search("li.active").last
  end
end

