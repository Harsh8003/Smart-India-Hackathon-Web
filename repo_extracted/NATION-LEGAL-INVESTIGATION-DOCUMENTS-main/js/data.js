/**
 * National Legal & Investigation Document Repository (NLADR)
 * Department of Legal & Administrative Affairs - Government of India
 * Master Relational Database & Real Indian Police Bases / FIRs
 */

// ============================================================================
// 1. ALL 28 STATES WITH DISTRICTS
// ============================================================================
const INDIAN_STATES_DISTRICTS = {
  "Andhra Pradesh": [
    "Alluri Sitharama Raju", "Anakapalli", "Anantapur", "Annamayya", "Bapatla",
    "Chittoor", "East Godavari", "Eluru", "Guntur", "Kakinada", "Krishna",
    "Kurnool", "Nandyal", "Sri Potti Sriramulu Nellore", "NTR (Vijayawada)",
    "Palnadu", "Parvathipuram Manyam", "Prakasam", "Sri Balaji (Tirupati)",
    "Sri Sathya Sai", "Srikakulam", "Visakhapatnam", "Vizianagaram",
    "West Godavari", "YSR Kadapa"
  ],
  "Arunachal Pradesh": [
    "Anjaw", "Changlang", "Dibang Valley", "East Kameng", "East Siang",
    "Itanagar Capital Complex", "Kamle", "Kra Daadi", "Kurung Kumey",
    "Lepa Rada", "Lohit", "Longding", "Lower Dibang Valley", "Lower Siang",
    "Lower Subansiri", "Namsai", "Pakke-Kessang", "Papum Pare", "Shi Yomi",
    "Siang", "Tawang", "Tirap", "Upper Siang", "Upper Subansiri",
    "West Kameng", "West Siang"
  ],
  "Assam": [
    "Bajali", "Baksa", "Barpeta", "Biswanath", "Bongaigaon", "Cachar",
    "Charaideo", "Chirang", "Darrang", "Dhemaji", "Dhubri", "Dibrugarh",
    "Dima Hasao", "Goalpara", "Golaghat", "Hailakandi", "Hojai", "Jorhat",
    "Kamrup", "Kamrup Metropolitan (Guwahati)", "Karbi Anglong", "Karimganj",
    "Kokrajhar", "Lakhimpur", "Majuli", "Morigaon", "Nagaon", "Nalbari",
    "Sivasagar", "Sonitpur", "South Salmara-Mankachar", "Tamulpur",
    "Tinsukia", "Udalguri", "West Karbi Anglong"
  ],
  "Bihar": [
    "Araria", "Arwal", "Aurangabad", "Banka", "Begusarai", "Bhagalpur",
    "Bhojpur", "Buxar", "Darbhanga", "East Champaran", "Gaya", "Gopalganj",
    "Jamui", "Jehanabad", "Kaimur", "Katihar", "Khagaria", "Kishanganj",
    "Lakhisarai", "Madhepura", "Madhubani", "Munger", "Muzaffarpur",
    "Nalanda", "Nawada", "Patna", "Purnia", "Rohtas", "Saharsa",
    "Samastipur", "Saran", "Sheikhpura", "Sheohar", "Sitamarhi",
    "Siwan", "Supaul", "Vaishali", "West Champaran"
  ],
  "Chhattisgarh": [
    "Balod", "Baloda Bazar", "Balrampur", "Bastar", "Bemetara", "Bijapur",
    "Bilaspur", "Dantewada", "Dhamtari", "Durg", "Gariaband",
    "Gaurela-Pendra-Marwahi", "Janjgir-Champa", "Jashpur", "Kabirdham",
    "Kanker", "Khairagarh", "Kondagaon", "Korba", "Koriya", "Mahasamund",
    "Manendragarh", "Mohla-Manpur-Ambagarh Chowki", "Mungeli", "Narayanpur",
    "Raigarh", "Raipur", "Rajnandgaon", "Sakti", "Sarangarh-Bilaigarh",
    "Sukma", "Surajpur", "Surguja"
  ],
  "Goa": [
    "North Goa", "South Goa"
  ],
  "Gujarat": [
    "Ahmedabad", "Amreli", "Anand", "Aravalli", "Banaskantha", "Bharuch",
    "Bhavnagar", "Botad", "Chhota Udaipur", "Dahod", "Dang",
    "Devbhoomi Dwarka", "Gandhinagar", "Gir Somnath", "Jamnagar",
    "Junagadh", "Kheda", "Kutch", "Mahisagar", "Mehsana", "Morbi",
    "Narmada", "Navsari", "Panchmahal", "Patan", "Porbandar", "Rajkot",
    "Sabarkantha", "Surat", "Surendranagar", "Tapi", "Vadodara", "Valsad"
  ],
  "Haryana": [
    "Ambala", "Bhiwani", "Charkhi Dadri", "Faridabad", "Fatehabad",
    "Gurugram", "Hisar", "Jhajjar", "Jind", "Kaithal", "Karnal",
    "Kurukshetra", "Mahendragarh", "Nuh", "Palwal", "Panchkula",
    "Panipat", "Rewari", "Rohtak", "Sirsa", "Sonipat", "Yamunanagar"
  ],
  "Himachal Pradesh": [
    "Bilaspur", "Chamba", "Hamirpur", "Kangra", "Kinnaur", "Kullu",
    "Lahaul and Spiti", "Mandi", "Shimla", "Sirmaur", "Solan", "Una"
  ],
  "Jharkhand": [
    "Bokaro", "Chatra", "Deoghar", "Dhanbad", "Dumka", "East Singhbhum",
    "Garhwa", "Giridih", "Godda", "Gumla", "Hazaribagh", "Jamtara",
    "Khunti", "Koderma", "Latehar", "Lohardaga", "Pakur", "Palamu",
    "Ramgarh", "Ranchi", "Sahebganj", "Seraikela Kharsawan", "Simdega",
    "West Singhbhum"
  ],
  "Karnataka": [
    "Bagalkot", "Ballari", "Belagavi", "Bengaluru Rural", "Bengaluru Urban",
    "Bidar", "Chamarajanagara", "Chikkaballapura", "Chikkamagaluru",
    "Chitradurga", "Dakshina Kannada (Mangaluru)", "Davanagere", "Dharwad",
    "Gadag", "Hassan", "Haveri", "Kalaburagi", "Kodagu", "Kolar",
    "Koppal", "Mandya", "Mysuru", "Raichur", "Ramanagara", "Shivamogga",
    "Tumakuru", "Udupi", "Uttara Kannada", "Vijayapura", "Yadgir"
  ],
  "Kerala": [
    "Alappuzha", "Ernakulam (Kochi)", "Idukki", "Kannur", "Kasaragod",
    "Kollam", "Kottayam", "Kozhikode", "Malappuram", "Palakkad",
    "Pathanamthitta", "Thiruvananthapuram", "Thrissur", "Wayanad"
  ],
  "Madhya Pradesh": [
    "Agar Malwa", "Alirajpur", "Anuppur", "Ashoknagar", "Balaghat",
    "Barwani", "Betul", "Bhind", "Bhopal", "Burhanpur", "Chhatarpur",
    "Chhindwara", "Damoh", "Datia", "Dewas", "Dhar", "Dindori",
    "Guna", "Gwalior", "Harda", "Narmadapuram", "Indore",
    "Jabalpur", "Jhabua", "Katni", "Khandwa", "Khargone", "Mandla",
    "Mandsaur", "Morena", "Narsinghpur", "Neemuch", "Niwari", "Panna",
    "Raisen", "Rajgarh", "Ratlam", "Rewa", "Sagar", "Satna", "Sehore",
    "Seoni", "Shahdol", "Shajapur", "Sheopur", "Shivpuri", "Sidhi",
    "Singrauli", "Tikamgarh", "Ujjain", "Umaria", "Vidisha"
  ],
  "Maharashtra": [
    "Ahmednagar", "Akola", "Amravati", "Aurangabad (Chhatrapati Sambhajinagar)",
    "Beed", "Bhandara", "Buldhana", "Chandrapur", "Dhule", "Gadchiroli",
    "Gondia", "Hingoli", "Jalgaon", "Jalna", "Kolhapur", "Latur",
    "Mumbai City", "Mumbai Suburban", "Nagpur", "Nanded", "Nandurbar",
    "Nashik", "Navi Mumbai", "Osmanabad (Dharashiv)", "Palghar", "Parbhani",
    "Pune", "Raigad", "Ratnagiri", "Sangli", "Satara", "Sindhudurg",
    "Solapur", "Thane", "Wardha", "Washim", "Yavatmal"
  ],
  "Manipur": [
    "Bishnupur", "Chandel", "Churachandpur", "Imphal East", "Imphal West",
    "Jiribam", "Kakching", "Kamjong", "Kangpokpi", "Noney", "Pherzawl",
    "Senapati", "Tamenglong", "Tengnoupal", "Thoubal", "Ukhrul"
  ],
  "Meghalaya": [
    "Eastern West Khasi Hills", "East Garo Hills", "East Jaintia Hills",
    "East Khasi Hills (Shillong)", "Mairang", "North Garo Hills", "Ribhoi",
    "South Garo Hills", "South West Garo Hills", "South West Khasi Hills",
    "West Garo Hills", "West Jaintia Hills", "West Khasi Hills"
  ],
  "Mizoram": [
    "Aizawl", "Champhai", "Hnahthial", "Khawzawl", "Kolasib", "Lawngtlai",
    "Lunglei", "Mamit", "Saiha", "Saitual", "Serchhip"
  ],
  "Nagaland": [
    "Chumoukedima", "Dimapur", "Kiphire", "Kohima", "Longleng",
    "Mokokchung", "Mon", "Niuland", "Noklak", "Peren", "Phek",
    "Shamator", "Tseminyu", "Tuensang", "Wokha", "Zunheboto"
  ],
  "Odisha": [
    "Angul", "Balangir", "Balasore", "Bargarh", "Bhadrak", "Boudh",
    "Cuttack", "Deogarh", "Dhenkanal", "Gajapati", "Ganjam",
    "Jagatsinghpur", "Jajpur", "Jharsuguda", "Kalahandi", "Kandhamal",
    "Kendrapara", "Kendujhar (Keonjhar)", "Khordha (Bhubaneswar)",
    "Koraput", "Malkangiri", "Mayurbhanj", "Nabarangapur", "Nayagarh",
    "Nuapada", "Puri", "Rayagada", "Sambalpur", "Subarnapur (Sonepur)",
    "Sundargarh"
  ],
  "Punjab": [
    "Amritsar", "Barnala", "Bathinda", "Faridkot", "Fatehgarh Sahib",
    "Fazilka", "Ferozepur", "Gurdaspur", "Hoshiarpur", "Jalandhar",
    "Kapurthala", "Ludhiana", "Malerkotla", "Mansa", "Moga",
    "Sri Muktsar Sahib", "Pathankot", "Patiala", "Rupnagar",
    "SAS Nagar (Mohali)", "Sangrur", "Shaheed Bhagat Singh Nagar",
    "Tarn Taran"
  ],
  "Rajasthan": [
    "Ajmer", "Alwar", "Anupgarh", "Balotra", "Banswara", "Baran",
    "Barmer", "Beawar", "Bharatpur", "Bhilwara", "Bikaner", "Bundi",
    "Chittorgarh", "Churu", "Dausa", "Deeg", "Dholpur",
    "Didwana-Kuchaman", "Dudu", "Dungarpur", "Gangapur City",
    "Hanumangarh", "Jaipur", "Jaipur Rural", "Jaisalmer", "Jalore",
    "Jhalawar", "Jhunjhunu", "Jodhpur", "Jodhpur Rural", "Karauli",
    "Kekri", "Kota", "Kotputli-Behror", "Nagaur", "Neem Ka Thana",
    "Pali", "Phalodi", "Pratapgarh", "Rajsamand", "Salumbar",
    "Sawai Madhopur", "Shahpura", "Sikar", "Sirohi",
    "Sri Ganganagar", "Tonk", "Udaipur"
  ],
  "Sikkim": [
    "East Sikkim (Gangtok)", "North Sikkim (Mangan)", "Pakyong",
    "Soreng", "South Sikkim (Namchi)", "West Sikkim (Gyalshing)"
  ],
  "Tamil Nadu": [
    "Ariyalur", "Chengalpattu", "Chennai", "Coimbatore", "Cuddalore",
    "Dharmapuri", "Dindigul", "Erode", "Kallakurichi", "Kancheepuram",
    "Kanyakumari", "Karur", "Krishnagiri", "Madurai", "Mayiladuthurai",
    "Nagapattinam", "Namakkal", "Nilgiris", "Perambalur", "Pudukkottai",
    "Ramanathapuram", "Ranipet", "Salem", "Sivaganga", "Tenkasi",
    "Thanjavur", "Theni", "Thoothukudi (Tuticorin)", "Tiruchirappalli",
    "Tirunelveli", "Tirupathur", "Tiruppur", "Tiruvallur",
    "Tiruvannamalai", "Tiruvarur", "Vellore", "Villupuram",
    "Virudhunagar"
  ],
  "Telangana": [
    "Adilabad", "Bhadradri Kothagudem", "Hanumakonda", "Hyderabad",
    "Jagitial", "Jangaon", "Jayashankar Bhupalpally", "Jogulamba Gadwal",
    "Kamareddy", "Karimnagar", "Khammam", "Kumuram Bheem Asifabad",
    "Mahabubabad", "Mahbubnagar", "Mancherial", "Medak",
    "Medchal-Malkajgiri (Cyberabad)", "Mulugu", "Nagarkurnool",
    "Nalgonda", "Narayanpet", "Nirmal", "Nizamabad", "Peddapalli",
    "Rajanna Sircilla", "Rangareddy (Rachakonda)", "Sangareddy",
    "Siddipet", "Suryapet", "Vikarabad", "Wanaparthy", "Warangal",
    "Yadadri Bhuvanagiri"
  ],
  "Tripura": [
    "Dhalai", "Gomati", "Khowai", "North Tripura", "Sepahijala",
    "South Tripura", "Unakoti", "West Tripura (Agartala)"
  ],
  "Uttar Pradesh": [
    "Agra", "Aligarh", "Ambedkar Nagar", "Amethi", "Amroha", "Auraiya",
    "Ayodhya", "Azamgarh", "Baghpat", "Bahraich", "Ballia", "Balrampur",
    "Banda", "Barabanki", "Bareilly", "Basti", "Bhadohi", "Bijnor",
    "Budaun", "Bulandshahr", "Chandauli", "Chitrakoot", "Deoria",
    "Etah", "Etawah", "Farrukhabad", "Fatehpur", "Firozabad",
    "Gautam Buddha Nagar (Noida)", "Ghaziabad", "Ghazipur", "Gonda",
    "Gorakhpur", "Hamirpur", "Hapur", "Hardoi", "Hathras", "Jalaun",
    "Jaunpur", "Jhansi", "Kannauj", "Kanpur Dehat", "Kanpur Nagar",
    "Kasganj", "Kaushambi", "Kushinagar", "Lakhimpur Kheri", "Lalitpur",
    "Lucknow", "Maharajganj", "Mahoba", "Mainpuri", "Mathura", "Mau",
    "Meerut", "Mirzapur", "Moradabad", "Muzaffarnagar", "Pilibhit",
    "Pratapgarh", "Prayagraj", "Raebareli", "Rampur", "Saharanpur",
    "Sambhal", "Sant Kabir Nagar", "Shahjahanpur", "Shamli", "Shravasti",
    "Siddharthnagar", "Sitapur", "Sonbhadra", "Sultanpur", "Unnao",
    "Varanasi"
  ],
  "Uttarakhand": [
    "Almora", "Bageshwar", "Chamoli", "Champawat", "Dehradun",
    "Haridwar", "Nainital", "Pauri Garhwal", "Pithoragarh",
    "Rudraprayag", "Tehri Garhwal", "Udham Singh Nagar", "Uttarkashi"
  ],
  "West Bengal": [
    "Alipurduar", "Bankura", "Birbhum", "Cooch Behar", "Dakshin Dinajpur",
    "Darjeeling", "Hooghly", "Howrah", "Jalpaiguri", "Jhargram",
    "Kalimpong", "Kolkata", "Malda", "Murshidabad", "Nadia",
    "North 24 Parganas", "Paschim Bardhaman", "Paschim Medinipur",
    "Purba Bardhaman", "Purba Medinipur", "Purulia", "South 24 Parganas",
    "Uttar Dinajpur"
  ]
};

