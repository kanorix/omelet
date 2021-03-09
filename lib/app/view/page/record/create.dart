import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/notifier.dart';

class RecordCreatePage extends StatelessWidget {
  const RecordCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordListNotifier>(
      create: (_) => RecordListNotifier(),
      child: RecordCreateView(),
    );
  }
}

class RecordCreateView extends StatelessWidget {
  const RecordCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('レコード作成'),
      ),
      body: Placeholder(),
    );
  }
}
