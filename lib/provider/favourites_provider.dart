import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);
  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);
    if (mealIsFavourite) {
      // remove from list
      // state = List.from(state)..remove(meal);
      state = state.where((mealItem) => mealItem != meal).toList();
      return false;
    } else {
      // add to list
      state = [...state, meal];
      return true;
    }
  }
}

// we use StateNotifierProvider with data can be change
final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});


/*
-- State Notifier
-- State Notifier Provider

# create class Notifier with extends State Notifier <type>
# create var provider called (state notifier provider<Notifier class , List<Meal>>)( (ref) => Notifier class  )

# var provider ... 
widget: stateNotifierProvider
type: class notifier + data 
return class notifier

# class state Notifier
type : data

 */
