import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themeTextHeadLine = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: Theme.of(context).colorScheme.onBackground);
    TextStyle themeTextBody = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(color: Theme.of(context).colorScheme.onBackground);

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh ... nothing here!', style: themeTextHeadLine),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try selecting a different category!',
            style: themeTextBody,
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onSelectMeal: (meal) {
                selectMeal(context, meal);
              }),
          itemCount: meals.length);
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
