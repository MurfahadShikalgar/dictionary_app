import 'package:dictionary_app/providers/dictionary_provider.dart';
import 'package:dictionary_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const DictionaryApp());
}
class DictionaryApp extends StatelessWidget {
  const DictionaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DictionaryProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ); 
  }
}