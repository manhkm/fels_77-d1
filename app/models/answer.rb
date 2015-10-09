class Answer < ActiveRecord::Base

  
  
  belongs_to :lesson
  delegate :user, to: :lesson
  belongs_to :word

  

end
