
# I want the gardens index page to show all gardens and be able to view all of the gardens show page.
# In the vegetable show page i want to have basic info about each vegetable, along with a picture
# USE THE current_user.garden_ids, or current_user.vegetable_ids method !!!!!

# Home Page:
#    If logged in:
#    <% if logged_in? %>
#   <p>Welcome, <%=current_user.username %></p>
#       <a href="/gardens/new"> Create a New Garden  </a>
#       <a href= "/farmers/current_user.id"> My Gardens</a>
#       <a href="/logout"> Log Out </a>


#     <% else %>
#       <a href="/signup">Sign Up</a>
#       <a href="/login"> Sign In </a>
#     <%end %>


# Farmer :id page:

#2- In farmers/:id
#  <a href= "/vegetables/new"> Add new Vegetables to My Garden</a>
