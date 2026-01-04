import 'package:flutter/material.dart';

class CompleteGroupedListDemo extends StatefulWidget {
  const CompleteGroupedListDemo({super.key});

  @override
  State<CompleteGroupedListDemo> createState() =>
      _CompleteGroupedListDemoState();
}

class _CompleteGroupedListDemoState extends State<CompleteGroupedListDemo> {
  String selectedFilter = '全部';
  final List<String> filters = ['全部', '未读', '已读', '重要'];
  List<MessageGroup> messageGroups = messageGroupsMock;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息列表'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedFilter = value;
              });
            },
            itemBuilder: (context) => filters
                .map(
                  (filter) => PopupMenuItem(value: filter, child: Text(filter)),
                )
                .toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          // 搜索框
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: '搜索...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // 分组列表
          Expanded(
            child: ListView.builder(
              itemCount: messageGroups.length,
              itemBuilder: (context, index) {
                final group = messageGroups[index];
                return _buildMessageGroup(group);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageGroup(MessageGroup group) {
    final unReadCount = group.messages
        .where((Message message) => message.isRead == false)
        .length;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ExpansionTile(
        initiallyExpanded: group.isExpanded,
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: group.color,
              child: Text(
                group.name.substring(0, 0),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            if (unReadCount > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          group.name,
          style: TextStyle(
            fontWeight: group.unReadCount > 0
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        subtitle: Text('$unReadCount条未读'),
        trailing: unReadCount > 0
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${group.unReadCount}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            : null,
        children: group.messages
            .map((message) => _buildMessageItem(message))
            .toList(),
      ),
    );
  }

  Widget _buildMessageItem(Message message) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 72,
        right: 16,
        top: 4,
        bottom: 4,
      ),
      title: Text(
        message.title,
        style: TextStyle(
          fontWeight: message.isRead ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message.content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message.time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          if (!message.isRead)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      onTap: () {
        setState(() {
          message.isRead = true;
        });
      },
    );
  }
}

class MessageGroup {
  final String name;
  final Color color;
  final List<Message> messages;
  final int unReadCount;
  final bool isExpanded;

  MessageGroup({
    required this.name,
    required this.color,
    required this.messages,
    required this.unReadCount,
    this.isExpanded = false,
  });
}

class Message {
  final String title;
  final String content;
  final String time;
  bool isRead;

  Message({
    required this.title,
    required this.content,
    required this.time,
    this.isRead = false,
  });
}

final List<MessageGroup> messageGroupsMock = [
  MessageGroup(
    name: '工作群',
    color: Colors.blue,
    messages: [
      Message(
        title: '项目进度汇报',
        content: '请各位同事在今天下班前提交项目进度报告',
        time: '10:30',
        isRead: false,
      ),
      Message(
        title: '会议通知',
        content: '明天下午2点召开产品评审会议',
        time: '09:15',
        isRead: false,
      ),
      Message(
        title: '系统维护',
        content: '今晚10点至12点进行系统维护',
        time: '昨天',
        isRead: true,
      ),
    ],
    unReadCount: 3,
  ),

  MessageGroup(
    name: '家庭群',
    color: Colors.green,
    messages: [
      Message(title: '晚餐安排', content: '吃饺子', time: '11:45', isRead: false),
      Message(title: '周末计划', content: '遛弯', time: '11:45', isRead: true),
    ],
    unReadCount: 1,
  ),

  MessageGroup(
    name: '朋友群',
    color: Colors.orange,
    messages: [
      Message(title: '聚会邀请', content: '下周六晚上聚餐', time: '2天前', isRead: true),
    ],
    unReadCount: 0,
  ),
];
