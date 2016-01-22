class Event < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true, length: {in: 3..100}
  validates :description, presence: true, length: {in: 3..100}
  validates :start_time, presence: true
  validates :start_time, presence: true

end
