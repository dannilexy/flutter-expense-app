import '/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
            )),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            // ignore: deprecated_member_use
            ? FlatButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: Text("Delete"),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                iconSize: 30,
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
