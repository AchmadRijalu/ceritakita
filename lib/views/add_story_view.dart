part of 'views.dart';

class AddStoryView extends StatefulWidget {
  static const appRoute = '/addStory';
  const AddStoryView({super.key});

  @override
  State<AddStoryView> createState() => _AddStoryViewState();
}

class _AddStoryViewState extends State<AddStoryView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  bool _showLocationFields = false;

  @override
  void dispose() {
    _headlineController.dispose();
    _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: whiteColor,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Tambah Cerita Kita',
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        shadowColor: greyColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<StoriesProvider>(
                builder: (context, storiesProvider, _) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 220,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: primaryColor.withValues(alpha: 0.35),
                                width: 1.5,
                              ),
                            ),
                            child: storiesProvider.selectedPhoto == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 56,
                                        height: 56,
                                        decoration: BoxDecoration(
                                          color: primaryColor.withValues(
                                            alpha: 0.12,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.add_a_photo_outlined,
                                          color: primaryColor,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Snap or select',
                                        style: blackTextStyle.copyWith(
                                          fontWeight: semiBold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Add a high-quality visual to your story',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                      File(storiesProvider.selectedPhoto!.path),
                                      width: double.infinity,
                                      height: 220,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          if (storiesProvider.selectedPhoto != null)
                            Positioned(
                              right: 12,
                              bottom: 12,
                              child: Material(
                                color: whiteColor,
                                shape: const CircleBorder(),
                                elevation: 2,
                                child: InkWell(
                                  onTap: () => storiesProvider.pickImage(
                                    ImageSource.gallery,
                                  ),
                                  customBorder: const CircleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Material(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(16),
                              child: InkWell(
                                onTap: () => storiesProvider.pickImage(
                                  ImageSource.camera,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.photo_camera_outlined,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Open Camera',
                                        style: primaryDarkTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Material(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(16),
                              child: InkWell(
                                onTap: () => storiesProvider.pickImage(
                                  ImageSource.gallery,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.photo_library_outlined,
                                        color: primaryColor,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'From Gallery',
                                        style: primaryDarkTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              CustomFormField(
                title: 'Headline',
                hintText: 'Give your story a catchy title...',
                controller: _headlineController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Headline is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'The Story',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    '${_storyController.text.length} / 500',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _storyController,
                maxLines: 6,
                maxLength: 500,
                onChanged: (_) => setState(() {}),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Story is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Once upon a time...',
                  counterText: '',
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: blackColor, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 32),
              Consumer<StoriesProvider>(
                builder: (context, storiesProvider, _) {
                  return CustomFilledButton(
                    title: storiesProvider.isLoading
                        ? 'Loading...'
                        : 'Upload Story',
                    onPressed: () async {
                      if (storiesProvider.selectedPhoto == null) {
                        showSnackBar(context, 'Please select a photo first');
                        return;
                      }

                      if (!_formKey.currentState!.validate()) return;

                      await storiesProvider.addNewStory(
                        _headlineController.text,
                        _storyController.text,
                      );

                      if (!mounted) return;

                      if (storiesProvider.isSuccess) {
                        context.pop('Story uploaded successfully');
                      } else if (storiesProvider.isFailure) {
                        showSnackBar(
                          context,
                          ErrorItem.friendlyMessage(
                            storiesProvider.errorMessage,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
