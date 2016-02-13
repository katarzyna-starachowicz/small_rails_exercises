require 'rest-client'
url_index = "http://localhost:3000/users"
url_show = "http://localhost:3000/users/:id"
url_new = "http://localhost:3000/users/new"
url_edit = "http://localhost:3000/users/:id/edit"
puts RestClient.get(url_index)
puts RestClient.get(url_show)
puts RestClient.get(url_new)
puts RestClient.get(url_edit)