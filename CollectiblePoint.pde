class CollectiblePoint extends Point {
  private boolean isVisible;
  
  public void set(int posx, int posy, int r, int g, int b, boolean isVisible) {
    super.set( posx,  posy,  r,  g, b);
    this.isVisible = isVisible;
  }
  
  public Boolean getIsVisible() {
    return this.isVisible;
  }
  public void setIsVisible(Boolean vis) {
    this.isVisible = vis;
  }
  
}