// ============================================================================
// 1B. ALL 8 UNION TERRITORIES WITH DISTRICTS
// ============================================================================
const INDIAN_UT_DISTRICTS = {
  "Andaman and Nicobar Islands": [
    "Nicobars", "North and Middle Andaman", "South Andaman (Port Blair)"
  ],
  "Chandigarh": [
    "Chandigarh"
  ],
  "Dadra and Nagar Haveli and Daman and Diu": [
    "Dadra and Nagar Haveli (Silvassa)", "Daman", "Diu"
  ],
  "Delhi (NCT)": [
    "Central Delhi", "East Delhi", "New Delhi", "North Delhi",
    "North East Delhi", "North West Delhi", "Shahdara",
    "South Delhi", "South East Delhi", "South West Delhi", "West Delhi"
  ],
  "Jammu and Kashmir": [
    "Anantnag", "Bandipora", "Baramulla", "Budgam", "Doda",
    "Ganderbal", "Jammu", "Kathua", "Kishtwar", "Kulgam",
    "Kupwara", "Poonch", "Pulwama", "Rajouri", "Ramban",
    "Reasi", "Samba", "Shopian", "Srinagar", "Udhampur"
  ],
  "Ladakh": [
    "Kargil", "Leh"
  ],
  "Lakshadweep": [
    "Agatti", "Amini", "Andrott", "Bitra", "Chetlat", "Kadmat",
    "Kalpeni", "Kavaratti", "Kiltan", "Minicoy"
  ],
  "Puducherry": [
    "Karaikal", "Mahe", "Puducherry", "Yanam"
  ]
};


