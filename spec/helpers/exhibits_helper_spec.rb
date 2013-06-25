require_relative '../../app/helpers/exhibits_helper'
require_relative '../../app/exhibits/text_post_exhibit'
require_relative '../../app/exhibits/picture_post_exhibit'
require_relative '../../app/exhibits/link_exhibit'
require_relative '../spec_helper_lite'

stub_class 'Post'

describe ExhibitsHelper do 
  before do 
    @it = Object.new
    @it.extend ExhibitsHelper
    @context = stub!
  end

  it "decorates picture post with a PicturePostExhibit" do 
    post = Post.new 
    stub(post).picture?{ true }
    @it.exhibit(post, @context).must_be_kind_of(PicturePostExhibit)
  end

  it "decorates text posts with TextPostExhibit" do 
    post = Post.new
    stub(post).picture?{ false }
    @it.exhibit(post, @context).must_be_kind_of(TextPostExhibit)
  end

  it "leaves objects it doesn't know alone" do 
    model = Object.new
    @it.exhibit(model, @context).must_be_same_as(model)
  end
end
