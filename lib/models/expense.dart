// this is a data model class for expenses like a data structure which we are defining.

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter =
    DateFormat.yMd(); // used to format date and comes with the intl package

const uuid = Uuid(); // used to create a unique id

enum Category {
  food,
  travel,
  leisure,
  work
} /* to make chart we require this 
  enum to define out own data type */

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
}; //this is a map created for icons to relate with category

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid
            .v4(); /*  like this we can declare the variables 
                      which didnt got declared in constructor function */

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
// to format date we have to add a package intl
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
