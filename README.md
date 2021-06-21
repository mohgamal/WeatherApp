# WeatherApp

## iOS app tp get wether data info for selected cities from MetaWeather APIs

### Approch for development:
#### I've used modular app archetecture approch splitting project small frameworks doing the main functionality along with the main app layer:
- Main App layer: which containts the app delegate and scene delgate along with coordinator and dependency injection functionality.
- Domain layer: which hodling the interfaces used in other app layers like entities , interactors , and domain repo interface used in the diferrent layers
  - domain layer is the only gate to other app layers like data and presentation layers.
- Data Layer: which have the models structure from remote or local data sources, it also holds remote and local data sources implenentation which deals with APIs and local data.
  - I've added unit tests for data layer to test decoding the data and I mocked the remote data source protocol to work with local json file which I got from remote API.
- Presentation Layer: which everything the application looks like it used MVVM and combine for inteeractivity betwwen view and view model and it depends on Domain layer interactor to get translated data from remote apis or local data.
  - Presnetation layer holds the dependncy injection interfaces and coordinator interfaces as we don't need the main app to depened on low level presentation layer.


### Here is recording from final result:



https://user-images.githubusercontent.com/6039137/122761104-286e9900-d29c-11eb-924a-f88755a5c088.mp4


