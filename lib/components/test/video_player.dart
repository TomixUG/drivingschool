import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VPlayer extends StatefulWidget {
  final String asset;

  const VPlayer({Key? key, required this.asset}) : super(key: key);

  @override
  State<VPlayer> createState() => _VPlayerState();
}

class _VPlayerState extends State<VPlayer> {
  late VideoPlayerController _controller;

  late var isVideo = widget.asset.split(".").last == "mp4";

  @override
  void initState() {
    super.initState();
    // check whether asset is video or image
    if (isVideo) {
      // video
      _controller = VideoPlayerController.asset(
        widget.asset,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true), // dont stop background audio session
      )..initialize().then((_) {
          setState(() {
            _controller.setVolume(0);
            _controller.setLooping(true);
            _controller.play();
          });
        });
    }
  }

  @override
  void dispose() {
    if (isVideo) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isVideo) {
      return _controller.value.isInitialized
          ? ConstrainedBox(
              constraints: const BoxConstraints(),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
          : const Text("");
    } else {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 230),
        child: Image.asset(
          widget.asset,
        ),
      );
    }
  }
}
