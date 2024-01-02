import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Domain/userprovider.dart';
import 'package:simple_flutter_project/Utils/utils.dart';

class HomeAPIConsumer extends StatelessWidget {
  const HomeAPIConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users in Consumer',
          style: TextStyle(color: color),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: Provider.of<UserProvider>(context, listen: false).fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Consumer<UserProvider>(
                builder: (context, userProvider, child) {
              return ListView.builder(
                itemCount: userProvider.users.length,
                itemBuilder: (context, index) {
                  final user = userProvider.users[index];
                  return ListTile(
                    title: Text(
                      user.name,
                      style: TextStyle(color: color),
                    ),
                    subtitle: Text(
                      user.email,
                      style: TextStyle(color: color),
                    ),
                  );
                },
              );
            });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<UserProvider>(context, listen: false).fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
