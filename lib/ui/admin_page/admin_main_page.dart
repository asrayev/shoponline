import 'package:flutter/material.dart';
import 'package:shoponline/ui/admin_page/pages/category_add_page.dart';
import 'package:shoponline/ui/admin_page/pages/product_add_page.dart';
import 'package:shoponline/utils/my_colors.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_0F1620,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
        Column(
          children: [
            SizedBox(height: 400,),
            InkWell(
              onTap: ((){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryAddPage()));
              }),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue
                ),
                height: 50,
                width: 300,
                child: Center(child: Text("Category add", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),)),
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: ((){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductAddPage()));
              }),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                ),
                height: 50,
                width: 300,
                child: Center(child: Text("Product add", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
