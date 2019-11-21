import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Rent your perfect tablescape", "or rent out yours to other hosts"],
    typeSpeed: 80,
    loop: true,
    backSpeed: 40,
    backDelay: 500,
    showCursor: true
  });
}

export { loadDynamicBannerText };
