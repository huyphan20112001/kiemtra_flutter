import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<String> list = [
    './assets/img/Picture1.png',
    './assets/img/Picture2.png',
    './assets/img/Picture3.png',
    './assets/img/Picture4.png',
  ];

  bool showGrid = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(context),
              SizedBox(
                height: 20,
              ),
              buildWelcome(context),
              SizedBox(
                height: 20,
              ),
              buildSearch(context),
              SizedBox(
                height: 20,
              ),
              buildSavedPlace(context),
              SizedBox(
                height: 20,
              ),
              showGrid ? bbuildGrid(context) : buildList(context),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                showGrid = true;
              });
            },
            icon: Icon(Icons.notifications)),
        IconButton(
            onPressed: () {
              setState(() {
                showGrid = false;
              });
            },
            icon: Icon(Icons.extension)),
      ],
    );
  }

  buildWelcome(BuildContext context) {
    return Text.rich(TextSpan(
        text: "Welcome, ",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "Charlie",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal))
        ]));
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  buildSavedPlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Saved Places",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: Text("Grid")),
            TextButton(onPressed: () {}, child: Text("List")),
          ],
        )
      ],
    );
  }

  bbuildGrid(BuildContext context) {
    return Expanded(
        child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: [
        ...list
            .map((e) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                          fit: BoxFit.cover)),
                ))
            .toList()
      ],
    ));
  }

  //
  buildList(BuildContext context) {
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        ...list
            .map((e) => Container(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1657214059212-104dac959c56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ))
            .toList()
      ],
    ));
  }
}
