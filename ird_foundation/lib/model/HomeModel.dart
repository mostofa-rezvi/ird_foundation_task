class HomeModel {
  final String image;
  final String title;
  final String subtitle;

  HomeModel({required this.image, required this.title, required this.subtitle});
}

List<HomeModel> homeList = [
  HomeModel(image: 'assets/dreamsvile_house.png', title: 'Dreamsvile House', subtitle: 'Jl. Sultan Iskandar Muda'),
  HomeModel(image: 'assets/digital_marketing.png', title: 'Sample Item 2', subtitle: 'Jl. Sultan Iskandar Muda'),
];
