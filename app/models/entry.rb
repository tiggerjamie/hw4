class Entry < ApplicationRecord

  class Post < ApplicationRecord
    has_one_attached :uploaded_image
  end
  
end
