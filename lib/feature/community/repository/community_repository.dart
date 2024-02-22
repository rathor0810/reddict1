import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddict1/core/constants/firebase_constants.dart';
import 'package:reddict1/core/failure.dart';
import 'package:reddict1/core/provider/firebase_provider.dart';
import 'package:reddict1/core/type_defs.dart';
import 'package:reddict1/models/community_model.dart';

final communityRepositoryProvider = Provider((ref) {
  return CommunityRepository(firebaseFirestore: ref.watch(firestoreProvider));
});

class CommunityRepository {
  final FirebaseFirestore _firebaseFirestore;

  CommunityRepository({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  Future<Either<failure, dynamic>> createCommunity(Community community) async {
    try {
      var communityDoc = await _communities.doc(community.name).get();
      if (communityDoc.exists) {
        throw 'Community of this name already exist';
      }
      return right(_communities.doc(community.name).set(community.toMap()));
    } on FirebaseException catch (e) {
      return left(failure(e.message!));
    } catch (e) {
      return left(failure(e.toString()));
    }
  }

  CollectionReference get _communities =>
      _firebaseFirestore.collection(FirebaseConstants.communitiesCollection);
}
