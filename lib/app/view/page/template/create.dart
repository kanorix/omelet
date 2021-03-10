import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/notifier/record/record_list_notifier.dart';

class TemplateCreatePage extends StatelessWidget {
  const TemplateCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordListNotifier>(
      create: (_) => RecordListNotifier(),
      child: TemplateCreateView(),
    );
  }
}

class TemplateCreateView extends StatelessWidget {
  const TemplateCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Template作成'),
      ),
      body: Placeholder(),
    );
  }
}
