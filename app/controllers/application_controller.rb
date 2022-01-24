class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    x = BakedGood.by_price
    x.to_json
  end

  get '/baked_goods/most_expensive' do
    x = BakedGood.by_price.first
    x.to_json
  end

end
