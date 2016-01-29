require 'httparty'
require './config'

class Observer
  include HTTParty
  # def initialize
  #   @options = {
  #     query: generate_queries,
  #     cookies: generate_cookies,
  #     debug_output: $stdout
  #   }
  # end

  def self.run
    p self.default_cookies
    response = self.get('http://trade.itemmania.com/sell/list.html', query: generate_queries, debug_output: $stdout)
    p response.body
  end

  def self.generate_cookies
    response = self.post(
    'https://www.itemmania.com/portal/user/login_form_ok.php',
    body: {
            :user_id => Config::ID,
            :user_password => Config::PASSWORD
          })

    self.default_cookies.add_cookies(response.headers["set-cookie"])
  end

  def self.generate_queries
    { search_type: 'sell', search_game: 138, search_server: 658, search_goods: 'item' }
  end
end

Observer.generate_cookies
Observer.run
