import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoponline/ui/Login/login_widgets/widget_tree.dart';
import 'package:provider/provider.dart';
import 'package:shoponline/ui/main/mainPage.dart';
import 'package:shoponline/view_model/category_view_model.dart';
import 'package:shoponline/view_model/login_view_model.dart';
import 'package:shoponline/view_model/products_veiw_model.dart';
import 'data/login_register/auth.dart';
import 'data/repositories/categories_repository.dart';
import 'data/repositories/products_repository.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var fireStore = FirebaseFirestore.instance;

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoriesViewModel(
            categoryRepository: CategoryRepository(
              firebaseFirestore: fireStore,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(
            productRepository: ProductRepository(
              firebaseFirestore: fireStore,
            ),
          ),
        ),
        Provider(
        create: (context) => AuthViewModel(
           auth: Auth(firebaseAuth: FirebaseAuth.instance))
         ),
      ],

      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(423.5294,843.13727),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext contex, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        );
      },
    );
  }
}

// yozgan file ga kirin