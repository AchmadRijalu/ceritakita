part of 'views.dart';

class RegisterView extends StatefulWidget {
  static const appRoute = '/register';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cerita Kita",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 25),
            ),
            const SizedBox(height: 8),
            Text(
              "Join our community of storytellers and start sharing your journey today.",
            ),
          ],
        ),
      ),
    );
  }
}
