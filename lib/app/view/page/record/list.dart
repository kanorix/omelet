import 'dart:math';

import 'package:flutter/material.dart';
import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/notifier.dart';
import 'package:omelet/app/view/component/search_app_bar.dart';

class RecordListView extends StatelessWidget {
  const RecordListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = context.read<RecordListNotifier>();
    final state = context.watch<RecordListNotifier>();
    return SafeArea(
      child: Scaffold(
        appBar: SearchAppBar(
          titleText: 'メモ一覧',
          onChanged: (v) => event.search(v),
          onSearchClosed: () => event.search(''),
        ),
        // レコード追加ボタン
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // :TODO: 後で削除する
            event.addRecord(title: Random().nextInt(100).toString());
          },
        ),
        // 追加ボタンの位置指定
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // レコードのリスト
        body: Scrollbar(
          child: FutureBuilder(
            future: state.records,
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              final results = (snapshot.data as List<Record>);
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (_, int index) {
                  final record = results[index];
                  return Card(
                    child: ListTile(
                      title: Text(record.title),
                      subtitle: Text('2021/03/07'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
