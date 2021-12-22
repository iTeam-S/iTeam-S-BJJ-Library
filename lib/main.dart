import 'package:bjj_library/service/api.dart';
import 'package:bjj_library/controller/users.dart';
import 'package:bjj_library/view/confirm_pass.dart';
import 'package:bjj_library/view/play_video.dart';
import 'package:bjj_library/view/reinitialize_pass.dart';
import 'package:bjj_library/view/signup.dart';
import 'package:bjj_library/view/video_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bjj_library/view/splash.dart';
import 'package:bjj_library/view/login.dart';
import 'package:bjj_library/view/forgot_pass.dart';
import 'package:bjj_library/view/home.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // await GetStorage.init();
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  final UserController userController = Get.put(UserController());
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      // if (box.hasData('user')) {
      //   Map usrTmp = box.read('user');
      //   userController.user = User(
      //     email: usrTmp['email'],
      //     admin: usrTmp['admin'],
      //     id: usrTmp['id'],
      //     token: usrTmp['token'],
      //   );

      //   var vidtmp = usrTmp['video'];
      //   if (vidtmp != null) {
      //     userController.user.video['id'] = vidtmp['id'];
      //     userController.user.video['pos'] = Duration(seconds: vidtmp['pos']);
      //   }
      //   Get.offNamed('/home');
      //   return;
      // }
      Get.offNamed('/login');
    });

    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        primarySwatch: Colors.blue,
        fontFamily: "ProductSans",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignScreen(),
        '/forgot': (context) => ForgotScreen(),
        '/confirm_pass': (context) => ConfirmScreen(),
        '/reinitialize_pass': (context) => ReinitializeScreen(),
        '/home': (context) => HomeScreen(),
        '/video': (context) => VideoScreen(),
        '/videolist': (context) => VideoListScreen()
      },
    );
  }
}
