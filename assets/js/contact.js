(function () {
  function decodePart(value) {
    try {
      return atob(value.trim()).trim();
    } catch (e) {
      return value.trim();
    }
  }

  document.querySelectorAll("[data-email-b64]").forEach(function (el) {
    var raw = el.getAttribute("data-email-b64") || "";
    var emails = raw.split("|").map(decodePart).filter(Boolean);
    if (!emails.length) return;
    el.textContent = emails.join(" | ");
    el.href = "mailto:" + emails[0];
  });

  document.querySelectorAll("[data-b64]").forEach(function (el) {
    var raw = el.getAttribute("data-b64") || "";
    var text = raw.split("|").map(decodePart).filter(Boolean).join(" | ");
    if (text) el.textContent = text;
  });
})();
