
const SidebarController = {
  // Méthode d'exemple
  toggleSidebar: function() {
    var sidebar = document.getElementById("sidebar");
  if (sidebar.style.transform === "translateX(0px)") {
    sidebar.style.transform = "translateX(-250px)"; // Cache la barre latérale
  } else {
    sidebar.style.transform = "translateX(0px)"; // Affiche la barre latérale
  }
  }
};

export default SidebarController;
