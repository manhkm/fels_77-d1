class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
  validates :content_jp, presence: true, length: { maximum: 50 },
                        uniqueness: {case_sensitive: false}
end
