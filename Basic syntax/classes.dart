
enum party {
  democrat,
  republican,
  libertarian,
  green
}

class politician {

  List<String> donors;
  List<String> positions;
  party p;

  politician(this.donors, this.positions, this.p);
}

class president extends politician {

  int term;

  // same order as super class
  president(super.donors, super.positions, super.p, this.term);
}

void main(){
  president trump = president([], [], party.republican, 1);

  print(trump.is_dem);
}
