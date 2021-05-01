import 'package:cocktail_flow/models/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientsList {
  static List<Ingredient> getMockedIngredients() {
    return [
      Ingredient(name: "7up", description: "", color: Colors.white),
      Ingredient(
          name: "Absinthe",
          description: "Overproof anise-flavored spirit",
          color: Colors.teal[100]),
      Ingredient(
          name: "Agave Nectar", description: "", color: Colors.orange[100]),
      Ingredient(name: "Ale", description: "", color: Colors.red[100]),
      Ingredient(
          name: "Amaretto",
          description: "Sweet almond-flavored liqueur",
          color: Colors.green[50]),
      Ingredient(
          name: "Angostura Orange Bitters",
          description: "",
          color: Colors.green[50]),
      Ingredient(
          name: "Aperol",
          description: "Italian aperitif",
          color: Colors.green[50]),
      Ingredient(name: "Apple", description: "", color: Colors.yellow[100]),
      Ingredient(
          name: "Apple Brandy",
          description: "Brandy made from apple",
          color: Colors.green[40]),
      Ingredient(name: "Apple Juice", description: "", color: Colors.grey[100]),
      Ingredient(
          name: "Appleton Estate Reserve Rum",
          description: "Jamaican Gold Rum",
          color: Colors.pink[100]),
      Ingredient(
          name: "Apricot Brandy",
          description: "Brandy made from apricot",
          color: Colors.yellow[200]),
      Ingredient(
          name: "Aquavit",
          description: "Flavoured spirit produced in Scandinavia and Germany",
          color: Colors.white),
      Ingredient(
          name: "Bacardi Carta Blanca",
          description: "Puerto Rican white rum, also known as Bacardi Superior",
          color: Colors.white)
    ];
  }
}
