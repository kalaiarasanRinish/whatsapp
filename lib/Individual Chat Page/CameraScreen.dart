import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'CameraView.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>   {
  late CameraController cameraController;
  late Future<void> cameraValue;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<void>(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(cameraController);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.flash_off, color: Colors.white, size: 28),
                    ),
                    InkWell(
                      onTap: () async {
                        await takePhoto(context);
                      },
                      child: const Icon(Icons.panorama_fisheye_rounded, color: Colors.white, size: 70),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.flip_camera_ios, color: Colors.white, size: 28),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Hold for video, Tap for photo",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> takePhoto(BuildContext context) async {
    try {
      final XFile picture = await cameraController.takePicture();

      // Use the path property of XFile to get the file path
      final String path = picture.path;


      Navigator.push(context, MaterialPageRoute(builder: (builder) => CameraViewPage(path: path)));
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

}
