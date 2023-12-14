ThinkingSphinx::Index.define :message, :with => :real_time do 
          # fields
  indexes subject, :sortable => true
  indexes content
  indexes user.user_name, :as => :user_name, :sortable => true

  # attributes
  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
end