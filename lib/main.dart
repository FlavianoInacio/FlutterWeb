import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/util/app_colors.dart';
import 'package:myapp/util/app_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AppModel(),
          )
        ],
          child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.blue,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: AppColors.blue,
              fontSize: 22,
              fontFamily: "Sofia"
            )
          )
        ),
        home: HomePage(),
      ),
    );
  }
}
