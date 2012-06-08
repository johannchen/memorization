class Verse < ActiveRecord::Base
  attr_accessible :content, :memorized, :title
  validates_presence_of :title, :content
end
