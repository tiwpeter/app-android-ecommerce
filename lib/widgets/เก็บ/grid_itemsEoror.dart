import 'package:flutter/material.dart';
import 'package:flutter_application_ecomert/screens/item_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GridItem extends StatefulWidget {
  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  List<String> imageUrls = [];
  bool isLoading = false;

  Future<void> fetchImages() async {
    if (isLoading) {
      return; // ถ้ากำลังโหลดอยู่ ไม่ต้องทำอะไร
    }

    setState(() {
      isLoading = true;
    });

    final apiUrl = 'http://10.0.2.2:5000/images';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      try {
        // Convert JSON response to a list of maps
        List<Map<String, dynamic>> jsonData =
            (json.decode(response.body) as List<dynamic>)
                .cast<Map<String, dynamic>>();

        // Extract image URLs from the map
        List<String> urls = jsonData
            .map((imageData) => 'http://10.0.2.2:5000/images/jonny.jpg')
            .toList(); // Change the file extension to .jpg

        // Update the state with the retrieved image URLs
        setState(() {
          imageUrls = urls;
        });
      } catch (e) {
        print('Error processing received data: $e');
      }
    } else {
      print('Failed to fetch images: ${response.reasonPhrase}');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (imageUrls.isEmpty) {
      fetchImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            itemCount: imageUrls.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.7,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFD4ECF7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "30% off",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Icon(Icons.favorite, color: Colors.redAccent),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            // Handle image tap
                          },
                          child: Image.network(
                            imageUrls[index],
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Product Name",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "\$100",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "30% off",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
