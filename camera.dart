import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription>? cameras;

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    if (cameras != null && cameras!.isNotEmpty) {
      _controller = CameraController(cameras![0], ResolutionPreset.max);
      _controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDeined':
              print("Access was denied");
              break;
            default:
              print(e.description);
              break;
          }
        }
      });
    } else {
      print('No available cameras');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_controller != null && _controller!.value.isInitialized)
            Container(
              height: double.infinity,
              child: CameraPreview(_controller!),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    home: CameraApp(),
  ));
}
