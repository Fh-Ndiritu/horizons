class Product < ApplicationRecord
  belongs_to :user
  has_many :conversations, dependent: :destroy
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  ThinkingSphinx::Callbacks.append(self, :behaviours => [:real_time])



  validates :title, presence: true


  after_create_commit ->{broadcast_append_to("products", partial: "products/product", locals: {product: self} , target: "products")}

end
