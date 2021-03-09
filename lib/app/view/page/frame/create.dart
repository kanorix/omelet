import 'package:omelet/app/config/export/default.dart';
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
      body: Placeholder(),
    );
  }
}
