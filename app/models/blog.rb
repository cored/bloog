class Blog
  attr_writer :post_source

  def initialize(entry_fetcher=Post.public_method(:most_recent))
    @entry_fetcher = entry_fetcher
  end

  def title
    "Watching paint dry"
  end

  def subtitle
    "The trusted source for drying paint news & opinion"
  end

  def new_post(*args)
    post_source.call(*args).tap do |p|
      p.blog = self
    end
  end

  def add_entry(entry)
    entry.save
  end

  def entries
    fetch_entries
  end

  private
  def post_source
    @post_source ||= Post.public_method(:new)
  end

  def fetch_entries
    @entries_fetcher.()
  end
end
