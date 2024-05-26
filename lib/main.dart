import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MyApp is the root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(), // Set the home screen to ProfilePage
    );
  }
}

// ProfilePage is the main screen of the application
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              // Handle menu selection here
            },
            itemBuilder: (BuildContext context) {
              return {'Option 1', 'Option 2', 'Option 3'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // User Profile Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // User Info Row
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/61364683?v=4'),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mohammed Haroon',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Full-stack developer',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.edit, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Info Columns Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildInfoColumn('846', 'Collect'),
                          buildInfoColumn('51', 'Attention'),
                          buildInfoColumn('267', 'Track'),
                          buildInfoColumn('39', 'Coupons'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              // Action Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconColumn(Icons.account_balance_wallet, 'Wallet'),
                  buildIconColumn(Icons.local_shipping, 'Delivery'),
                  buildIconColumn(Icons.message, 'Message', badgeCount: 2),
                  buildIconColumn(Icons.support_agent, 'Service'),
                ],
              ),
              SizedBox(height: 50),
              // List Tiles with Shadows
              buildListTileWithShadow(Icons.location_on, 'Address', 'Ensure your harvesting address'),
              buildListTileWithShadow(Icons.lock, 'Privacy', 'System permission change'),
              buildListTileWithShadow(Icons.settings, 'General', 'Basic functional settings'),
              buildListTileWithShadow(Icons.notifications, 'Notification', 'Take over the news in time'),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build info columns
  Column buildInfoColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  // Helper method to build icon columns with optional badge count
  Column buildIconColumn(IconData icon, String label, {int badgeCount = 0}) {
    return Column(
      children: [
        Stack(
          children: [
            Icon(
              icon,
              size: 32,
            ),
            if (badgeCount > 0)
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '$badgeCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  // Helper method to build list tiles
  ListTile buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 2.0,
              color: Colors.black26,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Icon(Icons.chevron_right),
    );
  }

  Widget buildListTileWithShadow(IconData icon, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0), // Add margin top and bottom
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 173, 206, 239),
            blurRadius: 40.0,
            spreadRadius: 5.0,
            offset: Offset(
              15.0,
              15.0,
            ),
          )
        ],
        border: Border.all(
          color: Color.fromARGB(255, 208, 208, 245),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: buildListTile(icon, title, subtitle),
    );
  }
}