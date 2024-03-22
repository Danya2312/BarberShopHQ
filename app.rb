#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', host: 'localhost', database: 'BarberShopHQ', username: 'postgres', password: 'postgres', port: '5432'}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do
	@barbers = Barber.order "created_at DESC"
	erb :index
end