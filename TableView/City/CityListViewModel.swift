//
//  CityListViewModel.swift
//  TableViewTasks
//
//  Created by Abdulaziz Boyqoziyev on 01/03/23.
//

import Foundation

struct CityViewModelActions {
    let showAddContact: () -> Void // bunda return qiymat boimaydi
    let showConfirmDeleteAlert: () -> Void
    let showContactDetail: (_ contact: Int) -> Void // _ bunda qoshilib ketmaydi
}

protocol CityViewModelInput {
    func addContactTxapped()
    func deleteContactTapped()
    func contactDeletionConfirmed()
    func showContactDetail(at index: Int)
}

protocol CityViewModelOutput {
    
}
protocol CityViewModel: CityViewModelInput, CityViewModelOutput { }
final class CityListViewModel: ViewModel, CityViewModelOutput {
    
    private var cities: [City] = []
    
    func data() {
        populateDataSource()
    }
  
    
    let actions: CityViewModelActions
    init(actions: CityViewModelActions) {
        self.actions = actions
    }
    func addContactTapped() {
        actions.showAddContact()
        
    }
    func showContactDetail(at index: Int) {
        actions.showContactDetail(index) 
        
    }
   
    
        

    func  populateDataSource() {
        
        let tashkent = City(name: "Tashkent", info: "During its long history, Tashkent has had various changes in names and political and religious affiliations. Abu Rayhan Biruni wrote that the city's name Tashkent comes from the Turkic tash and kent, literally translated as \"Stone City\" or \"City of Stones\".[5] Ilya Gershevitch (1974:55, 72) (apud Livshits, 2007:179) traces the city's old name Chach back to Old Iranian *čāiča- \"area of water, lake\" (cf. Lake Čaēčista mentioned in the Avesta) (whence Middle Chinese transcription *źiäk > standard Chinese Shí with Chinese character 石 for \"stone\"[6][7]), and *Čačkand ~ Čačkanθ was the basis for Turkic adaption Tashkent, popularly etymologized as \"stone city\".", image: "Image")
        let samarqand = City(name: "Samarqand", info: "Samarkand, Uzbek Samarqand, city in east-central Uzbekistan that is one of the oldest cities of Central Asia. Known as Maracanda in the 4th century BCE, it was the capital of Sogdiana and was captured by Alexander the Great in 329 BCE. The city was later ruled by Central Asian Turks (6th century CE), the Arabs (8th century), the Samanids of Iran (9th–10th century), and various Turkic peoples (11th–13th century) before it was annexed by the Khwārezm-", image:  "Samarqand")
        let buxoro = City(name: "Buxoro", info: "Buxoro — Oʻzbekiston Respublikasining qadimiy shaharlaridan biri, Buxoro viloyatining maʼmuriy, iqtisodiy va madaniy markazi. O'zbekistonning ilk poytaxti. Buyuk ipаk yoʻlida yirik tijorat markazlaridan boʻlgan. Oʻzbekistonning janubiy-gʻarbida, Zarafshon daryosi quyi oqimida joylashgan. Toshkentdan 616 km. Buxoro 2 ta shahar rayoni (Fayzulla Xoʻjayev va Toʻqimachilik)ga boʻlingan. Aholisi 290000 (2019). Aholisining katta qismini o'zbeklar tashkil etadi.", image: "buxoro.icon")
        let nukus = City(name: "Nukus", info: "В настоящее время изучение его следов затруднено (на этом месте теперь кладбище), однако, по имеющимся данным, можно утверждать, что городище было одним из оборонительных сооружений, которые прикрывали границы древнего хорезмского государства, а также контролировали водный путь по Амударье.", image: "nukus.icon")
        let urganch = City(name: "Urganch", info: "Urgench is a small town in western Uzbekistan, the center of Khorezm region and transport hub for the entire area. It can serve as a great starting point for travel in Western Uzbekistan for anyone looking to explore the farther reaches of the country. Just thirty kilometers southwest of Urgench is the ancient city of Khiva, which some have likened to a live museum. Fifty kilometers to the north you’ll find the ruins of several thousand-year-old fortresses, including Toprak-Kala, Kyzyl-Kala and Ayaz-Kala.", image: "urganch.icon")
        let xorazm = City(name: "Xorazm", info: "Khorazm Region (Uzbek: Xorazm viloyati, Хоразм вилояти, خارەزم ۋىلايەتى, Russian: Хорезмская область), is a viloyat (region) of Uzbekistan located in the northwest of the country in the lower reaches of the Amu Darya River. It borders with Turkmenistan, Karakalpakstan, and Bukhara Region. It covers an area of 6,050 square kilometres (2,340 sq mi).[1] The population is estimated 1,893,300 (2021), with 67% living in rural areas.[2] The capital is Urgench (pop. est. 145,000). Other major towns include Xonqa, Khiva, Shovot, and Pitnak.", image: "xorazm.icon")
        let qarshi = City(name: "Qarshi", info: "Qarshi shahrining oʻzbek tarixida oʻziga xos oʻrni bor. Birinchidan, Qarshi — Movarounnahrdagi birinchi yirik turkiy tilli shahar. U payti Xorazmda (Urganch), Fargʻonada (Andijon), Shosh vohasida (Toshkent), Sirdaryo boʻylarida bir qancha yirik shaharlarda turkiy til hukmron edi, lekin Movarounnahrda bunday shahar yoʻq edi. Qarshining qurilishi bilan bu yerda turli-tuman aholi joylashdi, ammo turkiy shaharda hukmron tilga aylandi. U payti moʻgʻullarning oʻzi ham allaqachon turkiy tilda gapirardi. Xususan, Kebakxonning ona tili turkiy til boʻlganini arab sayyohi Ibn Battuta qayd etgan. Chigʻatoy ulusi, undan keyin Temuriylar davrida turkiy til rasmiy yozishmalar tili boʻlib xizmat qildi.", image:  "qarshi.icon")
        let navoiy = City(name: "Navoiy", info: "Navoiy shahri Alisher Navoiy sharafiga atab shunday nomlangan. Shaharning hozirgi hududi oldin choʻl boʻlgan. Shimolda qadimiy Karmana shahri joylashgan boʻlib, oʻtmishda Buxoro amirligining bekligi hisoblangan. Janubda Temir yoʻl stansiyasi va bir qishloq boʻlgan, hozirda bu joy Navoiy shahrining Vokzaloldi hududi deb ataladi. 1958-yilning sentabr oyida Navoiy shahri sanoatlashgan shahar sifatida tashkil topdi. Shu vaqtdan Navoiy viloyati tashkil topganga qadar Navoiy shahri Buxoro viloyati tarkibida boʻlib keldi.", image:  "navoiy.icon")
        let jizzax = City(name: "Jizzax", info: "Respublikasi, country in Central Asia. It lies mainly between two major rivers, the Syr Darya (ancient Jaxartes River) to the northeast and the Amu Darya (ancient Oxus River) to the southwest, ", image: "jiizax.icon")
        let namangan = City(name: "Namangan", info: "Считается, что название «Наманган» произошло от персидского «Намак кан» (نمک‌کان) — «соляная копь». Город Наманган восходит к XVII веку, когда на севере Ферганской долины возникло поселение местных соледобытчиков руд (наман канн). В XVII веке после разрушительного землетрясения сюда переселились жители Аксикента (Ахсыкента). Аксикент", image: "namangan.icon")
        let fargona = City(name: "Fargona", info: "Fargʻona soʻzining kelib chiqishi toʻgʻrisida turli fikrlar mavjud. Olimlar „Fargʻona“ soʻzining bundan 13 asr ilgari sugʻd yozuvlarida „Pargʻana“, „Pragʻana“ shakllarida yozilganligini hamda hind-sanskrit tilida „kichik viloyat“; fors tillarida „togʻ oraligʻidagi vodiy“", image:  "fargona.icon")
        let andijon = City(name: "Andijon", info: "в Индии Империи Великих Моголов. З. Бабур писал во всемирно известном «Бабурнамэ», что Андижан является столицей области Ферганы. Крепость в Андижане была одной из трех крупнейших в Средней Азии (после Самарканда и Кеша (Шахрисабз)", image:  "andijon.icon")
        cities.append(jizzax)
        cities.append(namangan)
        cities.append(fargona)
        cities.append(andijon)
        cities.append(tashkent)
        cities.append(samarqand)
        cities.append(buxoro)
        cities.append(nukus)
        cities.append(urganch)
        cities.append(xorazm)
        cities.append(navoiy)
        cities.append(qarshi)
    }
    
    func numberOfRows() -> Int {
        return cities.count
    }
    
    func getCity(at indexPath: IndexPath) -> City {
        return cities[indexPath.row]
    }
}

