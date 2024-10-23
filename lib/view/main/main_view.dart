import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
// import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import '../../view model/responsive.dart';
import 'components/drawer/drawer.dart';
import 'components/navigation_button_list.dart';
import 'package:video_player/video_player.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://www.nhanngyn.tech/static/media/second.3208149c92992855c4ad.mp4'))
      ..initialize().then((_) {
        _controller.setVolume(0);
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      }).catchError((error) {
        debugPrint('Error initializing video: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          // Background video covering the entire screen
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          // Overlay UI components
          Container(
            color: Colors.black.withOpacity(0.7),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                  child: TopNavigationBar(),
                ),
                if (Responsive.isLargeMobile(context))
                  const Row(
                    children: [Spacer(), NavigationButtonList(), Spacer()],
                  ),
                Expanded(
                  flex: 9,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [...widget.pages],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