// ============================================================================
// 2. REAL INDIAN POLICE BASES & JURISDICTION STATIONS
// ============================================================================
const INDIAN_POLICE_BASES = [
  // Delhi Police Commissionerate
  { id: "PB-DL-01", name: "PS Barakhamba Road", state: "Delhi (NCT)", district: "New Delhi", commissionerate: "Delhi Police - New Delhi District", cctnsCode: "DL-ND-001", type: "Police Station" },
  { id: "PB-DL-02", name: "PS Connaught Place", state: "Delhi (NCT)", district: "New Delhi", commissionerate: "Delhi Police - New Delhi District", cctnsCode: "DL-ND-002", type: "Police Station" },
  { id: "PB-DL-03", name: "Special Cyber Crime Cell, Mandir Marg", state: "Delhi (NCT)", district: "New Delhi", commissionerate: "Special Investigation Division", cctnsCode: "DL-CY-101", type: "Cyber Cell" },
  { id: "PB-DL-04", name: "Economic Offences Wing (EOW), Mandir Marg", state: "Delhi (NCT)", district: "New Delhi", commissionerate: "Delhi Police EOW HQ", cctnsCode: "DL-EW-201", type: "Special Wing" },
  { id: "PB-DL-05", name: "PS Parliament Street", state: "Delhi (NCT)", district: "New Delhi", commissionerate: "Delhi Police - New Delhi District", cctnsCode: "DL-ND-003", type: "Police Station" },
  { id: "PB-DL-06", name: "PS Hauz Khas", state: "Delhi (NCT)", district: "South Delhi", commissionerate: "Delhi Police - South District", cctnsCode: "DL-SD-041", type: "Police Station" },
  { id: "PB-DL-07", name: "Special Cell HQ, Lodhi Colony", state: "Delhi (NCT)", district: "South Delhi", commissionerate: "Delhi Police Counter-Terror & Special Ops", cctnsCode: "DL-SC-009", type: "Special Wing" },
  { id: "PB-DL-08", name: "PS Tis Hazari Court Complex", state: "Delhi (NCT)", district: "Central Delhi", commissionerate: "Delhi Police - Central District", cctnsCode: "DL-CD-018", type: "Court Security PS" },

  // Maharashtra Police / Mumbai Police Commissionerate
  { id: "PB-MH-01", name: "BKC Cyber Police Station", state: "Maharashtra", district: "Mumbai Suburban", commissionerate: "Mumbai City Police Commissionerate", cctnsCode: "MH-MUM-CY01", type: "Cyber Cell" },
  { id: "PB-MH-02", name: "PS Azad Maidan", state: "Maharashtra", district: "Mumbai City", commissionerate: "Mumbai Police Zone-1", cctnsCode: "MH-MUM-012", type: "Police Station" },
  { id: "PB-MH-03", name: "PS Marine Drive", state: "Maharashtra", district: "Mumbai City", commissionerate: "Mumbai Police Zone-1", cctnsCode: "MH-MUM-015", type: "Police Station" },
  { id: "PB-MH-04", name: "EOW Mumbai Police HQ, Crawford Market", state: "Maharashtra", district: "Mumbai City", commissionerate: "Mumbai Police Crime Branch", cctnsCode: "MH-MUM-EOW", type: "Special Wing" },
  { id: "PB-MH-05", name: "PS Bandra", state: "Maharashtra", district: "Mumbai Suburban", commissionerate: "Mumbai Police Zone-9", cctnsCode: "MH-MUM-088", type: "Police Station" },
  { id: "PB-MH-06", name: "Pune Cyber Crime Police Station, Shivajinagar", state: "Maharashtra", district: "Pune", commissionerate: "Pune City Police Commissionerate", cctnsCode: "MH-PUN-CY01", type: "Cyber Cell" },
  { id: "PB-MH-07", name: "Thane Crime Branch Unit-1", state: "Maharashtra", district: "Thane", commissionerate: "Thane Police Commissionerate", cctnsCode: "MH-THA-CB01", type: "Crime Branch" },

  // Karnataka Police / Bengaluru City Police
  { id: "PB-KA-01", name: "CID Cyber Crime Division, Carlton House", state: "Karnataka", district: "Bengaluru Urban", commissionerate: "Karnataka State Criminal Investigation Dept", cctnsCode: "KA-CID-CY01", type: "State CID" },
  { id: "PB-KA-02", name: "PS Vidhana Soudha", state: "Karnataka", district: "Bengaluru Urban", commissionerate: "Bengaluru City Police Central Division", cctnsCode: "KA-BLR-001", type: "Police Station" },
  { id: "PB-KA-03", name: "PS Commercial Street", state: "Karnataka", district: "Bengaluru Urban", commissionerate: "Bengaluru City Police East Division", cctnsCode: "KA-BLR-023", type: "Police Station" },
  { id: "PB-KA-04", name: "Central Crime Branch (CCB), NT Road", state: "Karnataka", district: "Bengaluru Urban", commissionerate: "Bengaluru City Police CCB HQ", cctnsCode: "KA-BLR-CCB", type: "Special Wing" },
  { id: "PB-KA-05", name: "Mysuru CEN Police Station (Cyber, Economics, Narcotics)", state: "Karnataka", district: "Mysuru", commissionerate: "Mysuru City Police", cctnsCode: "KA-MYS-CEN", type: "Cyber Cell" },

  // Uttar Pradesh Police
  { id: "PB-UP-01", name: "PS Sector-20, Noida", state: "Uttar Pradesh", district: "Gautam Buddha Nagar (Noida)", commissionerate: "Noida Police Commissionerate Zone-1", cctnsCode: "UP-NOI-020", type: "Police Station" },
  { id: "PB-UP-02", name: "Cyber Crime Police Station, Sector-36 Noida", state: "Uttar Pradesh", district: "Gautam Buddha Nagar (Noida)", commissionerate: "UP Police Cyber Wing", cctnsCode: "UP-NOI-CY01", type: "Cyber Cell" },
  { id: "PB-UP-03", name: "PS Hazratganj, Lucknow", state: "Uttar Pradesh", district: "Lucknow", commissionerate: "Lucknow Police Commissionerate Central", cctnsCode: "UP-LKO-001", type: "Police Station" },
  { id: "PB-UP-04", name: "Special Task Force (STF) HQ, Lucknow", state: "Uttar Pradesh", district: "Lucknow", commissionerate: "UP Police STF Headquarters", cctnsCode: "UP-STF-001", type: "Special Task Force" },
  { id: "PB-UP-05", name: "PS Sigra, Varanasi", state: "Uttar Pradesh", district: "Varanasi", commissionerate: "Varanasi Police Commissionerate", cctnsCode: "UP-VAR-011", type: "Police Station" },

  // Tamil Nadu Police
  { id: "PB-TN-01", name: "Cyber Crime Wing, Greater Chennai Police", state: "Tamil Nadu", district: "Chennai", commissionerate: "Greater Chennai Police Commissionerate, Vepery", cctnsCode: "TN-CHN-CY01", type: "Cyber Cell" },
  { id: "PB-TN-02", name: "PS Flower Bazaar, Chennai", state: "Tamil Nadu", district: "Chennai", commissionerate: "Chennai Police North Zone", cctnsCode: "TN-CHN-014", type: "Police Station" },
  { id: "PB-TN-03", name: "Coimbatore City Crime Branch", state: "Tamil Nadu", district: "Coimbatore", commissionerate: "Coimbatore City Police", cctnsCode: "TN-CBE-CB01", type: "Crime Branch" },

  // Gujarat Police
  { id: "PB-GJ-01", name: "Cyber Crime Police Station, Ahmedabad City", state: "Gujarat", district: "Ahmedabad", commissionerate: "Ahmedabad City Police Commissionerate", cctnsCode: "GJ-AHM-CY01", type: "Cyber Cell" },
  { id: "PB-GJ-02", name: "PS Navrangpura, Ahmedabad", state: "Gujarat", district: "Ahmedabad", commissionerate: "Ahmedabad Police Zone-1", cctnsCode: "GJ-AHM-045", type: "Police Station" },
  { id: "PB-GJ-03", name: "CID Crime HQ, Gandhinagar", state: "Gujarat", district: "Gandhinagar", commissionerate: "Gujarat State CID Crime", cctnsCode: "GJ-GND-CID", type: "State CID" },

  // Central Agencies (Federal Jurisdiction)
  { id: "PB-CBI-01", name: "CBI Anti-Corruption Branch (ACB), Lodhi Road", state: "Central Bureau / Pan-India", district: "CBI Headquarters New Delhi", commissionerate: "Central Bureau of Investigation (CBI)", cctnsCode: "CBI-ACB-DL01", type: "Federal Agency" },
  { id: "PB-CFSL-01", name: "Central Forensic Science Laboratory (CFSL) Digital Wing", state: "Central Bureau / Pan-India", district: "CFSL Central Campus", commissionerate: "Ministry of Home Affairs / CBI Campus", cctnsCode: "CFSL-DFW-MHA", type: "Forensic Lab" },
  { id: "PB-NIA-01", name: "National Investigation Agency (NIA) HQ, CGO Complex", state: "Central Bureau / Pan-India", district: "NIA Headquarters New Delhi", commissionerate: "Ministry of Home Affairs", cctnsCode: "NIA-HQ-DEL", type: "Counter-Terror Agency" }
];

