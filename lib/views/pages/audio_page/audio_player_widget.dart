import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_streaming_app/controllers/audio_player_controller.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayerController controller = Get.put(AudioPlayerController());

  final audioPlayer = AudioPlayer();
  bool isPLaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  Duration bufferPosition = Duration.zero;

  @override
  void initState() {
    audioPlayer.positionStream.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    audioPlayer.bufferedPositionStream.listen((newBufferPostion) {
      setState(() {
        bufferPosition = newBufferPostion;
      });
    });

    audioPlayer.playerStateStream.listen((state) {
      print(state.playing);
      setState(() {
        isPLaying = state.playing;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Book'),
      ),
      body: Column(
        children: [
          ProgressBar(
            progress: position,
            total: duration,
            buffered: bufferPosition,
            onSeek: (duration) => audioPlayer.seek(duration),
          ),
          // play/pause button
          CircleAvatar(
            radius: 35,
            child: Obx(
              () => IconButton(
                icon: Icon(
                  controller.isPLaying.value ? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: playAudio,
              ),
            ),
          )
        ],
      ),
    );
  }

  void playAudio() async {
    if (controller.isPLaying.value) {
      await audioPlayer.pause();
    } else {
      if (position == Duration.zero) {
        String url = 'http://www.harlancoben.com/audio/CaughtSample.mp3';
        // set audio source
        await audioPlayer.setUrl(url);
        // getting the duration of the audio
        duration = audioPlayer.duration ?? Duration.zero;
        if (duration != Duration.zero) {
          // if have duration play
          audioPlayer.play();
        }
      } else {
        audioPlayer.play();
      }
    }
  }
}
