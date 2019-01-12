import UIKit
class GetDataViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var from_year_value: UISlider!
    @IBOutlet weak var from_year_text: UILabel!
    @IBOutlet weak var from_month_value: UISlider!
    @IBOutlet weak var from_month_text: UILabel!
    @IBOutlet weak var from_day_value: UISlider!
    @IBOutlet weak var from_day_text: UILabel!
    @IBOutlet weak var to_year_value: UISlider!
    @IBOutlet weak var to_year_text: UILabel!
    @IBOutlet weak var to_month_value: UISlider!
    @IBOutlet weak var to_month_text: UILabel!
    @IBOutlet weak var to_day_value: UISlider!
    @IBOutlet weak var to_day_text: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func from_year_slider(_ sender: Any) {
        date_text_change()
        check_date()
    }
    @IBAction func from_month_slider(_ sender: Any) {
        date_text_change()
        check_date()
    }
    @IBAction func from_day_slider(_ sender: Any) {
        date_text_change()
        check_date()
    }
    @IBAction func to_year_slider(_ sender: Any) {
        date_text_change()
        check_date()
    }
    @IBAction func to_month_slider(_ sender: Any) {
        date_text_change()
        check_date()
    }
    @IBAction func to_day_slider(_ sender: Any) {
        date_text_change()
        check_date()
    }
    
    func check_date(){
        if(from_year_value.value > to_year_value.value){
            from_year_value.value = to_year_value.value}
        else if(from_year_value.value == to_year_value.value){
            if(from_month_value.value > to_month_value.value){
                from_month_value.value = to_month_value.value}
            else if(from_month_value.value == to_month_value.value){
                    if(from_day_value.value > to_day_value.value){
                        from_day_value.value = to_day_value.value
                    }
                }
            }
        
    
        date_text_change()
    }
    
    func date_text_change(){
        from_year_value.value = roundf(from_year_value.value)
        from_year_text.text = String(format:"%.0f",(from_year_value.value+2016))
        from_month_value.value = roundf(from_month_value.value)
        from_month_text.text = String(format:"%.0f",(from_month_value.value+1))
        from_day_value.value = roundf(from_day_value.value)
        from_day_text.text = String(format:"%.0f",(from_day_value.value+1))
        
        to_year_value.value = roundf(to_year_value.value)
        to_year_text.text = String(format:"%.0f",(to_year_value.value+2016))
        to_month_value.value = roundf(to_month_value.value)
        to_month_text.text = String(format:"%.0f",(to_month_value.value+1))
        to_day_value.value = roundf(to_day_value.value)
        to_day_text.text = String(format:"%.0f",(to_day_value.value+1))
    }
    func num_change_str(number:Int) -> String{
            if(number < 10){
                return "0"+String(number)}
            else{
                return String(number)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var start_date = "0"
        var end_date = "0"
        if  let year_text = from_year_text.text
           ,let month_text = Int(from_month_text.text!)
           ,let day_text = Int(from_day_text.text!){
            start_date = year_text+"-"+num_change_str(number:month_text)+"-"+num_change_str(number:day_text)
            print("from:"+start_date)
        }
        if  let year_text = to_year_text.text
            ,let month_text = Int(to_month_text.text!)
            ,let day_text = Int(to_day_text.text!){
            end_date = year_text+"-"+num_change_str(number:month_text)+"-"+num_change_str(number:day_text)
            print("to:"+end_date)
        }
        NasaController.shared.set_date(s_date:start_date,e_date:end_date)
        print(NasaController.shared.get_api_Str())
    }
}

/*
 for i in 0...3{
 AnswerButton[i].isHidden = false
 AnswerButton[i].isEnabled = true
 }
 */
