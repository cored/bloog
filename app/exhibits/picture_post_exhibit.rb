require_relative 'exhibit'

class PicturePostExhibit < Exhibit

  def render_body 
    @context.render(partial: "/posts/picture_body", locals: { post: self })
  end

  def self.applicable_to?
    object.is_a?(Post) && object.picture?
  end

end
