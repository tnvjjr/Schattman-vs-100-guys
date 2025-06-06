// ParameterMenu.pde - Custom Processing UI (no G4P)

// --- Global variables for parameters (use these in your sim logic) ---
float gorillaFear = 5;
float gorillaStamina = 100;
float humanFear = 5;
int simulationSpeed = 1;
boolean paused = false;

// --- UI state ---
boolean draggingGorillaFear = false;
boolean draggingGorillaStamina = false;
boolean draggingHumanFear = false;
boolean draggingSimSpeed = false;

// --- UI layout constants ---
int sliderX = 40, sliderW = 200;
int gfY = 80, gsY = 130, hfY = 180, ssY = 230;
int sliderH = 20;

void drawParameterMenu() {
  fill(240);
  rect(20, 60, 300, 220, 10);
  fill(0);
  textSize(18);
  text("Parameter Menu", 40, 75);
  textSize(14);

  // --- Draw sliders ---
  drawSlider("Gorilla Fear", gorillaFear, 0, 10, sliderX, gfY, sliderW, sliderH);
  drawSlider("Gorilla Stamina", gorillaStamina, 0, 200, sliderX, gsY, sliderW, sliderH);
  drawSlider("Human Fear", humanFear, 0, 10, sliderX, hfY, sliderW, sliderH);
  drawSlider("Sim Speed", simulationSpeed, 1, 4, sliderX, ssY, sliderW, sliderH);

  // --- Draw Pause Button ---
  fill(paused ? color(200, 100, 100) : color(100, 200, 100));
  rect(260, 230, 60, 30, 8);
  fill(0);
  textAlign(CENTER, CENTER);
  text(paused ? "PLAY" : "PAUSE", 290, 245);
  textAlign(LEFT, BASELINE);
}

void drawSlider(String label, float val, float minV, float maxV, int x, int y, int w, int h) {
  fill(180);
  rect(x, y, w, h, 6);
  float norm = map(val, minV, maxV, 0, 1);
  int knobX = int(x + norm * w);
  fill(60, 120, 220);
  ellipse(knobX, y + h/2, h, h);
  fill(0);
  text(label + ": " + nf(val, 0, 2), x + w + 15, y + h/2 + 5);
}

void mousePressedParameterMenu() {
  // Gorilla Fear
  if (overSlider(mouseX, mouseY, sliderX, gfY, sliderW, sliderH)) draggingGorillaFear = true;
  // Gorilla Stamina
  if (overSlider(mouseX, mouseY, sliderX, gsY, sliderW, sliderH)) draggingGorillaStamina = true;
  // Human Fear
  if (overSlider(mouseX, mouseY, sliderX, hfY, sliderW, sliderH)) draggingHumanFear = true;
  // Sim Speed
  if (overSlider(mouseX, mouseY, sliderX, ssY, sliderW, sliderH)) draggingSimSpeed = true;
  // Pause Button
  if (mouseX > 260 && mouseX < 320 && mouseY > 230 && mouseY < 260) paused = !paused;
}

void mouseDraggedParameterMenu() {
  if (draggingGorillaFear) gorillaFear = constrain(map(mouseX, sliderX, sliderX + sliderW, 0, 10), 0, 10);
  if (draggingGorillaStamina) gorillaStamina = constrain(map(mouseX, sliderX, sliderX + sliderW, 0, 200), 0, 200);
  if (draggingHumanFear) humanFear = constrain(map(mouseX, sliderX, sliderX + sliderW, 0, 10), 0, 10);
  if (draggingSimSpeed) simulationSpeed = int(constrain(map(mouseX, sliderX, sliderX + sliderW, 1, 4), 1, 4));
}

void mouseReleasedParameterMenu() {
  draggingGorillaFear = false;
  draggingGorillaStamina = false;
  draggingHumanFear = false;
  draggingSimSpeed = false;
}

boolean overSlider(int mx, int my, int x, int y, int w, int h) {
  return (mx > x && mx < x + w && my > y && my < y + h);
} 