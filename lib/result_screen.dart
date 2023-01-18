import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  late AudioPlayer player;

  ResultScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: _playSound(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text('Your score: $score');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton(
              child: const Text('Try Again'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/quiz');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playSound() async {
    await player.setAsset('assets/clapping.mp3');
    player.play();
  }
}
