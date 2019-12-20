def RouteStep
  attr_reader :html_instructions

  def initialize(step_data)
    @directions = step_data[:html_instructions]
  end
end
