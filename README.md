# Zerouter
Ruby API Framework on top of Grape.

Since Grape doesn't really support usage of inheritance within each Grape::Endpoint, thus, let's make some that does.

### Defining Endpoints
```
# component/video/endpoint/v1.rb
class Component::Video::Endpoint::V1 < Ramadoka::Endpoint::Base
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
end
```

### Inheriting Class
```
class Component::Video::Endpoint::V1 < Ramadoka::Endpoint::Base
...
inherit! # this line is important.
```

### Defining Error Handling
TODO: write the docs
