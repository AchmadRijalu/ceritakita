import 'package:ceritakita/l10n/app_localizations.dart';
import 'package:ceritakita/providers/map_provider.dart';
import 'package:ceritakita/shared/theme.dart';
import 'package:ceritakita/views/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class StoryLocationMap extends StatefulWidget {
  const StoryLocationMap({
    super.key,
    required this.lat,
    required this.lon,
    required this.title,
  });

  final double lat;
  final double lon;
  final String title;

  @override
  State<StoryLocationMap> createState() => _StoryLocationMapState();
}

class _StoryLocationMapState extends State<StoryLocationMap> {
  GoogleMapController? _mapController;

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  void _showAddressSheet(MapProvider mapProvider) {
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
          child: FutureBuilder<String>(
            future: mapProvider.getAddress(widget.lat, widget.lon),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CeritaLoadingAnimation.compact(message: l10n.loadingAddress),
                  ],
                );
              }

              final address = snapshot.data;
              final displayAddress = address != null && address.isNotEmpty
                  ? address
                  : l10n.addressUnavailable;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.lat.toStringAsFixed(5)}, ${widget.lon.toStringAsFixed(5)}',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    displayAddress,
                    style: blackTextStyle.copyWith(fontSize: 14),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final mapProvider = context.read<MapProvider>();
    final position = LatLng(widget.lat, widget.lon);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.storyLocation,
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.tapMarkerForAddress,
          style: greyTextStyle.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 260,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: position, zoom: 15),
              onMapCreated: (controller) => _mapController = controller,
              markers: {
                Marker(
                  markerId: const MarkerId('story_location'),
                  position: position,
                  onTap: () => _showAddressSheet(mapProvider),
                ),
              },
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
            ),
          ),
        ),
      ],
    );
  }
}
