class Category < Sequel::Model
  many_to_one :parent, class: self
  one_to_many :children, key: :parent_id, class: self

  one_to_many :assets

  def calculate_path
    parent = self.parent
    elements = [self.name]

    if parent
      until parent == nil
        elements.unshift parent.name
        parent = parent.parent
      end
    end

    self.path = elements.join("/")
  end
end
