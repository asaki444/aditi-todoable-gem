RSpec.describe TODOABLE::List do
  before do
    username = ENV.fetch('USERNAME')
    password = ENV.fetch('PASSWORD')
    code = TODOABLE.initialize(username,password)
    ENV["TOKEN"] = code

    @list = TODOABLE::List.new_list("aditi's list")
  end

        it "should create a item with id" do
            item = TODOABLE::Item.new_item( @list.id , "new item")
            item.should_not be nil
        end

        it "should return all items" do
         items = TODAOBLE::Item.get_all
         items.should_not be nil
        end

        #added a test for mark as finished
  end
