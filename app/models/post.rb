class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_attached_file :respaper
  validates_attachment_content_type :respaper, content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)

  default_scope -> { includes(:user).order(created_at: :desc) }

  acts_as_commontable
  acts_as_commontable dependent: :destroy

  
  scope :by_category, -> (branch, category_name) do 
    joins(:category).where(categories: {name: category_name, branch: branch}) 
  end

  scope :by_branch, -> (branch) do
    joins(:category).where(categories: {branch: branch}) 
  end

  scope :search, -> (search) do
    where("title ILIKE lower(?) OR content ILIKE lower(?)", "%#{search}%", "%#{search}%")
  end

  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :content, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :category_id, presence: true


end