import 'package:coinkoi/core/theme/color_theme.dart';
import 'package:coinkoi/core/theme/text_theme.dart';
import 'package:coinkoi/data/services/service.dart';
import 'package:coinkoi/modules/btm_navigation.dart';
import 'package:coinkoi/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<DbService>(() async => await DbService());
  print(' the service is on');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.grey.shade900,
        // primaryColor: Colors.black,
        // colorScheme: ColorScheme.dark(),

        brightness: Brightness.dark,
        primaryColor: koiColor,
        //textTheme: CustomTextTheme().customs,
      ),
      home: BottomNavigationScreen(),
      getPages: AppPages.pages,
    );
  }
}