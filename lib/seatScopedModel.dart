
import 'package:scoped_model/scoped_model.dart';

class SeatScopedModel extends Model{

  bool _selected = false;
  bool get selected => this._selected;
  isSelected() {
    this._selected = !this.selected;
    notifyListeners();
  }
  

  List<String> _selectedSeats=[];
  List<String> get selectedSeats => this._selectedSeats;
  
  updateList(String seatNumber){
    _selectedSeats.add(seatNumber);
    notifyListeners();
  }

  removeItem(String seatNumber){
    _selectedSeats.remove(seatNumber);
    notifyListeners();
  }


}