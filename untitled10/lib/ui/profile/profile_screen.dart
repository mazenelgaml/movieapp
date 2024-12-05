import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../edit_peofile/edit_profile_screen.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: Icon(Icons.person),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 16),
              CircleAvatar(
                radius: 64,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: AssetImage('assets/images/profile1.jpg'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Demo Name',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'demoemail@gmail.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {Get.to(()=>EditProfile());},
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextButton.icon(
                onPressed: () {
                },
                icon: const Icon(Icons.exit_to_app, color: Colors.red),
                label: const Text('Logout', style: TextStyle(color: Colors.red)),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            label: 'Save',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 4, //
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
        },
      ),
    );
  }
}