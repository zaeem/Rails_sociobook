class Cpshare < ActiveRecord::Base
  belongs_to :content
  belongs_to :cpoll
end
