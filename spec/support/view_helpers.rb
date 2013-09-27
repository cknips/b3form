module ViewHelpers
  def page
    Capybara::Node::Simple.new(rendered)
  end
end
