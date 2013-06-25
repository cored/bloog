require_relative '../exhibits/exhibit'
module ExhibitsHelper
  def exhibit(model, context)
    Exhibit.exhibit(model, context)
  end
end
