import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  _ColorsScreenState createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  FlutterTts flutterTts = FlutterTts();
  Color _currentColor = Colors.red;

  void _changeColor(Color color) {
    setState(() {
      _currentColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  _playSound('red');
                  _changeColor(Colors.red);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  color: _currentColor,
              ),
            ),
            ),
            const Text('Red'),
            Expanded(
              child: InkWell(
                onTap: () {
                  _playSound('blue');
                  _changeColor(Colors.blue);

                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  color: _currentColor,
                ),
              ),
            ),
            const Text('Blue'),
            Expanded(
              child: InkWell(
                onTap: () {
                  _playSound('green');
                  _changeColor(Colors.green);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  color: _currentColor,
                ),
              ),
            ),
            const Text('Green'),
            ElevatedButton(
              child: const Text('Take Quiz'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/quiz');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _playSound(String words) async {
    await flutterTts.speak(words);
  }
}
