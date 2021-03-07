import 'package:flutter/material.dart';
import 'package:omelet/app/config/export/default.dart';

class RecordListView extends StatelessWidget {
  const RecordListView({Key key}) : super(key: key);

  Widget getAppBar({bool searchMode = false}) {
    return searchMode
        ? AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            title: Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'search',
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              ),
            ],
          )
        : AppBar(
            title: Text('メモ一覧'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(searchMode: false),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Column(
          children: [
            Flexible(
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (_, int index) {
                    return Card(
                      child: ListTile(
                        title: Text('title'),
                        subtitle: Text('2021/03/07'),
                      ),
                    );
                  },
                  itemCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
