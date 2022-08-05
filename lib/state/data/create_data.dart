
import 'dart:math';

import '../../models/statistic_model.dart';

class CreateData {

List<Statistics> CreateDataValue(){

  List<Statistics> data = [];
  Statistics data1 =  Statistics(
    guid: "1",
    toplananVeAdreslenenAdet: ToplananVeAdreslenenAdet(bugunAdreslenenAdet: 38239, bugunToplananAdet: 46805),
    siparisler : Siparisler(bugunGelenSiparisAdet: 21739, bugunGelenSiparisSayi: 6379),
    faturaYazdirilanSiparisler : FaturaYazdirilanSiparisler(bugunFaturaKesilenSiparisAdet: 53481, bugunFaturaKesilenSiparisSayi: 16539),
    paketlenenSiparis : PaketlenenSiparis(bugunPaketlenenSiparisAdet: 53445, bugunPaketlenenSiparisSayi: 16531 ),
    onaylananSiparis : OnaylananSiparis(toplamOnaylananSiparisAdet: 1269, toplamOnaylananSiparisSayi: 971 ),
    goalOnaylananSiparis : GoalOnaylananSiparis(goalOnaylananSiparisAdet: 1267, goalOnaylananSiparisSayi: 969),
    toplamHazirlaniyor : ToplamHazirlaniyor(toplamHazirlaniyorAdet: 37172, toplamHazirlaniyorSayi: 9572),
    toplanacakUrunMiktari : ToplanacakUrunMiktari(internetDepoToplanacakUrunMiktari: 4813,omniChannelToplanacakUrunMiktari: 2008 ),
    yedekSorterSayi :  YedekSorterSayi(gozYedekSayisi1200:0 ,gozYedekSayisi600: 0),
    toplamAdreslenecekAdet : 3138,
    dateTime : "2022-08-02T11:45:18.4943733+03:00"
  );

  Statistics data2 =  Statistics(
    guid: "2",
    toplananVeAdreslenenAdet: ToplananVeAdreslenenAdet(bugunAdreslenenAdet: 14602, bugunToplananAdet: 14448),
    siparisler : Siparisler(bugunGelenSiparisAdet: 8988, bugunGelenSiparisSayi: 3138),
    faturaYazdirilanSiparisler : FaturaYazdirilanSiparisler(bugunFaturaKesilenSiparisAdet: 12297, bugunFaturaKesilenSiparisSayi: 3353),
    paketlenenSiparis : PaketlenenSiparis(bugunPaketlenenSiparisAdet: 12345, bugunPaketlenenSiparisSayi: 3361 ),
    onaylananSiparis : OnaylananSiparis(toplamOnaylananSiparisAdet: 18747, toplamOnaylananSiparisSayi: 4921 ),
    goalOnaylananSiparis : GoalOnaylananSiparis(goalOnaylananSiparisAdet: 18745, goalOnaylananSiparisSayi: 4919),
    toplamHazirlaniyor : ToplamHazirlaniyor(toplamHazirlaniyorAdet: 52199, toplamHazirlaniyorSayi: 17847),
    toplanacakUrunMiktari : ToplanacakUrunMiktari(internetDepoToplanacakUrunMiktari: 15499,omniChannelToplanacakUrunMiktari: 6766 ),
    yedekSorterSayi :  YedekSorterSayi(gozYedekSayisi1200:0 ,gozYedekSayisi600: 0),
    toplamAdreslenecekAdet : 1854,
    dateTime : "2022-08-03T12:45:18.4943733+03:00"
  );

  Statistics data3 =  Statistics(
    guid: "3",
    toplananVeAdreslenenAdet: ToplananVeAdreslenenAdet(bugunAdreslenenAdet: 38239, bugunToplananAdet: 46805),
    siparisler : Siparisler(bugunGelenSiparisAdet: 26739, bugunGelenSiparisSayi: 6679),
    faturaYazdirilanSiparisler : FaturaYazdirilanSiparisler(bugunFaturaKesilenSiparisAdet: 50481, bugunFaturaKesilenSiparisSayi: 26539),
    paketlenenSiparis : PaketlenenSiparis(bugunPaketlenenSiparisAdet: 63445, bugunPaketlenenSiparisSayi: 26531 ),
    onaylananSiparis : OnaylananSiparis(toplamOnaylananSiparisAdet: 1869, toplamOnaylananSiparisSayi: 1001 ),
    goalOnaylananSiparis : GoalOnaylananSiparis(goalOnaylananSiparisAdet: 1567, goalOnaylananSiparisSayi: 999),
    toplamHazirlaniyor : ToplamHazirlaniyor(toplamHazirlaniyorAdet: 31172, toplamHazirlaniyorSayi: 8572),
    toplanacakUrunMiktari : ToplanacakUrunMiktari(internetDepoToplanacakUrunMiktari: 4813,omniChannelToplanacakUrunMiktari: 2008 ),
    yedekSorterSayi :  YedekSorterSayi(gozYedekSayisi1200:0 ,gozYedekSayisi600: 0),
    toplamAdreslenecekAdet : 3638,
    dateTime : "2022-09-04T13:45:18.4943733+03:00"
  );

  List<String> Months =  ["01","02","03","04","06","07","08","09","10","11","12"];
  List<String> Days =  ["01","02","03","04","06","07","08","09","10","11","12","11","12","13","14","16","17","18","21","22","23","24","26","27","28"];

  for (var i = 4; i < 400; i++) {
    String randomDay = (Days..shuffle()).first;
    String randomMonth = (Months..shuffle()).first;

    data.add(
      Statistics(
      guid: i.toString(),
      toplananVeAdreslenenAdet: ToplananVeAdreslenenAdet(bugunAdreslenenAdet: 38239+(i*2), bugunToplananAdet: 46805+(i*2)),
      siparisler : Siparisler(bugunGelenSiparisAdet: 26739+(i*2), bugunGelenSiparisSayi: 6679+(i*2)),
      faturaYazdirilanSiparisler : FaturaYazdirilanSiparisler(bugunFaturaKesilenSiparisAdet: 50481+(i*2), bugunFaturaKesilenSiparisSayi: 26539+(i*2)),
      paketlenenSiparis : PaketlenenSiparis(bugunPaketlenenSiparisAdet: 63445+(i*2), bugunPaketlenenSiparisSayi: 26531 +(i*2)),
      onaylananSiparis : OnaylananSiparis(toplamOnaylananSiparisAdet: 1869+(i*2), toplamOnaylananSiparisSayi: 1001+(i*2) ),
      goalOnaylananSiparis : GoalOnaylananSiparis(goalOnaylananSiparisAdet: 1567+(i*2), goalOnaylananSiparisSayi: 999+(i*2)),
      toplamHazirlaniyor : ToplamHazirlaniyor(toplamHazirlaniyorAdet: 31172+(i*2), toplamHazirlaniyorSayi: 8572),
      toplanacakUrunMiktari : ToplanacakUrunMiktari(internetDepoToplanacakUrunMiktari: 4813+(i*2),omniChannelToplanacakUrunMiktari: 2008 +(i*2)),
      yedekSorterSayi :  YedekSorterSayi(gozYedekSayisi1200:0 ,gozYedekSayisi600: 0),
      toplamAdreslenecekAdet : 363+(i*2),
      dateTime : "2022-$randomMonth-${randomDay}T13:45:18.4943733+03:00"
    )
    );
  }

  data.add(data1);
  data.add(data2);
  data.add(data3);
  return data;
}
}