import '../../shared/model/club.dart';
import '../../shared/model/player.dart';
import '../../shared/model/stadium.dart';
import 'player_photos.dart';

class FootballData {
  static const List<Club> clubs = [
    Club(
      id: 'real-madrid',
      name: 'Real Madrid CF',
      supporterLabel: 'Madridista',
      shortName: 'RMA',
      league: 'La Liga',
      country: 'Spanyol',
      city: 'Madrid',
      logoUrl: 'https://stock.adobe.com/search?k=real+madrid+stadium',
      bannerPhoto:
          'https://t4.ftcdn.net/jpg/02/93/86/75/360_F_293867530_wr1V4rrT3ZITzExcC3TRng8yyGzf9rCv.jpg',
      uclTitles: 15,
      leagueTitles: 36,
      stadiumName: 'Estadio Santiago Bernabéu',
      stadiumId: 'santiago-bernabeu',
      stadiumCapacity: 84744,
      manager: 'Jose Mourinho',
      marketValue: '€1.36 Miliar',
      isMadridFavorite: true,
      starPlayers: [
        'Kylian Mbappé',
        'Jude Bellingham',
        'Vinícius Júnior',
        'Federico Valverde',
        'Trent Alexander-Arnold',
        'Rodrygo',
      ],
      description:
          'Klub tersukses dalam sejarah sepak bola dunia dengan rekor 15 trofi Liga Champions UEFA.',
      characteristics:
          'Tradisi juara Eropa, kualitas individu kelas dunia, dan mental kuat di laga besar.',
      playingStyle:
          'Transisi cepat, serangan vertikal, dan eksploitasi ruang melalui winger.',
    ),

    // FC BARCELONA
    Club(
      id: 'barcelona',
      name: 'FC Barcelona',
      supporterLabel: 'Culé',
      shortName: 'BAR',
      league: 'La Liga',
      country: 'Spanyol',
      city: 'Barcelona',
      logoUrl:
          'https://www.dreamstime.com/photos-images/barcelona-stadium-nou-camp.html',
      bannerPhoto:
          'https://thumbs.dreamstime.com/b/camp-nou-stadium-barcelona-panorama-17122124.jpg',
      uclTitles: 5,
      leagueTitles: 27,
      stadiumName: 'Spotify Camp Nou',
      stadiumId: 'camp-nou',
      stadiumCapacity: 105000,
      manager: 'Hansi Flick',
      marketValue: '€950 Juta',
      isMadridFavorite: false,
      starPlayers: [
        'Lamine Yamal',
        'Pedri',
        'Raphinha',
        'Dani Olmo',
        'Gavi',
        'Frenkie de Jong',
      ],
      description:
          'Rival abadi Real Madrid dalam duel El Clásico dengan akademi La Masia yang legendaris.',
      characteristics:
          'Identik dengan akademi La Masia, teknik tinggi, dan penguasaan bola.',
      playingStyle:
          'Build-up pendek, positional play, dan pressing setelah kehilangan bola.',
    ),

    // MANCHESTER CITY
    Club(
      id: 'manchester-city',
      name: 'Manchester City FC',
      supporterLabel: 'Cityzen',
      shortName: 'MCI',
      league: 'Premier League',
      country: 'Inggris',
      city: 'Manchester',
      logoUrl: 'https://www.pexels.com/id-id/pencarian/manchester%20city/',
      bannerPhoto:
          'https://images.pexels.com/photos/13434565/pexels-photo-13434565.jpeg',
      uclTitles: 1,
      leagueTitles: 10,
      stadiumName: 'Etihad Stadium',
      stadiumId: 'etihad-stadium',
      stadiumCapacity: 53400,
      manager: 'Enzo Maesca',
      marketValue: '€1.26 Miliar',
      isMadridFavorite: false,
      starPlayers: [
        'Erling Haaland',
        'Phil Foden',
        'Semenyo',
        'Rayan Cherki',
        'Josko Gvardiol',
        'Nico O\'Reilly',
      ],
      description:
          'Kekuatan dominan Premier League dengan sepak bola berbasis penguasaan bola total.',
      characteristics:
          'Kombinasi teknis, rotasi posisi, dan dominasi penguasaan bola.',
      playingStyle:
          'Positional play, sirkulasi sabar, dan tekanan tinggi saat bola hilang.',
    ),

    // LIVERPOOL FC
    Club(
      id: 'liverpool',
      name: 'Liverpool FC',
      supporterLabel: 'Kopite',
      shortName: 'LIV',
      league: 'Premier League',
      country: 'Inggris',
      city: 'Liverpool',
      logoUrl: 'https://stock.adobe.com/search?k=liverpool+football',
      bannerPhoto:
          'https://t4.ftcdn.net/jpg/03/15/13/93/360_F_315139343_St8gE1WZJUX37WDOBjAsfNsA1dQNR2dj.jpg',
      uclTitles: 6,
      leagueTitles: 19,
      stadiumName: 'Anfield',
      stadiumId: 'anfield',
      stadiumCapacity: 61276,
      manager: 'Andoni Iraola',
      marketValue: '€980 Juta',
      isMadridFavorite: false,
      starPlayers: [
        'Cody Gakpo',
        'Virgil van Dijk',
        'Florian Wirtz',
        'Alexander Isak',
        'Alexis Mac Allister',
        'Alisson Becker',
      ],
      description:
          'Klub tersukses di Inggris dalam kancah Eropa dengan atmosfer magis You\'ll Never Walk Alone di Anfield.',
      characteristics:
          'Intensitas tinggi, dukungan Anfield, dan serangan cepat dari berbagai sisi.',
      playingStyle:
          'Pressing agresif, transisi cepat, dan serangan langsung ke ruang kosong.',
    ),

    // ARSENAL FC
    Club(
      id: 'arsenal',
      name: 'Arsenal FC',
      supporterLabel: 'Gooner',
      shortName: 'ARS',
      league: 'Premier League',
      country: 'Inggris',
      city: 'London',
      logoUrl: 'https://stock.adobe.com/de/search?k=emirates+stadium',
      bannerPhoto:
          'https://t3.ftcdn.net/jpg/03/47/97/68/360_F_347976887_3u4IXCAHBtD591QRludMNWKKIYyIdliX.jpg',
      uclTitles: 0,
      leagueTitles: 13,
      stadiumName: 'Emirates Stadium',
      stadiumId: 'emirates-stadium',
      stadiumCapacity: 60704,
      manager: 'Mikel Arteta',
      marketValue: '€1.15 Miliar',
      isMadridFavorite: false,
      starPlayers: [
        'Bukayo Saka',
        'Viktor Gyökeres',
        'Declan Rice',
        'William Saliba',
        'Martin Ødegaard',
        'David Raya',
      ],
      description:
          'Klub London Utara dengan julukan The Gunners yang dikenal dengan filosofi menyerang atraktif.',
      characteristics:
          'Kombinasi pemain muda dan berpengalaman dengan organisasi tim yang disiplin.',
      playingStyle:
          'Build-up terstruktur, pressing tinggi, dan kombinasi cepat di area sayap.',
    ),

    // FC BAYERN MÜNCHEN
    Club(
      id: 'bayern-munich',
      name: 'FC Bayern München',
      supporterLabel: 'Die Roten',
      shortName: 'BAY',
      league: 'Bundesliga',
      country: 'Jerman',
      city: 'Munich',
      logoUrl: 'https://stock.adobe.com/search?k=%22allianz+arena%22',
      bannerPhoto:
          'https://t4.ftcdn.net/jpg/04/23/22/55/360_F_423225572_EzbrjJKXVw1PBnfI6JEUsBnJwUvBkI1p.jpg',
      uclTitles: 6,
      leagueTitles: 33,
      stadiumName: 'Allianz Arena',
      stadiumId: 'allianz-arena',
      stadiumCapacity: 75024,
      manager: 'Vincent Kompany',
      marketValue: '€940 Juta',
      isMadridFavorite: false,
      starPlayers: [
        'Harry Kane',
        'Jamal Musiala',
        'Joshua Kimmich',
        'Michael Olise',
        'Luis Díaz',
        'Manuel Neuer',
      ],
      description:
          'Penguasa sepak bola Jerman berjuluk Die Roten dengan stadion berpanel menyala spektakuler.',
      characteristics:
          'Mental juara, kedalaman skuad, dan permainan menyerang yang intens.',
      playingStyle:
          'Garis pertahanan tinggi, pressing agresif, dan serangan lebar yang cepat.',
    ),

    // INTER MILAN
    Club(
      id: 'inter-milan',
      name: 'Inter Milan',
      supporterLabel: 'Interista',
      shortName: 'INT',
      league: 'Serie A',
      country: 'Italia',
      city: 'Milan',
      logoUrl:
          'https://depositphotos.com/id/editorial/south-tribune-in-san-siro-or-giuseppe-meazza-stadium-in-milan-12706247.html',
      bannerPhoto:
          'https://st.depositphotos.com/1679308/1270/i/950/depositphotos_12706247-stock-photo-south-tribune-in-san-siro.jpg',
      uclTitles: 3,
      leagueTitles: 20,
      stadiumName: 'San Siro (Stadio Giuseppe Meazza)',
      stadiumId: 'san-siro',
      stadiumCapacity: 80018,
      manager: 'Cristian Chivu',
      marketValue: '€675 Juta',
      isMadridFavorite: false,
      starPlayers: [
        'Lautaro Martínez',
        'Nicolò Barella',
        'Marcus Thuram',
        'Hakan Çalhanoğlu',
        'Alessandro Bastoni',
        'Federico Dimarco',
      ],
      description:
          'Raksasa Serie A Italia berjuluk Nerazzurri dengan tradisi pertahanan kokoh dan serangan balik mematikan.',
      characteristics:
          'Organisasi taktis kuat, kerja sama antarlini, dan dua penyerang yang saling melengkapi.',
      playingStyle:
          'Formasi tiga bek, build-up dari belakang, dan serangan melalui wing-back.',
    ),

    // PARIS SAINT-GERMAIN
    Club(
      id: 'psg',
      name: 'Paris Saint-Germain',
      supporterLabel: 'Les Parisiens',
      shortName: 'PSG',
      league: 'Ligue 1',
      country: 'Prancis',
      city: 'Paris',
      logoUrl: 'https://stock.adobe.com/search?k=parc+des+princes',
      bannerPhoto:
          'https://t4.ftcdn.net/jpg/05/27/29/11/360_F_527291139_lGEcYVfryzGkdUSaoTZ10codVhxrvcD0.jpg',
      uclTitles: 2,
      leagueTitles: 12,
      stadiumName: 'Parc des Princes',
      stadiumId: 'parc-des-princes',
      stadiumCapacity: 47929,
      manager: 'Luis Enrique',
      marketValue: '€880 Juta',
      isMadridFavorite: false,
      starPlayers: [
        'Ousmane Dembélé',
        'Khvicha Kvaratskhelia',
        'Achraf Hakimi',
        'Warren Zaïre-Emery',
        'Matvey Safonov',
        'Vitinha',
        'Ferran Torres',
      ],
      description:
          'Penguasa Ligue 1 Prancis yang bermarkas di Parc des Princes di jantung kota mode Paris.',
      characteristics:
          'Skuad teknis dengan pemain kreatif dan kekuatan menyerang dari sisi lapangan.',
      playingStyle:
          'Penguasaan bola, pressing tinggi, dan akselerasi serangan melalui winger.',
    ),
    Club(
      id: 'atletico-madrid',
      name: 'Atlético de Madrid',
      supporterLabel: 'Colchonero',
      shortName: 'ATM',
      league: 'La Liga',
      country: 'Spanyol',
      city: 'Madrid',
      logoUrl: 'https://stock.adobe.com/search?k=%22atletico+madrid%22',
      bannerPhoto:
          'https://t3.ftcdn.net/jpg/03/58/22/16/360_F_358221645_ectvA7k0bduquhOsbipQDg4ShEkLsRtM.jpg',
      uclTitles: 0,
      leagueTitles: 11,
      stadiumName: 'Riyadh Air Metropolitano',
      stadiumId: 'metropolitano',
      stadiumCapacity: 70460,
      manager: 'Diego Simeone',
      marketValue: '€550 Juta',
      starPlayers: [
        'Julián Álvarez',
        'Alexander Sørloth',
        'Jan Oblak',
        'Marcos Llorente',
        'Koke',
        'Giuliano Simeone',
      ],
      description:
          'Klub ibu kota Spanyol dengan semangat juang tinggi dan dukungan fanatik di Metropolitano.',
      characteristics:
          'Kolektivitas, disiplin bertahan, dan daya juang kuat sepanjang pertandingan.',
      playingStyle:
          'Blok pertahanan rapat, pressing terarah, dan transisi cepat ke depan.',
    ),
    Club(
      id: 'tottenham',
      name: 'Tottenham Hotspur FC',
      supporterLabel: 'Spurs',
      shortName: 'TOT',
      league: 'Premier League',
      country: 'Inggris',
      city: 'London',
      logoUrl: 'https://www.pexels.com/search/tottenham%20hotspur%20stadium/',
      bannerPhoto:
          'https://images.pexels.com/photos/12536501/pexels-photo-12536501.jpeg',
      uclTitles: 0,
      leagueTitles: 2,
      stadiumName: 'Tottenham Hotspur Stadium',
      stadiumId: 'tottenham-hotspur-stadium',
      stadiumCapacity: 62850,
      manager: 'De Zerbi',
      marketValue: '€780 Juta',
      starPlayers: [
        'Xavi Simons',
        'James Maddison',
        'Dejan Kulusevski',
        'Pape Matar Sarr',
        'Dominic Solanke',
        'Micky van de Ven',
      ],
      description:
          'Klub London Utara yang bermain di salah satu stadion sepak bola paling modern di Inggris.',
      characteristics:
          'Tempo tinggi, pemain menyerang yang dinamis, dan keberanian bermain dengan garis tinggi.',
      playingStyle:
          'Pressing agresif, garis pertahanan tinggi, dan progresi bola vertikal.',
    ),
    Club(
      id: 'manchester-united',
      name: 'Manchester United FC',
      supporterLabel: 'Red Devil',
      shortName: 'MUN',
      league: 'Premier League',
      country: 'Inggris',
      city: 'Manchester',
      logoUrl: 'https://stock.adobe.com/search?k=manchester+united+football',
      bannerPhoto:
          'https://t3.ftcdn.net/jpg/04/66/06/52/360_F_466065227_0mrzWcOUn1Q9O8DMXEt7aCfqw6XBDVxd.jpg',
      uclTitles: 3,
      leagueTitles: 20,
      stadiumName: 'Old Trafford',
      stadiumId: 'old-trafford',
      stadiumCapacity: 74310,
      manager: 'Michael Carrick',
      marketValue: '€720 Juta',
      starPlayers: [
        'Bruno Fernandes',
        'Amad Diallo',
        'Kobbie Mainoo',
        'Mason Mount',
        'Lisandro Martínez',
        'Noussair Mazraoui',
      ],
      description:
          'Klub bersejarah Manchester dengan deretan gelar liga dan atmosfer khas di Old Trafford.',
      characteristics:
          'Tradisi serangan dari sisi lapangan dan pemain yang kuat dalam duel terbuka.',
      playingStyle:
          'Transisi cepat, serangan langsung, dan eksploitasi ruang di belakang pertahanan.',
    ),
    Club(
      id: 'chelsea',
      name: 'Chelsea FC',
      supporterLabel: 'The Blues',
      shortName: 'CHE',
      league: 'Premier League',
      country: 'Inggris',
      city: 'London',
      logoUrl: 'https://stock.adobe.com/search?k=%22chelsea+fc%22',
      bannerPhoto:
          'https://t3.ftcdn.net/jpg/04/36/01/62/360_F_436016218_b1ULc44M1u0RKDvGS2TXOz6tllgWqWxH.jpg',
      uclTitles: 2,
      leagueTitles: 6,
      stadiumName: 'Stamford Bridge',
      stadiumId: 'stamford-bridge',
      stadiumCapacity: 40341,
      manager: 'Xabi Alonso',
      marketValue: '€1.05 Miliar',
      starPlayers: [
        'Cole Palmer',
        'Estêvão',
        'Moisés Caicedo',
        'Reece James',
        'João Pedro',
        'Levi Colwill',
      ],
      description:
          'Klub London Barat dengan tradisi kompetisi Eropa dan markas bersejarah di Stamford Bridge.',
      characteristics:
          'Skuad muda dengan kemampuan teknis dan fleksibilitas posisi yang tinggi.',
      playingStyle:
          'Pressing intens, kombinasi cepat, dan progresi bola melalui lini tengah.',
    ),
    Club(
      id: 'juventus',
      name: 'Juventus FC',
      supporterLabel: 'Juventino',
      shortName: 'JUV',
      league: 'Serie A',
      country: 'Italia',
      city: 'Turin',
      logoUrl:
          'https://stock.adobe.com/de/search?k=juventus%20stadium&promoid=J7XBWPPS&mv=other&as_channel=adobe_com&as_campclass=brand&as_campaign=srp-raill&as_source=behance_net&as_camptype=acquisition&as_audience=users&as_content=explore-more-adobe-stock',
      bannerPhoto:
          'https://t3.ftcdn.net/jpg/04/48/50/66/360_F_448506605_VwIg3hYlLp4hZrzY4hRFIFNJ4MgZsSnM.jpg',
      uclTitles: 2,
      leagueTitles: 36,
      stadiumName: 'Allianz Stadium',
      stadiumId: 'allianz-stadium-turin',
      stadiumCapacity: 41507,
      manager: 'Luciano Spaletti',
      marketValue: '€600 Juta',
      starPlayers: [
        'Kenan Yıldız',
        'Khephren Thuram',
        'Bremer',
        'Manuel Locatelli',
        'Francisco Conceição',
        'Andrea Cambiaso',
      ],
      description:
          'Raksasa Turin berjuluk Bianconeri dengan sejarah panjang dan stadion modern milik klub.',
      characteristics:
          'Organisasi bertahan, kedisiplinan taktik, dan pengalaman di kompetisi besar.',
      playingStyle:
          'Pertahanan terstruktur, penguasaan ruang, dan serangan balik terukur.',
    ),
    Club(
      id: 'borussia-dortmund',
      name: 'Borussia Dortmund',
      supporterLabel: 'Die Schwarzgelben',
      shortName: 'BVB',
      league: 'Bundesliga',
      country: 'Jerman',
      city: 'Dortmund',
      logoUrl: 'https://stock.adobe.com/de/search?k=borussia+dortmund',
      bannerPhoto:
          'https://t4.ftcdn.net/jpg/04/19/90/65/360_F_419906536_wFxDW9qwgA8Kf8seNpmrNbiA2QLBUWTG.jpg',
      uclTitles: 1,
      leagueTitles: 8,
      stadiumName: 'Signal Iduna Park',
      stadiumId: 'signal-iduna-park',
      stadiumCapacity: 81365,
      manager: 'Niko Kovač',
      marketValue: '€480 Juta',
      starPlayers: [
        'Serhou Guirassy',
        'Jobe Bellingham',
        'Maximilian Beier',
        'Nico Schlotterbeck',
        'Gregor Kobel',
        'Marcel Sabitzer',
      ],
      description:
          'Klub Ruhr dengan dukungan terkenal di Südtribüne dan atmosfer besar di Signal Iduna Park.',
      characteristics:
          'Energi tinggi, dukungan suporter yang kuat, dan keberanian mengembangkan talenta muda.',
      playingStyle:
          'Pressing intens, transisi vertikal, dan serangan cepat ke kotak penalti.',
    ),
  ];

