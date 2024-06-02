import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerSection extends StatefulWidget {
  const YoutubePlayerSection({super.key, required this.url});
  final String? url;
  @override
  State<YoutubePlayerSection> createState() => _YoutubePlayerSectionState();
}

class _YoutubePlayerSectionState extends State<YoutubePlayerSection> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
  final videoUrl=widget.url??'https://youtu.be/ZoFw08mu-mM?si=HYQRMkvxccowhDKe';
    final videoId=YoutubePlayer.convertUrlToId(videoUrl);
    _youtubePlayerController=YoutubePlayerController(initialVideoId: videoId!,
    flags: YoutubePlayerFlags(autoPlay: false,));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16),
      child: YoutubePlayer(
        controller: _youtubePlayerController,
        showVideoProgressIndicator: true,
      ),
    );
  }
}