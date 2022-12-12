import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoponline/data/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:shoponline/utils/my_colors.dart';
import 'package:shoponline/view_model/products_veiw_model.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductModel model;


  ProductItemWidget({Key? key, required this.model, }) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

int categoryindex = 0;

class _ProductItemWidgetState extends State<ProductItemWidget> {

  @override
  Widget build(BuildContext context) {

          return Scaffold(
            backgroundColor: MyColors.C_F5B88C,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        width: 200.w,
                        height: 200.h,
                        child: CachedNetworkImage(

                          imageUrl: widget.model.productImages[0].toString(),
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

                    SizedBox(height: 20.r),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Product name:',
                              style: GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18)
                            ),
                            SizedBox(width: 10.w,),
                            Text(widget.model.productName,
                                style:  GoogleFonts.barlow(color: Colors.white, fontSize: 18),
                              ),

                          ],
                        ),

                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Text(
                              'Price:',
                              style: GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(width: 8.w,),
                            Text(
                              "\$ ${widget.model.price}",
                             style:  GoogleFonts.barlow(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),

                      ],
                    ),
                    SizedBox(height: 20.r),

                      Text(
                        'Description',
                          style: GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18)
                      ),

                    SizedBox(height: 15.r),
                    Container(
                      height: 200.h,
                      child: Text(
                      widget.model.description,
                        style:  GoogleFonts.barlow(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 130.h),
                    InkWell(
                      borderRadius: BorderRadius.circular(15.r),
                      onTap: (() async {

                      }),
                      child: Container(
                        width: double.infinity,
                        height: 75.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          gradient: const LinearGradient(
                            colors: [
                              MyColors.C_0F1620,
                              Colors.blueAccent
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Add to cart",
                            style:  TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }



}
