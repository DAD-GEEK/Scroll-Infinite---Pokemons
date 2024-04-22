
# Proyecto de Listado de Pokemons con Scroll Infinito

Este proyecto es una aplicación de Flutter que muestra una lista de Pokemons con scroll infinito. Los usuarios pueden desplazarse por la lista para ver los diferentes Pokemons disponibles y la aplicación cargará más Pokemons a medida que el usuario se desplace hacia abajo.

## Características

- **Lista de Pokemons**: La aplicación muestra una lista de Pokemons utilizando un `ListView.builder`. Cada elemento de la lista es un `ListTile` que muestra el nombre del Pokemon.

- **Scroll Infinito**: La aplicación utiliza un `ScrollController` para detectar cuando el usuario se ha desplazado hasta el final de la lista. Cuando esto sucede, la aplicación carga más Pokemons.

## Código Principal

El código principal de la aplicación se encuentra en los siguientes archivos:

- `main.dart`: Este archivo contiene la función `main` que inicia la aplicación y el widget `MainApp` que define la estructura principal de la aplicación.

- `ListPokemons.dart`: Este archivo contiene el widget `ListPokemons` que muestra la lista de Pokemons y gestiona el scroll infinito.

## Cómo Ejecutar

Para ejecutar esta aplicación, necesitarás tener Flutter y Dart instalados en tu máquina. Una vez instalados, puedes clonar este repositorio y ejecutar `flutter run` en la raíz del proyecto.

## Contribuir

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request si deseas contribuir a este proyecto.

## Licencia

Este proyecto está licenciado bajo los términos de la licencia MIT.