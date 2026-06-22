import 'package:flutter/material.dart';
import 'package:star_wars/core/api/auth/models/profile.model.dart';
import 'package:star_wars/ui/components/model/ui.model.dart';
import 'package:star_wars/ui/components/ui.comp.dart';
import 'package:star_wars/ui/home/profile/profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.viewModel});
  final ProfileViewModel viewModel;
  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  late Future<ProfileModel> _profileFuture;
  @override
  void initState() {
    super.initState();
    _profileFuture = widget.viewModel.fetchProfile();
  }

  void signOut() async {
    await widget.viewModel.signOut();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<ProfileModel>(
    future: _profileFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      final profile = snapshot.data;
      return Column(
        spacing: 30,
        children: [
          Column(
            children: [
              Icon(Icons.account_circle, size: 120),
              Text(
                profile?.name ?? 'Hello',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Center(
            child: CardItems(
              items: [
                Item(icon: Icons.star, value: '10'),
                Item(icon: Icons.cake, value: '26/02/2005'),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            width: 270,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: 3,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Text('Email: ${profile?.email ?? ''}');
                  case 1:
                    return Text('Role: ${profile?.role ?? ''}');
                  default:
                    return Container();
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => signOut(),
                child: Text('Sign Out'),
              ),
            ],
          ),
        ],
      );
    },
  );
}
