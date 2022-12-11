import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/category.dart';
import '../../../data/models/forDropDownList.dart';
import '../../../view_model/category_view_model.dart';
import '../../admin_page/admin_main_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [

            SizedBox(height: 300,),
            Center(
              child: InkWell(

                  onTap: ((){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminMainPage()));
                  }),


                  child: Text("Admin Page")),
            ),
          ],
        ),
      ),
    );
  }
}
