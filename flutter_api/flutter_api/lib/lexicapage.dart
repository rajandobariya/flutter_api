import 'package:flutter/material.dart';
import 'package:flutter_api/fullimage.dart';
import 'package:flutter_api/model/lexica.dart';
import 'package:flutter_api/services/lexicaapiservieces.dart';

class LexicaScreen extends StatefulWidget {
  @override
  _LexicaScreenState createState() => _LexicaScreenState();
}

class _LexicaScreenState extends State<LexicaScreen> {
  final LexicaApiService apiService = LexicaApiService();
  List<Lexica> lexicaList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final data = await apiService.getPhotos();
      setState(() {
        lexicaList = data;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // change your color here
        ),
        title: Text(
          'Lexica Images',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: lexicaList.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(6.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 262),
          itemCount: lexicaList.length,
          itemBuilder: (context, index) {
            final lexica = lexicaList[index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LexicaFullScreen(
                            lexicaList: lexicaList, index: index),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://image.lexica.art/full_webp/${lexica.id}",
                        fit: BoxFit.cover,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
