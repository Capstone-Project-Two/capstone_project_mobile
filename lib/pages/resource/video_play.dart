// youtube_player_widget.dart

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class ResourcePage extends StatefulWidget {
//   const ResourcePage({Key? key}) : super(key: key);

//   @override
//   State<ResourcePage> createState() => _ResourcePageState();
// }

// class _ResourcePageState extends State<ResourcePage> {
class VideoPlayer extends StatefulWidget {
  final YoutubePlayerController controller;

  const VideoPlayer({super.key, required this.controller});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void deactivate() {
    widget.controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
            controller: widget.controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: colorScheme.primary,
            progressColors: ProgressBarColors(
              playedColor: colorScheme.primary,
              handleColor: colorScheme.primary,
            ),
            width: double.maxFinite),
        builder: (context, player) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              player,
            ],
          );
        },
      ),
    );
  }
}
