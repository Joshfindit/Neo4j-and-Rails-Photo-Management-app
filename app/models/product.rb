class Product 
  include Neo4j::ActiveNode
  property :name, type: String
  property :description, type: String
  property :sku, type: String

  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name

  private
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  public
  has_many :out, :tags, type: :TAGGED, model_class: :Tag
  has_many :both, :relateds, type: :RELATED, model_class: :Product
  has_many :out, :product_images, type: :PRODUCT_IMAGE, model_class: :Image
  

end
