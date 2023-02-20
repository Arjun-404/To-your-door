import 'package:flutter/material.dart';
import 'package:to_your_door/screen/home_page.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  @override
  void initState(){
    _controller=VideoPlayerController.network("https://media.istockphoto.com/id/1287152899/video/asian-chinese-delivery-man-with-helmet-press-door-bell-for-grocery-food-delivery.mp4?s=mp4-640x640-is&k=20&c=rAT-Kpk1yWhuaxtRou27_lv05boCKVXES2tb0azMrCg=")
    ..initialize().then((_){
      setState(() {
      });
    });
        super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("We Deliver!",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.red,),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                    HomePage(),
                )
            );
          },
        ),
      ),
      body: Content(),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          _controller.value.isPlaying
              ?Icons.pause
              :Icons.play_arrow,
        ),
        onPressed: (){
          setState(() {
            _controller.value.isPlaying
            ?_controller.pause()
                :_controller.play();
          });
        }
      ) ,
      bottomNavigationBar: Container(
        height: 180,
        width: double.infinity,
        child: Align(
            alignment: Alignment.center,
            child: Text("        .You Just need to dial!*** \n and we will be at your DoorStep. ",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.grey.shade600,fontStyle: FontStyle.italic),
            ),
        ),
      ),
    );
  }
  Widget Content(){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5,color:Colors.grey.shade500),
            borderRadius: BorderRadius.circular(0),),
        width: 400,
        height: 550,
        child: _controller.value.isInitialized
            ? VideoPlayer(_controller)
      :Container()),
    );
  }
}
