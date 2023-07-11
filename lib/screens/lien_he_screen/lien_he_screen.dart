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