class User < ActiveRecord::Base
  after_create :create_writer
  has_one :writer

  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    self.role == 'admin'
  end

  private

  def create_writer
    return if self.role == 'admin' || self.role == 'visitor'
    writer = Writer.new
    writer.user_id = self.id
    writer.save!
  end

end