  static const List<Player> players = [
    Player(
      id: 'madrid-mbappe',
      name: 'Kylian Mbappé',
      number: 9,
      position: 'FW',
      nationality: 'Prancis',
      age: 27,
      rating: 90,
      marketValue: '€180 juta',
      goals: 22,
      assists: 8,
      appearances: 27,
      passAccuracy: 84,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Real Madrid CF',
      bio:
          'Penyerang cepat dengan penyelesaian akhir dan pergerakan tanpa bola yang tajam.',
    ),
    Player(
      id: 'madrid-vinicius',
      name: 'Vinícius Júnior',
      number: 7,
      position: 'FW',
      nationality: 'Brasil',
      age: 26,
      rating: 89,
      marketValue: '€170 juta',
      goals: 16,
      assists: 10,
      appearances: 25,
      passAccuracy: 81,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Real Madrid CF',
      bio:
          'Winger eksplosif yang unggul dalam dribel satu lawan satu dan serangan balik.',
    ),
    Player(
      id: 'madrid-bellingham',
      name: 'Jude Bellingham',
      number: 5,
      position: 'MF',
      nationality: 'Inggris',
      age: 23,
      rating: 88,
      marketValue: '€160 juta',
      goals: 9,
      assists: 7,
      appearances: 24,
      passAccuracy: 90,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Real Madrid CF',
      bio:
          'Gelandang box-to-box dengan kemampuan membawa bola dan masuk ke kotak penalti.',
    ),
    Player(
      id: 'barcelona-yamal',
      name: 'Lamine Yamal',
      number: 10,
      position: 'FW',
      nationality: 'Spanyol',
      age: 19,
      rating: 91,
      marketValue: '€200 juta',
      goals: 14,
      assists: 15,
      appearances: 27,
      passAccuracy: 85,
      preferredFoot: 'Kiri',
      photoUrl: '',
      clubName: 'FC Barcelona',
      bio:
          'Winger kreatif dengan kontrol bola rapat, visi umpan, dan ancaman dari sisi kanan.',
    ),
    Player(
      id: 'barcelona-pedri',
      name: 'Pedri',
      number: 8,
      position: 'MF',
      nationality: 'Spanyol',
      age: 23,
      rating: 89,
      marketValue: '€120 juta',
      goals: 5,
      assists: 9,
      appearances: 25,
      passAccuracy: 92,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'FC Barcelona',
      bio:
          'Gelandang pengatur tempo dengan orientasi tubuh dan progresi bola yang istimewa.',
    ),
    Player(
      id: 'barcelona-raphinha',
      name: 'Raphinha',
      number: 11,
      position: 'FW',
      nationality: 'Brasil',
      age: 29,
      rating: 89,
      marketValue: '€90 juta',
      goals: 18,
      assists: 10,
      appearances: 26,
      passAccuracy: 83,
      preferredFoot: 'Kiri',
      photoUrl: '',
      clubName: 'FC Barcelona',
      bio:
          'Penyerang sayap pekerja keras dengan pressing agresif dan tembakan kaki kiri.',
    ),
    Player(
      id: 'city-haaland',
      name: 'Erling Haaland',
      number: 9,
      position: 'FW',
      nationality: 'Norwegia',
      age: 26,
      rating: 90,
      marketValue: '€180 juta',
      goals: 25,
      assists: 5,
      appearances: 27,
      passAccuracy: 72,
      preferredFoot: 'Kiri',
      photoUrl: '',
      clubName: 'Manchester City FC',
      bio:
          'Striker target dengan kekuatan fisik, akselerasi, dan insting gol kelas dunia.',
    ),
    Player(
      id: 'city-foden',
      name: 'Phil Foden',
      number: 47,
      position: 'MF',
      nationality: 'Inggris',
      age: 26,
      rating: 87,
      marketValue: '€110 juta',
      goals: 11,
      assists: 8,
      appearances: 25,
      passAccuracy: 89,
      preferredFoot: 'Kiri',
      photoUrl: '',
      clubName: 'Manchester City FC',
      bio:
          'Pemain serbaguna yang nyaman bermain di antara lini maupun dari sisi lapangan.',
    ),
    Player(
      id: 'liverpool-wirtz',
      name: 'Florian Wirtz',
      number: 7,
      position: 'MF',
      nationality: 'Jerman',
      age: 23,
      rating: 88,
      marketValue: '€140 juta',
      goals: 10,
      assists: 12,
      appearances: 25,
      passAccuracy: 87,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Liverpool FC',
      bio:
          'Gelandang serang kreatif yang mencari ruang di antara lini dan menciptakan peluang.',
    ),
    Player(
      id: 'liverpool-isak',
      name: 'Alexander Isak',
      number: 9,
      position: 'FW',
      nationality: 'Swedia',
      age: 27,
      rating: 87,
      marketValue: '€120 juta',
      goals: 17,
      assists: 4,
      appearances: 22,
      passAccuracy: 78,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Liverpool FC',
      bio:
          'Striker teknis yang menggabungkan pergerakan cerdas dan finishing tenang.',
    ),
    Player(
      id: 'arsenal-saka',
      name: 'Bukayo Saka',
      number: 7,
      position: 'FW',
      nationality: 'Inggris',
      age: 25,
      rating: 89,
      marketValue: '€150 juta',
      goals: 14,
      assists: 11,
      appearances: 24,
      passAccuracy: 84,
      preferredFoot: 'Kiri',
      photoUrl: '',
      clubName: 'Arsenal FC',
      bio:
          'Winger kanan konsisten yang berbahaya saat menggiring bola maupun memberi umpan silang.',
    ),
    Player(
      id: 'arsenal-gyokeres',
      name: 'Viktor Gyökeres',
      number: 14,
      position: 'FW',
      nationality: 'Swedia',
      age: 28,
      rating: 87,
      marketValue: '€75 juta',
      goals: 19,
      assists: 5,
      appearances: 25,
      passAccuracy: 76,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Arsenal FC',
      bio:
          'Penyerang tengah kuat yang aktif menyerang ruang dan menekan bek lawan.',
    ),
    Player(
      id: 'arsenal-rice',
      name: 'Declan Rice',
      number: 41,
      position: 'MF',
      nationality: 'Inggris',
      age: 27,
      rating: 88,
      marketValue: '€120 juta',
      goals: 5,
      assists: 8,
      appearances: 26,
      passAccuracy: 91,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Arsenal FC',
      bio:
          'Gelandang dinamis dengan jangkauan tekel luas dan progresi bola yang kuat.',
    ),
    Player(
      id: 'bayern-kane',
      name: 'Harry Kane',
      number: 9,
      position: 'FW',
      nationality: 'Inggris',
      age: 33,
      rating: 91,
      marketValue: '€65 juta',
      goals: 27,
      assists: 8,
      appearances: 26,
      passAccuracy: 79,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'FC Bayern München',
      bio:
          'Striker komplet yang berbahaya sebagai finisher maupun penghubung permainan.',
    ),
    Player(
      id: 'bayern-musiala',
      name: 'Jamal Musiala',
      number: 10,
      position: 'MF',
      nationality: 'Jerman',
      age: 23,
      rating: 88,
      marketValue: '€140 juta',
      goals: 12,
      assists: 8,
      appearances: 22,
      passAccuracy: 88,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'FC Bayern München',
      bio:
          'Gelandang serang lincah dengan dribel rapat dan kemampuan melewati tekanan.',
    ),
    Player(
      id: 'bayern-olise',
      name: 'Michael Olise',
      number: 17,
      position: 'FW',
      nationality: 'Prancis',
      age: 24,
      rating: 87,
      marketValue: '€100 juta',
      goals: 13,
      assists: 12,
      appearances: 25,
      passAccuracy: 85,
      preferredFoot: 'Kiri',
      photoUrl: '',
      clubName: 'FC Bayern München',
      bio:
          'Winger kreatif dengan umpan terobosan dan tendangan kaki kiri yang akurat.',
    ),
    Player(
      id: 'inter-lautaro',
      name: 'Lautaro Martínez',
      number: 10,
      position: 'FW',
      nationality: 'Argentina',
      age: 29,
      rating: 89,
      marketValue: '€100 juta',
      goals: 19,
      assists: 6,
      appearances: 25,
      passAccuracy: 78,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Inter Milan',
      bio:
          'Kapten dan striker agresif yang aktif menekan serta menyerang ruang sempit.',
    ),
    Player(
      id: 'inter-thuram',
      name: 'Marcus Thuram',
      number: 9,
      position: 'FW',
      nationality: 'Prancis',
      age: 29,
      rating: 87,
      marketValue: '€75 juta',
      goals: 15,
      assists: 8,
      appearances: 25,
      passAccuracy: 77,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Inter Milan',
      bio:
          'Penyerang kuat yang mampu membawa bola dan bekerja efektif sebagai tandem striker.',
    ),
    Player(
      id: 'inter-barella',
      name: 'Nicolò Barella',
      number: 23,
      position: 'MF',
      nationality: 'Italia',
      age: 29,
      rating: 88,
      marketValue: '€80 juta',
      goals: 4,
      assists: 10,
      appearances: 26,
      passAccuracy: 89,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Inter Milan',
      bio:
          'Gelandang pekerja keras dengan umpan progresif, intensitas tinggi, dan visi bermain.',
    ),
    Player(
      id: 'psg-dembele',
      name: 'Ousmane Dembélé',
      number: 10,
      position: 'FW',
      nationality: 'Prancis',
      age: 29,
      rating: 90,
      marketValue: '€100 juta',
      goals: 18,
      assists: 9,
      appearances: 24,
      passAccuracy: 84,
      preferredFoot: 'Kedua kaki',
      photoUrl: '',
      clubName: 'Paris Saint-Germain',
      bio:
          'Penyerang dua kaki yang sulit ditebak dan mampu menciptakan peluang dari kedua sisi.',
    ),
    Player(
      id: 'psg-kvaratskhelia',
      name: 'Khvicha Kvaratskhelia',
      number: 7,
      position: 'FW',
      nationality: 'Georgia',
      age: 25,
      rating: 89,
      marketValue: '€90 juta',
      goals: 13,
      assists: 11,
      appearances: 24,
      passAccuracy: 83,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Paris Saint-Germain',
      bio:
          'Winger kreatif dengan dribel eksplosif dan kemampuan memotong ke area tengah.',
    ),
    Player(
      id: 'psg-vitinha',
      name: 'Vitinha',
      number: 17,
      position: 'MF',
      nationality: 'Portugal',
      age: 26,
      rating: 89,
      marketValue: '€90 juta',
      goals: 6,
      assists: 9,
      appearances: 26,
      passAccuracy: 93,
      preferredFoot: 'Kanan',
      photoUrl: '',
      clubName: 'Paris Saint-Germain',
      bio:
          'Gelandang pengatur ritme dengan kontrol bola dan akurasi umpan tinggi.',
    ),
  ];

