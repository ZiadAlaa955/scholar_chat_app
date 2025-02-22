import 'package:flutter/material.dart';
import '../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> initializeFirebae() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void snackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

OutlineInputBorder outlineInputBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  );
}
