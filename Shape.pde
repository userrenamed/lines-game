abstract class Shape {
  abstract void draw(float x, float y, float s, int col);
}

class Rect extends Shape {
  @Override
    void draw(float x, float y, float s, int col) {
    fill(col);
    rect(x, y, s, s);
  }
}

class Ellipse extends Shape {
  @Override
    void draw(float x, float y, float s, int col) {
    fill(col);
    ellipse(x, y, s, s);
  }
}