import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:my_ticket/auth/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:my_ticket/models/user.dart';
import 'package:my_ticket/firebase_options.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockAuthCredentials extends Mock implements AuthCredential {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

void main() {
  group('Login Widget', () {
    MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
    MockGoogleSignIn mockGoogleSignIn = MockGoogleSignIn();

    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
    });

    testWidgets('Renders login UI correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => UserModel(),
            child: const Login(),
          ),
        ),
      );

      expect(find.text('Continue with Phone'), findsOneWidget);
      expect(find.text('Continue with Google'), findsOneWidget);
      expect(find.text('No account?'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);

      final userModel = Provider.of<UserModel>(
          tester.element(find.byType(Login)),
          listen: true);
      when(mockGoogleSignIn.signIn()).thenAnswer((_) async {
        GoogleSignInAccount? googleUser = await mockGoogleSignIn.signIn();
        GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        try {
          mockFirebaseAuth.signInWithCredential(credential);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            debugPrint(
                "The account already exists with a different credential");
          } else if (e.code == 'invalid-credential') {
            debugPrint(
                "Error occurred while accessing credentials. Try again.");
          }
        } catch (e) {
          debugPrint(e.toString());
        }
      });

      await tester.tap(find.text('Continue with Google'));
      await tester.pumpAndSettle();

      await userModel.getUser();

      expect(userModel.user, isA<User>);
    });
  });
}
