import 'package:fitness_app/model/channel_model.dart';
import 'package:fitness_app/model/video_model.dart';
import 'package:fitness_app/screens/video/detail/detail_screen.dart';
import 'package:fitness_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoContentState createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoScreen> {

  Channel _channel;
  bool _isLoading = false;
  bool _bottomTab = true;

  @override
  void initState() {
    _initChannel();
    super.initState();
  }

  _initChannel() async {
    Channel channel = await YtbAPIService.instance
      .fetchChannel(channelId: 'UC8211Zt_HQJWDD0Bj6cenQw');
    setState(() {
      _channel = channel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _channel != null
      ? NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          // bottomTab ist ready
          if(scroll.metrics.pixels != scroll.metrics.maxScrollExtent) {
            _bottomTab = true;
          }
          // can load more videos
          if(!_isLoading
            && _channel.videos.length != int.parse(_channel.videoCount)
            && scroll.metrics.pixels == scroll.metrics.maxScrollExtent)
          {
            _loadMoreVideos();
          }
          // no more videos AND scroll to the bottom AND bottomTab is ready 
          //      => show bottomTab
          if(_channel.videos.length == int.parse(_channel.videoCount)
            && scroll.metrics.pixels == scroll.metrics.maxScrollExtent
            && _bottomTab == true) {
            Fluttertoast.showToast(
              msg: 'No more...',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.black,
              fontSize: 16,
              timeInSecForIosWeb:1 
            );
            _bottomTab = false;
          }
          return false;
        },
        child: ListView.builder(
          itemCount: 1 + _channel.videos.length, // the add-one to store channel infomation
          itemBuilder: (BuildContext ctx, int index) {
            if (index ==  0) {
              return _buildProfileInfo();
            } 
            Video video = _channel.videos[index - 1];
            return _buildVideo(video);
          },
        ),
      )
    : Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0
          )
        ]
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _channel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailScreen(video: video),
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.all(10),
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6
            )
          ]
        ),
        child: Row(
          children: [
            Image(
              width: 150,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                    )
                  ),
                  Text(
                    video.channelTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                    )
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    Fluttertoast.showToast(
      msg: 'Loading...',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16,
      timeInSecForIosWeb:1 
    );
    List<Video> moreVideos = await YtbAPIService.instance
      .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }
}