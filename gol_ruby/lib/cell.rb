class Cell
  def initialize(attributes = {})
    @alive = attributes.fetch(:alive, false)
  end

  def alive?
    @alive
  end

  def kill
    @alive = false
  end
end
