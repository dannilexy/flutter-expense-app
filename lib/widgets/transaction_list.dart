import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, cons) {
            return Column(
              children: [
                Text(
                  'No Transactions Added Yet!',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Image(
                  image: AssetImage('assets/images/waiting.png'),
                  height: cons.maxHeight * 0.7,
                  fit: BoxFit.cover,
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              //   return Card(
              //     child: Row(
              //       children: [
              //         Container(
              //           padding: EdgeInsets.all(10),
              //           margin:
              //               EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //                 color: Theme.of(context).primaryColor, width: 2),
              //           ),
              //           child: Text(
              //             '\$${transactions[index].amount.toStringAsFixed(2)}',
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor,
              //             ),
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               transactions[index].title,
              //               style: TextStyle(
              //                 fontSize: 18,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //             Text(
              //               DateFormat.yMMMEd()
              //                   .format(transactions[index].date),
              //               style: TextStyle(
              //                 color: Colors.grey,
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   );
              // },
              return TransactionItem(
                  transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
