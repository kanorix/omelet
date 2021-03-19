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
    final Template template = PageNavigator.of(context).getArgument();

    return ChangeNotifierProvider<RecordListNotifier>(
      create: (_) => RecordListNotifier(template),
      child: RecordListView(),
    );
  }
}

class RecordListView extends StatelessWidget {
  const RecordListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<RecordListNotifier>();
    final watch = context.watch<RecordListNotifier>();

    return Scaffold(
      appBar: SearchAppBar(
        titleText: '「${read.template.title}」一覧',
        onChanged: (v) => read.search(v),
        onSearchClosed: () => read.search(''),
      ),
      // レコード追加ボタン
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await PageNavigator.of(context).pushNamed(
              PageRouter.recordCreate,
              read.template,
            );
            read.reload();
          }),
      // 追加ボタンの位置指定
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // レコードのリスト
      body: FutureListView<Record>(
        future: watch.records,
        itemBuilder: (record, index, list) {
          return DismissibleCard(
            padding: EdgeInsets.zero,
            child: ListTile(
              title: Text(record.items.first.content),
              subtitle: Text(record.createdAt.toString()),
              onLongPress: () {
                _showDialog(context, read.template, record);
              },
            ),
            onDismissed: (direction) async {
              list.removeAt(index);
              await read.removeRecord(record);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${record.items.first.content}は削除されました。"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void _showDialog(context, Template template, Record record) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return Dialog(
        child: Container(
          height: 200,
          padding: EdgeInsets.all(10),
          child: Scrollbar(
            child: ListView.builder(
              itemCount: template.items.length,
              itemBuilder: (_, index) {
                return TextFormField(
                    initialValue: record.items[index].content,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: template.items[index].name,
                    ));

                // Text('[$index] ${template.items[index].name} : ${record.items[index].content}');
              },
            ),
          ),
        ),
      );
    },
  );
}
