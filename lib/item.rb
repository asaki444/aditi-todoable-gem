require 'rest-client'
require_relative 'todoable'

class TODOABLE::List
ITEMS_URL = "/lists"

     def self.new_item(name)
         id = TODOABLE::List.last.id
         TODOABLE::Item.TODOABLE.create(name , ITEMS_URL)
     end

     def self.all
        TODOABLE.get_all(ITEMS_URL)
     end

end
