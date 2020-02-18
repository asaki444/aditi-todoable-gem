# Todoable

Welcome to Todoable!!! Use this gem for your next list app :D

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todoable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todoable

## Usage

To send requests to an to do list api. On this api, you can create/delete lists, and items. The only information you can add to a list/item is a name. It is also possible to mark an item as done.



To use, first initialize, using your username, and password for the todoable API. :

```
  Todoable.initialize(username,password)
```
To use gem, list methods begin with ```TODOABLE::List```. The method arguments are strings, but the item_id/list_id are integers:

List methods
| Request | Method|
| ------------- | ------------- |
| Add a list | ```.add_list(desired_name)``` |
| Get A list Info  | ```.get_list(list_id) ``` |
| Update List | ```.update_list(list_id, name)```|
| Delete List |``` .delete_list(list_id)``` |

Item methods begin with ```TODOABLE::Item```. 

Item methods
|Request| Method|
|------------|----------|
| Add Item| ```.add_item(desired_name, list_id ) ```|
| Mark Done|```.mark_done(item_id)``` |
| Delete Item| ```.delete_item(item_id)``` |

## Things I wish I could have had more time

I did not get to create a fully working gem. Besides that, I would have added some error handling to send a message to the console depending on the response code.

Also I needed to add a method to check if a code is still valid if 20 minutes have passed before requesting another token, when an api request is called. Or added logic to call the initialize method when the token was invalid after a request to the api.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/todoable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Todoable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/todoable/blob/master/CODE_OF_CONDUCT.md).
