

import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/profile_screen.dart';


class MainFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Main Feed'),
    );
  }

  Widget _buildBody() {
    return ListView.builder(itemCount: 10,
      itemBuilder: (context, index) {
        return _buildFeedItem(context);
      },
    );
  }

  Widget _buildFeedItem(BuildContext context) {
    return Column(
      children: [
        //사용자 프로필 사진 및 이름
        ListTile(
          leading: GestureDetector(
            onTap: ()
    {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    },
            child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/user_profile.jpg'), // 임시 이미지url 대체
          ),
    ),
          title: Text('Username'),
          trailing: Icon(Icons.more_vert),
        ),

        //게시물 이미지
        Image.network('https://img.danawa.com/prod_img/500000/444/008/img/12008444_1.jpg?shrink=500:*&_v=20200810131643'), // 임시 이미지url 대체

        // 좋아요, 댓글 공유 버튼
        Row(
          children: [
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
            IconButton(icon: Icon(Icons.comment), onPressed: () {}),
            IconButton(icon: Icon(Icons.send), onPressed: () {}),
          ],
        ),

        //좋아요 수 , 설명, 댓글 등
        Padding(padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Liked by username and others'),
              SizedBox(height: 4),
              Text('Username Here is a descriphton of the post...'),
              SizedBox(height: 4),
              Text('View all comments'),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Upload'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Likes'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
