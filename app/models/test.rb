class Test < ApplicationRecord
  def self.category(name_category)
    self.joins('JOIN categories ON categories.id = tests.category_id').where(categories: {title: name_category}).order('tests.title DESC').pluck('tests.title')
  end  
end
