import App from './App.svelte'
import Mobile from './Mobile.svelte'

// Функция определения мобильного устройства
function isMobileDevice() {
  // Проверка по User Agent
  const userAgent = navigator.userAgent || navigator.vendor || window.opera;
  const mobileRegex = /android|webos|iphone|ipad|ipod|blackberry|iemobile|opera mini|mobile/i;
  
  // Проверка по размеру экрана
  const screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
  const isMobileScreen = screenWidth <= 768;
  
  // Проверка touch устройства
  const isTouchDevice = 'ontouchstart' in window || navigator.maxTouchPoints > 0;
  
  return mobileRegex.test(userAgent) || (isMobileScreen && isTouchDevice);
}

// Запуск соответствующей версии
const AppComponent = isMobileDevice() ? Mobile : App;

const app = new AppComponent({
  target: document.getElementById('app')
})

export default app
