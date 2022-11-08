# Cephalopod

Cephalopod is an Octopus, and also a gem designed to query the Octopus Energy REST API.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add cephalopod

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install cephalopod

## Usage

### Configuration

```ruby
Cephalopod.configure do |config|
    config[:api_key] = "Your API key"
    config[:base_url] = "https://api.octopus.energy"
end
```

You will need an Octopus API key, this can be generated from your customer dashboard: https://octopus.energy/dashboard/developer/

### Runtime

Products and tariffs can be retrieved
```ruby
products = Cephalopod.products(query: {is_variable: true, available_at: DateTime.now})
# Available query params: 
# is_variable (boolean, optional)
# is_green (boolean, optional)
# is_tracker (boolean, optional)
# is_prepay (boolean, optional)
# is_business (boolean, default: false)
# available_at (datetime, default: now)

detailed_product = products.first.details
```
However to make sense of the tariffs that are available to you, you will need to determine your GSP (Grid Supply Point), which is a key like `_J`. These GSP's are based on your geographic location, as provided by a postcode lookup
```ruby
gsp = Cephalopod.grid_supply_point(postcode: "W1D 1NN")
```

You can also grab consumption data, if supported on your account
```ruby
electrical_consumption = Cephalopod.electrical_consumption(mpan: "MPAN", serial_number: "METER SERIAL", query: {})
gas_consumption        = Cephalopod.gas_consumption(mpan: "MPAN", serial_number: "METER SERIAL", query: {})
# Available query params
# period_from (datetime, optional)
# period_to (datetime, optional)
# page_size (int, optional)
# order_by (string, optional)
# group_by (string, optional) 
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adamcarlile/cephalopod. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/adamcarlile/cephalopod/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cephalopod project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/adamcarlile/cephalopod/blob/master/CODE_OF_CONDUCT.md).