  static const Map<String, String> _playerProfiles = {
    'Federico Valverde':
        'Gelandang serbabisa dengan stamina dan tendangan jarak jauh yang kuat; bermain box-to-box, menutup ruang, lalu membawa bola cepat ke depan.',
    'Trent Alexander-Arnold':
        'Bek kanan dengan visi dan umpan silang akurat; sering masuk ke tengah untuk mengatur serangan dan mengirim umpan progresif.',
    'Rodrygo':
        'Penyerang lincah dengan kontrol bola rapat dan penyelesaian tenang; bergerak dari sayap ke ruang tengah untuk kombinasi dan tembakan.',
    'Dani Olmo':
        'Gelandang serang kreatif yang nyaman menerima bola di ruang sempit; menghubungkan lini dan menusuk ke kotak penalti.',
    'Gavi':
        'Gelandang pekerja keras yang agresif saat pressing dan nyaman mengalirkan bola di ruang sempit.',
    'Semenyo':
        'Penyerang serbabisa yang mengandalkan kekuatan, kecepatan, dan dribel untuk menciptakan peluang dari sisi lapangan.',
    'Nico O\'Reilly':
        'Pemain muda serbabisa yang dapat membantu progresi bola dan mengisi beberapa peran di lini tengah.',
    'Cody Gakpo':
        'Penyerang serbabisa yang dapat bermain melebar atau di tengah, dengan kombinasi dribel dan penyelesaian.',
    'Matvey Safonov':
        'Kiper dengan refleks cepat dan kemampuan mengamankan tembakan dari jarak dekat.',
    'Ferran Torres':
        'Penyerang yang bergerak cerdas tanpa bola dan dapat bermain di beberapa posisi lini depan.',
    'Frenkie de Jong':
        'Gelandang progresif dengan kontrol bola dan ketenangan saat ditekan; membawa bola melewati lini lawan untuk memulai serangan.',
    'Rayan Cherki':
        'Pemain kreatif dengan teknik dan improvisasi tinggi; menggiring di antara lini lalu mencari umpan terobosan atau tembakan.',
    'Josko Gvardiol':
        'Bek kuat dalam duel dan membawa bola; bertahan agresif lalu membantu progresi dari sisi kiri.',
    'Virgil van Dijk':
        'Bek tengah dominan dengan duel udara dan antisipasi kuat; menjaga garis pertahanan serta memulai build-up dengan umpan panjang.',
    'Alexis Mac Allister':
        'Gelandang cerdas dengan orientasi tubuh dan umpan progresif; mengatur tempo sambil membantu tekanan di lini tengah.',
    'Alisson Becker':
        'Kiper dengan refleks dan distribusi bola yang baik; berani menyapu ruang belakang serta memulai serangan dari area sendiri.',
    'William Saliba':
        'Bek tengah tenang dengan kecepatan dan kemampuan membaca permainan; menjaga ruang belakang dan mengalirkan bola dari bawah.',
    'Martin Ødegaard':
        'Gelandang serang dengan visi dan sentuhan pertama yang halus; mencari celah antarlini untuk mengirim umpan kunci.',
    'David Raya':
        'Kiper dengan distribusi akurat dan pengambilan keputusan cepat; menjadi opsi build-up dan aktif mengantisipasi bola terobosan.',
    'Joshua Kimmich':
        'Gelandang taktis dengan akurasi umpan dan disiplin posisi; mengatur sirkulasi bola serta membantu mengamankan area tengah.',
    'Luis Díaz':
        'Winger eksplosif dengan dribel dan keberanian menyerang bek; menusuk dari kiri untuk menciptakan peluang atau menembak.',
    'Manuel Neuer':
        'Kiper sweeper dengan antisipasi dan distribusi yang kuat; menjaga garis tinggi dengan bergerak keluar dari kotak penalti.',
    'Khvicha Kvaratskhelia':
        'Winger kreatif dengan dribel rapat dan perubahan arah tajam; menusuk dari kiri untuk menciptakan peluang dan menembak.',
    'Achraf Hakimi':
        'Bek kanan cepat dengan stamina dan ancaman menyerang; melakukan overlap untuk memberi lebar dan masuk ke kotak penalti.',
    'Warren Zaïre-Emery':
        'Gelandang muda dengan tenaga dan kedewasaan dalam menguasai bola; mendukung build-up sekaligus melakukan tekanan agresif.',
    'Hakan Çalhanoğlu':
        'Gelandang dengan umpan panjang dan tendangan jarak jauh akurat; mengatur ritme serangan serta menjadi ancaman dari bola mati.',
    'Alessandro Bastoni':
        'Bek tengah berkaki kiri dengan visi dan progresi bola; menjaga pertahanan tiga bek lalu mengirim umpan menembus lini lawan.',
    'Federico Dimarco':
        'Bek sayap dengan umpan silang dan tendangan kiri yang kuat; aktif overlap untuk memberi lebar dan menciptakan peluang dari sisi kiri.',
    'Julián Álvarez':
        'Penyerang mobile dengan etos kerja dan penyelesaian cepat; menekan bek lawan lalu bergerak mencari ruang di sekitar kotak penalti.',
    'Alexander Sørloth':
        'Penyerang tengah dengan kekuatan fisik dan kemampuan menyelesaikan peluang di dalam kotak penalti.',
    'Jan Oblak':
        'Kiper dengan posisi dan refleks yang konsisten; menjaga area gawang dengan tenang serta kuat menghadapi situasi satu lawan satu.',
    'Marcos Llorente':
        'Pemain serbabisa dengan kecepatan dan daya jelajah tinggi; berlari dari lini tengah ke ruang kosong untuk mendukung transisi.',
    'Koke':
        'Gelandang berpengalaman dengan pemahaman posisi dan umpan sederhana yang efektif; menjaga ritme serta membantu organisasi tim.',
    'Giuliano Simeone':
        'Penyerang energik dengan intensitas dan kemauan menekan; menyerang ruang kosong dan membantu tim merebut bola lebih awal.',
    'James Maddison':
        'Gelandang serang dengan kreativitas dan kemampuan bola mati; mencari ruang antarlini untuk melepas umpan atau tembakan.',
    'Dejan Kulusevski':
        'Winger berkaki kiri dengan kekuatan melindungi bola; bergerak dari kanan ke tengah untuk menghubungkan serangan.',
    'Pape Matar Sarr':
        'Gelandang dinamis yang membantu pressing, menutup ruang, dan membawa bola ke area serang.',
    'Dominic Solanke':
        'Striker kuat dengan pergerakan tanpa bola dan kerja pressing; menahan bola untuk rekan lalu menyerang umpan silang.',
    'Micky van de Ven':
        'Bek tengah cepat dengan jangkauan luas; menutup ruang di belakang garis tinggi dan membawa bola saat ada ruang.',
    'Bruno Fernandes':
        'Gelandang serang dengan visi dan keberanian mengambil risiko; mencari umpan vertikal serta tiba di kotak penalti untuk mencetak gol.',
    'Amad Diallo':
        'Winger lincah dengan kontrol rapat dan perubahan arah cepat; menusuk dari kanan untuk kombinasi dan peluang tembakan.',
    'Kobbie Mainoo':
        'Gelandang tenang dengan kontrol bola dan kemampuan keluar dari tekanan; membawa bola melewati lini sambil menjaga tempo.',
    'Mason Mount':
        'Gelandang serang yang aktif bergerak antarlini dan membantu tekanan tanpa bola.',
    'Lisandro Martínez':
        'Bek tangguh dengan agresivitas dan umpan progresif; menghadapi lawan dengan berani lalu membangun serangan dari belakang.',
    'Noussair Mazraoui':
        'Bek serbabisa yang nyaman menjaga sisi lapangan maupun membantu membangun serangan dari belakang.',
    'Cole Palmer':
        'Pemain kreatif dengan kontrol dan ketenangan di area akhir; bergerak ke ruang kanan untuk mengirim umpan atau menyelesaikan peluang.',
    'Estêvão':
        'Pemain depan muda yang mengandalkan dribel, kreativitas, dan kombinasi cepat di area menyerang.',
    'Moisés Caicedo':
        'Gelandang bertahan dengan daya jelajah dan kemampuan merebut bola; menjaga area tengah lalu mengalirkan bola ke depan.',
    'Reece James':
        'Bek kanan kuat dengan umpan silang dan tenaga fisik; melakukan overlap dan memberi ancaman dari sisi lapangan.',
    'João Pedro':
        'Penyerang yang mampu menghubungkan permainan dan mencari ruang untuk menyelesaikan peluang.',
    'Levi Colwill':
        'Bek kiri atau bek tengah dengan distribusi bola yang rapi; menjaga ruang dan membantu tim memulai build-up dari belakang.',
    'Kenan Yıldız':
        'Penyerang muda dengan kreativitas dan dribel progresif; bergerak dari kiri ke tengah untuk menciptakan peluang.',
    'Khephren Thuram':
        'Gelandang bertenaga dengan kemampuan membawa bola, memenangkan duel, dan mendukung transisi tim.',
    'Bremer':
        'Bek tengah kuat dalam duel dan penjagaan; menjaga penyerang lawan dengan ketat serta menguasai bola udara.',
    'Manuel Locatelli':
        'Gelandang bertahan dengan distribusi dan disiplin posisi; menjadi penghubung antarlini sambil melindungi pertahanan.',
    'Francisco Conceição':
        'Winger pendek dan lincah dengan akselerasi tajam; mengandalkan dribel untuk melewati lawan dan mengirim bola ke kotak penalti.',
    'Andrea Cambiaso':
        'Pemain sisi lapangan yang fleksibel dengan teknik dan stamina; berganti posisi untuk mendukung build-up serta overlap.',
    'Serhou Guirassy':
        'Striker kuat dengan penyelesaian klinis dan kemampuan menahan bola; menjadi titik akhir serangan serta membuka ruang bagi rekan.',
    'Jobe Bellingham':
        'Gelandang muda yang aktif membawa bola ke depan dan mendukung pressing serta transisi.',
    'Maximilian Beier':
        'Penyerang yang rajin menyerang ruang kosong dan memberi opsi lari di belakang pertahanan.',
    'Nico Schlotterbeck':
        'Bek kiri tengah dengan duel kuat dan umpan progresif; maju membawa bola untuk membantu tim menembus tekanan.',
    'Gregor Kobel':
        'Kiper dengan refleks cepat dan keberanian menghadapi situasi satu lawan satu; menjaga gawang dan mengamankan bola silang.',
    'Marcel Sabitzer':
        'Gelandang pekerja keras dengan tembakan jarak jauh dan umpan vertikal; mendukung pressing serta masuk ke area serang.',
  };

