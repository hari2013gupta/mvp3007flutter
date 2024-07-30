import 'package:flutter/material.dart';
import 'package:mvp3007/src/model/post_model.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    super.key,
    required this.item,
  });

  final PostModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text('${item.id}. ',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(item.title, style: const TextStyle(fontSize: 20)),
              ),
            ],
          ),
          const Divider(),
          Text(item.body,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
