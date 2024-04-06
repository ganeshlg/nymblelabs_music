import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'app.dart';

void main() {
  runApp(const App());
  // runApp(MusicPlayer());
}

// class MusicPlayer extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Center(
//         child: ElevatedButton(
//           child: Text("Play"),
//           onPressed: () async {
//             final player = AudioPlayer();
//             await player.setUrl('https://onlinetestcase.com/wp-content/uploads/2023/06/100-KB-MP3.mp3');
//             player.play();
//             player.setLoopMode(LoopMode.all);
//             // player.pause();
//             // player.seek(const Duration(seconds: 60));
//           },
//         ),
//       ),
//     );
//   }
// }

