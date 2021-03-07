import 'package:flutter/material.dart';
import 'package:omelet/app/config/export/default.dart';

class RecordListView extends StatelessWidget {
  const RecordListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'メモ一覧',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemBuilder: (_, int index) {
            return Card(
              child: ListTile(
                title: Text('title'),
                subtitle: Text('2021/03/07'),
              ),
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}
