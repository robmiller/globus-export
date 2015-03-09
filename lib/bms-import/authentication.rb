class Authentication
  def initialize(bms_url, username, password)
    @bms_url  = bms_url
    @username = username
    @password = password
  end

  def login(agent)
    page = agent.get(bms_url)
    login_form = page.form_with(name: "loginform")
    login_form["username"] = username
    login_form["password"] = password
    agent.submit(login_form)
  end

  private
  attr_reader :bms_url, :username, :password
end
