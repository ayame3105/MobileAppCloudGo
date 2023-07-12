import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LienHe extends StatelessWidget {
  const LienHe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kênh hỗ trợ'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemCount: listViewData.length,
        separatorBuilder: (BuildContext context, int index) =>
        const Divider(), // Ngăn cách giữa các phần tử bằng Divider
        itemBuilder: (BuildContext context, int index) {
          final item = listViewData[index];
          return ListTile(
            onTap: (){
                if (item.title == 'Hotline') {
                  showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )
                      ),
                      builder: (context)
                  {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 200,
                      width: 420,
                      child:
                      const Column(
                        children: [
                          Text('Liên hệ dến tổng đài',textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize:20)),
                          Divider(
                              color: Colors.black12
                          ),
                          Text('Gọi đến'),
                          Text('1900 29 29 90'),
                          Icon(Icons.phone, size: 60, color: Colors.blue),
                          Row(
                            children: [

                            ],
                          )
                        ],
                      ),
                    );
                  });
                }
            },
            title: Text(item.title),
            subtitle: Text(item.content),
          );
        },
      ),
    );
  }
}


class ListViewData {
  final String title;
  final String content;

  ListViewData({
    required this.title,
    required this.content,
  });
}

final List<ListViewData> listViewData = [
  ListViewData(
    title: 'Hotline',
    content: '1900 29 29 90',
  ),
  ListViewData(
    title: 'Email',
    content: 'support@onlinecrm.vn',
  ),
  ListViewData(
    title: 'Zalo',
    content: 'Công ty TNHH PM QL KH Việt Nam',
  ),
  ListViewData(
    title: 'Kênh hỗ trợ trực tuyến',
    content: 'CloudGO - Giải pháp chuyển đổi số Tinh - Gọn',
  ),
  ListViewData(
    title: 'Tài liệu hướng dẫn',
    content: 'https://docs.onlinecrm.vn/',
  ),
  ListViewData(
    title: 'Youtube',
    content: 'Cloudpro CRM - Giải pháp CRM chuyên sâu theo ngành',
  ),
  ListViewData(
    title: 'Website',
    content: 'https://onlinecrm.vn/',
  ),


];