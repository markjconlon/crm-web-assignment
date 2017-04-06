gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Contact < ActiveRecord::Base
  #string field is limited to 256 characters
  field :first_name, as: :string
  field :last_name, as: :string
  field :email, as: :string
  field :note,  as: :text

  # attr_accessor :first_name, :last_name, :email, :note
  # attr_reader :id
  def full_name
    "#{first_name} #{last_name}"
  end
end
Contact.auto_upgrade!
#this is required because MiniRecord will open connections but wont close
#SQLite only allows 5 connections so every 6th time you reconnect you
#would otherwise get a timeout ERROR
