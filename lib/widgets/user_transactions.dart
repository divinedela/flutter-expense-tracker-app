import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transactionlist.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    new Transaction(
      id: 't1',
      title: 'milo',
      amount: 10,
      date: DateTime.now(),
    ),
    new Transaction(
      id: 't1',
      title: 'conrnflakes',
      amount: 12.50,
      date: DateTime.now(),
    )
  ];

  void addTransaction(String title, double amount) {
    final Transaction transaction = new Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
