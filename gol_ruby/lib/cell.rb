class Cell
  def initialize(attributes = {})
    @alive = attributes.fetch(:alive, false)
  end

  def alive?
    @alive
  end
end
