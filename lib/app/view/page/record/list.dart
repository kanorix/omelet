import 'package:flutter/material.dart';
import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/view/component/search_app_bar.dart';

class RecordListView extends StatelessWidget {
  const RecordListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchAppBar(
          searchMode: false,
          titleText: 'メモ一覧',
          onTapSearchIcon: () {},
          onTapCloseIcon: () {},
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Scrollbar(
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
    );
  }
}
