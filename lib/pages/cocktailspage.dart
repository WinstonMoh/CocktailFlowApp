import 'package:cocktail_flow/models/cocktail.dart';
import 'package:cocktail_flow/util/cocktailslist.dart';
import 'package:flutter/material.dart';

class CocktailsPage extends StatefulWidget {
  @override
  _CocktailsPageState createState() => new _CocktailsPageState();
}

class _CocktailsPageState extends State<CocktailsPage>
    with AutomaticKeepAliveClientMixin<CocktailsPage> {
  TextEditingController _editingController = TextEditingController();
  ScrollController _scrollingController = new ScrollController();

  final List<Cocktail> _cocktailsList = CocktailsList.getMockedCocktails();
  var _items = [];

  @override
  void initState() {
    _items.addAll(_cocktailsList);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  void filterSearchResults(String query) {
    List<Cocktail> originalList = _cocktailsList; // store previous list.
    if (query.isNotEmpty) {
      List<Cocktail> filteredList = [];
      originalList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(item);
        }
      });
      setState(() {
        //update internal state of object.
        _items.clear();
        _items.addAll(filteredList);
      });
    } else {
      setState(() {
        // update internal state of object.
        _items.clear();
        _items.addAll(_cocktailsList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new ListView(children: <Widget>[
      Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Cocktails',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: _editingController,
                    decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _editingController.clear();
                            setState(() {
                              //reset internal state of object.
                              _items.clear();
                              _items.addAll(_cocktailsList);
                            });
                          },
                          icon: Icon(Icons.clear),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  )),
              ListView.builder(
                  physics: ClampingScrollPhysics(),
                  controller: _scrollingController,
                  shrinkWrap: true,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: _items[index].color,
                      title: Text('${_items[index].name}'),
                      leading: FlutterLogo(size: 56.0),
                      subtitle: Text('${_items[index].strength}'),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {},
                    );
                  }),
            ]),
      )
    ]);
  }
}
