class Component::Video
  extend Memoist

  def domain
    self.class::Domain.new(self)
  end
  memoize(:domain)

end
