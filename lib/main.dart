import 'package:flutter/cupertino.dart';
import 'package:vibration/vibration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!(await Vibration.hasVibrator() ?? false)) throw 'nope';
  runApp(CupertinoApp(
    title: 'Vibrator',
    home: MyHomePage(
      'Amplitude: ${await Vibration.hasAmplitudeControl()}\n'
      'Custom Vibrations: ${await Vibration.hasCustomVibrationsSupport()}',
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.status);

  final String status;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.status,
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          CupertinoButton.filled(
            child: Text('do it'),
            onPressed: () {
              Vibration.vibrate(duration: 1000);
            },
          ),
        ],
      ),
    );
  }
}
