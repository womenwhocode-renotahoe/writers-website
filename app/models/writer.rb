class Writer < ActiveRecord::Base
  after_create do |writer|
    create_writer_goals(writer)
  end

  has_many :stories
  has_many :writer_goals
  has_many :goals, through: :writer_goals
  has_many :activities
  belongs_to :user

  private

  def create_writer_goals(writer)
    Goal.all.each do |goal|
      WriterGoal.create!(
        writer_id: writer.id,
        goal_id: goal.id,
        value: 0)
    end
  end
end
