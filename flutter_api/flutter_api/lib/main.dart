// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_api/model/photos.dart';
// import 'package:flutter_api/services/apiservices.dart';
// import 'lexicapage.dart';
//
// void main() {
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.deepPurple,
//   ));
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           backgroundColor: Colors.deepPurple,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late List<Photo>? _userModel = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }
//
//   void _getData() async {
//     _userModel = (await ApiServices().getPhotos())!;
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               height: 55,
//               color: Colors.deepPurple,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         'Api Calling',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LexicaScreen(),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Icon(
//                         Icons.image,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 children: [
//                   _userModel == null || _userModel!.isEmpty
//                       ? const Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Please Wait....",
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 18),
//                               )
//                             ],
//                           ),
//                         )
//                       : ListView.builder(
//                           itemCount: _userModel!.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Column(
//                               children: [
//                                 _userModel![index].url == null
//                                     ? Container(
//                                         child: CircularProgressIndicator(),
//                                       )
//                                     : Image.network(
//                                         _userModel![index].url,
//                                         height: 100,
//                                         width: 100,
//                                       ),
//                                 Text(_userModel![index].text),
//                               ],
//                             );
//                           },
//                         ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api/model/photos.dart';
import 'package:flutter_api/services/apiservices.dart';
import 'lexicapage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.deepPurple,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.deepPurple,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Photo>? _userModel;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = await ApiServices().getPhotos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 55,
              color: Colors.deepPurple,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Api Calling',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LexicaScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _userModel == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _userModel!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            _userModel![index].url == null
                                ? Container(
                                    child: CircularProgressIndicator(),
                                  )
                                : Image.network(
                                    _userModel![index].url!,
                                    height: 100,
                                    width: 100,
                                  ),
                            Text(_userModel![index].text ?? 'Sumit'),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
