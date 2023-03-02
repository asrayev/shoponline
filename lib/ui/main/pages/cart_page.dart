import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoponline/utils/myMediaquery.dart';
import 'package:shoponline/view_model/order_view_model.dart';
import 'package:shoponline/view_model/products_veiw_model.dart';
import '../../../data/models/category.dart';
import '../../../data/models/product_model.dart';
import '../../../view_model/category_view_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: m_h(context),
          width: m_w(context),
          child: StreamBuilder(
            stream: Provider.of<OrdersViewModel>(context,listen: false).listenOrders("DizqThEevchzfhAncw97rRcGvNy2"),
            builder: (context, snapshot)
              { if (snapshot.hasData){
                return ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index){
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.cyanAccent,
                      );

                    });
              }
              else {
                return CircularProgressIndicator();
              }

                }
          )
      ),
    );
  }
}
