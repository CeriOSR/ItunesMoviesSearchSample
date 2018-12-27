# ItunesMoviesSearchSample

      
Access a dummy iTunes API and fetches a list of tracks and its details.  
The application features a splash screen where the prefetching and saving to database happens. Then it segues to the main screen. Here it uses a collection view used to display the image, the title and a few details. You can click on the collection view cells to see the detail screen viewController. This screen displays a bigger image and more relevant details.


Features :

- Hidden navigation bar on the main screen to display a custom header.
- Animation in splash screen.
      - There is a delay when loading if we go straight to the MainScreen so I added a splashscreen lasting 5 seconds, where         all the fetching and saving to Realm happens.
- Networking is handled by AlamoFire Library.
      - AlamoFire is one of the most used networking library. Its reliable, efficient and easy to use.
- Persistence is handled by Realm internal database. Last visit date persistence is handle by UserDefaults.
      - I use Realm because its fast and reliable, efficient and easy to use. I use it over the native userDefaults or CoreData because of its efficiency. Post the last item visited on the left side of HeaderView and also scrolls to the index of last item selected.
- Image loading handled by AlamoFireImage.
      - I use AlamoFireImage to handle image loading. I trust the AlamoFire team. It does what I need it to do. I have made my own scaling function if I choose not to use the library's. Also for uniformity, because I already use their networking library.
- Optional bindings to make sure all data is saved to realm and pulled.
      - Some Tracks pulled are missing properties.
- Modally push the details viewController for ease of navigation. 



Pattern:

- Pattern used is MVC. I feel if its a small project with only 1 person working on it. MVC will suffice.
- I chose to do this programmatically for ease and efficiency. This is btw, a personal opinion.
