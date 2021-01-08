class Button {
  int x;
  int y;
  int h;
  int w;
  String txt;
  int txtSize;
  int strokeWeight;
  int col;
  int stroke;
  int txtCol;

  //x, y, width, height, stroke, strokeWeight, colour, text, textSize
  public Button(int x, int y, int w, int h, int stroke, int strokeWeight, int col, String txt, int txtSize, int txtCol) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.txt = txt;
    this.txtSize =txtSize;
    this.strokeWeight = strokeWeight;
    this.w = w;
    this.col = col;
    this.stroke = stroke;
    this.txtCol = txtCol;
  }  

  void show() {
    rectMode(CENTER);
    fill(col);
    strokeWeight(strokeWeight);
    stroke(0);
    rect(x, y, w, h);
    fill(txtCol);
    textAlign(CENTER, CENTER);
    textSize(txtSize);
    text(txt, x, y-10);
  }

  boolean mouseClick() {
    if (mouseX> x-w/2 && mouseX<x+w/2 && mouseY<y+h/2 && mouseY>y-h/2 && mouse) {
      return true;
    }
    return false;
  }
}
