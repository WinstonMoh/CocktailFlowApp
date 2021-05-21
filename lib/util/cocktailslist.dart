import 'package:cocktail_flow/models/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailsList {
  static List<Cocktail> getMockedCocktails() {
    return [
      Cocktail(name: "2Oth Century", strength: "Strong", color: Colors.white),
      Cocktail(
          name: "4th of July", strength: "Strong", color: Colors.teal[100]),
      Cocktail(
          name: "ABC Pousse Cafe",
          strength: "Strong",
          color: Colors.orange[100]),
      Cocktail(
          name: "Abbey Cocktail", strength: "Medium", color: Colors.red[100]),
      Cocktail(
          name: "Absinthe Frappe", strength: "Medium", color: Colors.green[50]),
      Cocktail(
          name: "Absinthe No 2",
          strength: "Extreme Strong",
          color: Colors.green[50]),
      Cocktail(
          name: "Absinthe Swizzle",
          strength: "Strong",
          color: Colors.green[50]),
      Cocktail(
          name: "Absolutely Bananas",
          strength: "Medium",
          color: Colors.yellow[100]),
      Cocktail(
          name: "Ace Cocktail", strength: "Strong", color: Colors.green[40]),
      Cocktail(
          name: "Addington Cocktail",
          strength: "Medium",
          color: Colors.grey[100]),
      Cocktail(
          name: "Adonis Cocktail 11",
          strength: "Medium",
          color: Colors.pink[100]),
      Cocktail(
          name: "Affinity Cocktail",
          strength: "Strong",
          color: Colors.yellow[200]),
      Cocktail(name: "Agave Punch", strength: "Medium", color: Colors.white),
      Cocktail(name: "Ai-La Palu", strength: "Medium", color: Colors.white)
    ];
  }
}
