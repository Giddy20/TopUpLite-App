import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybetter/Controllers/ProductController.dart';
import 'package:mybetter/Controllers/TransactionController.dart';
import 'package:mybetter/Screens/DataTopup.dart';

import '../Constants.dart';


class TxnHistoryBottomSheet extends StatelessWidget {

 final TransactionController transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        child: Obx(
                () => ListView.separated(
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_){
                    //
                    var removed = transactionController.transactions[index];
                    transactionController.transactions.removeAt(index);
                    Get.snackbar( "History Deleted" , 'Are you Sure you want to delete completely?',
                    isDismissible: true,
                    showProgressIndicator: false,
                    dismissDirection: SnackDismissDirection.HORIZONTAL,
                    mainButton: FlatButton(onPressed: (){
                      if(removed == null){
                        return;
                      }
                      transactionController.transactions.insert(index, removed);
                      removed = null;
                      if(Get.isSnackbarOpen){
                        Get.back();
                      }
                    }, child: Text('Undo')),
                    backgroundColor: kLeadingGradient,
                    );
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        color: Colors.white60,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(transactionController.transactions[index].title,),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("₦${transactionController.transactions[index].amount.toString()}"),
                                  Text(transactionController.transactions[index].dateTime.toString()),

                                  SizedBox(
                                    height: 7,
                                  ),
                                  MaterialButton(
                                      onPressed: (){

                                      },
                                      child: ClayContainer(
                                        color: kLeadingGradient,
                                        borderRadius: 5,
                                        emboss: true,
                                        curveType: CurveType.concave,
                                        spread: 1,
                                        depth: 10,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 13),
                                          decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            'Order Again',
                                            style: Theme.of(context).textTheme.button.copyWith(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // child: ListTile(
                  //
                  //     title: Text(transactionController.transactions[index].title,),
                  //     trailing :Text("Price: ₦${transactionController.transactions[index].amount.toString()}"),
                  //     subtitle: Text(transactionController.transactions[index].dateTime.toString())
                  //   // style: (todoController.todos[index].done ?
                  //   // TextStyle(
                  //   //   color: Colors.red,
                  //   //   decoration: TextDecoration.lineThrough,
                  //   // )
                  //   //     : TextStyle(t
                  //   //     color: Theme.of(context).textTheme.bodyText1.color
                  //   // )),),
                  //
                  // ),
                ),
                separatorBuilder: (_, __) => Divider(height: 0,),
                itemCount: transactionController.transactions.length)
        )
    );
  }
}

