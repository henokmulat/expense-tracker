import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Catagory { food, travel, leisure, work }

const catagoryIcons = {
  Catagory.food: Icons.lunch_dining,
  Catagory.travel: Icons.flight_takeoff,
  Catagory.leisure: Icons.movie,
  Catagory.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.catagory,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catagory catagory;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.catagory,
    required this.expenses,
  });

  ExpenseBucket.forCatagory(List<Expense> allExpenses, this.catagory)
      : expenses = allExpenses
            .where(
              (expense) => expense.catagory == catagory,
            )
            .toList();

  final Catagory catagory;
  final List<Expense> expenses;

  double get totalExpense {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount; // sum = sum + expense.amount
    }
    return sum;
  }
}
