# Hero-Sightings-Database
Stores hero sightings using Core Data. Includes photo picking functionality. This app is for iPad only.

The user gets to store hero name, image, zodiac sign, city of residence, and the location it was last seen into Core Data. 
The small image comes from the app's own assets, while the snapshot where it was last seen is picked from the device's photo
gallery.  

The database is displayed neatly in a table view controller. The user may also delete heroes, on which they will be notified 
for confirmation.

Each table cell has a disclosure arrow. When a cell is tapped, you segue to a detail view controller. This view 
controller shows the gallery image the user picked for this hero, and displays the last seen title at the top. 
The hero image is randomly placed over the gallery background image (representing the sighting).

The app is localized also in Korean. The default scheme is set initially to Korean.

The user is also alerted when all 5 heroes have been sighted. This works even when some table cells are in different languages.

<img src="/Me%20See%20Hero/Assets.xcassets/Add.png" width="300" height="440">
<img src="/Me%20See%20Hero/Assets.xcassets/DetailVC.png" width="300" height="440">
