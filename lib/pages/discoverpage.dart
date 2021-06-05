import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => new _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin<DiscoverPage> {
  final Map<String, String> _discoverImages = {
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_christmas.png':
        'Christmas',
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_new_years_eve.png':
        'New Year\'s Eve',
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_type_martini_trio.png':
        'Martini',
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_type_champagne.png':
        'Sparkling',
  };

  final Map<String, String> _latestCocktails = {
    'https://vignette.wikia.nocookie.net/cocktails/images/0/04/Mikado.jpg/revision/latest/scale-to-width-down/340?cb=20150717021317':
        'Mikado',
    'https://i.pinimg.com/originals/a4/06/60/a40660adce58e8ed806b77f21844a23c.jpg':
        'Olympic',
    'https://www.thespruceeats.com/thmb/CwuMEo5bx7Q6kXOwV3tmHgjgQwg=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/gin-rickey-recipe-760083-hero-01-67f0e60bf4594e1893982c1dad67c548.jpg':
        'Gin Gin Highball',
    'https://mrbcooks.com/wp-content/uploads/2018/10/IMG_9813.jpg':
        'Upside-down Martini',
  };

  final Map<String, String> _iconicCocktails = {
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_fancy.png':
        'Surprise Me!',
    'https://www.liquor.com/thmb/e5U_ixZzKIComkO9okCMkXMwUNE=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/dark-and-stormy-720x720-recipe-95f288ed6697444ab3301f8670b4564e.jpg':
        'Dark and Stormy',
    'https://images.cocktailflow.com/v1/cocktail/w_300,h_540/cocktail_daiquiri-1.png':
        'Daiquiri',
    'https://images.cocktailflow.com/v1/cocktail/w_300,h_540/cocktail_pina_colada-1.png':
        'Pina Colada'
  };

  final Map<String, String> _aroundTheWorld = {
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_france.png':
        'France',
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_italy.png':
        'Italy',
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_usa.png':
        'USA',
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_england.png':
        'United Kingdom'
  };

  final Map<String, String> _cocktailType = {
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_type_classical_trio.png':
        'Classic',
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_type_creamy.png':
        'Creamy',
    'https://images.cocktailflow.com/v1/collection/w_300,h_270/collection_type_short.png':
        'Short',
    'https://images.cocktailflow.com/v1/cocktail/w_300,h_540/cocktail_hangmans_blood-1.png':
        'Longdrink'
  };

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new ListView(children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Discover',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(),
              items: _discoverImages.entries
                  .map((item) => Column(children: <Widget>[
                        Expanded(
                            child: Image.network(
                          item.key,
                          fit: BoxFit.fill,
                          width: 500,
                          height: 200,
                        )),
                        Text(item.value,
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ]))
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Iconic Cocktails',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.5,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: _iconicCocktails.entries
                  .map((item) => Column(children: <Widget>[
                        Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  item.key,
                                  fit: BoxFit.fill,
                                  width: 180,
                                  height: 180,
                                ))),
                        Text(item.value,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ]))
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Cocktail Type',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.5,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: _cocktailType.entries
                  .map((item) => Column(children: <Widget>[
                        Flexible(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  item.key,
                                  fit: BoxFit.fill,
                                  width: 180,
                                  height: 180,
                                ))),
                        Text(item.value,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ]))
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Latest Cocktails',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.5,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: _latestCocktails.entries
                  .map((item) => Column(children: <Widget>[
                        Text(item.value,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        Flexible(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  item.key,
                                  fit: BoxFit.fill,
                                  width: 180,
                                  height: 180,
                                ))),
                      ]))
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Around the World',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.5,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: _aroundTheWorld.entries
                  .map((item) => Column(children: <Widget>[
                        Flexible(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  item.key,
                                  fit: BoxFit.fill,
                                  width: 180,
                                  height: 180,
                                ))),
                        Text(item.value,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ]))
                  .toList(),
            ),
          ),
        ],
      ),
    ]);
  }
}