  static List<Player> playersForClub(String clubName) {
    final club = clubs.firstWhere((club) => club.name == clubName);
    final savedPlayers = {
      for (final player in players)
        if (player.clubName == clubName) player.name: player,
    };
    const positions = ['FW', 'FW', 'MF', 'DF', 'DF', 'GK'];
    const numbers = [9, 11, 8, 4, 5, 1];
    const goals = [16, 11, 6, 2, 1, 0];
    const assists = [5, 8, 7, 2, 1, 0];
    const passAccuracy = [78, 83, 90, 86, 88, 75];

    return club.starPlayers.asMap().entries.map((entry) {
      final name = entry.value;
      final existingPlayer = savedPlayers[name];
      final photoUrl = PlayerPhotos.forPlayer(club.id, name);
      if (existingPlayer != null) {
        return existingPlayer.copyWith(photoUrl: photoUrl);
      }

      final index = entry.key % positions.length;
      return Player(
        id: '${club.id}-catalog-${entry.key}',
        name: name,
        number: numbers[index],
        position: positions[index],
        nationality: club.country,
        age: 22 + (entry.key % 8),
        rating: 84 + (entry.key % 5),
        marketValue: 'Data katalog',
        goals: goals[index],
        assists: assists[index],
        appearances: 24 + (entry.key % 8),
        passAccuracy: passAccuracy[index],
        preferredFoot: 'Kanan',
        photoUrl: photoUrl,
        clubName: club.name,
        bio: _playerProfiles[name] ??
            'Profil pemain katalog Super Football; karakteristik dan gaya bermain belum tersedia.',
      );
    }).toList(growable: false);
  }

