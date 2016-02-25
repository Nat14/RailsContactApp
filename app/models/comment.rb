class Comment < ActiveRecord::Base
    belongs_to(:todoitem)
end
