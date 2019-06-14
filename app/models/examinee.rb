class Examinee < ActiveRecord::Base
  belongs_to :exam
  has_many :submissions

  def score
    submissions.select { |s| s.status == 'correct' }.size
  end
end
