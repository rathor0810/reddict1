import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddict1/core/constants/constants.dart';
import 'package:reddict1/feature/auth/controller/auth_controller.dart';
import 'package:reddict1/feature/community/repository/community_repository.dart';
import 'package:reddict1/models/community_model.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/utils.dart';

final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  final CommunityRepository = ref.watch(communityRepositoryProvider);
  return CommunityController(
      communityRepository: CommunityRepository, ref: ref);
});

class CommunityController extends StateNotifier<bool> {
  final CommunityRepository _communityRepository;
  final Ref _ref;

  CommunityController(
      {required CommunityRepository communityRepository, required Ref ref})
      : _communityRepository = communityRepository,
        _ref = ref,
        super(false);

  void CreateCommunity(String name, BuildContext context) async {
    state = true;
    final uid = _ref.read(userProvider)?.uid ?? '';
    Community community = Community(
        id: name,
        name: name,
        banner: Constants.bannerDefault,
        avatar: Constants.avatarDefault,
        members: [uid],
        mods: [uid]);
    final res = await _communityRepository.createCommunity(community);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'community created succesfully');
      Routemaster.of(context).pop();
    });
  }
}