// ============================================================================
// 3. MASTER AUTHENTICATED PERSONNEL
// ============================================================================
const INITIAL_USERS = [
  {
    id: "USR-ADM-001",
    username: "admin.sharma",
    password: "GovtSecured@2026",
    name: "Dr. Arvind Sharma, IAS",
    role: "Administrator",
    designation: "Principal Secretary & Chief Document Controller",
    department: "Department of Legal & Administrative Affairs",
    badgeNumber: "IAS-1998-DL-042",
    email: "arvind.sharma@nic.gov.in",
    phone: "+91 98101 23456",
    state: "Delhi (NCT)",
    district: "New Delhi",
    policeBase: "Department of Legal & Administrative Affairs (Central)",
    googleLinked: false,
    googleEmail: "",
    status: "Active",
    avatar: "AS",
    approvedAt: "2024-01-10T10:00:00Z"
  },
  {
    id: "USR-IO-001",
    username: "io.rathore",
    password: "GovtSecured@2026",
    name: "Vikramaditya Rathore",
    role: "Investigator Officer",
    designation: "Superintendent of Police (Anti-Corruption & Cyber Special Branch)",
    department: "Special Investigation Division",
    badgeNumber: "IPS-2012-DL-8841",
    email: "vikram.rathore@delhipolice.gov.in",
    phone: "+91 98712 34567",
    state: "Delhi (NCT)",
    district: "New Delhi",
    policeBase: "Special Cyber Crime Cell, Mandir Marg",
    googleLinked: false,
    googleEmail: "",
    status: "Active",
    avatar: "VR",
    approvedAt: "2024-01-15T11:30:00Z"
  },
  {
    id: "USR-LEG-001",
    username: "legal.mehta",
    password: "GovtSecured@2026",
    name: "Adv. Ananya Mehta",
    role: "Legal Officer",
    designation: "Senior Public Prosecutor & Standing Government Counsel",
    department: "Directorate of Prosecution, Ministry of Law & Justice",
    badgeNumber: "D/1429/2010",
    email: "ananya.mehta@govcourt.nic.in",
    phone: "+91 98234 56789",
    state: "Delhi (NCT)",
    district: "Central Delhi",
    policeBase: "PS Tis Hazari Court Complex",
    googleLinked: false,
    googleEmail: "",
    status: "Active",
    avatar: "AM",
    approvedAt: "2024-02-01T09:00:00Z"
  },
  {
    id: "USR-REC-001",
    username: "record.verma",
    password: "GovtSecured@2026",
    name: "Om Prakash Verma",
    role: "Record Officer",
    designation: "Chief Archivist & Digital Vault Custodian",
    department: "Central Legal Archive & Record Depository",
    badgeNumber: "REC-DEL-4412",
    email: "op.verma@nic.in",
    phone: "+91 94120 98765",
    state: "Delhi (NCT)",
    district: "Central Delhi",
    policeBase: "Central Legal Archive & Record Depository",
    googleLinked: false,
    googleEmail: "",
    status: "Active",
    avatar: "OV",
    approvedAt: "2024-02-10T14:20:00Z"
  },
  {
    id: "USR-CIT-001",
    username: "citizen.rajesh",
    password: "GovtSecured@2026",
    name: "Rajesh Kumar Sharma",
    role: "Citizen",
    designation: "Citizen / Complainant",
    department: "Public Grievance & Complainant Division",
    aadhaarMasked: "XXXX-XXXX-8921",
    email: "rajesh.sharma.delhi@gmail.com",
    phone: "+91 98111 54321",
    state: "Delhi (NCT)",
    district: "New Delhi",
    policeBase: "PS Barakhamba Road",
    googleLinked: true,
    googleEmail: "rajesh.sharma.delhi@gmail.com",
    status: "Active",
    avatar: "RS",
    approvedAt: "2024-03-01T16:00:00Z"
  },
  {
    id: "USR-IO-002",
    username: "io.kadam",
    password: "GovtSecured@2026",
    name: "Sachin Kadam",
    role: "Investigator Officer",
    designation: "Assistant Commissioner of Police (ACP) - Cyber Crime",
    department: "Mumbai City Police Commissionerate",
    badgeNumber: "SPS-2015-MH-4421",
    email: "sachin.kadam@mahapolice.gov.in",
    phone: "+91 98200 44321",
    state: "Maharashtra",
    district: "Mumbai Suburban",
    policeBase: "BKC Cyber Police Station",
    googleLinked: false,
    googleEmail: "",
    status: "Active",
    avatar: "SK",
    approvedAt: "2024-03-15T10:00:00Z"
  }
];

