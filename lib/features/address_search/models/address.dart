class Address {
  String placeId;
  String placeName;
  double latitude;
  double longitude;
  String placeFormattedAddress;

  Address(
    this.placeId,
    this.placeName,
    this.latitude,
    this.longitude,
    this.placeFormattedAddress,
  );

  @override
  String toString() {
    return 'Address(placeId: $placeId, placeName: $placeName, latitude: $latitude, longitude: $longitude, placeFormattedAddress: $placeFormattedAddress)';
  }
}
