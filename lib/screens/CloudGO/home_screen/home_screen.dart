import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_layout/blocs/firebase_user_bloc/login_bloc.dart';
import 'package:first_layout/screens/CLoudWORK/cloud_work.dart';
import 'package:first_layout/screens/CloudCALL/cloud_call.dart';
import 'package:first_layout/screens/CloudGO/profile/HoSoCaNhan/profile.dart';
import 'package:first_layout/screens/CloudGO/profile/about_us/about_us.dart';
import 'package:first_layout/screens/CloudGO/profile/menu_account.dart';
import 'package:first_layout/screens/CloudGO/splash_screen/hello.dart';
import 'package:first_layout/screens/CloudSALES/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<LoginInfoBloc, LoginInfoState>(
        builder: (context, state) {
       return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: (){
                    FirebaseAuth auth = FirebaseAuth.instance;
                    User? user = auth.currentUser;
                    var uid = user?.uid;
                    FirebaseFirestore.instance.collection('Users').doc(uid)
                        .get().then((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.exists) {
                        String hoten = documentSnapshot['hoten'];
                        String email = documentSnapshot['email'];
                        print('------------------');
                        print('Uid: ${uid}');
                        print('Hoten: ${hoten}');
                        print('Email: ${email}');
                        print('------------------');
                        context.read<LoginInfoBloc>().add(GetTokenEvent(
                            token: uid,
                            hoten: hoten,
                            email: email
                        ));
                        print("State uid: ${state.token}");
                        print("State hoten: ${state.hoten}");
                        print("State email: ${state.email}");
                        print('------------------');
                      }
                      else {
                        print('Tài liệu không tồn tại');
                      }
                    });
                  },
                  icon: Icon(Icons.refresh)),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                 DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://banner2.cleanpng.com/20180418/xqw/kisspng-avatar-computer-icons-business-business-woman-5ad736ba3f2735.7973320115240536902587.jpg'),
                        ),
                      ),
                      // Container(
                      //   height: 100,
                      //   width: 100,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white70,
                      //     borderRadius: BorderRadius.circular(50),
                      //   )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.hoten, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            Text(state.email),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).pop();
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => HoSoCaNhan()));
                  },
                  title: Text('Tài khoản'),
                  leading: Icon(Icons.person),
                ),

                ExpansionTile(
                  title: Text("Danh mục"),
                  leading: Icon(Icons.category), //add icon
                  childrenPadding: EdgeInsets.only(left:60), //children padding
                  children: [
                    ListTile(
                      leading: Icon(Icons.insights_sharp),
                      title: Text("CloudSALES"),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        => Home()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.work),
                      title: Text("CloudWORK"),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        => BauCuaGame()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text("CloudCAM"),
                      onTap: (){
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.emoji_people),
                      title: Text("CloudCARE"),
                      onTap: (){
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.call),
                      title: Text("CloudCALL"),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        => CloudCALL()));
                      },
                    ),

                    //more child menu
                  ],
                ),
                ListTile(
                  onTap: (){

                  },
                  title: Text('Lọc'),
                  leading: Icon(Icons.filter_alt),
                ),
                ListTile(
                  onTap: (){

                  },
                  title: Text('Cài đặt'),
                  leading: Icon(Icons.settings),
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    => AboutUs()));
                  },
                  title: Text('Giúp đỡ'),
                  leading: Icon(Icons.help),
                ),
                ListTile(
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                    Fluttertoast.showToast(
                        msg: "Đăng xuất thành công 😎",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                    => Hello()));
                  },
                  title: Text('Đăng xuất'),
                  leading: Icon(Icons.logout),
                ),

              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: maxHeight * 0.45,
                child: Stack(
                  children: [
                    Container(
                      height: maxHeight * 0.15,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MenuAccount()),
                              );},
                            child: Container(
                              child: SizedBox(
                                width: maxWidth * 0.125,
                                child: Image.asset('assets/images/user_ic.png'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                             state.hoten,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: maxWidth * 0.24,
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
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/crm_raw.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/CRM_for_startup.png',
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
                              activeIndex: activeIndex, count: 4)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: maxHeight * 0.32,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // crossAxisSpacing: 10,
                    // mainAxisSpacing: 10,
                  ),
                  itemCount: gridImageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        if (gridTextList[index] == 'CloudSALES') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        }
                        if (gridTextList[index] == 'CloudCALL') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CloudCALL()),
                          );
                        }
                        if (gridTextList[index] == 'CloudWORK') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BauCuaGame()),
                          );
                        }
                      },
                      child: Column(
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
                      ),
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
                height: maxHeight * 0.21,
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
          ));
    });
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
