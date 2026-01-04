import 'package:flutter/material.dart';

class SectionListDemo extends StatelessWidget {
  const SectionListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义分组列表')),
      body: ListView.separated(
        itemBuilder: (context, sectionIndex) {
          final section = sections[sectionIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                color: Colors.grey[100],
                width: double.infinity,
                child: Text(
                  section.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              ...section.items.map(
                (item) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.avatarUrl),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.description),
                  trailing: item.tailing,
                  onTap: () {
                    print(item);
                  },
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemCount: sections.length,
      ),
    );
  }
}

class Item {
  final String name;
  final String description;
  final String avatarUrl;
  final Widget? tailing;

  Item({
    required this.name,
    required this.description,
    required this.avatarUrl,
    this.tailing,
  });
}

class Section {
  final String title;
  final List<Item> items;

  Section({required this.title, required this.items});
}

final List<Section> sections = [
  Section(
    title: '今天',
    items: [
      Item(
        name: '会议安排',
        description: '上午10:00 - 项目讨论会',
        avatarUrl: 'https://via.placeholder.com/40',
        tailing: const Icon(Icons.alarm, color: Colors.orange),
      ),
      Item(
        name: '午餐约会',
        description: '中午12：30 - 与朋友聚餐',
        avatarUrl: 'https://via.placeholder.com/40',
        tailing: const Icon(Icons.restaurant, color: Colors.green),
      ),
    ],
  ),
  Section(
    title: '明天',
    items: [
      Item(
        name: '医生预约',
        description: '下午14：00 - 年度体检',
        avatarUrl: 'https://via.placeholder.com/40',
        tailing: const Icon(Icons.local_hospital, color: Colors.red),
      ),
    ],
  ),
  Section(
    title: '本周',
    items: [
      Item(
        name: '健身计划',
        description: '周三、周五晚上健身',
        avatarUrl: 'https://via.placeholder.com/40',
        tailing: const Icon(Icons.fitness_center, color: Colors.blue),
      ),
      Item(
        name: '学习新技能',
        description: '周末完成Flutter课程',
        avatarUrl: 'https://via.placeholder.com/40',
        tailing: const Icon(Icons.school, color: Colors.purple),
      ),
    ],
  ),
];
