import 'package:dictionary_app/providers/dictionary_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Provider.of<DictionaryProvider>(context).outSideBool == false ? Colors.white : Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Provider.of<DictionaryProvider>(context).outSideBool == false ? Colors.white : Colors.black,
        leading: IconButton(
          icon: Icon(Icons.west_outlined, color: Provider.of<DictionaryProvider>(context).outSideBool == false ?  Colors.black : Colors.white,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: 50,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Consumer<DictionaryProvider>(
              builder: (context, provider, child){
                return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                      const SizedBox(height: 20,),
                      Container(
                        //height: height*0.2,
                        width: width*0.95,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 31, 3, 36), Color.fromARGB(255, 123, 31, 139)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  Text(data['word'], style: const TextStyle(fontSize: 40, fontFamily: 'Rubik', color: Colors.white, fontWeight: FontWeight.w500),),
                                  Expanded(child: Text("(${data['definitions'][0]['type']})", style: const TextStyle(fontSize: 40, fontFamily: 'Rubik', color: Colors.white, fontWeight: FontWeight.w500),)),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  const Text("pronunciation    ", style: TextStyle(fontSize: 16, fontFamily: 'Rubik', color: Color.fromARGB(255, 160, 163, 163), fontWeight: FontWeight.w500),),
                                  Text("[${data['pronunciation']}]", style: const TextStyle(fontSize: 16, fontFamily: 'Rubik', color: Colors.white, fontWeight: FontWeight.w500),),
                                ],
                              ), 
                                              
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        // height: height*0.3,
                        // width: width*0.6,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: data['definitions'][0]['image_url'] == null ? Image.asset('images/no_image.png', height: 150, width: 150,) : Image.network(data['definitions'][0]['image_url'] , width: 150, height: 150,fit: BoxFit.fill),
                      ), 
                      const SizedBox(height: 30,),
                      Container(
                        //height: height*0.4,
                        width: width*0.95,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 31, 3, 36), Color.fromARGB(255, 123, 31, 139)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,20,10,20),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                   Text("Definition:", style: TextStyle(fontSize: 20, fontFamily: 'Rubik', color: Colors.white, fontWeight: FontWeight.w500),),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Text("${data['definitions'][0]['definition']}", textAlign: TextAlign.center ,style: const TextStyle(fontSize: 16, fontFamily: 'Rubik', color: Colors.white, fontWeight: FontWeight.w500),),
                              
                            ],
                          ),
                        ),
                      ), 
                      const SizedBox(height: 10,),   
                      Container(
                        //height: height*0.4,
                        width: width*0.95,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 31, 3, 36), Color.fromARGB(255, 123, 31, 139)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,20,10,20),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text("Example:", style:  TextStyle(fontSize: 20, fontFamily: 'Rubik', color: Colors.white, fontWeight: FontWeight.w500),),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Text(data['definitions'][0]['example'] == null ? "..." : "${data['definitions'][0]['example']}", textAlign: TextAlign.center ,style: const TextStyle(fontSize: 16, fontFamily: 'Rubik', color: Colors.white, fontWeight: FontWeight.w500),),
                              
                            ],
                          ),
                        ),
                      ),  
                      const SizedBox(height: 30,),                                                           
              ],
            );
              }
            )
          ),
        ),
      ),
    );
  }
}