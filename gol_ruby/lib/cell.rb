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

  def revive
    @alive = true
  end

  def next_state(alive_in_neighborhood)
    if alive?
      if alive_in_neighborhood < 2 || alive_in_neighborhood > 3
        kill
      end
    else
      if alive_in_neighborhood == 3
        revive
      end
    end
  end

  def to_s
    alive? ? "1" : "0"
  end
end
