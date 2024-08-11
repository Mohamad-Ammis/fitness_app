// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class videooo extends StatefulWidget {
//   const videooo({super.key});

//   @override
//   State<videooo> createState() => _videoooState();
// }

// class _videoooState extends State<videooo> {
//   late FlickManager flick;

//   @override
//   void initState() {
//     super.initState();
//     flick = FlickManager(
//         videoPlayerController:
//             VideoPlayerController.asset("assets/images/videod.mp4"));
//   }

//   @override
//   void dispose() {
//     flick.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: flick.flickVideoManager!.videoPlayerController!.initialize(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Center(
//             child: FlickVideoPlayer(flickManager: flick),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }


//  late VideoPlayerController? controllerV;
//   @override
//   void initState() {
//     super.initState();
//     controllerV = VideoPlayerController.asset("assets/video/videod.mp4");

//     controllerV!.initialize();
//     controllerV!.play();
//   }

//   @override
//   void dispose() {
//     controllerV!.dispose();
//     super.dispose();
//   }

  // VideoPlayerController? controllerV;
  // @override
  // void initState() {
  //   super.initState();
  //   controllerV = VideoPlayerController.asset("assets/video/videod.mp4");

  //   controllerV!.addListener(() {
  //     setState(() {});
  //   });

  //   controllerV!.initialize().then((_) => setState(() {}));
  //   controllerV!.play();
  // }

  // @override
  // void dispose() {
  //   controllerV!.dispose();
  //   super.dispose();
  // }


  // GetBuilder<Controller>(
            //   builder: (controller) {
            //     return controller.videoController != null &&
            //             controller.videoController!.value.isInitialized
            //         ? Container(
            //             clipBehavior: Clip.antiAlias,
            //             decoration: const BoxDecoration(
            //               color: Color.fromARGB(255, 231, 41, 41),
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(10),
            //               ),
            //             ),
            //             height: MediaQuery.of(context).size.height * 0.55,
            //             width: MediaQuery.of(context).size.width,
            //             child: AspectRatio(
            //               aspectRatio:
            //                   controller.videoController!.value.aspectRatio,
            //               child: VideoPlayer(controller.videoController!),
            //             ))

            // Container(
            //     clipBehavior: Clip.antiAlias,
            //     decoration: BoxDecoration(
            //       color: Colors.black.withOpacity(0.4),
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(10),
            //       ),
            //     ),
            //     height: MediaQuery.of(context).size.height * 0.55,
            //     width: MediaQuery.of(context).size.width,
            //     child: VideoPlayer(
            //         widget.v!)),
            //   },
            // ),