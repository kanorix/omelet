import 'package:omelet/app/config/export/default.dart';

class FutureListView<E> extends StatelessWidget {
  final Future<List<E>> future;

  final Widget Function(E, int, List<E>) itemBuilder;

  FutureListView({
    @required this.future,
    @required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Scrollbar(
        child: FutureBuilder(
          future: future,
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final results = (snapshot.data as List<E>);

            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (_, int index) {
                final element = results[index];
                return itemBuilder(element, index, results);
              },
            );
          },
        ),
      ),
    );
  }
}
