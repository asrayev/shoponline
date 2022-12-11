import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/category.dart';
import '../../../data/models/forDropDownList.dart';
import '../../../view_model/category_view_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Provider.of<CategoriesViewModel>(context,listen: false).listenCategories(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<CategoryModel> categories= snapshot.data!;
            return ListView(
              children: List.generate(categories.length, (index) {
                CategoryModel category = categories[index];
                return ListTile(
                  title: Text(category.categoryName),
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

                              await context.read<CategoriesViewModel>().deleteCategory(category.categoryId);
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
