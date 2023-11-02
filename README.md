# henry_meds_challenge

Henry Meds Challenge

## Getting Started

I normally use Micro-Frontend and create packages for each screen. 
But with a time crunch, I will have the pages in the page folder. Assume each will be a separate package.

## Folder structure

```
├── home.dart
└── src
    ├── data
    │   ├── datasources: connect to the api
    │   └── mappers
    ├── domain
    │   ├── entities
    │   ├── enums
    │   └── usecases
    ├── infrastructure
    │   ├── datasources
    │   └── repositories
    └── presentation
        ├── notifiers
        └── pages
```

## Limited time wish list

This wish list is not exhausted
- brought the json data from the datasource to the page
- constant folder for all colors and such
- broken up the widgets into smaller chunks
- Remove set states and put them inside the value notifier
- push the selected data to the fake api
- made packages to align with micro-frontend architecture
- and much more