// ============================================================================
// 4. ACCESS REGISTRATION REQUESTS
// ============================================================================
const INITIAL_REGISTRATION_REQUESTS = [
  {
    id: "REQ-2026-089",
    name: "Dr. K. S. Ramanujan",
    email: "ramanujan.fsl@delhi.gov.in",
    phone: "+91 98661 22334",
    role: "Others",
    customRole: "Director - Forensic Science Laboratory (Digital Forensics Wing)",
    department: "Central Forensic Science Laboratory, CBI Campus",
    idProofType: "Govt Department Identity Card (MHA)",
    idProofNumber: "CFSL-DFW-2018-099",
    state: "Delhi (NCT)",
    district: "New Delhi",
    policeBase: "Central Forensic Science Laboratory (CFSL) Digital Wing",
    reason: "Require cryptographic verification privileges to submit Section 65B forensic hash certificates for active cyber litigation.",
    appliedAt: "2026-09-17T09:45:00Z",
    status: "Pending"
  },
  {
    id: "REQ-2026-090",
    name: "Inspector Neha Sundaram",
    email: "neha.sundaram@ips.gov.in",
    phone: "+91 99887 76655",
    role: "Investigator Officer",
    customRole: "",
    department: "Economic Offences Wing (EOW), Unit IV",
    idProofType: "State Police Service Card",
    idProofNumber: "EOW-DL-5120",
    state: "Delhi (NCT)",
    district: "New Delhi",
    policeBase: "Economic Offences Wing (EOW), Mandir Marg",
    reason: "Assigned as co-investigator on multi-crore public procurement forgery inquiry NLADR/2026/041.",
    appliedAt: "2026-09-18T08:15:00Z",
    status: "Pending"
  },
  {
    id: "REQ-2026-091",
    name: "Pooja V. Deshmukh",
    email: "pooja.deshmukh@rediffmail.com",
    phone: "+91 97654 32100",
    role: "Citizen",
    customRole: "",
    department: "Individual Complainant",
    idProofType: "Aadhaar e-KYC Verification",
    idProofNumber: "XXXX-XXXX-4519",
    state: "Maharashtra",
    district: "Mumbai Suburban",
    policeBase: "BKC Cyber Police Station",
    reason: "To track status of Cyber Impersonation & Online Extortion FIR No. 302/2026 lodged at BKC Cyber PS.",
    appliedAt: "2026-09-18T11:20:00Z",
    status: "Pending"
  }
];

