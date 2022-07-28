class PlayerPoint extends Point {
  private boolean finished;
  public void set(int posx, int posy, int r, int g, int b, boolean finished) {
  super.set(posx, posy, r, g, b);
  this.finished = finished;
  }
  
  public Boolean getIsFinished() {
    return this.finished;
  }
  
  public void setIsFinished(Boolean fin) {
    finished = fin;
  }
  
}
