import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_layout/screens/profile/menu_account.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
      SizedBox(
          height: 300,
          child: Stack(
            children: [
              Container(
                height: maxHeight * 0.2,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuAccount()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        child: SizedBox(
                          width: maxWidth * 0.125,
                          height: 50,
                          child: Image.asset('assets/images/user_ic.png'),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Buổi sáng tốt lành'),
                            Text(
                              'NGUYỄN VĂN TOÀN',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    CarouselSlider(
                      items: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/crm.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/crm_la_gi.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),
                    AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: 2)
                  ],
                ),

              ),

            ],
          ),
      ),
      const SizedBox(height: 10),
      SizedBox(
          height: maxHeight * 0.3,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: gridImageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      gridImageList[index],
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
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
      ),
      SizedBox(
          height: maxHeight * 0.07,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tin tức',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Tất cả',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
      ),
      SizedBox(
          width: maxWidth,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listViewData.length,
            itemBuilder: (BuildContext context, int index) {
              final item = listViewData[index];
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      item.imagePath,
                      width: 300,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      item.title,
                      softWrap: true,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              );
            },
          ),
      ),
    ]),
        )
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

final List<String> imageList = [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png'
];

final List<String> gridImageList = [
  'assets/images/sales.png',
  'assets/images/bag.png',
  'assets/images/camera.png',
  'assets/images/care.png',
  'assets/images/call.png',
  'assets/images/expand.png',
];

final List<String> gridTextList = [
  'CloudSALES',
  'CloudWORK',
  'CloudCAM',
  'CloudCARE',
  'CloudCALL',
  'Xem thêm'
];
