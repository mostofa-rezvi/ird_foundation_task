import 'package:flutter/material.dart';
import 'package:ird_foundation/main.dart';
import 'package:ird_foundation/model/CategoryModel.dart';
import 'package:ird_foundation/model/HomeModel.dart';
import 'package:ird_foundation/pages/HouseDetails.dart';

class HomeScreen extends StatelessWidget {
  final bool hasNotifications;
  final List<String> notifications;


  const HomeScreen({
    Key? key,
    this.hasNotifications = false,
    this.notifications = const [],
  }) : super(key: key);



  void showNotifications(BuildContext context, List<String> notifications) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifications'),
          content: SizedBox(
            height: 200,
            width: double.maxFinite,
            child: notifications.isNotEmpty
                ? ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.travel_explore),
                        title: Text(notifications[index]),
                      );
                    },
                  )
                : const Center(
                    child: Text('No notifications available.'),
                  ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Location",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          child: DropdownButton<String>(
                            value: 'Jakarta',
                            onChanged: (String? newValue) {},
                            dropdownColor: Colors.white,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            items: <String>['Jakarta', 'Surabaya', 'Bali']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            underline: SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Stack(
              children: [
                GestureDetector(
                  onTap: () => showNotifications(context, notifications),
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      "assets/icon_notification.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (hasNotifications)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),


      drawer: CustomDrawer(),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search address, or near you',
                          hintStyle: TextStyle(color: Colors.black38),
                          prefixIcon:
                              Icon(Icons.search_sharp, color: Colors.black54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),


                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 48,
                    width: 48,
                    // padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      "assets/filter.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),


              Container(
                height: 45,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getCategory.length,
                  itemBuilder: (context, index) {
                    final data = getCategory[index];
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 41,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        data.name,
                        textAlign: TextAlign.center,
                        // Center the text horizontally
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: data.name.isEmpty
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: index == 0
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == 0
                            ? null
                            : Colors.white,
                        gradient: index == 0
                            ? LinearGradient(
                                colors: [Colors.purple, Colors.lightBlue],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Near from you',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),


              Container(
                height: 280,
                width: double.infinity,
                // color: Colors.red,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeList.length,
                    itemBuilder: (context, index) {
                      final data = homeList[index];
                      return Container(
                          margin: EdgeInsets.only(right: 24),
                          height: 272,
                          width: 222,
                          padding: EdgeInsets.only(left: 20, bottom: 16),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text(data.subtitle,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(data.image),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(21),
                            color: Colors.blue,
                          ));
                    }),
              ),

              SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best for you',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              _buildVerticalList(context),


            ],
          ),
        ),
      ),
    );
  }



  Widget _buildCategoryChip(String label, {bool isActive = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black54,
        ),
      ),
    );
  }



  Widget _buildHorizontalCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String distance,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),

      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                distance,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildVerticalList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyDetailsPage(),
                ),
              ),
            },
            child: _buildVerticalCard(
              imageUrl: 'assets/orchad_house.png',
              title: 'Orchad House',
              price: 'Rp. 2,500,000,000 / Year',
              bedrooms: 6,
              bathrooms: 4,
            ),
          ),
          SizedBox(height: 10),


          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyDetailsPage(),
                ),
              ),
            },
            child: _buildVerticalCard(
              imageUrl: 'assets/the _hollies_house.png',
              title: 'The Hollies House',
              price: 'Rp. 2,000,000,000 / Year',
              bedrooms: 5,
              bathrooms: 2,
            ),
          ),
          SizedBox(height: 10),


          GestureDetector(
            onTap: () => {
              // Navigate to PropertyDetailsPage with specific property data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyDetailsPage(),
                ),
              ),
            },
            child: _buildVerticalCard(
              imageUrl: 'assets/sea_breezes.png',
              title: 'The Hollies House',
              price: 'Rp. 3,500,000,000 / Year',
              bedrooms: 7,
              bathrooms: 4,
            ),
          ),
          SizedBox(height: 10),


          GestureDetector(
            onTap: () => {
              // Navigate to PropertyDetailsPage with specific property data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyDetailsPage(),
                ),
              ),
            },
            child: _buildVerticalCard(
              imageUrl: 'assets/little_copse.png',
              title: 'The Hollies House',
              price: 'Rp. 3,000,000,000 / Year',
              bedrooms: 6,
              bathrooms: 3,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildVerticalCard({
    required String imageUrl,
    required String title,
    required String price,
    required int bedrooms,
    required int bathrooms,
  }) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                price,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.bed, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('$bedrooms Bedroom'),
                  SizedBox(width: 16),
                  Icon(Icons.bathtub, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('$bathrooms Bathroom'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
