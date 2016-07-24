class Image 
  include Neo4j::ActiveNode
  include Neo4jrb::Paperclip
  property :name, type: String
  property :description, type: String
  property :ingested_path, type: String


  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name

  private
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  public
  has_neo4jrb_attached_file :image_file, styles: {thumbnail: "110x110#"}, :convert_options => { :thumb => "-quality 60 -strip" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image_file, content_type: /\Aimage\/.*\Z/

  has_one :in, :product, type: :PRODUCT_IMAGE, model_class: :Product
  has_many :both, :other_versions, type: :OTHER_VERSION, model_class: :Image

end