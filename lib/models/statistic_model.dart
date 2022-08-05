class Statistics {
  String? guid;
  ToplananVeAdreslenenAdet? toplananVeAdreslenenAdet;
  Siparisler? siparisler;
  FaturaYazdirilanSiparisler? faturaYazdirilanSiparisler;
  PaketlenenSiparis? paketlenenSiparis;
  OnaylananSiparis? onaylananSiparis;
  GoalOnaylananSiparis? goalOnaylananSiparis;
  ToplamHazirlaniyor? toplamHazirlaniyor;
  ToplanacakUrunMiktari? toplanacakUrunMiktari;
  YedekSorterSayi? yedekSorterSayi;
  int? toplamAdreslenecekAdet;
  String? dateTime;

  Statistics(
      {this.guid,
      this.toplananVeAdreslenenAdet,
      this.siparisler,
      this.faturaYazdirilanSiparisler,
      this.paketlenenSiparis,
      this.onaylananSiparis,
      this.goalOnaylananSiparis,
      this.toplamHazirlaniyor,
      this.toplanacakUrunMiktari,
      this.yedekSorterSayi,
      this.toplamAdreslenecekAdet,
      this.dateTime});

  Statistics.fromJson(Map<String, dynamic> json) {
    guid = json['Guid'];
    toplananVeAdreslenenAdet = json['ToplananVeAdreslenenAdet'] != null
        ? ToplananVeAdreslenenAdet.fromJson(
            json['ToplananVeAdreslenenAdet'])
        : null;
    siparisler = json['Siparisler'] != null
        ? Siparisler.fromJson(json['Siparisler'])
        : null;
    faturaYazdirilanSiparisler = json['FaturaYazdirilanSiparisler'] != null
        ? FaturaYazdirilanSiparisler.fromJson(
            json['FaturaYazdirilanSiparisler'])
        : null;
    paketlenenSiparis = json['PaketlenenSiparis'] != null
        ? PaketlenenSiparis.fromJson(json['PaketlenenSiparis'])
        : null;
    onaylananSiparis = json['OnaylananSiparis'] != null
        ? OnaylananSiparis.fromJson(json['OnaylananSiparis'])
        : null;
    goalOnaylananSiparis = json['GoalOnaylananSiparis'] != null
        ? GoalOnaylananSiparis.fromJson(json['GoalOnaylananSiparis'])
        : null;
    toplamHazirlaniyor = json['ToplamHazirlaniyor'] != null
        ? ToplamHazirlaniyor.fromJson(json['ToplamHazirlaniyor'])
        : null;
    toplanacakUrunMiktari = json['ToplanacakUrunMiktari'] != null
        ? ToplanacakUrunMiktari.fromJson(json['ToplanacakUrunMiktari'])
        : null;
    yedekSorterSayi = json['YedekSorterSayi'] != null
        ? YedekSorterSayi.fromJson(json['YedekSorterSayi'])
        : null;
    toplamAdreslenecekAdet = json['ToplamAdreslenecekAdet'];
    dateTime = json['DateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Guid'] = guid;
    if (toplananVeAdreslenenAdet != null) {
      data['ToplananVeAdreslenenAdet'] =
          toplananVeAdreslenenAdet!.toJson();
    }
    if (siparisler != null) {
      data['Siparisler'] = siparisler!.toJson();
    }
    if (faturaYazdirilanSiparisler != null) {
      data['FaturaYazdirilanSiparisler'] =
          faturaYazdirilanSiparisler!.toJson();
    }
    if (paketlenenSiparis != null) {
      data['PaketlenenSiparis'] = paketlenenSiparis!.toJson();
    }
    if (onaylananSiparis != null) {
      data['OnaylananSiparis'] = onaylananSiparis!.toJson();
    }
    if (goalOnaylananSiparis != null) {
      data['GoalOnaylananSiparis'] = goalOnaylananSiparis!.toJson();
    }
    if (toplamHazirlaniyor != null) {
      data['ToplamHazirlaniyor'] = toplamHazirlaniyor!.toJson();
    }
    if (toplanacakUrunMiktari != null) {
      data['ToplanacakUrunMiktari'] = toplanacakUrunMiktari!.toJson();
    }
    if (yedekSorterSayi != null) {
      data['YedekSorterSayi'] = yedekSorterSayi!.toJson();
    }
    data['ToplamAdreslenecekAdet'] = toplamAdreslenecekAdet;
    data['DateTime'] = dateTime;
    return data;
  }
}

class ToplananVeAdreslenenAdet {
  int? bugunToplananAdet;
  int? bugunAdreslenenAdet;

  ToplananVeAdreslenenAdet({this.bugunToplananAdet, this.bugunAdreslenenAdet});

  ToplananVeAdreslenenAdet.fromJson(Map<String, dynamic> json) {
    bugunToplananAdet = json['BugunToplananAdet'];
    bugunAdreslenenAdet = json['BugunAdreslenenAdet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BugunToplananAdet'] = bugunToplananAdet;
    data['BugunAdreslenenAdet'] = bugunAdreslenenAdet;
    return data;
  }
}

class Siparisler {
  int? bugunGelenSiparisSayi;
  int? bugunGelenSiparisAdet;

  Siparisler({this.bugunGelenSiparisSayi, this.bugunGelenSiparisAdet});

