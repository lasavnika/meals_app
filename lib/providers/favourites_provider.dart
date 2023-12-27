import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouritMealsNotifier extends StateNotifier<List<Meal>> {
  FavouritMealsNotifier() : super([]); // Initial value is an empty list
  //and we must never etid that value directly. We must always create a new list (value)

  bool toggleMealFavouriteStatus(Meal meal) {
    // state holds a property that holds the current state

    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [
        ...state,
        meal
      ]; // ... is used to pull out all the elements that are stored
      // in the list and add them as individual values to the new list

      return true;
    }

    state = [];
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouritMealsNotifier, List<Meal>>((ref) {
  return FavouritMealsNotifier(); // returns an instance of FavouritMealsNotifier class
});

//we can use this to get the list of favourite meals and to
//trigger the toggleMealFavouriteStatus method
