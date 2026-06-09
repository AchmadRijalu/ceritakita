part of '../views.dart';

class RegisterView extends StatefulWidget {
  static const appRoute = '/register';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cerita Kita",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        ),
        shadowColor: greyColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
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
              const SizedBox(height: 24),
              CustomFormField(
                title: "Full Name",
                hintText: "Enter your full name",
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Full name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomFormField(
                title: "Email Address",
                hintText: "name@example.com",
                keyBoardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(
                    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomFormField(
                title: "Password",
                hintText: "••••••••",
                keyBoardType: TextInputType.visiblePassword,
                isPasswordField: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'At least 8 characters',
                    style: blackTextStyle.copyWith(
                      fontSize: 11,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Consumer<AuthProvider>(
                builder: (context, value, child) => CustomFilledButton(
                  title: value.isLoading ? "Loading..." : "Register",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final authContext = context.read<AuthProvider>();
                      await authContext.fetchRegister(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (!mounted) return;

                      if (authContext.isSuccess) {
                        final message =
                            authContext.successMessage ??
                            'Registration successful';
                        authContext.reset();
                        context.go(LoginView.appRoute, extra: message);
                      } else if (authContext.isFailure) {
                        showSnackBar(
                          context,
                          authContext.errorMessage ?? "Register Failed",
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
