ElektraGo iOS App

ElektraGo es una aplicación móvil de iOS que permite explorar productos de Elektra, ver detalles, seleccionar favoritos y mantener persistencia local. Implementa arquitectura MVVM, consumo de API REST, Core Data y UserDefaults para persistencia, y una experiencia de usuario fluida y moderna con SwiftUI.

🎯 Características principales

Consumo de la API de Elektra para obtener productos en tiempo real.

Lista de productos con detalles: nombre, precio, categoría e imagen.

Persistencia local con Core Data para mostrar productos sin conexión.

Almacenamiento de producto seleccionado usando UserDefaults.

Interfaz construida con SwiftUI y componentes reutilizables (ProductCard, RemoteImage).

Navegación fluida entre pantalla principal y lista de productos.

Manejo de estados: carga, error y selección de producto.

🛠 Tecnologías y Herramientas

Lenguaje: Swift 5.9

Frameworks: SwiftUI, Core Data, Combine

Arquitectura: MVVM

Red: URLSession + Network Layer

Persistencia: Core Data (productos), UserDefaults (producto seleccionado)

Compatibilidad: iOS 17+

Gestión de dependencias: Nativa (sin CocoaPods o SPM en este proyecto)

📂 Estructura del Proyecto
ElektraGo/
│
├─ Models/           # Estructuras de datos y protocolos
├─ Services/         # ProductService, NetworkClient
├─ ViewModels/       # ProductListViewModel
├─ Views/            # ContentView, ProductListView, ProductCard, RemoteImage
├─ Persistence/      # Core Data stack (PersistenceController)
└─ Resources/        # Assets (logos, imágenes)

🚀 Funcionalidad principal

Pantalla de inicio:

Logo de Elektra

Botón “Ver productos”

Lista de productos:

Carga desde Core Data si está disponible

Descarga de API si no hay datos locales

Selección de producto y persistencia en UserDefaults

Detalle de producto:

Muestra nombre, precio, categoría e imagen

Integración con UI moderna y reutilizable

💾 Persistencia

Core Data: guarda productos para visualización offline.

UserDefaults: almacena el último producto seleccionado.

Esto permite que la app funcione parcialmente sin conexión y recuerde la selección del usuario.


Abre ElektraGo.xcodeproj en Xcode 15+.

Selecciona el simulador o dispositivo iOS 17+.

Build & Run (Cmd + R).
