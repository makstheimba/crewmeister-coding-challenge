# Flutter app for Crewmeister coding challenge
## Project structure

### Frontend:
- [Very Good CLI](https://pub.dev/packages/very_good_cli) is used to create flutter project template
- app architecture is sctructured according to clean architecture and is separated into 3 layers:
  * data for interacting with external data sources. I didn't use DTO models to simplify and speed up development. `Dio` and `retrofit` are used for api calls
  * domain for internal business logic. I'm storing models here. `json_serializable` and `freezed` are used to make model generation much easier.
  * presentation for UI. Here cubits and widgets are housing

### Backend:
- I've set up two simple lambda functions for users and absences. For absences I've also added simple filtering because I thought it makes sense to do it on the server because it messes up pagination on the client.

