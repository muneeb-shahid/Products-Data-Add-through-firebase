import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';

class AllProductsView extends StatelessWidget {
  AllProductsView({super.key});
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  getAllProducts() async {
    return products.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
            future: getAllProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          children: [
                            Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.22,
              child: Image(
                // color: rectangularColor,
                image: AssetImage("assets/images/Rectangle 27.png"),
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            child: Image(
                color: AppColors.app_white_Color,
                image: AssetImage('assets/images/Vector1.png')),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: Image(
                color: AppColors.app_white_Color,
                image: AssetImage('assets/images/Vector2.png')),
          ),
          Positioned(
              left: 30,
              top: 30,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "google",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Image(
                          image: AssetImage(
                              'assets/images/detailProduct hand.png')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ],
                  )
                ],
              )),
          Positioned(
              left: 30,
              top: 60,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    snapshot.data.docs[index]['name'],
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.black),
                  ))),
          Positioned(
              left: 30,
              top: 120,
              child: Text(
              snapshot.data.docs[index]['price'],
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )),
          const Positioned(
              top: 110,
              left: 90,
              child: Image(
                  height: 70,
                  width: 70,
                  image: AssetImage('assets/images/black heart.png'))),
          Positioned(
            top: 110,
            left: 160,
            child: InkWell(
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => OrderScreen(),
              //       ));
              // },
              child: Image(
                  height: 70,
                  width: 70,
                  image: AssetImage('assets/images/detailproduct_add.png')),
            ),
          ),
          Positioned(
              top: 8,
              right: -20,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                // child:
                //  Image(
                //   image: AssetImage(productImage),
                // ),
              )),
        ],
      ),
                          ],
                        )

                        // subtitle: Text(snapshot.data.docs[index]['price']),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}



topPick(context,  productName, productPrice, ) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => DetailProductPage(),
      //       ));
      // },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.22,
              child: Image(
                // color: rectangularColor,
                image: AssetImage("assets/images/Rectangle 27.png"),
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            child: Image(
                color: AppColors.app_white_Color,
                image: AssetImage('assets/images/Vector1.png')),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: Image(
                color: AppColors.app_white_Color,
                image: AssetImage('assets/images/Vector2.png')),
          ),
          Positioned(
              left: 30,
              top: 30,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "google",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Image(
                          image: AssetImage(
                              'assets/images/detailProduct hand.png')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ],
                  )
                ],
              )),
          Positioned(
              left: 30,
              top: 60,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    productName,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.black),
                  ))),
          Positioned(
              left: 30,
              top: 120,
              child: Text(
                productPrice,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )),
          const Positioned(
              top: 110,
              left: 90,
              child: Image(
                  height: 70,
                  width: 70,
                  image: AssetImage('assets/images/black heart.png'))),
          Positioned(
            top: 110,
            left: 160,
            child: InkWell(
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => OrderScreen(),
              //       ));
              // },
              child: Image(
                  height: 70,
                  width: 70,
                  image: AssetImage('assets/images/detailproduct_add.png')),
            ),
          ),
          Positioned(
              top: 8,
              right: -20,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                // child:
                //  Image(
                //   image: AssetImage(productImage),
                // ),
              )),
        ],
      ),
    );
  }