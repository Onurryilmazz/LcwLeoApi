List<String> DrowDownitems = [   
    'Backlog',
    'ToplananVeAdreslenenAdet',
    'Siparisler',
    'FaturaYazdirilanSiparisler',
    'PaketlenenSiparis',
    'OnaylananSiparis',
    'GoalOnaylananSiparis',
    'ToplamHazirlaniyor',
    'ToplanacakUrunMiktari',
    'YedekSorterSayi',
    'ToplamAdreslenecekAdet'
];

Map DropDownProperty = {
  'ToplananVeAdreslenenAdet' : {
    'propertyFather' : 'ToplananVeAdreslenenAdet',
    'propertyChild' : 'BugunToplananAdet'
  },
  'Siparisler' : {
    'propertyFather' : 'Siparisler',
    'propertyChild' : 'BugunGelenSiparisAdet'
  },
  'FaturaYazdirilanSiparisler' : {
    'propertyFather' : 'FaturaYazdirilanSiparisler',
    'propertyChild' : 'BugunFaturaKesilenSiparisAdet'
  },
  'PaketlenenSiparis' : {
    'propertyFather' : 'PaketlenenSiparis',
    'propertyChild' : 'BugunPaketlenenSiparisAdet'
  },
  'OnaylananSiparis' : {
    'propertyFather' : 'OnaylananSiparis',
    'propertyChild' : 'ToplamOnaylananSiparisAdet'
  },
  'GoalOnaylananSiparis' : {
    'propertyFather' : 'GoalOnaylananSiparis',
    'propertyChild' : 'GoalOnaylananSiparisAdet'
  },
  'ToplamHazirlaniyor' : {
    'propertyFather' : 'ToplamHazirlaniyor',
    'propertyChild' : 'ToplamHazirlaniyorAdet'
  },
  'ToplanacakUrunMiktari' : {
    'propertyFather' : 'ToplanacakUrunMiktari',
    'propertyChild' : 'InternetDepoToplanacakUrunMiktari'
  },
  'YedekSorterSayi' : {
    'propertyFather' : 'YedekSorterSayi',
    'propertyChild' : 'GozYedekSayisi1200'
  },
  'ToplamAdreslenecekAdet' : {
    'propertyFather' : 'ToplamAdreslenecekAdet',
    'propertyChild' : ''
  },
  'Backlog' : {
    'propertyFather' : 'Backlog',
    'propertyChild' : ''
  },
};

class ProjectText{
  String DefaultDropDownText = 'Backlog';
  String DefaultProperty = 'Backlog';
  String DefaultProperty2 = '';

  String AppBarTitle = 'Statistic Graph';

  String GraphErrorMessage = 'Graph Dont Create'; 
}

class ProjectButtonName{
  String DayButton = 'Day';
  String NowButton = 'Anlık';
  String MonthButton = 'Month';
}