# 🎬 Movie App

A Flutter movie app built using **Clean Architecture** and **Bloc** for state management.

---

## 📱 Features

- Display **Now Playing**, **Popular**, and **Top Rated** movies  
- Show **movie details** (overview, rating, release date, etc.)  
- Clean and maintainable **architecture layers (Data, Domain, Presentation)**  
- Uses **The Movie DB API** for fetching real data  
- Error handling and loading states  
- Responsive design for mobile

---

## 🧠 Technologies Used

- **Flutter**  
- **Bloc (flutter_bloc)**  
- **Dio** for API calls  
- **GetIt (service locator)**  
- **Equatable** for state comparison  
- **Clean Architecture pattern**

---

## 🧩 Project Structure

lib/
│
├── core/
│ ├── error/
│ ├── network/
│ └── utils/
│
├── movie/
│ ├── data/
│ ├── domain/
│ └── presentation/
│
└── main.dart