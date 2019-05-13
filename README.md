# I have a banner across current_user for every page with logout/homepage(gardens)/create new garden/create new vegetables etc>
# validate entries
# adjust edit delete alingment
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
  <input type="submit" value= "delete">


  <% if logged_in? %>
    <a href="/gardens/new">New Garden </a>
    <a href= "/farmers/#{current_user.id}">Home</a>
    <a href="/logout"> Log Out </a>
    <p>Welcome, <%=current_user.username %></p>

  <% else %>
    <a href="/signup">Sign Up</a>
    <a href="/login"> Sign In </a>
  <%end %>
