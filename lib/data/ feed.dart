// ignore: camel_case_types
class recommedData {
  String imageUrl;
  String name;

  String price;

  String region;

  recommedData(
      {required this.imageUrl,
      required this.name,
      required this.price,
      required this.region});
}

// ignore: camel_case_types
class featuredData {
  String imageUrl;

  featuredData({required this.imageUrl});
}

List<recommedData> recommendedFeed = [
  recommedData(
      imageUrl:
          "https://plant.studio/cdn/shop/files/1BF37612-18C8-495C-9B6B-177C9B70867F.jpg?v=1695458831&width=1946",
      name: "Samantha",
      price: "\$400",
      region: "Russia"),
  recommedData(
      imageUrl:
          "https://www.thespruce.com/thmb/pk6HeIjCkjKlhphYqGYzrFDdsR8=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/crasslua-1-b7370572a73045dcb04f9734b7ce77c8.jpg",
      name: "Silver",
      price: "\$120",
      region: "Burma"),
  recommedData(
      imageUrl:
          "https://www.thespruce.com/thmb/AP31Uo9taa9xjvAf6wc_G9AJa9U=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/grow-sedum-morganianum-1902975-01-da48acd20ef24c8783c1b979d75eee9f-91b3a6b9e94a4b7982f5fed37bb6c174.jpg",
      name: "Donkey's",
      price: "\$100",
      region: "America"),
  recommedData(
      imageUrl:
          "https://www.thespruce.com/thmb/2xMhBZNjmIn3cGGXS9NwP4J-6No=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/how-to-grow-mexican-snowball-echeveria-elegans-01-b35b412ea9ce4bdcbe22b322623edf19-b3eba95d24a94d778d2ed92c571c0b00.jpg",
      name: "Mexican",
      price: "\$200",
      region: "Myanmar"),
  recommedData(
      imageUrl:
          "https://www.thespruce.com/thmb/Xh_Hw5BfoW3EzChMT8X9Ymhl0uk=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/how-to-grow-euphorbia-ingens-hero-355f296552ca41a2abfcbc8dbbeb43b0.jpg",
      name: "Cactus",
      price: "\$700",
      region: "Thailand"),
];
List<featuredData> featuredFeed = [
  featuredData(
      imageUrl:
          "https://kyora.com.au/wp-content/uploads/2017/06/bromeliad-300x199.jpg"),
  featuredData(
      imageUrl:
          "https://growingoutdoors.com.au/wp-content/uploads/2021/08/Cordylines-Electric-Pink-300x250.jpg"),
  featuredData(
      imageUrl:
          "https://nativeplantproject.com.au/wp-content/uploads/2018/11/94b3fcad4f38028c8cf8c2cdbafdc45c-1.jpg"),
  featuredData(
      imageUrl:
          "https://st.hzcdn.com/simgs/pictures/landscapes/canna-pretoria-img~a45126140f7dd8d1_14-8146-1-78950f4.jpg"),
  featuredData(
      imageUrl:
          "https://cdn.prod.website-files.com/5d2fb52b76aabef62647ed9a/615e3d1484ca975776d42683_top-12-featured-plants-from-landscaping-week-on-the-block-2021-thumb.jpg")
];
