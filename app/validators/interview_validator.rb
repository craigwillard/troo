class InterviewValidator < ActiveModel::Validator
  def validate(record)
    if record.interviewee.id == record.interviewer.id
      record.errors[:interviewee_id] << ' cannot be the same as interviewer.'
    end
  end
end