import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    new Transaction(id: 't1', title: 'milo', amount: 10, date: DateTime.now()),
    new Transaction(
        id: 't1', title: 'conrnflakes', amount: 12.50, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          Column(
            children: <Widget>[
              ...transactions.map((t) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.purple),
                        ),
                        child: Text(
                          'GHS ${t.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            t.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd("en_US").format(t.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList()
            ],
          )
        ],
      ),
    );
  }
}
