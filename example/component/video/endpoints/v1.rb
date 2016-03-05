module Component::Video::Endpoint; end
class Component::Video::Endpoint::V1 < Ramadoka::Endpoint::Base
  def route_v1
    o = OpenStruct.new
    o.data =  1
    [o, o, o]
  end
  route!(:route_v1, "videos") do
    path "/test"
    method :get
    description "test routing"
    presenter Component::Video::Entity::Lite
    optional :page, type: Integer, default: 1
    optional :per_page, type: Integer, default: 1
  end

  def route
    o = OpenStruct.new
    o.data = 0
    [o, o, o]
  end
  route!(:route, "videos") do
    path "/override"
    method :get
    description "to be overriden"
    presenter Component::Video::Entity::Lite
    optional :page, type: Integer, default: 1
    optional :per_page, type: Integer, default: 1
  end

  def route_logic_only
    o = OpenStruct.new
    o.data = 3
    [o, o, o]
  end
  route!(:route_logic_only, "videos") do
    path "/logic"
    method :get
    description "check overrider"
    presenter Component::Video::Entity::Lite
    optional :page, type: Integer, default: 1
    optional :per_page, type: Integer, default: 1
  end

  inherit!
end
