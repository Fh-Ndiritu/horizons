ThinkingSphinx::Index.define :conversation, :with => :real_time do 
      # fields
  indexes subject, :sortable => true
  indexes title
  indexes product.title, :as => :title, :sortable => true
  indexes product.price, :as => :price, :sortable => true

  # attributes
  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
end