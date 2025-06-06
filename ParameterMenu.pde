// ParameterMenu.pde
// G4P parameter menu for simulation attributes

import g4p_controls.*;

GPanel paramPanel;
GSlider sSimSpeed, sGorillaFear, sGorillaStamina, sHumanFear;
GLabel lSimSpeed, lGorillaFear, lGorillaStamina, lHumanFear, lHumanStamina;
GButton btnShowHideMenu;
boolean menuVisible = true;

void setupParameterMenu() {
  // Create panel
  paramPanel = new GPanel(this, 20, 70, 300, 250, "Simulation Parameters");
  paramPanel.setOpaque(true);
  paramPanel.setVisible(menuVisible);

  // Simulation speed label and slider
  lSimSpeed = new GLabel(this, 30, 10, 220, 20, "Simulation Speed");
  paramPanel.addControl(lSimSpeed);
  sSimSpeed = new GSlider(this, 30, 30, 220, 30, 10.0);
  sSimSpeed.setLimits(simulationSpeed, 1, 4);
  sSimSpeed.setNumberFormat(G4P.INTEGER, 0);
  sSimSpeed.setShowValue(true);
  sSimSpeed.setShowLimits(true);
  paramPanel.addControl(sSimSpeed);

  // Gorilla fear label and slider
  lGorillaFear = new GLabel(this, 30, 60, 220, 20, "Gorilla Fear");
  paramPanel.addControl(lGorillaFear);
  sGorillaFear = new GSlider(this, 30, 80, 220, 30, 10.0);
  sGorillaFear.setLimits(gorilla.intimidationFactor, 0, 10);
  sGorillaFear.setShowValue(true);
  sGorillaFear.setShowLimits(true);
  paramPanel.addControl(sGorillaFear);

  // Gorilla stamina label and slider
  lGorillaStamina = new GLabel(this, 30, 110, 220, 20, "Gorilla Stamina");
  paramPanel.addControl(lGorillaStamina);
  sGorillaStamina = new GSlider(this, 30, 130, 220, 30, 10.0);
  sGorillaStamina.setLimits(gorilla.staminaLevel, 0, 200);
  sGorillaStamina.setShowValue(true);
  sGorillaStamina.setShowLimits(true);
  paramPanel.addControl(sGorillaStamina);

  // Human fear label and slider
  lHumanFear = new GLabel(this, 30, 160, 220, 20, "Human Fear");
  paramPanel.addControl(lHumanFear);
  sHumanFear = new GSlider(this, 30, 180, 220, 30, 10.0);
  sHumanFear.setLimits(5, 0, 10);
  sHumanFear.setShowValue(true);
  sHumanFear.setShowLimits(true);
  paramPanel.addControl(sHumanFear);

  // Show/hide button
  btnShowHideMenu = new GButton(this, 340, 70, 100, 30, "Hide Menu");
}

void handleSliderEvents(GSlider slider) {
  if (slider == sSimSpeed) {
    simulationSpeed = int(slider.getValueF());
  } else if (slider == sGorillaFear) {
    gorilla.intimidationFactor = slider.getValueF();
  } else if (slider == sGorillaStamina) {
    gorilla.staminaLevel = slider.getValueF();
  } else if (slider == sHumanFear) {
    for (Human h : humans) h.fearLevel = slider.getValueF();
  }
}

void handleButtonEvents(GButton button) {
  if (button == btnShowHideMenu) {
    menuVisible = !menuVisible;
    paramPanel.setVisible(menuVisible);
    btnShowHideMenu.setText(menuVisible ? "Hide Menu" : "Show Menu");
  }
}

void handlePanelEvents(GPanel panel, GEvent event) {
  // No-op for now
}

// G4P event handler
void handleSliderEvents(GValueControl slider, GEvent event) {
  if (event == GEvent.CHANGE) {
    handleSliderEvents((GSlider)slider);
  }
}

void handleButtonEvents(GButton button, GEvent event) {
  if (event == GEvent.CLICKED) {
    handleButtonEvents(button);
  }
} 