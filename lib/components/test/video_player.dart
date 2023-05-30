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

  @override
  void initState() {
    super.initState();

    // check whether asset is video or image
    if (widget.asset.split(".").last == "mp4") {
      // video
      _controller = VideoPlayerController.asset(widget.asset)
        ..initialize().then((_) {
          setState(() {
            _controller.setLooping(true);
            _controller.play();
          });
        });
    } else {
      // image
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.asset.split(".").last == "mp4") {
      return _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : const CircularProgressIndicator();
    } else {
      return Image(
        image: AssetImage(widget.asset),
      );
    }
  }
}
