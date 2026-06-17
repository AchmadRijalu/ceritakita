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

  @override
  void dispose() {
    _headlineController.dispose();
    _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: whiteColor,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          l10n.addStoryTitle,
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
                                        l10n.snapOrSelect,
                                        style: blackTextStyle.copyWith(
                                          fontWeight: semiBold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        l10n.addVisualHint,
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
                                        l10n.openCamera,
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
                                        l10n.fromGallery,
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
              if (AppFlavorConfig.canAddStoryLocation)
                Consumer<MapProvider>(
                  builder: (context, mapProvider, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.addLocation,
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Material(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            onTap: () {
                              mapProvider.preparePicker(
                                initialLat: mapProvider.selectedLat,
                                initialLon: mapProvider.selectedLon,
                              );
                              context.push(MapPickerView.appRoute);
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      mapProvider.locationDisplayLabel(
                                        addLocationLabel: l10n.addLocation,
                                        loadingAddressLabel: l10n.loadingAddress,
                                        addressUnavailableLabel:
                                            l10n.addressUnavailable,
                                      ),
                                      style: primaryDarkTextStyle.copyWith(
                                        fontSize: 13,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ),
                                  if (mapProvider.hasSelectedLocation)
                                    TextButton(
                                      onPressed:
                                          mapProvider.clearSelectedLocation,
                                      child: Text(
                                        l10n.removeLocation,
                                        style: primaryDarkTextStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    )
                                  else
                                    Icon(
                                      Icons.chevron_right,
                                      color: primaryColor,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              else
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: greyColor.withValues(alpha: 0.35)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lock_outline, color: greyColor, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          l10n.locationPaidOnly,
                          style: greyTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 24),
              CustomFormField(
                title: l10n.headline,
                hintText: l10n.headlineHint,
                controller: _headlineController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.headlineRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.theStory,
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
                    return l10n.storyRequired;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: l10n.storyHint,
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
                        ? l10n.loading
                        : l10n.uploadStory,
                    onPressed: () async {
                      if (storiesProvider.selectedPhoto == null) {
                        showSnackBar(context, l10n.pleaseSelectPhoto);
                        return;
                      }

                      if (!_formKey.currentState!.validate()) return;

                      await storiesProvider.addNewStory(
                        _headlineController.text,
                        _storyController.text,
                      );

                      if (!mounted) return;

                      if (storiesProvider.isSuccess) {
                        context.pop(l10n.storyUploadedSuccessfully);
                      } else if (storiesProvider.isFailure) {
                        showSnackBar(
                          context,
                          ErrorItem.friendlyMessage(
                            context,
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
