ThinkingSphinx::Index.define :product, :with => :real_time do 
      # fields
  indexes subject, :sortable => true
  indexes title
  indexes user.user_name, :as => :user_name, :sortable => true

  # attributes
  has price,  :type => :integer
  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
end