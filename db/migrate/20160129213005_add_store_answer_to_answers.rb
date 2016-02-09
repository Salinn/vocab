class AddStoreAnswerToAnswers < ActiveRecord::Migration
  def change
    add_belongs_to :answers, :answer_option, index: true
  end
end
