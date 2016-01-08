class Event < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true, length: {in: 3..100}
  validates :description, presence: true, length: {in: 3..100}
  validates :start_time, presence: true
  validates :start_time, presence: true

  def update_event
    # self.update_columns(:end_time, self.lesson) according to a tutorial I was following code to update event goes here, but I can't link to lesson to get the new attributes
  end

end
