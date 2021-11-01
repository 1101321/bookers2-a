class SearchesController < ApplicationController
  @model = params["search"]["model"]
  @value = params["search"]["value"]
  @how = params["search"]["how"]
  @dates = search_for(@how, @model, @value)
end
