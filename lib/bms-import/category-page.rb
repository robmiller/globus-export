class CategoryPage
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

  def id
    url[/category=(\d+)/, 1].to_i
  end

  def name
    menu_item.at_css("text()").text
  end

  def parent
    link = menu_item.parent.parent.at_css("a")
    name = link.at_css("text()").text

    if name == "home"
      return 0
    end

    link["href"][/category=(\d+)/, 1].to_i
  end

  def categories
    menu_item.css("li a").map { |a| a["href"] }
  end

  def assets
    page
      .search("div#rightpane_navbar a[href*=\"showartwork.cfm\"]")
      .map { |a| a["href"] }
  end

  private
  attr_reader :url, :agent, :page

  def menu_item
    page.search("li.active").last
  end
end

