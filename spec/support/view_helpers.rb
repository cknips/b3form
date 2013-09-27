module ViewHelpers
  def page(rendered)
    Capybara::Node::Simple.new(rendered)
  end
end
