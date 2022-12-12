import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoponline/data/models/category.dart';
import 'package:shoponline/utils/my_colors.dart';
import '../../../view_model/category_view_model.dart';

class CategoryAddPage extends StatefulWidget {
  const CategoryAddPage({Key? key}) : super(key: key);

  @override
  State<CategoryAddPage> createState() => _CategoryAddPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final TextEditingController _controllercategoryName = TextEditingController();
final TextEditingController _controllerdescription = TextEditingController();
final TextEditingController _controllerimageUrl = TextEditingController();

class _CategoryAddPageState extends State<CategoryAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_0F1620,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(1, 1), // Shadow position
                        ),
                      ]),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextFormField(
                        cursorHeight: 25,
                        cursorColor: Colors.blue,
                        validator: (value) {
                          if (value!.length < 1)
                            return "Please Enter Category Name";
                        },
                        controller: _controllercategoryName,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          height: 25.0 / 15,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Category Name",
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white.withOpacity(0)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white.withOpacity(0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(1, 1), // Shadow position
                        ),
                      ]),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextFormField(
                        cursorHeight: 25,
                        cursorColor: Colors.blue,
                        validator: (value) {
                          if (value!.length < 1) return "Enter Description";
                        },
                        controller: _controllerdescription,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          height: 25.0 / 15,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Description",
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white.withOpacity(0)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white.withOpacity(0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(1, 1), // Shadow position
                        ),
                      ]),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextFormField(
                        cursorHeight: 25,
                        cursorColor: Colors.blue,
                        validator: (value) {
                          if (value!.length < 5) return "Enter Image Url";
                        },
                        controller: _controllerimageUrl,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          height: 25.0 / 15,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Image Url",
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white.withOpacity(0)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white.withOpacity(0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(60),
                child: InkWell(
                  onTap: (() {
                    if (_formKey.currentState?.validate() == true) {
                      //   context.read<CategoriesViewModel>().addCategory(CategoryModel(categoryId: "", categoryName: _controllercategoryName.text, description: _controllerdescription.text, imageUrl: _controllerimageUrl.text, createdAt: DateTime.now().toString()));
                      //
                      // } else {
                      //   return;
                      // }
                      context.read<CategoriesViewModel>().addCategory(
                          CategoryModel(
                              categoryId: "",
                              categoryName: _controllercategoryName.text,
                              description: _controllerdescription.text,
                              imageUrl: _controllerimageUrl.text,
                              createdAt: DateTime.now().toString()));
                    } else {
                      return;
                    }
                  }),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Add Firebase",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}