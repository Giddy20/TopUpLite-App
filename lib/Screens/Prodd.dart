import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybetter/Controllers/ProductController.dart';
import 'package:mybetter/Services/RemoteServices.dart';

class Prodd extends StatelessWidget{
  
ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Obx(
                () => ListView.separated(
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_){
                    
//                     THIS IS NOT A REAL PAGE, IT WAS JUST USED TO TEST FOR THE DATA GOT FROM THE API
                    
                    
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
                                  RaisedButton(onPressed: (){
                                    print(5);
                                  }, child: Text('ddddd'),),


                                  Text(productController.productList[index].productName),
                                ],
                              ),

                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Text("₦${transactionController.transactions[index].amount.toString()}"),
                              //     Text(transactionController.transactions[index].dateTime.toString()),
                              //
                              //     SizedBox(
                              //       height: 7,
                              //     ),
                              //     MaterialButton(
                              //       onPressed: (){
                              //
                              //       },
                              //       child: ClayContainer(
                              //         color: kLeadingGradient,
                              //         borderRadius: 5,
                              //         emboss: true,
                              //         curveType: CurveType.concave,
                              //         spread: 1,
                              //         depth: 10,
                              //         child: Container(
                              //           padding: EdgeInsets.symmetric(vertical: 7, horizontal: 13),
                              //           decoration: BoxDecoration(
                              //
                              //             borderRadius: BorderRadius.circular(5),
                              //           ),
                              //           child: Text(
                              //             'Order Again',
                              //             style: Theme.of(context).textTheme.button.copyWith(
                              //                 fontFamily: 'Source Sans Pro',
                              //                 color: Colors.white,
                              //                 fontSize: 11,
                              //                 fontWeight: FontWeight.bold
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // )
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
                itemCount: productController.productList.length)
        ),
      ),
    );
    
  }
}
