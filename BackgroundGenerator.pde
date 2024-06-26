PImage getBackgroundForExceptionWindow(int x, int y) {
  PGraphics g = createGraphics(x, y);
  g.beginDraw();

  if (BackgroundGeneratorSettings == null) {
    g.fill(0);
    g.stroke(0);
    g.rect(0, 0, x, y);
    return g;
  }

  int c1 = getSmartRandomColor(20, 70);
  int c2 = getSmartRandomColor(20, 70);


  for (int ix = 0; ix < x; ix++) {
    for (int iy = 0; iy < y; iy++) {
      float sx = ix / (float)x;
      float sy = iy / (float)y;
      float lerp = (sx + sy) / 2;

      color c = lerpColor(c1, c2, lerp);
      g.set(ix, iy, c);
    }
  }
  if (BackgroundGeneratorSettings.getJSONObject("grid_romb").getBoolean("enable")) {
    grid_romb(g, x, y);
  }

  g.endDraw();

  return g;
}

void grid_romb(PGraphics g, int x, int y) {
  float startfrom = -y + -x;
  float endto = x;
  float step = BackgroundGeneratorSettings.getJSONObject("grid_romb").getFloat("step");

  JSONArray colarr = BackgroundGeneratorSettings.getJSONObject("grid_romb").getJSONArray("strokecolor");
  int[] col = new int[4];

  if (colarr.size() != 4) {
    exceptionclear("Exception has been occured", "Class: Main.<func>grid_romb\n Error: Field \"strokecolor\" in \"grid_romb\" in \"background.json\" doesn't match size.\n      Required: size 4 (r, g, b, a)");
  }

  for (int i = 0; i < colarr.size(); i++) {
    col[i] = colarr.getInt(i);
  }

  float strokeweight = BackgroundGeneratorSettings.getJSONObject("grid_romb").getFloat("strokeweight");

  g.stroke(col[0], col[1], col[2], col[3]);
  g.strokeWeight(strokeweight);

  for (float i = startfrom; i < endto; i += step) {
    g.line(i, -50, i + x, y + 50);
  }
}
