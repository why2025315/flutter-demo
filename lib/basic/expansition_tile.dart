import 'package:flutter/material.dart';

class Group {
  final String groupName;
  final List<GroupItem> items;
  final IconData icon;
  Group({required this.groupName, required this.icon, required this.items});
}

class GroupItem {
  final String name;
  final String state;
  final String avatar;
  GroupItem({required this.name, required this.state, required this.avatar});
}

class ExpansitionTileDemo extends StatelessWidget {
  ExpansitionTileDemo({super.key});

  final List<Group> groupData = [
    Group(
      groupName: '家人',
      icon: Icons.family_restroom,
      items: [GroupItem(name: "张三", state: '在线', avatar: '张')],
    ),
    Group(
      groupName: '同事',
      icon: Icons.work,
      items: [GroupItem(name: "赵六", state: '离开', avatar: '赵')],
    ),
    Group(
      groupName: '朋友',
      icon: Icons.people,
      items: [GroupItem(name: "孙巴", state: '在线', avatar: '孙')],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('可展开的分组列表')),
      body: ListView.builder(
        itemCount: groupData.length,
        itemBuilder: (context, index) {
          final group = groupData[index];
          return ExpansionTile(
            title: Text(
              group.groupName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
            leading: Icon(group.icon),
            children: List.generate(group.items.length, (itemIndex) {
              final item = group.items[itemIndex];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Text(item.avatar),
                ),
                title: Text(item.name),
                subtitle: Text(item.state),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              );
            }),
          );
        },
      ),
    );
  }
}
