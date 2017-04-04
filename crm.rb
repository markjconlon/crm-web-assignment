# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

# Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
# Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
# Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')

#these are listeners that conect the views to the controller
get '/' do
  @crm_app_name = "Mark's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email],  params[:note])
  redirect to('/contacts')
end

#this only works because of sinatra, pure HTTP only knows get and post
delete '/contacts/:id' do
  puts "Deleting!!"
  contact = Contact.find(params[:id].to_i)
  contact.delete
  redirect to('/contacts')
end

#not working cant have multiple redirects unless
put '/contacts/:id' do
  puts "modifying"
  contact = Contact.find(params[:id].to_i)
  puts contact.id
  redirect to("contacts/#{contact.id}/update/")
end

get 'contacts/:id/update' do
  erb :update_contact
end
