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
end

Observer.generate_cookies
Observer.run
