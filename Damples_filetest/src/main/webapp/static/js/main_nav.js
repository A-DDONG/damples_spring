document.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector("nav.main");
  let URL;

  const navClickHandler = (e) => {
    const target = e.target;
    if (target.tagName === "LI") {
      const targetClassName = target.className;
      URL = `${rootPath}/` + targetClassName;
    }
    if (target.tagName === "P") {
      const targetClassName = target.className;
      URL = `${rootPath}/` + targetClassName;
    }
    document.location.href = URL;
  };

  nav?.addEventListener("click", navClickHandler);
});
