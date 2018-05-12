import spout.*;
Spout spout;
PImage img;
Config config;

void setup() {
  img = createImage(1, 1, ARGB);
  if (!config.isVisibleCursor) {
    noCursor();
  }
  imageMode(CENTER);
  spout = new Spout(this);
}

void settings() {
  config = loadConfig();
  fullScreen(P2D, config.targetMonitor);
}

Config loadConfig() {
  Config config = new Config();
  config.targetMonitor = 0;
  config.isVisibleCursor = true;
  try {
    JSONObject jo =loadJSONObject("config.json");
    int targetMonitor = jo.getInt("targetMonitor");
    boolean isVisibleCursor = jo.getBoolean("isVisibleCursor");
    config.targetMonitor = targetMonitor;
    config.isVisibleCursor = isVisibleCursor;
  }
  catch(Exception e) {
  }
  return config;
}

void draw() {
  background(0);
  spout.receiveTexture(img);
  image(img, width/2, height/2);
}

class Config {
  boolean isVisibleCursor;
  int targetMonitor;
}