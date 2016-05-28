class User < ActiveRecord::Base
  after_create do |user|
    create_writer(user)
  end
  
  has_one :writer

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
