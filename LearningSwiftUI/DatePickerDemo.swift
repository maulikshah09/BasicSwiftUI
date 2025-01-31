//
//  DatePicker.swift
//  LearningSwiftUI
//
//  Created by Maulik Shah on 2/1/25.
//

import SwiftUI

struct DatePickerDemo: View {
    @State var selectedDate = Date()
    
    let startingDate = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate = Date()
    
    var dataFormater: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        
        VStack{
            
            Text("Selected Date is:")
            Text(dataFormater.string(from: selectedDate))
                .font(.title)
            
            // DatePicker("Select a Date", selection: $selectedDate)
            //.datePickerStyle(CompactDatePickerStyle())
            // .datePickerStyle(GraphicalDatePickerStyle())
            
            // DatePicker("Select a data", selection: $selectedDate,displayedComponents: [.date])
            
            DatePicker("Select a data", selection: $selectedDate,in: startingDate...endingDate,displayedComponents: [.date])
            
            
                .datePickerStyle(WheelDatePickerStyle())
                .tint(.red)
                .foregroundStyle(.blue)
                .padding()
        }
    }
}

#Preview {
    DatePickerDemo()
}
