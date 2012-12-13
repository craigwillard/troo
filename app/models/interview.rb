class Interview < ActiveRecord::Base
  belongs_to :interviewee, class_name: "User"
  belongs_to :interviewer, class_name: "User"

  attr_accessible :approve, :notes, :interviewee_id, :interviewer_id

  validates_with InterviewValidator

  validates :notes, presence: true
  validates :interviewee, presence: true
  validates :interviewer, presence: true

end