  Siparisler.fromJson(Map<String, dynamic> json) {
    bugunGelenSiparisSayi = json['BugunGelenSiparisSayi'];
    bugunGelenSiparisAdet = json['BugunGelenSiparisAdet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BugunGelenSiparisSayi'] = bugunGelenSiparisSayi;
    data['BugunGelenSiparisAdet'] = bugunGelenSiparisAdet;
    return data;
  }
}

class FaturaYazdirilanSiparisler {
  int? bugunFaturaKesilenSiparisSayi;
  int? bugunFaturaKesilenSiparisAdet;

  FaturaYazdirilanSiparisler(
      {this.bugunFaturaKesilenSiparisSayi, this.bugunFaturaKesilenSiparisAdet});

  FaturaYazdirilanSiparisler.fromJson(Map<String, dynamic> json) {
    bugunFaturaKesilenSiparisSayi = json['BugunFaturaKesilenSiparisSayi'];
    bugunFaturaKesilenSiparisAdet = json['BugunFaturaKesilenSiparisAdet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BugunFaturaKesilenSiparisSayi'] = bugunFaturaKesilenSiparisSayi;
    data['BugunFaturaKesilenSiparisAdet'] = bugunFaturaKesilenSiparisAdet;
    return data;
  }
}

class PaketlenenSiparis {
  int? bugunPaketlenenSiparisSayi;
  int? bugunPaketlenenSiparisAdet;

  PaketlenenSiparis(
      {this.bugunPaketlenenSiparisSayi, this.bugunPaketlenenSiparisAdet});

  PaketlenenSiparis.fromJson(Map<String, dynamic> json) {
    bugunPaketlenenSiparisSayi = json['BugunPaketlenenSiparisSayi'];
    bugunPaketlenenSiparisAdet = json['BugunPaketlenenSiparisAdet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BugunPaketlenenSiparisSayi'] = bugunPaketlenenSiparisSayi;
    data['BugunPaketlenenSiparisAdet'] = bugunPaketlenenSiparisAdet;
    return data;
  }
}

class OnaylananSiparis {
  int? toplamOnaylananSiparisAdet;
  int? toplamOnaylananSiparisSayi;

  OnaylananSiparis(
      {this.toplamOnaylananSiparisAdet, this.toplamOnaylananSiparisSayi});

  OnaylananSiparis.fromJson(Map<String, dynamic> json) {
    toplamOnaylananSiparisAdet = json['ToplamOnaylananSiparisAdet'];
    toplamOnaylananSiparisSayi = json['ToplamOnaylananSiparisSayi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ToplamOnaylananSiparisAdet'] = toplamOnaylananSiparisAdet;
    data['ToplamOnaylananSiparisSayi'] = toplamOnaylananSiparisSayi;
    return data;
  }
}

class GoalOnaylananSiparis {
  int? goalOnaylananSiparisSayi;
  int? goalOnaylananSiparisAdet;

  GoalOnaylananSiparis(
      {this.goalOnaylananSiparisSayi, this.goalOnaylananSiparisAdet});

  GoalOnaylananSiparis.fromJson(Map<String, dynamic> json) {
    goalOnaylananSiparisSayi = json['GoalOnaylananSiparisSayi'];
    goalOnaylananSiparisAdet = json['GoalOnaylananSiparisAdet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GoalOnaylananSiparisSayi'] = goalOnaylananSiparisSayi;
    data['GoalOnaylananSiparisAdet'] = goalOnaylananSiparisAdet;
    return data;
  }
}

class ToplamHazirlaniyor {
  int? toplamHazirlaniyorSayi;
  int? toplamHazirlaniyorAdet;

  ToplamHazirlaniyor(
      {this.toplamHazirlaniyorSayi, this.toplamHazirlaniyorAdet});

  ToplamHazirlaniyor.fromJson(Map<String, dynamic> json) {
    toplamHazirlaniyorSayi = json['ToplamHazirlaniyorSayi'];
    toplamHazirlaniyorAdet = json['ToplamHazirlaniyorAdet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ToplamHazirlaniyorSayi'] = toplamHazirlaniyorSayi;
    data['ToplamHazirlaniyorAdet'] = toplamHazirlaniyorAdet;
    return data;
  }
}

class ToplanacakUrunMiktari {
  int? internetDepoToplanacakUrunMiktari;
  int? omniChannelToplanacakUrunMiktari;

  ToplanacakUrunMiktari(
      {this.internetDepoToplanacakUrunMiktari,
      this.omniChannelToplanacakUrunMiktari});

  ToplanacakUrunMiktari.fromJson(Map<String, dynamic> json) {
    internetDepoToplanacakUrunMiktari =
        json['InternetDepoToplanacakUrunMiktari'];
    omniChannelToplanacakUrunMiktari = json['OmniChannelToplanacakUrunMiktari'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['InternetDepoToplanacakUrunMiktari'] =
        internetDepoToplanacakUrunMiktari;
    data['OmniChannelToplanacakUrunMiktari'] =
        omniChannelToplanacakUrunMiktari;
    return data;
  }
}

class YedekSorterSayi {
  int? gozYedekSayisi600;
  int? gozYedekSayisi1200;

  YedekSorterSayi({this.gozYedekSayisi600, this.gozYedekSayisi1200});

  YedekSorterSayi.fromJson(Map<String, dynamic> json) {
    gozYedekSayisi600 = json['GozYedekSayisi600'];
    gozYedekSayisi1200 = json['GozYedekSayisi1200'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GozYedekSayisi600'] = gozYedekSayisi600;
    data['GozYedekSayisi1200'] = gozYedekSayisi1200;
    return data;
  }
}
