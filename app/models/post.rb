require 'date'
require 'active_record'

class Post < ActiveRecord::Base
  validates :title, presence: true

  attr_accessor :blog

  def publish(clock=DateTime)
    return false unless valid?
    self.pubdate = clock.now
    blog.add_entry(self)
  end

  def picture?
    image_url.present?
  end
end
