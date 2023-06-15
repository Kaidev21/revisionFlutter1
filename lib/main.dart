import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BasicsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon App Basique"),
        leading: const Icon(Icons.favorite),
        actions: const [
          Icon(Icons.handyman),
          Icon(Icons.border_color)
        ],
        centerTitle: true,
        elevation: 9,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: const EdgeInsets.only(top: 15),
        child: Center (
            child: Card (
              elevation: 7.5,
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      const Text("Test de la colonne"),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          fromAsset(height: 200, width: MediaQuery.of(context).size.width),
                          Padding(
                            padding: EdgeInsets.only(top: 150),
                            child: profilePicture(radius: 50),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(Icons.favorite, color: Colors.white,),
                              Icon(Icons.height, color: Colors.white),
                              Spacer(),
                              Text("Un autre élément", style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18
                              ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.teal,
                        height: 10,
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/brachHouse.jpg"),
                            fit: BoxFit.cover
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.yellow,
                              offset: Offset(2, 2),
                              blurRadius: 2,
                              spreadRadius: 1
                            ),
                          ],
                          //shape: BoxShape.circle
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Text("Container"),
                      ),
                      Container(
                        color: Colors.teal,
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            profilePicture(radius: 30),
                            // fromAsset(height: 80, width: 80),
                            Expanded(child: simpleText("Yann Kai_Dev")),
                          ],
                        ),
                      ),
                      fromNetwork(),
                      spanDemo(),
                      fromNetwork(),
                    ],
                  ),
                ),

              )
            )
        ),
      ),
    );
  }

  CircleAvatar profilePicture({required double radius}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue,
      foregroundImage: AssetImage("images/yann3.jpg"),
    );
  }

  Image fromAsset({required double height, required double width}) {
    return Image.asset(
      "images/brachHouse.jpg",
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }

  Image fromNetwork() {
    return Image.network(
      "https://render.fineartamerica.com/images/images-profile-flow/400/images/artworkimages/mediumlarge/2/spinosaurus-vs-tyrannosaurus-herschel-hoffmeyer.jpg",
        fit: BoxFit.cover,
        height: 130,
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600,
          fontSize: 40, fontStyle: FontStyle.italic),
      textAlign: TextAlign.center,
    );
  }

  Text spanDemo() {
    return const Text.rich(
      TextSpan(
          text: "Salut",
          style: TextStyle(color: Colors.red),
          children: [
            TextSpan(
                text: "2e TextSpan",
                style: TextStyle(fontSize: 30, color: Colors.grey)
            ),
            TextSpan(
                text: "aam",
                style: TextStyle(fontSize: 30, color: Colors.blueAccent)
            )
          ]
      ),
    );
  }
}

