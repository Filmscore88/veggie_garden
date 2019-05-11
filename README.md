
# I want the gardens index page to show all gardens and be able to view all of the gardens show page.
# I want to have the list of garden planting_system to be available in the edit page
# I want the list of vegetables to be available in the edit vegetables page.
# Check out the link kyle sent for forms info
# Add delete form and http for gardens and vegetables edit page
# In the vegetable show page i want to have basic info about each vegetable, along with a picture
# USE THE current_user.garden_ids, or current_user.vegetable_ids method !!!!!
# When creating a vegetable, i want to be able to select multiple , and a quantity for each one.
# The create new vegetable page should have a link to chose which garden to place it in.
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







CODE FOR DROP DOWN MENU SELECT OPTIONS HTML5

<form action="/action_page.php">
  <input list="browsers" name="browser">
  <datalist id="browsers">
    <option value="Internet Explorer">
    <option value="Firefox">
    <option value="Chrome">
    <option value="Opera">
    <option value="Safari">
  </datalist>
  <input type="submit">
</form>

<p><b>Note:</b> The datalist tag is not supported in Safari or IE9 (and earlier).</p>
