import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Data/Model/usermodel.dart';
import 'package:simple_flutter_project/Domain/userprovider.dart';
import 'package:simple_flutter_project/Utils/utils.dart';

class HomeAPISelector extends StatelessWidget {
  const HomeAPISelector({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Users in Selector',
          style: TextStyle(color: color),
        ),
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
            return Selector<UserProvider, List<User>>(
                selector: (context, userProvider) => userProvider.users,
                builder: (context, users, child) {
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
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
