class Book < ApplicationRecord
# nameの文字数は、1文字から10文字まで
validates :title,presence: true
validates :body,presence: true

end
