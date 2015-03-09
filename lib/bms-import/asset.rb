class Asset < Sequel::Model
  many_to_one :category
end
