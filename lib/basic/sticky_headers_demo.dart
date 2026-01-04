import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class StickyHeadersDemo extends StatelessWidget {
  const StickyHeadersDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('粘性头部列表')),
      body: ListView.builder(
        itemCount: groupedData.length,
        itemBuilder: (context, index) {
          final data = groupedData[index];
          return StickyHeader(
            header: Container(
              height: 50,
              color: Colors.blue[100],
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                data['header'],
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Container(
              child: Column(
                children: List.generate(data['items'].length, (itemIndex) {
                  final item = data['items'][itemIndex];
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text(item['description']),
                    leading: Icon(item['icon']),
                    onTap: () {
                      print(item);
                    },
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<Map<String, dynamic>> groupedData = [
  {
    'header': '工作相关',
    'items': [
      {'name': '项目文档', 'description': '更新项目技术文档', 'icon': Icons.description},
      {'name': '代码审查', 'description': '审查团队成员的代码', 'icon': Icons.code},
      {'name': '团队会议', 'description': '每周团队同步会议', 'icon': Icons.groups},
    ],
  },
  {
    'header': '个人任务',
    'items': [
      {"name": '购物清单', 'description': "购买生活用品", "icon": Icons.shopping_bag},
      {"name": '阅读书籍', 'description': '完成《Flutter实战》', "icon": Icons.book},
      {'name': '项目文档', 'description': '更新项目技术文档', 'icon': Icons.description},
      {'name': '代码审查', 'description': '审查团队成员的代码', 'icon': Icons.code},
      {'name': '团队会议', 'description': '每周团队同步会议', 'icon': Icons.groups},
      {'name': '项目文档', 'description': '更新项目技术文档', 'icon': Icons.description},
      {'name': '代码审查', 'description': '审查团队成员的代码', 'icon': Icons.code},
      {'name': '团队会议', 'description': '每周团队同步会议', 'icon': Icons.groups},
      {'name': '项目文档', 'description': '更新项目技术文档', 'icon': Icons.description},
      {'name': '代码审查', 'description': '审查团队成员的代码', 'icon': Icons.code},
      {'name': '团队会议', 'description': '每周团队同步会议', 'icon': Icons.groups},
    ],
  },
  {
    'header': '娱乐活动',
    "items": [
      {"name": '看电影', 'description': '观看最新上映的电影', 'icons': Icons.movie},
      {"name": '运动健身', 'description': '跑步或游泳', 'icons': Icons.directions_run},
      {'name': '音乐欣赏', 'description': '听喜欢的音乐专辑', 'icons': Icons.music_note},
    ],
  },
  {
    'header': '娱乐活动',
    "items": [
      {"name": '看电影', 'description': '观看最新上映的电影', 'icons': Icons.movie},
      {"name": '运动健身', 'description': '跑步或游泳', 'icons': Icons.directions_run},
      {'name': '音乐欣赏', 'description': '听喜欢的音乐专辑', 'icons': Icons.music_note},
    ],
  },
];
