part of '../views.dart';

class LoginView extends StatefulWidget {
  static const appRoute = '/login';

  const LoginView({super.key, this.registerSuccessMessage});

  final String? registerSuccessMessage;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final message = widget.registerSuccessMessage;
    if (message != null && message.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        showSnackBar(context, message, backgroundColor: greenColor);
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppImage.logo.image(width: 122),
                const SizedBox(height: 24),
                Text(
                  l10n.helloThere,
                  style: blackTextStyle.copyWith(
                    color: blackColor,
                    fontWeight: bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.signInToContinue,
                  style: blackTextStyle.copyWith(
                    color: blackColor,
                    fontWeight: regular,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  title: l10n.emailAddress,
                  hintText: "john.dave@gmail.com",
                  keyBoardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.emailRequired;
                    }
                    if (!RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return l10n.emailInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  title: l10n.password,
                  hintText: "",
                  isPasswordField: true,
                  keyBoardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.passwordRequired;
                    }
                    if (value.length < 6) {
                      return l10n.passwordMin6;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Consumer<AuthProvider>(
                  builder: (context, value, child) {
                    return CustomFilledButton(
                      title: value.isLoading ? l10n.loading : l10n.login,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final auth = context.read<AuthProvider>();

                          await auth.fetchLogin(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (!mounted) return;
                          if (auth.isFailure) {
                            showSnackBar(
                              context,
                              auth.errorMessage ?? l10n.loginFailed,
                            );
                          }
                        }
                      },
                    );
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(l10n.dontHaveAccount),
                    CustomTextButton(
                      title: l10n.register,
                      onPressed: () => context.push(RegisterView.appRoute),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
