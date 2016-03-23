require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'omniauth'
require 'omniauth-shine'
require 'omniauth-misfit'
require 'dotenv'

Dotenv.load

require './misfit_test'
run MisfitTest
