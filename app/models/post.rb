require 'date'
require 'active_record'
require 'fig_leaf'

class Post < ActiveRecord::Base
  include FigLeaf
  hide ActiveRecord::Base, ancestors: true,
      except: [Object, :init_with, :new_record?,
              :errors, :valid?, :save]
  hide_singletons ActiveRecord::Calculations,
                  ActiveRecord::FinderMethods,
                  ActiveRecord::Relation
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

  def self.most_recent(limit=10)
    all(order: "pubdate DESC", limit: limit)
  end

  def save(*)
    set_default_body
    super
  end

  private
  def set_default_body
    if body.blank?
      self.body = 'Nothing to see here'
    end
  end
end
