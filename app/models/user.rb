class User < ActiveRecord::Base
  after_create do |user|
    create_writer(user)
  end

  has_one :writer

  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def create_writer(user)
    writer = Writer.new
    writer.user_id = user.id
    writer.save!
  end
end
