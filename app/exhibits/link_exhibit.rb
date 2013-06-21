require_relative 'exhibit'

class LinkExhibit < Exhibit

  def self.applicable_to?(object)
    object.is_a?(Post)
  end

end
