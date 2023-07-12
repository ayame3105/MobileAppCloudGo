import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //     borderRadius: BorderRadius.circular(16.0),
          //   ),
          //   child: Row(
          //     children: [
          //       SizedBox(
          //         width: 50,
          //         height: 50,
          //         child: Image.asset('assets/images/user_ic.png'),
          //       ),
          //       const SizedBox(width: 10),
          //       const Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text('Buổi sáng tốt lành'),
          //             Text(
          //               'NGUYỄN VĂN TOÀN',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // CarouselSlider(
          //   items: [
          //     SizedBox(
          //       width: 400,
          //       height: 500,
          //       child: Card(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20.0),
          //         ),
          //         child: Row(
          //           children: [
          //             SizedBox(
          //               height: 100,
          //               width: 100,
          //               child: Image.asset(
          //                 'assets/images/1.png',
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //             const Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 20),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Row(
          //                     children: [
          //                       ImageIcon(
          //                         AssetImage('assets/images/sales.png'),
          //                       ),
          //                       Text('  CloudSALES'),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          //   options: CarouselOptions(
          //     enlargeCenterPage: true,
          //     autoPlay: true,
          //     enableInfiniteScroll: true,
          //   ),
          // ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 50,
              mainAxisSpacing: 30,
            ),
            itemCount: gridImageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ClipRRect(
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
          const SizedBox(
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
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
          ),
          SizedBox(
            width: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listViewData.length,
              itemBuilder: (BuildContext context, int index) {
                final item = listViewData[index];
                return Column(
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
                );
              },
            ),
          ),
        ],
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
