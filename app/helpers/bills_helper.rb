module BillsHelper
  def get_money_electric bill
    bill.electrical_number * Settings.electric_money    
  end

  def sum_money_bill  bill
    bill.electrical_number * Settings.electric_money + bill.room_price 
  end
end
