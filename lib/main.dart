import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:meditasi_app/view/screen/register_screen/sign_signup_screen.dart';
import 'package:meditasi_app/view/themes/theme.dart';

import 'view/screen/image_picker/image_picker_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: Builder(
        builder: (context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: context.theme.material,
            home: const AppStartingPage(),
          );
        },
      ),
    );
  }
}

class AppStartingPage extends StatelessWidget {
  const AppStartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MeditationSoundPage();
    return ImagePickerPage();
    // return const ProsesSignSignUp();
  }
}
