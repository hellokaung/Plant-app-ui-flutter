import 'package:flutter/material.dart';
import 'package:plant_app_ui/data/%20feed.dart';
import 'package:plant_app_ui/my_colors.dart';
import 'package:plant_app_ui/screen/detail.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<recommedData> recommendedList = recommendedFeed;
  List<featuredData> featuredList = featuredFeed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors().mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi Uishopy',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        CircleAvatar(
                          child: Text('Ui'),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Rounded corners for the card
                    ),
                    elevation: 5,
                    shadowColor: const Color.fromARGB(255, 160, 237, 162),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Search',
                              style: TextStyle(
                                color: MyColors().searchforegroundColor,
                              )),
                          Icon(
                            Icons.search_rounded,
                            color: MyColors().searchforegroundColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              feedButtonLayer(() {}, "Recommended", 100),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return recommendedFeedItem(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detailpage(
                                  index,
                                  recommendedList[index].imageUrl,
                                  recommendedList[index].name,
                                  recommendedList[index].price,
                                  recommendedList[index].region)));
                    },
                        recommendedList[index].imageUrl,
                        recommendedList[index].name,
                        recommendedList[index].price,
                        recommendedList[index].region,
                        index);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              feedButtonLayer(() {}, "Featured Plants", 100),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return featuredFeedItem(
                      () {},
                      featuredList[index].imageUrl,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class feedButtonLayer extends StatelessWidget {
  String data = '';
  double lineBg = 0;
  Function mypress = () {};
  feedButtonLayer(this.mypress, this.data, this.lineBg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 10,
                width: lineBg,
                color: Colors.green.shade100,
              ),
              Text(
                data,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 30,
            child: ElevatedButton(
              onPressed: mypress(),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(MyColors().mainColor),
              ),
              child: const Text(
                'More',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class recommendedFeedItem extends StatelessWidget {
  final Function mypress;
  final String imageUrl;
  final String name;
  final String price;
  final String region;
  final int index;
  const recommendedFeedItem(this.mypress, this.imageUrl, this.name, this.price,
      this.region, this.index,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mypress(),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Rounded corners for the card
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "image$index",
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ), // Rounded corners for the image
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover, // Ensure the image fits properly
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name.toUpperCase()),
                    Text(
                      price,
                      style: TextStyle(
                        color: MyColors().mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  region,
                  style: TextStyle(color: MyColors().searchforegroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class featuredFeedItem extends StatelessWidget {
  final Function mypress;
  final String imageUrl;

  const featuredFeedItem(this.mypress, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mypress(),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Rounded corners for the card
          ),
          child: Container(
            // height: 150,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(10)), // Rounded corners for the image
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover, // Ensure the image fits properly
              ),
            ),
          ),
        ),
      ),
    );
  }
}
