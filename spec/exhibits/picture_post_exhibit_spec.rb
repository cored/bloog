require_relative '../spec_helper_lite'
require_relative '../../app/exhibits/picture_post_exhibit'

describe PicturePostExhibit do 
  before do 
    @post = OpenStruct.new(
      title: "TITLE",
      body: "BODY",
      pubdate: "PUBDATE")
    @context = stub!
    @it = PicturePostExhibit.new(@post, @context)
  end

  it "delegates method calls to the post" do 
    @it.title.must_equal "TITLE"
    @it.body.must_equal "BODY"
    @it.pubdate.must_equal "PUBDATE"
  end

  it "renders itself with the appropiate partial" do 
    mock(@context).render(
      partial: "/posts/picture_body", locals: { post: @it }) {
        "THE HTML"
    }
    @it.render_body.must_equal "THE HTML"
  end
end
