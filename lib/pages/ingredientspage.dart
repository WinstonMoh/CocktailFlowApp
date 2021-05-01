import 'package:cocktail_flow/models/ingredient.dart';
import 'package:cocktail_flow/util/ingredientslist.dart';
import 'package:flutter/material.dart';

class IngredientsPage extends StatefulWidget {
  @override
  _IngredientsPageState createState() => new _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  TextEditingController _editingController = TextEditingController();
  ScrollController _scrollingController = new ScrollController();

  final List<Ingredient> ingredientsList =
      IngredientsList.getMockedIngredients();
  var items = [];

  @override
  void initState() {
    items.addAll(ingredientsList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Ingredient> originalList = ingredientsList; // store previous list.
    if (query.isNotEmpty) {
      List<Ingredient> filteredList = [];
      originalList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(item);
        }
      });
      setState(() {
        //update internal state of object.
        items.clear();
        items.addAll(filteredList);
      });
    } else {
      setState(() {
        // update internal state of object.
        items.clear();
        items.addAll(ingredientsList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Padding(
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
                        items.clear();
                        items.addAll(ingredientsList);
                      });
                    },
                    icon: Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            )),
        ListView.builder(
            physics: ClampingScrollPhysics(),
            controller: _scrollingController,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: items[index].color,
                title: Text('${items[index].name}'),
                leading: FlutterLogo(size: 56.0),
                subtitle: Text('${items[index].description}'),
                trailing: Icon(Icons.more_vert),
                onTap: () {},
              );
            }),
      ]),
    );
  }
}
