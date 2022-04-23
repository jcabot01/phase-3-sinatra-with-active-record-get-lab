class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  #routes
  get '/bakeries' do
    bakery = Bakery.all
    bakery.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(only: [:name], include: {
      baked_goods: { only: [:name, :price] }
    })
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end
 
  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.by_price.first
    baked_goods.to_json
  end
end
