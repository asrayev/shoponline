import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoponline/ui/main/pages/home/product_item_page.dart';
import 'package:shoponline/utils/my_colors.dart';
import 'package:shoponline/view_model/products_veiw_model.dart';
import '../../../../data/models/category.dart';
import '../../../../data/models/product_model.dart';
import '../../../../utils/myMediaquery.dart';
import '../../../../view_model/category_view_model.dart';
import '../../../../view_model/login_view_model.dart';

class HomePage extends StatefulWidget {


  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String categoryIdControl = "";

  @override
  Widget build(BuildContext context) {
    final User? user =
        Provider.of<AuthViewModel>(context, listen: false).currentData();

    Future<void> signOut() async {
      await Provider.of<AuthViewModel>(context, listen: false).signOut();
    }

    Widget _title() {
      return const Text("Firebase Auth");
    }

    Widget _userUid() {
      return Text(user?.email ?? "User email");
    }

    Widget _signOutButton() {
      return ElevatedButton(onPressed: signOut, child: const Text("Sign Out"));
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: MyColors.C_FB8A2E,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: StreamBuilder(
                  stream:
                      Provider.of<CategoriesViewModel>(context, listen: false)
                          .listenCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CategoryModel> categories = snapshot.data!;
                      // List listcategory = [] ;
                      // List allCategories = ["All"]+ listcategory.map((item) => categories[item].categoryName).toList();

                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: ((){
                                categoryIdControl = categories[index].categoryId;
                                    Provider.of<ProductViewModel>(context,listen: false).listenProducts(categories[index].categoryId);
                              }),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: MyColors.C_F5B88C,
                                        borderRadius: BorderRadius.circular(14)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: Center(
                                          child: Text(
                                              categories[index].categoryName)),
                                    )),
                              ),
                            );
                          });
                    } else {
                      return Container(
                        color: MyColors.C_F5B88C,
                      );
                    }
                  },
                ),
              ),
                  Consumer<ProductViewModel>(
                builder: (context, productViewModel, child) {
                           // productViewModel.products;
                  return  Container(
                    height: m_h(context) * 0.8,
                       child: GridView.builder(
                        shrinkWrap: true,
                       itemCount:  productViewModel.products.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5 / 3.1,
                        mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                        itemBuilder: (BuildContext context, int index) {

                          return buildPadding( productViewModel.products, index);
                        },
                       )
                     );

                   }
                   ,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPadding(List<ProductModel> products, int index) {
    return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (() {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductItemWidget(model: products[index],)));
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.white.withOpacity(0.8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        width: double.infinity,
                                        height: 100.w,
                                        child: CachedNetworkImage(
                                          imageUrl: products[index].productImages[0].toString(),
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) {
                                            return Shimmer.fromColors(
                                              period:
                                                  const Duration(seconds: 2),
                                              baseColor: Colors.grey.shade300,
                                              highlightColor:
                                                  Colors.grey.shade100,
                                              child: Container(
                                                width: 120,
                                                height: 100,
                                                color: Colors.white,
                                              ),
                                            );
                                          },
                                          // errorWidget: (context, url, error) =>
                                          //     const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Text(products[index].productName),
                                    SizedBox(height: 8.h),
                                    Row(
                                      children: [
                                        Text(products[index].price.toString().length > 15 ? products[index].price.toString().substring(0,14) : products[index].price.toString(),),
                                        Text(products[index].currency.length > 10 ? products[index].currency.substring(0,10): products[index].currency)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
  }
}
// {
// return Container(
// height: m_h(context)*0.8,
// child: GridView.builder(
// shrinkWrap: true,
// itemCount: 10,
// physics: const BouncingScrollPhysics(),
// scrollDirection: Axis.vertical,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// childAspectRatio: 2.5 / 3.1,
// mainAxisSpacing: 12,
// crossAxisSpacing: 12,
// ),
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: InkWell(
// onTap: (() {
//
// // Navigator.pushNamed(
// //   context,
// //   RoutName.productInfo,
// //   arguments: {
// //     'productInfo': data[index].id,
// //   },
//
// }),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15.r),
// color: MyColors.C_0F1620,
// ),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Center(
// child: SizedBox(
// width: 100.w,
// height: 100.w,
// child: CachedNetworkImage(
// imageUrl: "Imageurl",
// fit: BoxFit.contain,
// placeholder: (context, url) {
// return Shimmer.fromColors(
// period: const Duration(seconds: 2),
// baseColor: Colors.grey.shade300,
// highlightColor: Colors.grey.shade100,
// child: Container(
// width: 120,
// height: 100,
// color: Colors.white,
// ),
// );
// },
// errorWidget: (context, url, error) =>
// const Icon(Icons.error),
// ),
// ),
// ),
// SizedBox(height: 12.h),
// Text(
// "asdasfasfsadgfa"
// ),
// SizedBox(height: 8.h),
// Text(
// "asfcasdf"
// ),
// ],
// ),
// ),
// ),
// ));
//
// },
// )
// );
// }