  static const List<Stadium> stadiums = [
    Stadium(
      id: 'santiago-bernabeu',
      name: 'Estadio Santiago Bernabéu',
      clubName: 'Real Madrid CF',
      city: 'Madrid',
      country: 'Spanyol',
      capacity: 84744,
      openedYear: 1947,
      latitude: 40.4530,
      longitude: -3.6883,
      imageUrl:
          'https://t4.ftcdn.net/jpg/02/93/86/75/360_F_293867530_wr1V4rrT3ZITzExcC3TRng8yyGzf9rCv.jpg',
      description:
          'Stadion termegah di dunia dengan atap buka-tutup elektrik dan sistem lapangan retractable 360 derajat.',
      googleMapsUrl:
          'https://www.google.com/maps/place/Santiago+Bernab%C3%A9u+Stadium/@40.4530387,-3.6908953,17z',
    ),
    Stadium(
      id: 'camp-nou',
      name: 'Spotify Camp Nou',
      clubName: 'FC Barcelona',
      city: 'Barcelona',
      country: 'Spanyol',
      capacity: 105000,
      openedYear: 1957,
      latitude: 41.3809,
      longitude: 2.1228,
      imageUrl:
          'https://thumbs.dreamstime.com/b/camp-nou-stadium-barcelona-panorama-17122124.jpg',
      description:
          'Stadion sepak bola terbesar di Eropa, berkapasitas lebih dari 100.000 penonton di Catalonia.',
      googleMapsUrl:
          'https://www.google.com/maps/place/Spotify+Camp+Nou/@41.380896,2.1206313,17z',
    ),
    Stadium(
      id: 'allianz-arena',
      name: 'Allianz Arena',
      clubName: 'FC Bayern München',
      city: 'Munich',
      country: 'Jerman',
      capacity: 75024,
      openedYear: 2005,
      latitude: 48.2188,
      longitude: 11.6247,
      imageUrl:
          'https://t4.ftcdn.net/jpg/04/23/22/55/360_F_423225572_EzbrjJKXVw1PBnfI6JEUsBnJwUvBkI1p.jpg',
      description:
          'Stadion modern berteknologi panel ETFE bercahaya yang dapat berubah warna di utara kota Munich.',
      googleMapsUrl:
          'https://www.google.com/maps/place/Allianz+Arena/@48.2187965,11.6221251,17z',
    ),
    Stadium(
      id: 'anfield',
      name: 'Anfield',
      clubName: 'Liverpool FC',
      city: 'Liverpool',
      country: 'Inggris',
      capacity: 61276,
      openedYear: 1884,
      latitude: 53.4308,
      longitude: -2.9608,
      imageUrl:
          'https://t4.ftcdn.net/jpg/03/15/13/93/360_F_315139343_St8gE1WZJUX37WDOBjAsfNsA1dQNR2dj.jpg',
      description:
          'Salah satu stadion paling bersejarah di dunia dengan tribun The Kop yang legendaris.',
      googleMapsUrl:
          'https://www.google.com/maps/place/Anfield/@53.4308294,-2.9633857,17z',
    ),
    Stadium(
      id: 'emirates-stadium',
      name: 'Emirates Stadium',
      clubName: 'Arsenal FC',
      city: 'London',
      country: 'Inggris',
      capacity: 60704,
      openedYear: 2006,
      latitude: 51.5549,
      longitude: -0.1084,
      imageUrl:
          'https://t3.ftcdn.net/jpg/03/47/97/68/360_F_347976887_3u4IXCAHBtD591QRludMNWKKIYyIdliX.jpg',
      description:
          'Kandang Arsenal di Holloway, London Utara, dibuka pada 2006.',
      googleMapsUrl:
          'https://www.google.com/maps/search/?api=1&query=Emirates+Stadium+London',
    ),
    Stadium(
      id: 'san-siro',
      name: 'San Siro (Stadio Giuseppe Meazza)',
      clubName: 'Inter Milan & AC Milan',
      city: 'Milan',
      country: 'Italia',
      capacity: 80018,
      openedYear: 1926,
      latitude: 45.4781,
      longitude: 9.1240,
      imageUrl:
          'https://st.depositphotos.com/1679308/1270/i/950/depositphotos_12706247-stock-photo-south-tribune-in-san-siro.jpg',
      description:
          'Katedral sepak bola Italia dengan pilar spiral silinder ikonik yang menjadi markas dua klub raksasa Milan.',
      googleMapsUrl:
          'https://www.google.com/maps/place/San+Siro+Stadium/@45.4781243,9.1214251,17z',
    ),
    Stadium(
      id: 'etihad-stadium',
      name: 'Etihad Stadium',
      clubName: 'Manchester City FC',
      city: 'Manchester',
      country: 'Inggris',
      capacity: 53400,
      openedYear: 2002,
      latitude: 53.4831,
      longitude: -2.2004,
      imageUrl:
          'https://images.pexels.com/photos/13434565/pexels-photo-13434565.jpeg',
      description:
          'Stadion modern di Sportcity Manchester dengan fasilitas akademi kelas dunia.',
      googleMapsUrl:
          'https://www.google.com/maps/place/Etihad+Stadium/@53.4831381,-2.2029749,17z',
    ),
    Stadium(
      id: 'parc-des-princes',
      name: 'Parc des Princes',
      clubName: 'Paris Saint-Germain',
      city: 'Paris',
      country: 'Prancis',
      capacity: 47929,
      openedYear: 1972,
      latitude: 48.8414,
      longitude: 2.2530,
      imageUrl:
          'https://t4.ftcdn.net/jpg/05/27/29/11/360_F_527291139_lGEcYVfryzGkdUSaoTZ10codVhxrvcD0.jpg',
      description:
          'Kandang Paris Saint-Germain di barat daya Paris, dikenal dengan tribun yang dekat ke lapangan.',
      googleMapsUrl:
          'https://www.google.com/maps/search/?api=1&query=Parc+des+Princes+Paris',
    ),
    Stadium(
      id: 'metropolitano',
      name: 'Riyadh Air Metropolitano',
      clubName: 'Atlético de Madrid',
      city: 'Madrid',
      country: 'Spanyol',
      capacity: 70460,
      openedYear: 2017,
      latitude: 40.4362,
      longitude: -3.5995,
      imageUrl:
          'https://t3.ftcdn.net/jpg/03/58/22/16/360_F_358221645_ectvA7k0bduquhOsbipQDg4ShEkLsRtM.jpg',
      description:
          'Stadion modern di timur Madrid yang menjadi kandang Atlético de Madrid.',
      googleMapsUrl:
          'https://www.google.com/maps/search/?api=1&query=Riyadh+Air+Metropolitano+Madrid',
    ),
    Stadium(
      id: 'tottenham-hotspur-stadium',
      name: 'Tottenham Hotspur Stadium',
      clubName: 'Tottenham Hotspur FC',
      city: 'London',
      country: 'Inggris',
      capacity: 62850,
      openedYear: 2019,
      latitude: 51.6043,
      longitude: -0.0664,
      imageUrl:
          'https://images.pexels.com/photos/12536501/pexels-photo-12536501.jpeg',
      description:
          'Stadion serbaguna berteknologi tinggi di London Utara, rumah Tottenham Hotspur.',
      googleMapsUrl:
          'https://www.google.com/maps/search/?api=1&query=Tottenham+Hotspur+Stadium+London',
    ),
    Stadium(
      id: 'old-trafford',
      name: 'Old Trafford',
      clubName: 'Manchester United FC',
      city: 'Manchester',
      country: 'Inggris',
      capacity: 74310,
      openedYear: 1910,
      latitude: 53.4631,
      longitude: -2.2913,
      imageUrl:
          'https://t3.ftcdn.net/jpg/04/66/06/52/360_F_466065227_0mrzWcOUn1Q9O8DMXEt7aCfqw6XBDVxd.jpg',
      description:
          'Stadion bersejarah Manchester United yang dikenal sebagai Theatre of Dreams.',
      googleMapsUrl:
          'https://www.google.com/maps/search/?api=1&query=Old+Trafford+Manchester',
    ),
    Stadium(
      id: 'stamford-bridge',
      name: 'Stamford Bridge',
      clubName: 'Chelsea FC',
      city: 'London',
      country: 'Inggris',
      capacity: 40341,
      openedYear: 1877,
      latitude: 51.4817,
      longitude: -0.1910,
      imageUrl:
          'https://t3.ftcdn.net/jpg/04/36/01/62/360_F_436016218_b1ULc44M1u0RKDvGS2TXOz6tllgWqWxH.jpg',
      description:
          'Kandang Chelsea di Fulham, London Barat, sejak akhir abad ke-19.',
      googleMapsUrl:
          'https://www.google.com/maps/search/?api=1&query=Stamford+Bridge+London',
    ),
    Stadium(
      id: 'allianz-stadium-turin',
      name: 'Allianz Stadium',
      clubName: 'Juventus FC',
      city: 'Turin',
      country: 'Italia',
      capacity: 41507,
      openedYear: 2011,
      latitude: 45.1096,
      longitude: 7.6413,
      imageUrl:
          'https://t3.ftcdn.net/jpg/04/48/50/66/360_F_448506605_VwIg3hYlLp4hZrzY4hRFIFNJ4MgZsSnM.jpg',
      description: 'Stadion khusus sepak bola milik Juventus di kota Turin.',
      googleMapsUrl:
          'https://www.google.com/maps/search/?api=1&query=Allianz+Stadium+Turin',
    ),
    Stadium(
      id: 'signal-iduna-park',
      name: 'Signal Iduna Park',
      clubName: 'Borussia Dortmund',
      city: 'Dortmund',
      country: 'Jerman',
      capacity: 81365,
      openedYear: 1974,
      latitude: 51.4926,
      longitude: 7.4519,
      imageUrl:
          'https://t4.ftcdn.net/jpg/04/19/90/65/360_F_419906536_wFxDW9qwgA8Kf8seNpmrNbiA2QLBUWTG.jpg',
      description:
          'Kandang Borussia Dortmund yang terkenal dengan tribun selatan Südtribüne.',
      googleMapsUrl:
          'https://www.google.com/maps/search/?api=1&query=Signal+Iduna+Park+Dortmund',
    ),
  ];
}
