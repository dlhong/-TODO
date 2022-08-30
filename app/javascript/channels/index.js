// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

// import {swiper} from "./init_swiper";
// document.addEventListener("turbolinks:load", () => {
//   swiper;
//   console.log("hello");
// });
