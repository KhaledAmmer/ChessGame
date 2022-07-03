
class array {

  static final List<List<int>>Rows=[
    fillRow(0),
    fillRow(8),
    fillRow(16),
    fillRow(24),
    fillRow(32),
    fillRow(40),
    fillRow(48),
    fillRow(53)
  ];


  static final List<List<int>>Cols=[
    fillCols(0),
    fillCols(1),
    fillCols(2),
    fillCols(3),
    fillCols(4),
    fillCols(5),
    fillCols(6),
    fillCols(7)
  ];

}
 fillRow(start){
   List<int> row=[];
    for(int j=start;j<=start+7;j++){
        row.add(j);
    }
  return row;
}

fillCols(start){
  List<int> col=[];
  for(int j=start;j<=63;j+=8){
    col.add(j);
  }
  return col;
}