// ============================================================================
// 5. MASTER REAL POLICE FIRS & JUDICIAL CASE DOCKETS
// ============================================================================
const INITIAL_CASES = [
  // --- Case 1: Delhi Police EOW (New Delhi) ---
  {
    id: "CAS-2026-0101",
    caseNumber: "NLADR/2026/EOW-0101",
    firNumber: "FIR No. 412/2026, PS Barakhamba Road",
    state: "Delhi (NCT)",
    district: "New Delhi",
    policeStation: "PS Barakhamba Road",
    cctnsNumber: "DL-ND-2026-000412",
    gdNumber: "GD-24A dated 12.04.2026",
    title: "State of NCT Delhi vs. Apex Tech Synthetics (Public Procurement Fraud)",
    category: "Economic Offence & Financial Forgery",
    statuteSections: "Sec 318, 336, 340 of Bharatiya Nyaya Sanhita (BNS) & Sec 66D IT Act",
    complainant: "Rajesh Kumar Sharma",
    complainantId: "USR-CIT-001",
    complainantContact: "+91 98111 54321",
    assignedIO: "Vikramaditya Rathore",
    assignedIOId: "USR-IO-001",
    assignedLegalOfficer: "Adv. Ananya Mehta",
    assignedLegalOfficerId: "USR-LEG-001",
    recordOfficerId: "USR-REC-001",
    status: "Under Investigation",
    progressPercent: 65,
    filingDate: "2026-04-12",
    priority: "High",
    courtName: "Special CBI & EOW Sessions Court, Patiala House",
    presidingJudge: "Hon'ble Special Judge R. K. Goel",
    nextHearingDate: "2026-09-24",
    hearingStage: "Arguments on Bail & Admissibility of Forensic Digital Logs",
    archiveLocation: {
      vaultNumber: "Vault-03 (Classified)",
      rackNumber: "R-14",
      shelfNumber: "Shelf-B",
      classification: "Restricted Confidential"
    },
    teamMembers: [
      { name: "Vikramaditya Rathore", role: "Lead Investigator Officer (SP)", phone: "+91 98712 34567" },
      { name: "Insp. Devinder Chawla", role: "Sub-Inspector (Field Seizures)", phone: "+91 98111 22334" },
      { name: "Dr. K. S. Ramanujan", role: "Forensic Digital Analyst", phone: "+91 98661 22334" },
      { name: "Adv. Ananya Mehta", role: "Prosecuting Officer", phone: "+91 98234 56789" }
    ],
    findings: [
      {
        id: "FND-01",
        date: "2026-04-15",
        author: "Vikramaditya Rathore",
        title: "Preliminary Seizure of Servers & Audit Trails",
        description: "Executing search warrant at Nehru Place corporate office. 4 NVMe hard drives and cloud gateway logs seized under panchnama.",
        tag: "Field Seizure"
      },
      {
        id: "FND-02",
        date: "2026-06-02",
        author: "Dr. K. S. Ramanujan",
        title: "Forensic Hash Match Confirms Document Alteration",
        description: "Comparative cryptographic analysis of e-tender quotation PDF matches modified digital signatures using compromised cert #4491.",
        tag: "Forensic Lab"
      }
    ],
    documents: [
      {
        id: "DOC-2026-001",
        name: "Certified Copy of Original FIR No. 412_2026.pdf",
        type: "FIR Dossier",
        uploadedBy: "Vikramaditya Rathore",
        uploadedDate: "2026-04-12",
        sha256: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
        tamperVerified: true,
        fileSize: "2.4 MB",
        accessLevel: "Confidential"
      },
      {
        id: "DOC-2026-002",
        name: "Central Forensic Science Lab Report (Sec 65B Hash Cert).pdf",
        type: "Forensic Evidence",
        uploadedBy: "Dr. K. S. Ramanujan",
        uploadedDate: "2026-06-03",
        sha256: "8f434346648f6b96df89dda901c5176b10a6d83961dd3c1ac88b59b2dc327aa4",
        tamperVerified: true,
        fileSize: "14.8 MB",
        accessLevel: "Classified"
      }
    ],
    citizenGrievances: []
  },

  // --- Case 2: Delhi Cyber Crime Cell (New Delhi) ---
  {
    id: "CAS-2026-0102",
    caseNumber: "NLADR/2026/CYB-0204",
    firNumber: "FIR No. 188/2026, Special Cyber Cell Mandir Marg",
    state: "Delhi (NCT)",
    district: "New Delhi",
    policeStation: "Special Cyber Crime Cell, Mandir Marg",
    cctnsNumber: "DL-CY-2026-000188",
    gdNumber: "GD-09B dated 18.02.2026",
    title: "State vs. Syndicate of Fake Govt Land Registry Allotment Portals",
    category: "Cyber Crime & Sovereign Impersonation",
    statuteSections: "Sec 338, 318(4) BNS & Sec 66, 66C IT Act 2000",
    complainant: "Department of Revenue & Land Records (Ex-Officio)",
    complainantId: "GOV-REV-01",
    complainantContact: "+91 11 2309 4410",
    assignedIO: "Vikramaditya Rathore",
    assignedIOId: "USR-IO-001",
    assignedLegalOfficer: "Adv. Ananya Mehta",
    assignedLegalOfficerId: "USR-LEG-001",
    recordOfficerId: "USR-REC-001",
    status: "Charge-sheet Filed",
    progressPercent: 85,
    filingDate: "2026-02-18",
    priority: "Urgent",
    courtName: "Chief Metropolitan Magistrate Court, Rouse Avenue",
    presidingJudge: "Hon'ble CMM Smt. Manjula Joshi",
    nextHearingDate: "2026-09-28",
    hearingStage: "Scrutiny of Documents & Framing of Charges",
    archiveLocation: {
      vaultNumber: "Vault-01 (Digital Archive)",
      rackNumber: "R-08",
      shelfNumber: "Shelf-D",
      classification: "Secret"
    },
    teamMembers: [
      { name: "Vikramaditya Rathore", role: "Lead Investigator Officer (SP)", phone: "+91 98712 34567" },
      { name: "Insp. Tarun Nanda", role: "Cyber Forensics & IP Tracer", phone: "+91 98119 44556" },
      { name: "Adv. Ananya Mehta", role: "Prosecuting Officer", phone: "+91 98234 56789" }
    ],
    findings: [],
    documents: [
      {
        id: "DOC-2026-010",
        name: "CERT-In Threat Intelligence & IP Attribution Dossier.pdf",
        type: "Cyber Forensics",
        uploadedBy: "Vikramaditya Rathore",
        uploadedDate: "2026-03-05",
        sha256: "ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb",
        tamperVerified: true,
        fileSize: "18.2 MB",
        accessLevel: "Secret"
      }
    ],
    citizenGrievances: []
  },

  // --- Case 3: Maharashtra Police (Mumbai Suburban - BKC Cyber) ---
  {
    id: "CAS-2026-0201",
    caseNumber: "NLADR/2026/MUM-CY-0302",
    firNumber: "FIR No. 302/2026, BKC Cyber Police Station",
    state: "Maharashtra",
    district: "Mumbai Suburban",
    policeStation: "BKC Cyber Police Station",
    cctnsNumber: "MH-MUM-2026-CY-000302",
    gdNumber: "GD-14C dated 14.05.2026",
    title: "Maharashtra Police vs. Deepfake Biometric Extortion & Voice Cloning Syndicate",
    category: "AI Cyber Extortion & Identity Theft",
    statuteSections: "Sec 318(4), 336(3), 340 BNS & Sec 66D, 66E IT Act 2000",
    complainant: "Pooja V. Deshmukh",
    complainantId: "REQ-2026-091",
    complainantContact: "+91 97654 32100",
    assignedIO: "Sachin Kadam",
    assignedIOId: "USR-IO-002",
    assignedLegalOfficer: "Adv. Ananya Mehta",
    assignedLegalOfficerId: "USR-LEG-001",
    recordOfficerId: "USR-REC-001",
    status: "Under Investigation",
    progressPercent: 55,
    filingDate: "2026-05-14",
    priority: "Urgent",
    courtName: "Special Cyber Court, Esplanade Court Complex, Mumbai",
    presidingJudge: "Hon'ble Additional Chief Metropolitan Magistrate V. S. Patil",
    nextHearingDate: "2026-10-04",
    hearingStage: "Forensic Voice Biometrics Acoustic Waveform Analysis",
    archiveLocation: {
      vaultNumber: "Vault-02 (Secure Hard Evidence)",
      rackNumber: "R-11",
      shelfNumber: "Shelf-C",
      classification: "Secret"
    },
    teamMembers: [
      { name: "Sachin Kadam", role: "ACP (Cyber Crime)", phone: "+91 98200 44321" },
      { name: "Insp. Vinayak Shinde", role: "AI & Signal Forensics Officer", phone: "+91 98211 55667" }
    ],
    findings: [
      {
        id: "FND-M01",
        date: "2026-05-20",
        author: "Sachin Kadam",
        title: "Offshore VoIP SIP Trunk Gateway Traced",
        description: "Deepfake synthetic audio generation traced to server node hosted on bulletproof provider in Southeast Asia. 2 Mule accounts frozen.",
        tag: "Cyber Forensics"
      }
    ],
    documents: [
      {
        id: "DOC-2026-M01",
        name: "Acoustic Spectrogram Comparative Forensic Analysis.pdf",
        type: "Forensic Evidence",
        uploadedBy: "Sachin Kadam",
        uploadedDate: "2026-05-22",
        sha256: "91bfa3c678a12903de486127bcfb992147102947ac0011bbdd778844aa112233",
        tamperVerified: true,
        fileSize: "11.2 MB",
        accessLevel: "Secret"
      }
    ],
    citizenGrievances: []
  },

  // --- Case 4: Karnataka Police (Bengaluru Urban - CID Cyber Crime) ---
  {
    id: "CAS-2026-0202",
    caseNumber: "NLADR/2026/BLR-CID-0076",
    firNumber: "FIR No. 076/2026, PS Vidhana Soudha",
    state: "Karnataka",
    district: "Bengaluru Urban",
    policeStation: "PS Vidhana Soudha",
    cctnsNumber: "KA-BLR-2026-000076",
    gdNumber: "GD-03A dated 10.03.2026",
    title: "Karnataka CID vs. Critical Cloud Health Infrastructure Ransomware Attack",
    category: "State Infrastructure Cyber Sabotage",
    statuteSections: "Sec 324, 329 BNS & Sec 43, 66, 70 (Protected Systems) IT Act",
    complainant: "State Health Systems Resource Center (Ex-Officio)",
    complainantId: "GOV-KA-HLTH",
    complainantContact: "+91 80 2235 4400",
    assignedIO: "Vikramaditya Rathore",
    assignedIOId: "USR-IO-001",
    assignedLegalOfficer: "Adv. Ananya Mehta",
    assignedLegalOfficerId: "USR-LEG-001",
    recordOfficerId: "USR-REC-001",
    status: "In Trial",
    progressPercent: 90,
    filingDate: "2026-03-10",
    priority: "Critical",
    courtName: "Special Court for Economic Offences & Cyber Crime, Bengaluru",
    presidingJudge: "Hon'ble Special Judge H. R. Nataraj",
    nextHearingDate: "2026-09-30",
    hearingStage: "Deposition of Cert-In Technical Investigators (PW-4)",
    archiveLocation: {
      vaultNumber: "Vault-03 (Classified)",
      rackNumber: "R-04",
      shelfNumber: "Shelf-A",
      classification: "Top Secret"
    },
    teamMembers: [
      { name: "DySP Ramesh Gowda", role: "CID Cyber Lead", phone: "+91 94480 12345" },
      { name: "Dr. K. S. Ramanujan", role: "Forensic Technical Consultant", phone: "+91 98661 22334" }
    ],
    findings: [],
    documents: [
      {
        id: "DOC-2026-KA01",
        name: "Decrypted Lockbit 4.0 Payload & Attribution Dossier.pdf",
        type: "Forensic Evidence",
        uploadedBy: "Dr. K. S. Ramanujan",
        uploadedDate: "2026-03-15",
        sha256: "55aa44bb33cc22dd11ee00ff99887766554433221100aabbccddeeff00112233",
        tamperVerified: true,
        fileSize: "29.4 MB",
        accessLevel: "Classified"
      }
    ],
    citizenGrievances: []
  },

  // --- Case 5: Uttar Pradesh Police (Gautam Buddha Nagar / Noida) ---
  {
    id: "CAS-2026-0203",
    caseNumber: "NLADR/2026/UP-NOI-0219",
    firNumber: "FIR No. 219/2026, PS Sector-20, Noida",
    state: "Uttar Pradesh",
    district: "Gautam Buddha Nagar (Noida)",
    policeStation: "PS Sector-20, Noida",
    cctnsNumber: "UP-NOI-2026-000219",
    gdNumber: "GD-19A dated 22.01.2026",
    title: "UP Police vs. Fictitious PM-Kisan & Soil Health Card Forged DBT Syndicate",
    category: "Public Subsidy Forgery & Cyber Fraud",
    statuteSections: "Sec 318, 338, 336(3) BNS & Sec 13 Prevention of Corruption Act",
    complainant: "District Agriculture Officer, Gautam Buddha Nagar",
    complainantId: "GOV-UP-AGR",
    complainantContact: "+91 120 256 7890",
    assignedIO: "Vikramaditya Rathore",
    assignedIOId: "USR-IO-001",
    assignedLegalOfficer: "Adv. Ananya Mehta",
    assignedLegalOfficerId: "USR-LEG-001",
    recordOfficerId: "USR-REC-001",
    status: "Charge-sheet Filed",
    progressPercent: 80,
    filingDate: "2026-01-22",
    priority: "High",
    courtName: "Special Sessions Court PC Act, Surajpur Court, Greater Noida",
    presidingJudge: "Hon'ble ASJ Rajeshwar Singh",
    nextHearingDate: "2026-10-08",
    hearingStage: "Scrutiny of Bank Aadhar Payment Bridge Logs",
    archiveLocation: {
      vaultNumber: "Vault-01 (Digital Archive)",
      rackNumber: "R-15",
      shelfNumber: "Shelf-E",
      classification: "Restricted"
    },
    teamMembers: [],
    findings: [],
    documents: [
      {
        id: "DOC-2026-UP01",
        name: "NPCI DBT Payment Bridge Reconciliation Audit.pdf",
        type: "Financial Audit",
        uploadedBy: "Vikramaditya Rathore",
        uploadedDate: "2026-02-04",
        sha256: "7766554433221100ffeeddccbbaa99887766554433221100ffeeddccbbaa9988",
        tamperVerified: true,
        fileSize: "7.8 MB",
        accessLevel: "Restricted"
      }
    ],
    citizenGrievances: []
  },

  // --- Case 6: Central Bureau of Investigation (Federal / Pan-India) ---
  {
    id: "CAS-2026-0204",
    caseNumber: "NLADR/2026/CBI-ACB-0012",
    firNumber: "Regular Case RC-DAI-2026-A-0012, CBI ACB Lodhi Road",
    state: "Central Bureau / Pan-India",
    district: "CBI Headquarters New Delhi",
    policeStation: "CBI Anti-Corruption Branch (ACB), Lodhi Road",
    cctnsNumber: "CBI-DL-2026-RC0012",
    gdNumber: "Entry #42 dated 05.01.2026",
    title: "CBI vs. Electronic Defense Equipment Tender Document Substitution Nexus",
    category: "National Security & Anti-Corruption",
    statuteSections: "Sec 7, 13 Prevention of Corruption Act 1988 & Sec 61(2), 336 BNS",
    complainant: "Central Vigilance Commission (Confidential Ref # CVC/DEF/882)",
    complainantId: "GOV-CVC-01",
    complainantContact: "+91 11 2465 1000",
    assignedIO: "Vikramaditya Rathore",
    assignedIOId: "USR-IO-001",
    assignedLegalOfficer: "Adv. Ananya Mehta",
    assignedLegalOfficerId: "USR-LEG-001",
    recordOfficerId: "USR-REC-001",
    status: "In Trial",
    progressPercent: 95,
    filingDate: "2026-01-05",
    priority: "Critical",
    courtName: "Special CBI Court No. 1, Rouse Avenue Court Complex, New Delhi",
    presidingJudge: "Hon'ble Special CBI Judge Alok Kumar Verma",
    nextHearingDate: "2026-09-29",
    hearingStage: "Final Prosecution Arguments on Cryptographic Audit Trails",
    archiveLocation: {
      vaultNumber: "Vault-02 (Secure Hard Evidence)",
      rackNumber: "R-01",
      shelfNumber: "Shelf-A",
      classification: "Top Secret"
    },
    teamMembers: [
      { name: "Vikramaditya Rathore", role: "Superintendent of Police", phone: "+91 98712 34567" },
      { name: "Adv. Ananya Mehta", role: "Special Public Prosecutor", phone: "+91 98234 56789" },
      { name: "Dr. K. S. Ramanujan", role: "Chief Forensic Cryptographer", phone: "+91 98661 22334" }
    ],
    findings: [],
    documents: [
      {
        id: "DOC-2026-CBI01",
        name: "Section 63 BSA Certified SHA-256 Bitwise Comparison Proof.pdf",
        type: "Forensic Evidence",
        uploadedBy: "Dr. K. S. Ramanujan",
        uploadedDate: "2026-01-20",
        sha256: "33221100ffeeddccbbaa99887766554433221100ffeeddccbbaa998877665544",
        tamperVerified: true,
        fileSize: "16.4 MB",
        accessLevel: "Classified"
      }
    ],
    citizenGrievances: []
  },

  // --- Case 7: Disposed Benchmark Case ---
  {
    id: "CAS-2026-0105",
    caseNumber: "NLADR/2025/DIS-0991",
    firNumber: "FIR No. 551/2025, PS Hauz Khas",
    state: "Delhi (NCT)",
    district: "South Delhi",
    policeStation: "PS Hauz Khas",
    cctnsNumber: "DL-SD-2025-000551",
    gdNumber: "GD-11A dated 14.06.2025",
    title: "State vs. Global Media Piracy & Copyright Infringement Ring",
    category: "Intellectual Property & Cyber Piracy",
    statuteSections: "Sec 63, 65 Copyright Act 1957 & Sec 66 IT Act",
    complainant: "Indian Motion Picture & Broadcasters Guild",
    complainantId: "ORG-BCG-01",
    complainantContact: "+91 22 2682 9900",
    assignedIO: "Vikramaditya Rathore",
    assignedIOId: "USR-IO-001",
    assignedLegalOfficer: "Adv. Ananya Mehta",
    assignedLegalOfficerId: "USR-LEG-001",
    recordOfficerId: "USR-REC-001",
    status: "Solved/Disposed",
    progressPercent: 100,
    filingDate: "2025-06-14",
    disposedDate: "2026-08-11",
    disposalOutcome: "Conviction Secured: 3 Accused Sentenced to 3 Years Rigorous Imprisonment & ₹50 Lakh Fine Deposited.",
    priority: "Normal",
    courtName: "District & Sessions Court, Saket Complex",
    presidingJudge: "Hon'ble ASJ M. K. Aggarwal",
    nextHearingDate: "Disposed",
    hearingStage: "Case Concluded / Sentenced",
    archiveLocation: {
      vaultNumber: "Vault-05 (Permanent Archival)",
      rackNumber: "R-19",
      shelfNumber: "Shelf-F",
      classification: "Public Judicial Record"
    },
    teamMembers: [],
    findings: [],
    documents: [
      {
        id: "DOC-2026-040",
        name: "Final Certified Judgement and Order of Conviction.pdf",
        type: "Judgement / Order",
        uploadedBy: "Adv. Ananya Mehta",
        uploadedDate: "2026-08-12",
        sha256: "4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce",
        tamperVerified: true,
        fileSize: "5.7 MB",
        accessLevel: "Public Record"
      }
    ],
    citizenGrievances: []
  }
];

