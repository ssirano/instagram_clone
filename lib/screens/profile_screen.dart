import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          _buildProfileHeader(),
          _buildProfilePosts(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BlogWebView(), //웹뷰 페이지로 이동
              ),
            );
          },
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/user_profile.jpg'),
          ),
        ),
        Text('Username'),
        Text('Bio of the user'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('posts'),
                Text('100'),
              ],
            ),
            Column(
              children: [
                Text('Followers'),
                Text('50'),
              ],
            ),
            Column(
              children: [
                Text('Following'),
                Text('150'),
              ],
            ),
          ],
        ),

      ],
    );
  }

  Widget _buildProfilePosts() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Image.asset('assets/images/post.jpg');
      },
      itemCount: 9,
    );
  }
}

class BlogWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blog')),
      body: WebView(
        initialUrl: 'https://github.com/ssirano?tab=repositories',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
