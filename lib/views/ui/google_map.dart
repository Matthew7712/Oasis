import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oasis/controllers/locations.dart' as locations;
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/map/map_slider.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import '../../services/appcolors.dart';

class MyGoogleMap extends StatefulWidget {
  final String title;
  final double latitude;
  final double longitude;
  final List<AssetImage> assetImage;
  const MyGoogleMap({super.key, this.latitude =0.0, this.longitude =0.0, required this.assetImage, this.title = ''});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
  }

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 0.8,
        ),
        markers: _markers.values.toSet().map((marker) {
          return Marker(
            markerId: marker.markerId,
            position: marker.position,
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (context){
                    return SingleChildScrollView(
                      child: Container(
                        height: height * 0.8,
                        padding: EdgeInsets.symmetric(vertical: Dimensions.vertical10, horizontal: Dimensions.horizontal24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight: Radius.circular(Dimensions.radius20))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: width / 3.5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                                        color: Colors.black
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: Dimensions.height20,),
                            TitleText(title: widget.title, color: AppColors.titleColor, fontSize: width < 325 ? Dimensions.font24 : width < 375 ? Dimensions.font28 : Dimensions.font32, fontWeight: FontWeight.w600),
                            SizedBox(height: Dimensions.height20,),
                            TitleText(title: "Интересные факты", color: AppColors.titleColor, fontSize: width < 325 ? Dimensions.font16 : width < 375 ? Dimensions.font20 : Dimensions.font24, fontWeight: FontWeight.w600),
                            const SizedBox(height: 5,),
                            DefaultText(text: "Япония — это уникальное азиатское островное государство, история которого насчитывает тысячелетия.", color: AppColors.textColor, fontSize: width < 325 ? Dimensions.font12 : width < 375 ? Dimensions.font14 : Dimensions.font16, fontWeight: FontWeight.w400),
                            SizedBox(height: Dimensions.height30,),
                            //Сделать как отдельный компонент, слайдер для карты
                            MapSlider(title: "Фотография", assetImage: widget.assetImage),
                            SizedBox(height: Dimensions.height20,),
                            MapSlider(title: "Отели поблизости", assetImage: widget.assetImage)
                          ],
                        ),
                      ),
                    );
                  }
              );
            },
          );
        }).toSet()
      ),
    );
  }
}
