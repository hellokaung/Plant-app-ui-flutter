import 'package:flutter/material.dart';
import 'package:plant_app_ui/my_colors.dart';

// ignore: must_be_immutable
class Detailpage extends StatelessWidget {
  int index;
  String imageUrl;
  String name;
  String price;
  String region;
  Detailpage(this.index, this.imageUrl, this.name, this.price, this.region,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Body(index, imageUrl, name, price, region),
    );
  }
}

// ignore: must_be_immutable
class Body extends StatefulWidget {
  int index;
  String imageUrl;
  String name;
  String price;
  String region;
  Body(this.index, this.imageUrl, this.name, this.price, this.region,
      {super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final double appBarHeight = kToolbarHeight;

  bool currentBuyButton = true;

  bool currentdescButton = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: appBarHeight * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        infoItem(Icons.wb_sunny_outlined),
                        infoItem(Icons.water_drop_outlined),
                        infoItem(Icons.dew_point),
                        infoItem(Icons.air),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: MyColors().shadowColor,
                                  blurRadius: 30,
                                  spreadRadius: 1,
                                  offset: const Offset(
                                      -5, 5), // Shadow towards the left-bottom
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                              child: Hero(
                                tag: "image${widget.index}",
                                child: Image.network(
                                  widget.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              myAppBar(appBarHeight)
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text(widget.region,
                        style:
                            TextStyle(color: MyColors().searchforegroundColor))
                  ],
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 17,
                    color: MyColors().mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              myButton(() {
                currentBuyButton = true;
                currentdescButton = !currentBuyButton;
                setState(() {});
              }, true, "Buy Now", currentBuyButton),
              myButton(() {
                currentBuyButton = false;
                currentdescButton = !currentBuyButton;
                setState(() {});
              }, false, "Description", currentdescButton)
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class infoItem extends StatelessWidget {
  IconData icon;
  infoItem(this.icon, {super.key});
  @override
  Widget build(Object context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: MyColors().searchforegroundColor,
                blurRadius: 40,
                spreadRadius: 1,
                offset: const Offset(5, 10))
          ]),
      child: Icon(
        icon,
        color: MyColors().mainColor,
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class myButton extends StatelessWidget {
  bool leftButton;
  String text;
  Function mypress = () {};
  bool currentButton;
  myButton(this.mypress, this.leftButton, this.text, this.currentButton,
      {super.key});

  double topLeft = 30;

  double topRight = 30;

  Color activeBgColor = MyColors().mainColor;

  Color activeTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    if (leftButton) {
      topLeft = 0;
    } else {
      topRight = 0;
    }
    if (!currentButton) {
      activeBgColor = Colors.transparent;
      activeTextColor = Colors.black;
    }
    return Expanded(
      child: InkWell(
        onTap: () => mypress(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              color: activeBgColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeft),
                  topRight: Radius.circular(topRight))),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: activeTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class myAppBar extends StatelessWidget {
  double appBarHeight;
  myAppBar(this.appBarHeight, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: appBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
        ));
  }
}
