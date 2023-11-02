# henry_meds_challenge

Henry Meds Challenge

Full Video: https://drive.google.com/file/d/13Jlr2CamEV18aJQvrNAFyeIDS5FLvrAo/view?usp=sharing

## Screen Shots

Home:

<img width="437" alt="Screenshot 2023-11-01 at 8 30 03 PM" src="https://github.com/SawWebFuture/henry_meds_challenge/assets/14567308/9ad30696-3524-4b84-a616-e3f8c93d1917">

Provider:

<img width="451" alt="Screenshot 2023-11-01 at 8 30 16 PM" src="https://github.com/SawWebFuture/henry_meds_challenge/assets/14567308/95a93759-c387-49ed-a5ab-725acd8445fb">

Client:

- Set availability:

<img width="490" alt="Screenshot 2023-11-01 at 8 30 26 PM" src="https://github.com/SawWebFuture/henry_meds_challenge/assets/14567308/8297c6e5-b31d-4cff-a488-e4705fdbf3f9">

- Select Time slot:

<img width="517" alt="Screenshot 2023-11-01 at 8 30 36 PM" src="https://github.com/SawWebFuture/henry_meds_challenge/assets/14567308/5f68f3e9-844f-44d1-a524-a12c6547df9c">

- Confirm day & time:

<img width="469" alt="Screenshot 2023-11-01 at 8 30 42 PM" src="https://github.com/SawWebFuture/henry_meds_challenge/assets/14567308/2b39b081-20ff-47c2-b41f-896da7f88333">



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
