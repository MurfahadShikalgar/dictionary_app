import 'dart:convert';
import 'package:dictionary_app/helpers/constant.dart';
import 'package:dictionary_app/providers/dictionary_provider.dart';
import 'package:dictionary_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  String url = "https://owlbot.info/api/v4/dictionary/";
  String token = "8e91489959f0713d9cd4ddfe5b07b3ee92c30440";
  bool themeMode = true;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<DictionaryProvider>(context).outSideBool == false ? Colors.white : Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<DictionaryProvider>(
            builder: (context, provider, child){
              return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 30,),
            Row(
              children: [
                const SizedBox(width: 20,),
                IconButton(
                  onPressed: (){
                    themeMode = provider.updateThemeMode(themeMode);
                  }, 
                  icon: Icon(Icons.brightness_4_rounded, color: themeMode == false ? Colors.black : Colors.yellow,)
                )
              ],
            ),
            Image.asset("images/logo.png", height: 240,),
            Text("Dictionary", style: TextStyle(fontSize: 30, color: themeMode == false ? Colors.black : Colors.white, fontWeight: FontWeight.normal, fontFamily: 'Rubik'),),
            Text("Find defination and images of related words.", style: TextStyle(fontSize: 14, color: themeMode == false ? lightGreyColor : Colors.white, fontFamily: 'Rubik', fontWeight: FontWeight.w200),),
            // ignore: prefer_const_constructors
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,8,20,8),
              child:  Material(
                elevation: 2,
                color: themeMode == false ? Colors.white : const Color.fromARGB(255, 46, 39, 39),
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(' ')
                  ],
                  controller: searchController,
                  style: TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w100, color: themeMode == false ? Colors.black : Colors.white),
                  decoration:  InputDecoration(
                    hintText: "Search by word",
                    hintStyle: TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w100, color: themeMode == false ? lightGreyColor : Colors.white),
                    prefixIcon: Icon(Icons.search_rounded, color: themeMode == false ? lightGreyColor : Colors.white),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 90,),
            InkWell(
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    colors: [ Color.fromARGB(255, 253, 34, 18), Color.fromARGB(255, 109, 30, 30)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                  )
                ),
                child: const Center(child: Icon(Icons.memory, color: Colors.white,),),
              ),
              onTap: () async {
                getDictionaryData(context);
              },
            ),
          ],
         );
            }
          )        
        ),
      ),
    );
  }

  void getDictionaryData(BuildContext context) async {
    String add = url + searchController.text.trim();
    Uri uriLink = Uri.parse(add);                 
    Response response = await get( uriLink, 
      headers: {"Authorization": "Token $token"});
    Map decodedJson = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen(data: decodedJson))).whenComplete(() {
      searchController.clear();
    });    
  }
}