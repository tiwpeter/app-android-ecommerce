import 'package:flutter/material.dart';
import 'package:flutter_application_ecomert/item_screen.dart';

class GridItem extends StatelessWidget {
  var pNames = [
    "Apple Watch -M2",
    "White Tshirt",
    "Nike Shoe",
    "Ear Headphone",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pNames.length,
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
                // รูปที่ถูกใต้ top cate
                Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemScreen()));
                    },
                    child: Image.asset(
                      "images/${pNames[index]}.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // ข้อความ
                Text(
                  pNames[index],
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
                      "\100",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    //text off
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
  }
}
