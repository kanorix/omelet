import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/notifier/record/record_list_notifier.dart';

class FrameCreatePage extends StatelessWidget {
  const FrameCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordListNotifier>(
      create: (_) => RecordListNotifier(),
      child: FrameCreateView(),
    );
  }
}

class FrameCreateView extends StatelessWidget {
  const FrameCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frame作成'),
      ),
      // 追加ボタン
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {},
      ),
      // 追加ボタンの位置指定
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              maxLength: 20,
              decoration: InputDecoration(
                labelText: 'テンプレート名',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                TextFormField(
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: '内容1',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text("DATE"),
                ),
              ]),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                TextFormField(
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: '内容2',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text("DATE"),
                ),
              ]),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Respond to button press
            },
            icon: Icon(Icons.add, size: 18),
            label: Text("追加"),
          )
        ],
      ),
    );
  }
}
