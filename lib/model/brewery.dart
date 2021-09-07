




// To parse this JSON data, do
//
//     final breweryItems = breweryItemsFromJson(jsonString);

import 'dart:convert';

List<BreweryItems> breweryItemsFromJson(String str) => List<BreweryItems>.from(json.decode(str).map((x) => BreweryItems.fromJson(x)));

String breweryItemsToJson(List<BreweryItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BreweryItems {
  BreweryItems({
    this.id,
    this.obdbId,
    this.name,
    this.breweryType,
    this.street,
    this.address2,
    this.address3,
    this.city,
    this.state,
    this.countyProvince,
    this.postalCode,
    this.country,
    this.longitude,
    this.latitude,
    this.phone,
    this.websiteUrl,
    this.updatedAt,
    this.createdAt,
  });

  int? id;
  String? obdbId;
  String? name;
  String? breweryType;
  String? street;
  dynamic address2;
  dynamic address3;
  String? city;
  String? state;
  dynamic countyProvince;
  String? postalCode;
  String? country;
  String? longitude;
  String? latitude;
  String? phone;
  String? websiteUrl;
  String? updatedAt;
  String? createdAt;

  factory BreweryItems.fromJson(Map<String, dynamic> json) => BreweryItems(
    id: json["id"],
    obdbId: json["obdb_id"],
    name: json["name"],
    breweryType: json["brewery_type"],
    street: json["street"] == null ? null : json["street"],
    address2: json["address_2"],
    address3: json["address_3"],
    city: json["city"],
    state: json["state"],
    countyProvince: json["county_province"],
    postalCode: json["postal_code"],
    country: json["country"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    phone: json["phone"] == null ? null : json["phone"],
    websiteUrl: json["website_url"] == null ? null : json["website_url"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "obdb_id": obdbId,
    "name": name,
    "brewery_type": breweryType,
    "street": street == null ? null : street,
    "address_2": address2,
    "address_3": address3,
    "city": city,
    "state": state,
    "county_province": countyProvince,
    "postal_code": postalCode,
    "country": country,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
    "phone": phone == null ? null : phone,
    "website_url": websiteUrl == null ? null : websiteUrl,
    "updated_at": updatedAt,
    "created_at": createdAt,
  };
}
