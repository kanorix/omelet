import 'dart:math';

import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/notifier.dart';
import 'package:omelet/app/view/component/dismissible_card.dart';
import 'package:omelet/app/view/component/future_list_view.dart';

import 'package:omelet/app/view/component/search_app_bar.dart';

class RecordListPage extends StatelessWidget {
  const RecordListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordListNotifier>(
      create: (_) => RecordListNotifier(),
      child: RecordListView(),
    );
  }
}

class RecordListView extends StatelessWidget {
  const RecordListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Template template =
        PageNavigator.of(context).getArgument(orElse: Template(title: 'test'));
    final read = context.read<RecordListNotifier>();
    final watch = context.watch<RecordListNotifier>();

    return Scaffold(
      appBar: SearchAppBar(
        titleText: '「${template.title}」一覧',
        onChanged: (v) => read.search(v),
        onSearchClosed: () => read.search(''),
      ),
      // レコード追加ボタン
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // :TODO: 後で削除する
          await PageNavigator.of(context).pushNamed(
            PageRouter.recordCreate,
            template,
          );
          read.addRecord(title: Random().nextInt(100).toString());
        },
      ),
      // 追加ボタンの位置指定
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // レコードのリスト
      body: FutureListView<Record>(
        future: watch.records,
        itemBuilder: (record, index, list) {
          return DismissibleCard(
            padding: EdgeInsets.zero,
            child: ListTile(
              title: Text(record.title),
              subtitle: Text('2021/03/07'),
            ),
            onDismissed: (direction) async {
              list.removeAt(index);
              await read.removeRecord(record);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("タイトル: ${record.title}は削除されました。"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
