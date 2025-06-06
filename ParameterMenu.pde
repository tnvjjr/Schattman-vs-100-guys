// ParameterMenu.pde
// G4P parameter menu for simulation attributes

import g4p_controls.*;

GPanel paramPanel;
GSlider sSimSpeed, sGorillaFear, sGorillaStamina, sHumanFear, sHumanStamina;
GButton btnShowHideMenu;
boolean menuVisible = true;

void setupParameterMenu() {
  // Create panel
  paramPanel = new GPanel(this, 20, 70, 300, 250, "Simulation Parameters");
  paramPanel.setOpaque(true);
  paramPanel.setVisible(menuVisible);

  // Simulation speed slider
  sSimSpeed = new GSlider(this, 30, 30, 220, 30, 10.0);
  sSimSpeed.setLimits(simulationSpeed, 1, 4);
  sSimSpeed.setNumberFormat(G4P.INTEGER, 0);
  sSimSpeed.setShowValue(true);
  sSimSpeed.setShowLimits(true);
  paramPanel.addControl(sSimSpeed);
  sSimSpeed.setText("Simulation Speed");

  // Gorilla fear slider
  sGorillaFear = new GSlider(this, 30, 70, 220, 30, 10.0);
  sGorillaFear.setLimits(gorilla.intimidationFactor, 0, 10);
  sGorillaFear.setShowValue(true);
  sGorillaFear.setShowLimits(true);
  paramPanel.addControl(sGorillaFear);
  sGorillaFear.setText("Gorilla Fear");

  // Gorilla stamina slider
  sGorillaStamina = new GSlider(this, 30, 110, 220, 30, 10.0);
  sGorillaStamina.setLimits(gorilla.staminaLevel, 0, 200);
  sGorillaStamina.setShowValue(true);
  sGorillaStamina.setShowLimits(true);
  paramPanel.addControl(sGorillaStamina);
  sGorillaStamina.setText("Gorilla Stamina");

  // Human fear slider
  sHumanFear = new GSlider(this, 30, 150, 220, 30, 10.0);
  sHumanFear.setLimits(5, 0, 10);
  sHumanFear.setShowValue(true);
  sHumanFear.setShowLimits(true);
  paramPanel.addControl(sHumanFear);
  sHumanFear.setText("Human Fear");

  // Human stamina slider
  sHumanStamina = new GSlider(this, 30, 190, 220, 30, 10.0);
  sHumanStamina.setLimits(50, 0, 100);
  sHumanStamina.setShowValue(true);
  sHumanStamina.setShowLimits(true);
  paramPanel.addControl(sHumanStamina);
  sHumanStamina.setText("Human Stamina");

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
  } else if (slider == sHumanStamina) {
    for (Human h : humans) h.stamina = slider.getValueF();
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