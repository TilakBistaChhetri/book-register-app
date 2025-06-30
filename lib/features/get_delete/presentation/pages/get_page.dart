import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_cubit.dart';
import '../bloc/get_state.dart';

class GetPage extends StatelessWidget {
  const GetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: BlocBuilder<GetCubit, GetState>(
        builder: (context, state) {
          if (state is GetLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetLoaded) {
            final users = state.data.data;
            if (users == null || users.isEmpty) {
              return const Center(child: Text('No users found'));
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar ?? ''),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email ?? ''),
                );
              },
            );
          } else if (state is GetError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('Please fetch data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<GetCubit>().fetchData(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
