import 'package:cocktail_flow/models/ingredient.dart';
import 'package:cocktail_flow/util/ingredientslist.dart';
import 'package:flutter/material.dart';

class IngredientsPage extends StatefulWidget {
  @override
  _IngredientsPageState createState() => new _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage>
    with AutomaticKeepAliveClientMixin<IngredientsPage> {
  TextEditingController _editingController = TextEditingController();
  ScrollController _scrollingController = new ScrollController();

  final List<Ingredient> _ingredientsList =
      IngredientsList.getMockedIngredients();
  var _items = [];

  @override
  void initState() {
    _items.addAll(_ingredientsList);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  void filterSearchResults(String query) {
    List<Ingredient> originalList = _ingredientsList; // store previous list.
    if (query.isNotEmpty) {
      List<Ingredient> filteredList = [];
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
        _items.addAll(_ingredientsList);
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
                  'Ingredients',
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
                              _items.addAll(_ingredientsList);
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
                      subtitle: Text('${_items[index].description}'),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {},
                    );
                  }),
            ]),
      )
    ]);
  }
}
