gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Contact

  # attr_accessor :first_name, :last_name, :email, :note
  # attr_reader :id
end
