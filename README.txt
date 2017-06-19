Create a very simple iPhone application for displaying a list of hotels. This app will be graded on code quality, not on design. We are looking for good, reusable, code that displays knowledge of iOS paradigms. You may use open-source libraries to make your life easier. This project should only take a few hours to complete.

For your convenience we've provided a setup script that installs the Carthage dependency manager which clones and builds Alamofire.
You can find this script (setup.sh) in /carthage-setup

If you opt not to use Alamofire be sure to remove its references from the project. 

The app should contain the following 3 view controllers:

1) A list view (table view) of hotels with a segmented control or button to switch between hotels from 2 different cities: San Francisco and Chicago. The data you should display can be found at the following URLs:

https://techblog.expedia.com/utility/chicago-hotels.json
https://techblog.expedia.com/utility/san-francisco-hotels.json

This is real data and is an example of what we consume in the Expedia app. Do not ship the app with this data. Do not cache this data. Each time you want to display this data the app should download it, parse it, and then display it to the user. How you decide to do this is up to you.

In each table cell display the following information at a minimum: Hotel Name, Price

Don't worry about what the different prices mean in the data. Just pick any of them. Tapping on a hotel in the list should show a detail view (2) for the hotel.


2) Detail view for the hotel. This detail view should show the name, a photo, the star rating, and price. There should also be a button on this screen to transition into (3), a map view.


3) Map view. Show the location of the hotel on a map.
