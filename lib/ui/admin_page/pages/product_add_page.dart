import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoponline/data/models/category.dart';
import 'package:shoponline/data/models/product_model.dart';
import 'package:shoponline/utils/my_colors.dart';
import 'package:shoponline/view_model/products_veiw_model.dart';
import '../../../data/services/file_uploader.dart';
import '../../../view_model/category_view_model.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({Key? key}) : super(key: key);

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final ImagePicker _picker = ImagePicker();
   XFile? _image;
   String imageUrl = "";
   bool isLoading = false;
    List<dynamic> images = [];

final TextEditingController _countController = TextEditingController();
final TextEditingController _priceController = TextEditingController();
final TextEditingController _productNameController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
final TextEditingController _currencyController = TextEditingController();
String _categoryId = "";
String choosenCategory='Choose category';
class _ProductAddPageState extends State<ProductAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.C_0F1620,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70.h,),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  width: 100.w,
                  height: 100.h,
                  child: imageUrl.isEmpty
                      ? Icon(Icons.image)
                      : Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showPicker(context);

                  },
                  child: Text("Select Image"),
                ),

                StreamBuilder(
                stream: Provider.of<CategoriesViewModel>(context,listen: false).listenCategories(),
                builder: (context, snapshot) {
                if (snapshot.hasData) {
                List<CategoryModel>? categories=snapshot.data;
                return DropdownButtonHideUnderline(
                child: DropdownButton(
                hint:  Text(choosenCategory, style: TextStyle(color: Colors.white),),

                items: categories?.map((e) => DropdownMenuItem(
                onTap: (){
                choosenCategory=e.categoryName;
                _categoryId=e.categoryId;
                setState((){});
                },
                value: categories,
                child: Text(e.categoryName))).toList(),
                onChanged: (value) {},));
                }
                else return Container();
                }),

                mytextfield(_productNameController, "Name"),
                 SizedBox(height: 10.h,),
                mytextfield(_priceController, "Price"),
                SizedBox(height: 10.h,),
                mytextfield(_countController, "Count"),
                SizedBox(height: 10.h,),
                mytextfield(_descriptionController, "Description"),
                SizedBox(height: 10.h,),
                mytextfield(_currencyController, "Currency"),
                SizedBox(height: 10.h,),


                Padding(
                  padding: const EdgeInsets.all(60),
                  child: InkWell(
                    onTap: (() {
                      if (_formKey.currentState?.validate() == true && imageUrl.isNotEmpty && _categoryId!="") {
                        context.read<ProductViewModel>().addProduct(
                            ProductModel(count: int.parse(_countController.text),
                                price: int.parse(_priceController.text),
                                productImages: [imageUrl],
                                categoryId: _categoryId,
                                productId: "",
                                shopId: "",
                                productName: _productNameController.text,
                                description: _descriptionController.text,
                                createdAt: DateTime.now().toString(),
                                currency: _currencyController.text));
                        showSnackBarSuccess();
                      } else {
                        return showSnackBar();
                      }
                    }),
                    child: Container(
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.r),
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
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding mytextfield(TextEditingController controllerText, String hinttext) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
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
              cursorHeight: 25.h,
              cursorColor: Colors.blue,
              validator: (value) {
                if (value!.length < 1) return "Enter $hinttext";
              },
              controller: controllerText,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
                height: 25.0 / 15,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: hinttext,
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
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Gallery"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1000,
      maxHeight: 1000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {
        isLoading = true;
      });
      imageUrl = await FileUploader.imageUploader(pickedFile);
      setState(() {
        isLoading = false;
        _image = pickedFile;
      });
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      imageUrl = await FileUploader.imageUploader(pickedFile);
      setState(() {
        _image = pickedFile;
      });
    }
  }

  void showSnackBar(){
     AnimatedSnackBar.rectangle(
       'Warning',
       "Rasm pasm categoriyalarni hammasini to'ldiring!",
       type: AnimatedSnackBarType.error,
       brightness: Brightness.dark,
     ).show(
       context,
     );

   }

  void showSnackBarSuccess(){
    AnimatedSnackBar.rectangle(
      'Good job',
      "FireBasega qo'shib keldik shep",
      type: AnimatedSnackBarType.success,
      brightness: Brightness.dark,
    ).show(
      context,
    );

  }

}

