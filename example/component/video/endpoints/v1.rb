module Component::Video::Endpoint; end
class Component::Video::Endpoint::V1 < Ramadoka::Endpoint::Base

  class << self
    def default_response
      proc do |presenter, result, req|
        Common::Primitive::Entity.show(data: result, presenter: presenter)
      end
    end
  end
  success(&default_response)

  resource "/videos"

  def route_v1
    o = OpenStruct.new
    o.datum =  1
    [o, o, o]
  end
  route!(:route_v1) do
    path "/not-wrapped-with-primitive"
    method :get
    description "test routing"
    header :authorization, description: "Token Based Auth", required: true
    presenter Component::Video::Entity::Lite
    success do |presenter, result, req|
      presenter.represent(result)
    end
    optional :page, type: Integer, default: 1
    optional :per_page, type: Integer, default: 1
  end

  def route
    o = OpenStruct.new
    o.datum = 0
    [o, o, o]
  end
  route!(:route) do
    path "/wrapped-with-primitive"
    method :get
    description "to be overriden"
    presenter Component::Video::Entity::Lite
    success do |presenter, result, req|
      Common::Primitive::Entity.show(data: result, presenter: presenter, pagination: {per_page: req.per_page, page: req.page})
    end
    optional :page, type: Integer, default: 1
    optional :per_page, type: Integer, default: 1
  end

  def route_logic_only
    o = OpenStruct.new
    o.datum = 3
    [o, o, o]
  end
  route!(:route_logic_only) do
    path "/fallback-to-default"
    method :get
    description "check overrider"
    presenter Component::Video::Entity::Lite
    optional :page, type: Integer, default: 1
    optional :per_page, type: Integer, default: 1
  end

end
