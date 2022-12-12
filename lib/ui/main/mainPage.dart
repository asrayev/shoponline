import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoponline/ui/admin_page/admin_main_page.dart';
import 'package:shoponline/ui/main/pages/cart_page.dart';
import 'package:shoponline/ui/main/pages/home/home_page.dart';
import 'package:shoponline/ui/main/pages/search_page.dart';
import 'package:shoponline/utils/icon.dart';
import 'package:shoponline/utils/myMediaquery.dart';

import '../../utils/my_colors.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage=0;
  List pages=[
    HomePage(),
    SearchPage(),
    CartPage(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[currentPage],
          Column(
            children: [
              SizedBox(height: m_h(context)*0.9,),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: m_w(context)*0.04, right: m_w(context)*0.04),
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(

                      color: MyColors.C_F5B88C,
                      borderRadius: BorderRadius.circular(30.h),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.3),
                          blurRadius: 2,
                          offset: Offset(3, 4), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 35.w, left: 35.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: ((){
                                setState(() {
                                    currentPage=0;
                                     });
                                }),
                                child: SvgPicture.asset(MyIcons.home)),
                            InkWell(
                                onTap: ((){
                                  setState(() {
                                    currentPage=1;
                                  });
                                }),
                                child: SvgPicture.asset(MyIcons.search)),
                            InkWell(
                                onTap: ((){
                                  setState(() {
                                    currentPage=2;
                                  });
                                }),
                                child: SvgPicture.asset(MyIcons.cart)),
                            InkWell(
                                onTap: ((){
                                  setState(() {
                                    currentPage=3;
                                  });
                                }),
                                child: Icon(Icons.person))

                          ],
                      ),
                    ),
                    ),
                ),
              ),
            ],
          )
        ],
      )

      //
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentPage,
      //   onTap: ((v){
      //     setState(() {
      //       currentPage=v;
      //     });
      //   }),
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
      //   ],
      // ),
    );
  }
}