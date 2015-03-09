require "bundler/setup"

require "sequel"
require "sqlite3"
require "mechanize"
require "nokogiri"
require "pry"
require "retries"

DB = Sequel.sqlite("data/db")

DB.create_table? :categories do
  primary_key :id

  String  :name, size: 255
  Integer :parent_id
  String  :path, text: true

  index :parent_id
end

DB.create_table? :assets do
  primary_key :id

  String  :name
  String  :url, text: true
  Integer :category_id
  Boolean :downloaded, default: 0
end

module BMSImport
  def self.agent(bms_url, username, password)
    agent = Mechanize.new
    agent.user_agent_alias = "Mac Safari"

    Authentication.new(bms_url, username, password).login(agent)

    agent
  end
end

require_relative "bms-import/authentication"

require_relative "bms-import/category"
require_relative "bms-import/category-page"

require_relative "bms-import/asset"
require_relative "bms-import/asset-page"
