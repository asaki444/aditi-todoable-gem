require 'rest-client'
require_relative 'todoable'
require 'json'


class TODOABLE::List
LISTS_URL = "/lists"

     def self.new_list(name)
         payload = {
           "list"=> {
             "name" => name
           }
         }
         TODOABLE.create(payload, LISTS_URL)
     end

     def self.all
        TODOABLE.get_all(LISTS_URL)
     end

end
