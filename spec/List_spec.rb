require './lib/list'
require 'spec_helper'


RSpec.describe TODOABLE::List do
  before do
    username = ENV.fetch('USERNAME')
    password = ENV.fetch('PASSWORD')
    code = TODOABLE.initialize(username,password)
    ENV["TOKEN"] = code
  end

        it "should create a list" do
            list = TODOABLE::List.new_list("aditi's list")
            list.should_not be nil
        end

        it "should return all lists" do
         list = TODOABLE::List.new_list("welcome list")
         lists = TODOABLE::List.all
         lists[0].should be list
        end
  end
