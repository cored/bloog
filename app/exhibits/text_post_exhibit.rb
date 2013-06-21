require 'delegate'

class TextPostExhibit < Exhibit
  def render_body
    @context.render(partial: "/posts/text_body", locals: {post:self})
  end
end
