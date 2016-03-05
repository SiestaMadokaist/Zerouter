class Component::Video::Endpoint::V2 < Component::Video::Endpoint::V1
  def route
    o = OpenStruct.new
    o.data = 2
    [o, o, o]
  end
  route!(:route, "videos") do
    path "/override"
    method :get
    description "overridding v1"
    presenter Component::Video::Entity::Lite
    optional :page, type: Integer, default: 1
    optional :per_page, type: Integer, default: 1
  end

  def route_logic_only
    o = OpenStruct.new
    o.data = 5
    [o, o]
  end

  inherit!
end
