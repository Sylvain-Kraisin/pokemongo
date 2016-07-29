require 'rubygems'
require 'bundler/setup'
require 'poke-api'
require 'pp'

# Instantiate our client
client = Poke::API::Client.new

# Both PTC/Google available as authentication provider
client.store_location('New York')
client.login('sylvain.kraisin@gmail.com', 'ExUyiyunY7', 'google')

# Add RPC calls
client.recycle_inventory_item(item_id: 2, count: 2)


# Perform your RPC call
call = client.call

# A <Poke::API::Response> object is returned and decorated with your request and response in a Hash format
# Request
puts call.request.inspect
[
  {
    :RECYCLE_INVENTORY_ITEM => {
      :item_id=>2,
      :count=>2
    }
  }
]

# Response
puts call.response.inspect
{
  :RECYCLE_INVENTORY_ITEM =>{
    :result=>:SUCCESS,
    :new_count=>14
  },
  :status_code => 1,
  :api_url => "",
  :error => ""
}
