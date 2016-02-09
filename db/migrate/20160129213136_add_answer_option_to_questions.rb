class AddAnswerOptionToQuestions < ActiveRecord::Migration
  def change
    add_belongs_to :questions, :answer_options, index: true
  end
end
