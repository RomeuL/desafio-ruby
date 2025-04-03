document.addEventListener("DOMContentLoaded", () => {
  // Atualizar a matrícula do armeiro
  window.updateArmeiroMatricula = function () {
    const armeiroSelect = document.querySelector("select[name='despacho[armeiro_id]']");
    const armeiroMatriculaField = document.getElementById("matricula_armeiro");

    if (armeiroSelect) {
      const selectedOption = armeiroSelect.options[armeiroSelect.selectedIndex];
      if (selectedOption && selectedOption.dataset.matricula) {
        armeiroMatriculaField.value = selectedOption.dataset.matricula;
      } else {
        armeiroMatriculaField.value = "";
      }
    }
  };

  // Atualizar os detalhes do guarda
  window.updateGuardaDetails = function () {
    const guardaSelect = document.querySelector("select[name='despacho[guarda_id]']");
    const guardaMatriculaField = document.getElementById("matricula_guarda");
    const guardaPorteField = document.getElementById("porte_guarda");

    if (guardaSelect) {
      const selectedOption = guardaSelect.options[guardaSelect.selectedIndex];
      console.log("Selected Option:", selectedOption);
      if (selectedOption) {
        console.log("Matrícula:", selectedOption.dataset.matricula);
        console.log("Porte:", selectedOption.dataset.porte);
        guardaMatriculaField.value = selectedOption.dataset.matricula || "";
        guardaPorteField.value = selectedOption.dataset.porte || "";
      } else {
        guardaMatriculaField.value = "";
        guardaPorteField.value = "";
      }
    }
  };
});