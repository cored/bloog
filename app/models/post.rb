require 'date'
require 'active_record'
require 'fig_leaf'

class Post < ActiveRecord::Base
  validates :title, presence: true

  attr_accessor :blog
  attr_accessible :pubdate, :title, :body, :image_url

  def publish(clock=DateTime)
    return false unless valid?
    self.pubdate = clock.now
    blog.add_entry(self)
  end

  def picture?
    image_url.present?
  end

  def save(*)
    set_default_body
    super
  end

  def self.first_before(date)
    first(conditions: ["pubdate < ?", date],
          order:      "pubdate DESC")
  end

  def self.first_after(date)
    first(conditions: ["pubdate > ?", date],
          order:      "pubdate ASC")
  end

  def prev
    self.class.first_before(pubdate)
  end

  def next
    self.class.first_after(pubdate)
  end

  def up
    blog
  end

  def self.most_recent(limit=10)
    all(order: "pubdate DESC", limit: limit)
  end


  private
  def set_default_body
    if body.blank?
      self.body = 'Nothing to see here'
    end
  end
end
