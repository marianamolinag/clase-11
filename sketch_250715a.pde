//Mariana Molina 202222414
//clase 11 bases de datos

Table table;
int nSamples;

float [] appUsageTime;
float [] screenOnTime;

void setup() {
  size(1000, 1000);

  
  table = loadTable("user_behavior_dataset.csv", "header");
  nSamples = table.getRowCount();

  appUsageTime = new float[nSamples];
  screenOnTime = new float[nSamples];

  for (int i = 0; i < nSamples; i++) {
    appUsageTime[i] = table.getFloat(i, "App Usage Time (min/day)");
    screenOnTime[i] = table.getFloat(i, "Screen On Time (hours/day)");
  }
}

void draw() {
  background(255);

  for (int i = 0; i < nSamples; i++) {
    float x = map(appUsageTime[i], 0, max(appUsageTime), 0, width);
    float y = map(screenOnTime[i], 0, max(screenOnTime), height, 0);  // corregí height, antes decía width

    fill(random(0, 100), random(100, 180), random(180, 255));
    noStroke();
    ellipse(x, y, 15, 15);
  }
}
