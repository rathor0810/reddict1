import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddict1/core/common/loader.dart';
import 'package:reddict1/feature/community/controller/community_controller.dart';

class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends ConsumerState<CreateCommunityScreen> {
  final communityNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    communityNameController.dispose();
  }

  void createCommunity() {
    ref
        .read(communityControllerProvider.notifier)
        .CreateCommunity(communityNameController.text.trim(), context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoadding = ref.watch(communityControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create a community'),
        ),
        body: isLoadding
            ? const Loader()
            : Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Community Name')),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: communityNameController,
                      decoration: const InputDecoration(
                        hintText: '/community name',
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(18),
                      ),
                      maxLength: 21,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: createCommunity,
                      child: Text('Create community'),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    )
                  ],
                ),
              ));
  }
}
