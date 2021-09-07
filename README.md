# Delivery App

My first Flutter project.

## Splash screen

This app starts with a splash screen, that is used to validate the user. In case the user had previously logged in, the user will be redirected to the home page. If not, the user must log in.

<p align="center" >
  <img src="assets\screenshots\Screenshot_splash.png" width="350" title="splash screen">
</p>

## Log in

The log in screen uses a fake api implementation to validate the user's credentials. Real log in with Firebase to be implemented in the future. Default theme for the app is DarkMode, therefore, only the dark theme can bee seen.

<p align="center" >
  <img src="assets\screenshots\Screenshot_login_dark.png" width="350" title="login screen">

</p>

## Home screen

This is the main screen of the app, where the products, cart and profile screens can be found.

### Products screen

The products screen shows a list of products using a fake api implementation to obtain all the information required. It also shows a fake delay to appear that the app is actually loading the products from the internet. Once the products are loaded, the 'Buy' button can be pressed to add the items to the cart.

<p align="center" >
  <img src="assets\screenshots\Screenshot_home_light.png" width="350" title="home screen">
  <img src="assets\screenshots\Screenshot_home_dark.png" width="350" title="home screen">

</p>

### Cart screen

The cart screen shows the list of products that have been added to the cart. When no items are added, a different screen is shown. 

<p align="center" >
  <img src="assets\screenshots\Screenshot_empty_cart_light.png" width="350" title="home screen">
  <img src="assets\screenshots\Screenshot_empty_cart_dark.png" width="350" title="home screen">
</p>

The amount of products is updated and can be added, removed and deleted. At the same time, the cost of the purchase is calculated. The checkout button is yet to be implemented.
<p align="center" >
  <img src="assets\screenshots\Screenshot_full_cart_light.png" width="350" title="home screen">
  <img src="assets\screenshots\Screenshot_full_cart_dark.png" width="350" title="home screen">
</p>

### Profile screen

The profile screen shows the user's information: profile picture, name and email, and lets them choose whether they want the light or the dark theme*. The log out button deletes all information stored and redirects the user to the login screen.

<p align="center" >
  <img src="assets\screenshots\Screenshot_profile_light.png" width="350" title="home screen">
  <img src="assets\screenshots\Screenshot_profile_dark.png" width="350" title="home screen">
</p>

*Dark mode is forced when the device has dark mode enabled on its settings.

## State management

State management using Getx: GetWidgets, GetxControllers, ... 
Data stored using Shared preferences.


## Credits

Personal project to learn flutter, based on [Diegoveloper](https://www.youtube.com/c/diegoveloper)'s Delivery App videos.

Product's images obtained from [Unsplash](https://unsplash.com/s/photos/product)
