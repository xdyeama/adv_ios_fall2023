//
//  ViewController.swift
//  CalendarHW
//
//  Created by Beket Barlykov  on 04.10.2023.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarView: UICollectionView!
    
    var selectedDate = Date()
    var totalDates = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCellsView()
        setMonthView()
    }
    

    @IBAction func nextMonth(_ sender: Any) {
        selectedDate = CalendarUtility().plusMonth(date: selectedDate)
        setMonthView()
    }
    @IBAction func prevMonth(_ sender: Any) {
        selectedDate = CalendarUtility().minusMonth(date: selectedDate)
    }
    
    override open var shouldAutorotate: Bool{
        return false
    }
    
}

extension ViewController: UICollectionViewDelegate{
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalDates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as! CalendarCell
        
        cell.dayOfMonth.text = totalDates[indexPath.item]
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func setCellsView(){
        let width = (calendarView.frame.size.width - 2) / 8
        let height = (calendarView.frame.size.height - 2) / 8
        
        let flowLayout = calendarView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: 40, height: 40)
    }
    
    func setMonthView(){
        totalDates.removeAll()
        let daysInMonth = CalendarUtility().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarUtility().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarUtility().getWeekday(date: selectedDate)
        
        var count: Int = 1;
        while(count <= 42){
            if(count <= startingSpaces || count - startingSpaces > daysInMonth){
                totalDates.append("")
            }else{
                totalDates.append(String(count - startingSpaces))
            }
            count += 1
        }
        monthLabel.text = CalendarUtility().getMonthString(date: selectedDate) + " " + CalendarUtility().getYearString(date: selectedDate)
        calendarView.reloadData()
    }
}

