class RootManager < ActiveRecord::Base
  belongs_to :word
  belongs_to :word_root
end
