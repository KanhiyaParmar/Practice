// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   Future<User?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();

//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleAuth =
//             await googleSignInAccount.authentication;

//         final OAuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         final UserCredential authResult =
//             await _auth.signInWithCredential(credential);

//         final User? user = authResult.user;
//         return user;
//       } else {
//         return null;
//       }
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }

//   Future<void> signOutGoogle() async {
//     await googleSignIn.signOut();
//     print("User Signed Out");
//   }
// }
