import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/product_model.dart';
import '../../../../view_model/login_view_model.dart';
import '../../../../view_model/products_veiw_model.dart';

class ProductShowItem extends StatefulWidget {
  const ProductShowItem({Key? key}) : super(key: key);

  @override
  State<ProductShowItem> createState() => _ProductShowItemState();
}

class _ProductShowItemState extends State<ProductShowItem> {
  @override
  Widget build(BuildContext context) {
    final User? user =
    Provider.of<AuthViewModel>(context, listen: false).currentData();
    Future<void> signOut() async {
      await Provider.of<AuthViewModel>(context, listen: false).signOut();
    }
    return Scaffold(
      body: StreamBuilder(
        stream: Provider.of<ProductViewModel>(context,listen: false).listenProducts1(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<ProductModel> categories= snapshot.data!;
            return ListView(
              children: List.generate(categories.length, (index) {
                ProductModel category = categories[index];
                return ListTile(
                  title: Text(category.productName),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [

                        IconButton(
                            onPressed: () {
                              // showDialog(context: context, builder: (context) {
                              //   return  EditCategoryDialog(category: category,categoryController: categoryController);
                              // },
                              //  );
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () async {

                              await context.read<ProductViewModel>().deleteProduct(categories[index].productId);
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }),
            );
          }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white

          );
        },
      ),
    );
  }
}
