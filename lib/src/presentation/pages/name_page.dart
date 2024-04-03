import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_project/src/locator.dart';
import 'package:trial_project/src/presentation/bloc/name_bloc.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final nameBloc = locator<NameBloc>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NameBloc, NameState>(
        bloc: nameBloc,
        builder: (context, state) {
          if (state is NameLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GenericError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(state.error)),
                const SizedBox(height: 50),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const NamePage()),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Back"),
                  ),
                ),
              ],
            );
          }
          if (state is NameLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.name.name!),
                const SizedBox(height: 50),
                Text(state.name.age.toString()),
                const SizedBox(height: 50),
                Text(state.name.count.toString()),
                const SizedBox(height: 50),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const NamePage()),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Back"),
                  ),
                ),
              ],
            );
          }
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(""),
            const SizedBox(height: 50),
            TextFormField(
              controller: nameController,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                final param = {"name": nameController.text};
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter a name")),
                  );
                } else {
                  nameBloc.add(GetNameEvent(param: param));
                }
              },
              child: const Text("Search Name"),
            ),
          ]);
        },
      ),
    );
  }
}
