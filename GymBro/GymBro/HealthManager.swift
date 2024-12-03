//
//  HealthManager.swift
//  GymBro
//
//  Created by Joshua Gudgin on 03/12/2024.
//

import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    static var startOfWeek: Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
    }
}

class HealthManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    
    @Published var activities: [String: Activity] = [:]
    
    init() {
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        
        let healthTypes: Set = [steps, calories]
        
        Task{
            do{
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                fetchTodaySteps()
                fetchTodayCalories()
                fetchWeekSteps()
                fetchWeekCalories()
            } catch {
                print("Error requesting authorization: \(error)")
            }
        }
    }
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching todays step data")
                return
            }
            
            let stepCount = quantity.doubleValue(for: .count())
            let activity = Activity(id: 0, title: "Steps", subtitle: "Goal: 10,000", image: "figure.walk", amount: stepCount.formattedString())
            
            DispatchQueue.main.async {
                self.activities["todaySteps"] = activity
            }
            
        }
        
        healthStore.execute(query)
    }
    
    func fetchWeekSteps(){
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching week calories: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            let stepCount = quantity.doubleValue(for: .count())
            let activity = Activity(id: 10, title: "Steps", subtitle: "Goal: 10000", image: "figure.walk", amount: stepCount.formattedString())
            
            
            DispatchQueue.main.async {
                self.activities["weekSteps"] = activity
            }
        }
        
        healthStore.execute(query)
    }
    
    func fetchTodayCalories(){
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching todays calorie data")
                return
            }
            
            let caloriesBurned = quantity.doubleValue(for: .kilocalorie())
            let activity = Activity(id: 1, title: "Calories", subtitle: "Goal: 800", image: "flame", amount: caloriesBurned.formattedString())
            
            DispatchQueue.main.async{
                self.activities["todayCalories"] = activity
            }
            
        }
        
        healthStore.execute(query)
    }
    
    func fetchWeekCalories(){
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching week calories: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            let caloriesBurned = quantity.doubleValue(for: .kilocalorie())
            let activity = Activity(id: 11, title: "Calories", subtitle: "Goal: 5,600", image: "flame", amount: caloriesBurned.formattedString())
            
            DispatchQueue.main.async{
                self.activities["weekCalories"] = activity
            }
        }
        
        healthStore.execute(query)
        
    }
}
    
    extension Double {
        func formattedString() -> String {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 0
            return numberFormatter.string(from: NSNumber(value: self))!
        }
    }
