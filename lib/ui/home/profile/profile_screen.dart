import 'dart:async';
import 'package:flutter/material.dart';
import 'package:star_wars/core/api/auth/models/profile.model.dart';
import 'package:star_wars/ui/components/model/ui.model.dart';
import 'package:star_wars/ui/components/ui.comp.dart';
import 'package:star_wars/ui/home/profile/profile_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.viewModel});
  final ProfileViewModel viewModel;
  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  late Future<ProfileModel> _profileFuture;
  final Completer<GoogleMapController> _mapController = Completer();
  @override
  void initState() {
    super.initState();
    _profileFuture = widget.viewModel.fetchProfile();
  }

  void signOut() async {
    await widget.viewModel.signOut();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: FutureBuilder<ProfileModel>(
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
                  ItemModel(icon: Icon(Icons.star), value: '10'),
                  ItemModel(icon: Icon(Icons.cake), value: '26/02/2005'),
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
            SizedBox(
              width: 300,
              height: 200,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(37.43296265331129, -122.08832357078792),
                  tilt: 59.440717697143555,
                  zoom: 19.151926040649414,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
                myLocationEnabled: true,
                compassEnabled: true,
                myLocationButtonEnabled: true,
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
    ),
  );
}
