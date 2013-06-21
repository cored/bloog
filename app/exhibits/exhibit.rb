require 'delegate'
class Exhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    super(model)
  end
end
