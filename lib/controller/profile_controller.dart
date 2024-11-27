import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var profiles = <Profile>[].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Menambahkan profil ke Firestore
  Future<void> addProfile(String name, String gender, double weight, double height) async {
    DocumentReference docRef = await firestore.collection('profiles').add({
      'name': name,
      'gender': gender,
      'weight': weight,
      'height': height,
    });
    profiles.add(Profile(id: docRef.id, name: name, gender: gender, weight: weight, height: height));
  }

  // Mengupdate profil di Firestore
  Future<void> updateProfile(int index, String name, String gender, double weight, double height) async {
    String docId = profiles[index].id;
    await firestore.collection('profiles').doc(docId).update({
      'name': name,
      'gender': gender,
      'weight': weight,
      'height': height,
    });
    profiles[index] = Profile(id: docId, name: name, gender: gender, weight: weight, height: height);
  }

  // Menghapus profil dari Firestore
  Future<void> deleteProfile(int index) async {
    String docId = profiles[index].id;
    await firestore.collection('profiles').doc(docId).delete();
    profiles.removeAt(index);
  }

  // Mendapatkan profil dari Firestore saat inisialisasi controller
  @override
  void onInit() {
    super.onInit();
    fetchProfiles();
  }

  // Mengambil profil dari Firestore
  Future<void> fetchProfiles() async {
    QuerySnapshot snapshot = await firestore.collection('profiles').get();
    profiles.value = snapshot.docs.map((doc) {
      return Profile(
        id: doc.id,
        name: doc['name'],
        gender: doc['gender'],
        weight: doc['weight'],
        height: doc['height'],
      );
    }).toList();
  }
}

class Profile {
  String id;
  String name;
  String gender;
  double weight;
  double height;

  Profile({
    required this.id,
    required this.name,
    required this.gender,
    required this.weight,
    required this.height,
  });
}
