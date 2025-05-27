import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  // we use Provider with static type will be not change
  return dummyMeals;
});

/*
-- create var provider 
-- return data
*/
