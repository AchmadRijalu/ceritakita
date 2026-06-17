part of 'views.dart';

class MapPickerView extends StatefulWidget {
  static const appRoute = '/mapPicker';

  const MapPickerView({super.key});

  @override
  State<MapPickerView> createState() => _MapPickerViewState();
}

class _MapPickerViewState extends State<MapPickerView> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (!AppFlavorConfig.canAddStoryLocation) {
        context.pop();
        return;
      }
      context.read<MapProvider>().initPicker();
    });
  }

  @override
  void dispose() {
    _mapController?.dispose();
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
          l10n.pickLocationTitle,
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        shadowColor: greyColor,
      ),
      body: Consumer<MapProvider>(
        builder: (context, mapProvider, _) {
          if (!mapProvider.isPickerReady || !mapProvider.hasPickerPosition) {
            return Center(
              child: CeritaLoadingAnimation(message: l10n.loading),
            );
          }

          final position = LatLng(mapProvider.pickerLat!, mapProvider.pickerLon!);

          return Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: position,
                  zoom: 15,
                ),
                onMapCreated: (controller) => _mapController = controller,
                onCameraMove: (cameraPosition) => mapProvider.updatePickerPosition(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
              ),
              IgnorePointer(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, color: primaryColor, size: 48),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
              Positioned(
                top: 16,
                left: 20,
                right: 20,
                child: Material(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      l10n.mapPickerHint,
                      style: blackTextStyle.copyWith(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 24,
                child: CustomFilledButton(
                  title: l10n.confirmLocation,
                  onPressed: () async {
                    context.pop();
                    await mapProvider.applyPickerAsSelection();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
