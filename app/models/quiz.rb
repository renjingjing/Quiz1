class Quiz < ActiveRecord::Base
  validates :name, :email, presence: true

end
