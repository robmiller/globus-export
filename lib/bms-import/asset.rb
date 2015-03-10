class Asset < Sequel::Model
  many_to_one :category

  def self.undownloaded
    where(downloaded: false)
      .where(downloading: false)
      .exclude(url: nil)
  end
end
