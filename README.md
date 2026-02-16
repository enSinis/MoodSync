# MoodSync

Este proyecto es una aplicación de seguimiento de estado de ánimo construida con SwiftUI.

**Estado actual:** He configurado el repositorio como un **Swift Executable Package**. Esto permite abrirlo, compilarlo y ejecutarlo directamente en Xcode.

## Cómo ejecutar en Xcode

1. **Abre el proyecto:**
   - Abre Xcode y selecciona **File > Open...**.
   - Selecciona la carpeta raíz de este repositorio.

2. **Ejecuta la aplicación:**
   - Selecciona el target **MoodSync**.
   - Para ejecutar directamente en tu Mac, selecciona **My Mac (Designed for iPad)** como destino.
   - Presiona **Cmd + R**.

---

## Cómo convertir a una App de iOS completa

Si deseas tener un proyecto de iOS estándar (.xcodeproj) para publicar en la App Store o usar todas las funciones de iOS:

1. **Crea un nuevo proyecto en Xcode:**
   - **File > New > Project... > iOS > App**.
   - Nombre: `MoodSync`.
2. **Importa los archivos:**
   - Borra `ContentView.swift` y `MoodSyncApp.swift` del nuevo proyecto.
   - Arrastra la carpeta `MoodSync` de este repositorio a tu nuevo proyecto.
   - Asegúrate de marcar **"Copy items if needed"**.
