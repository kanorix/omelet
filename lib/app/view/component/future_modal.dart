import 'package:omelet/app/config/export/default.dart';

Future<T> futureModal<T>({
  @required BuildContext context,
  @required Future<T> future,
  Widget child,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        child: Container(
          // height: 90,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(),
              ),
              child ?? Text("Please wait..."),
            ],
          ),
        ),
      );
    },
  );

  // futureが解決するまで待つ
  final result = await future;
  Navigator.pop(context);

  return result;
}
