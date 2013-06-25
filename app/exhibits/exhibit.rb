require 'delegate'
class Exhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    super(model)
  end

  def to_model
    __getobj__
  end

  def class
    __getobj__.class
  end

  def self.exhibits
    [
      TextPostExhibit,
      PicturePostExhibit,
      LinkExhibit
    ]
  end

  def self.exhibit(object, context)
    exhibits.inject(object) do |object, exhibit|
      require 'pry'; binding.pry  
      exhibit.exhibit_if_applicable(object, context)
    end
  end

  def self.exhibit_if_applicable(object, context)
    if applicable_to?(object)
      self.new(object, context)
    else
      object
    end
  end

  def self.applicable_to?(object)
    false
  end
end