// ============================================================================
// 6. MASTER AUDIT LOGS
// ============================================================================
const INITIAL_AUDIT_LOGS = [
  {
    id: "LOG-9921",
    timestamp: "2026-09-18T12:05:22Z",
    actor: "Adv. Ananya Mehta",
    actorRole: "Legal Officer",
    action: "Hearing Outcome Updated",
    target: "CAS-2026-0204 ( Rouse Avenue CBI Special Court )",
    ipAddress: "10.14.22.81 (Gov-Intranet)",
    hashVerification: "PASSED (SHA-256 Valid)"
  },
  {
    id: "LOG-9920",
    timestamp: "2026-09-18T10:44:11Z",
    actor: "Vikramaditya Rathore",
    actorRole: "Investigator Officer",
    action: "Investigation Diary Entry Added",
    target: "CAS-2026-0101 (PS Barakhamba Road Seizure Memo)",
    ipAddress: "10.14.22.39 (Cyber Cell)",
    hashVerification: "PASSED (SHA-256 Valid)"
  },
  {
    id: "LOG-9919",
    timestamp: "2026-09-18T09:12:03Z",
    actor: "Dr. Arvind Sharma, IAS",
    actorRole: "Administrator",
    action: "Access Role Approved",
    target: "Inspector Rameshwar Dutt (EOW Mandir Marg)",
    ipAddress: "10.14.1.2 (Secretariat)",
    hashVerification: "PASSED (SHA-256 Valid)"
  },
  {
    id: "LOG-9918",
    timestamp: "2026-09-17T17:30:45Z",
    actor: "Om Prakash Verma",
    actorRole: "Record Officer",
    action: "Physical Chain of Custody Handover",
    target: "Exhibit Ex-101/A transferred to CFSL Ballistics",
    ipAddress: "10.14.8.100 (Central Vault)",
    hashVerification: "PASSED (SHA-256 Valid)"
  }
];
