require 'rest-client'
require_relative 'todoable'

class TODOABLE::List
ITEMS_URL = "/lists"

     def self.add_item(name,id)
         id = TODOABLE::List.all[id]
         TODOABLE::Item.TODOABLE.create(name , ITEMS_URL)
     end

     def self.all
        TODOABLE.get_all(ITEMS_URL)
     end

end
