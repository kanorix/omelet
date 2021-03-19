import 'package:omelet/app/config/export/common.dart';
import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/notifier.dart';
import 'package:omelet/app/view/component/dismissible_card.dart';
import 'package:omelet/app/view/component/future_list_view.dart';

import 'package:omelet/app/view/component/search_app_bar.dart';

import 'package:omelet/common/mixin/helper_mixin.dart';

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

class RecordListView extends StatelessWidget with HelperMixin {
  RecordListView({Key key}) : super(key: key);

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
          final titile = getFormattedInitialValue(
              read.template.items.first.type, record.items.first.content);
          return DismissibleCard(
            padding: EdgeInsets.zero,
            child: ListTile(
              title: Text(stringHelper.limit(titile)),
              subtitle: Text(dateTimeHelper.format(record.createdAt)),
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

String getFormattedInitialValue(RecordType type, initialValue) {
  switch (type) {
    case RecordType.None:
    case RecordType.Text:
      return initialValue;
    case RecordType.Date:
      final helper = DateTimeHelper();
      return helper.format(helper.parseIso(initialValue),
          format: DateTimeFormat.yyyyMMdd);
      break;
  }
  return '';
}

void _showDialog(context, Template template, Record record) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return Dialog(
        child: Scrollbar(
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: template.items.length,
                itemBuilder: (_, index) {
                  return TextFormField(
                    initialValue: getFormattedInitialValue(
                      template.items[index].type,
                      record.items[index].content,
                    ),
                    maxLines: null,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: template.items[index].name,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}
