import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> imageList = [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png'
];

final List<String> gridImageList = [
  'assets/images/bag.png',
  'assets/images/call.png',
  'assets/images/care.png',
  'assets/images/camera.png',
  'assets/images/expand.png',
  'assets/images/sales.png'
];

final List<String> gridTextList = [
  'CloudSALES',
  'CloudWORK',
  'CloudCAM',
  'CloudCARE',
  'CloudCALL',
  'Xem thêm'
];

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Trang chủ',
      style: optionStyle,
    ),
    Text(
      'Index 1: Tin tức',
      style: optionStyle,
    ),
    Text(
      'Index 2: Thông báo',
      style: optionStyle,
    ),
    Text(
      'Index 3: Liên hệ',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 50, // Đặt kích thước của hình ảnh tại đây
                    height: 50,
                    child: Image.asset(
                        'assets/images/user_ic.png'), // Thay thế URL hình ảnh thực tế tại đây
                  ),
                  const SizedBox(
                      width: 10), // Đặt khoảng cách giữa hình ảnh và văn bản
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Buổi sáng tốt lành'),
                        Text('NGUYỄN VĂN TOÀN',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      Container(
                        width: 400,
                        height: 500,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  'assets/images/1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        ImageIcon(
                                          AssetImage('assets/images/sales.png'),
                                        ),
                                        Text('  CloudSALES'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Hướng dẫn sử dụng',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Giải pháp bán hàng đa kênh'),
                                      ],
                                    ),
                                    Text('Xem chi tiết >',
                                        style: TextStyle(color: Colors.blue)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 500,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  'assets/images/2.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        ImageIcon(
                                          AssetImage('assets/images/bag.png'),
                                        ),
                                        Text('  CloudWORK'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Hướng dẫn sử dụng',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Giải pháp quản lý công việc & dự án khoa học',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                    Text('Xem chi tiết >',
                                        style: TextStyle(color: Colors.blue)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                    ),
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 30,
                    ),
                    shrinkWrap: true,
                    itemCount: gridImageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              gridImageList[index],
                              width: 50, // Đặt kích thước của hình ảnh
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                              height:
                                  10), // Đặt khoảng cách giữa hình ảnh và văn bản
                          Text(
                            gridTextList[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tin tức',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            'Tất cả',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),

            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listViewData.length,
              itemBuilder: (BuildContext context, int index) {
                final item = listViewData[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0), // Đặt giá trị khoảng cách tại đây
                  child: Column(
                    children: [
                      Image.asset(
                        item.imagePath,
                        width: 300,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          item.title,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),



          ],
        ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedFontSize: 18,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.podcasts),
            label: 'Tin tức',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ring_volume),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Liên hệ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),

        );
  }
}

class ListViewData {
  final String imagePath;
  final String title;

  ListViewData({
    required this.imagePath,
    required this.title,
  });
}

final List<ListViewData> listViewData = [
  ListViewData(
    imagePath: 'assets/images/tieu_chi.png',
    title: '9 tiêu chí đánh giá giải pháp CRM tốt cho doanh nghiệp',
  ),
  ListViewData(
    imagePath: 'assets/images/crm.png',
    title: 'Tổng quan về CRM, quản lý chất lượng',
  ),
  ListViewData(
    imagePath: 'assets/images/crm_la_gi.png',
    title: 'CRM là gì? Áp dụng chiến thuật CRM vào công ty',
  ),
];
