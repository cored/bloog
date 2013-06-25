require_relative 'exhibit'

class LinkExhibit < Exhibit
  RELATIONS = %w[next prev up]

  def prev_url
    @context.url_for(prev)
  end

  def next_url
    @context.url_for(self.next)
  end

  def up_url
    @context.url_for(up)
  end

  def links_hash
    {
      "links" => RELATIONS.map { |rel|
        {"rel" => rel, "href" => send("#{rel}_url")}
      }
    }
  end

  def serialize_hash(*args)
    super.merge(links_hash)
  end

  def to_json(options={})
    serialize_hash(options).to_json
  end

  def self.applicable_to?(object)
    object.is_a?(Post)
  end

end
