const initTurboformremove = () => {
  document.querySelectorAll("form").forEach(function (el) {
    el.dataset.turbo = false;
  });
};

export { initTurboformremove };
