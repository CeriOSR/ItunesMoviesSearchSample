# ItunesMoviesSearchSample

ItunesMoviesSearchSample :

      Access a dummy iTunes API and fetches a list of tracks and its details.  The application features a splash screen where the prefetching and saving to database happens. Then it segues to the main screen. Here it uses a collection view used to display the image, the title and a few details. You can click on the collection view cells to see the detail screen viewController. This screen displays a bigger image and more relevant details.

Features :

- Hidden navigation bar on the main screen to display a custom header.
- Animation in splash screen.
- Networking is handled by AlamoFire Library.
- Persistence is handled by Realm internal database.
- Image loading handled by AlamoFireImage.
- Optional bindings to make sure all data is saved to realm and pulled.
- Modally push the details viewController for ease of navigation. 
