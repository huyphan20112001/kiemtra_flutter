import 'package:didong/model/product_model.dart';
import 'package:didong/provider/product_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool typeListImage = true;
  Set<ProductModel> listCart = Set();
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();
    Set<String> listCategory = Set();
    productProvider.list.forEach((element) {
      listCategory.add(element.category.toString());
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...listCategory
                    .map((e) => TextButton(
                        onPressed: () {}, child: Text(e.toUpperCase())))
                    .toList(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildSearch(context),
          SizedBox(
            height: 20,
          ),
          buildSavePlate(context, listCart),
          SizedBox(
            height: 20,
          ),
          typeListImage
              ? (Expanded(
                  child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    ...productProvider.list.map((e) {
                      String price = (e.price.toString());

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.network(
                              e.image ?? "",
                              width: 100,
                              height: 150,
                            ),
                            Text(e.title ?? ""),
                            Text("$price"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                productSingle(context, e)),
                                      );
                                    },
                                    child: Text("Details")),
                                TextButton(
                                    onPressed: () {
                                      listCart.add(e);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                cart(context, listCart)),
                                      );
                                    },
                                    child: Icon(Icons.shopping_bag_outlined))
                              ],
                            )
                          ],
                        ),
                      );
                    }).toList()
                  ],
                )))
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...productProvider.list.map((e) {
                          String price = (e.price.toString());
                          return Container(
                            margin: EdgeInsets.all(20),
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    e.image ?? "",
                                    width: 100,
                                    height: 150,
                                  ),
                                  Text(e.title ?? ""),
                                  Text(price ?? ""),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (
                                                context,
                                              ) =>
                                                      productSingle(
                                                          context, e)),
                                            );
                                          },
                                          child: Text("Details")),
                                      TextButton(
                                          onPressed: () {
                                            listCart.add(e);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      cart(context, listCart)),
                                            );
                                          },
                                          child:
                                              Icon(Icons.shopping_bag_outlined))
                                    ],
                                  )
                                ]),
                          );
                        }).toList()
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  buildSavePlate(BuildContext context, list) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    typeListImage = false;
                  });
                },
                child: Icon(Icons.list)),
            TextButton(
                onPressed: () {
                  setState(() {
                    typeListImage = true;
                  });
                },
                child: Icon(Icons.grid_3x3)),
          ],
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cart(context, list)),
                  );
                },
                child: Icon(Icons.shopping_cart)),
          ],
        )
      ],
    );
  }

  productSingle(BuildContext context, product) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        SizedBox(
          height: 20,
        ),
        Image.network(
          product.image ?? "",
          width: 100,
          height: 150,
        ),
        Text(
          product.title ?? "",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        Text(product.price.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20)),
        TextButton(
            onPressed: () {
              listCart.add(product);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => cart(context, listCart)),
              );
            },
            child: Icon(Icons.shopping_bag_outlined))
      ],
    );
  }

  cart(BuildContext context, list) {
    num totalPrice() {
      num total = 0;
      for (var e in listCart) {
        total += e.price!;
      }
      return total;
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new)),
            ...list.map((e) {
              String price = (e.price.toString());
              return Container(
                margin: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        e.image ?? "",
                        width: 30,
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title ?? "",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            price ?? "",
                            style: TextStyle(color: Colors.black, fontSize: 11),
                          ),
                        ],
                      )
                    ]),
              );
            }).toList(),
            Column(
              children: [
                Row(
                  children: [Text("Total: "), Text(totalPrice().toString())],
                ),
                TextButton(onPressed: () {}, child: Text("Check out"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
