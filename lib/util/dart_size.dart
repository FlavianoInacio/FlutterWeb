size(double size, {double min, double max}){
  if(size<min){
    return min;
  }
  if(size>max){
        return max;
  }
  return size;
}