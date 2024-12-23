//
//  FitnessView.swift
//  GymBro
//
//  Created by Joshua Gudgin on 26/11/2024.
//

import SwiftUI

struct FitnessView: View {
    @State private var workouts: [Workout] = []
    
    var body: some View {
        Text("Fitness")
            .font(.title)
        
        NavigationStack{
            Grid{
                GridRow{
                    NavigationLink {
                        WorkoutProgramView(workouts: $workouts)
                    } label: {
                        AsyncImage(url: URL(string: "https://www.setforset.com/cdn/shop/articles/what_to_do_before_starting_a_workout_plan_2000x.jpg?v=1708974352")) { image in
                            image.image?.resizable()}
                        .frame(width: 180, height: 180)
                        .clipShape(.rect(cornerRadius: 25))
                    }
                    .contentShape(Rectangle())
                    NavigationLink() {
                        ExercisesView()
                    } label: {
                        AsyncImage(url: URL(string: "https://tropeaka.com/cdn/shop/articles/main_image_d517c79f-4ec7-4946-bb5e-db7e80623e85_3500x.jpg?v=1571697737")) { image in
                            image.image?.resizable()}
                        .frame(width: 180, height: 180)
                        .clipShape(.rect(cornerRadius: 25))
                    }                }
                GridRow {
                    NavigationLink{
                        WorkoutProgramView(workouts: $workouts)
                    } label: {
                        Text("Workout Program")
                            .font(.system(size: 20))
                            .foregroundStyle(.primary)
                    }
                    NavigationLink{
                        ExercisesView()
                    } label: {
                        Text("Exercises")
                            .font(.system(size:20))
                            .foregroundStyle(.primary)
                    }
                }
                
                
                GridRow{
                    Text("Test")
                        .gridCellColumns(2)
                }
            }
            .font(.title)
            Spacer()
        }
    }
}

struct Workout: Identifiable{
    let id = UUID()
    var day: String
    var exercise: String
    var reps: Int
    var sets: Int
    let duration: String?
}

struct WorkoutProgramView: View {
    @Binding var workouts: [Workout] // Binding passed from FitnessView
    
    // Define the order of days for sorting
    let daysOrder = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
        VStack {
            Spacer()
            
            if workouts.isEmpty {
                Text("No workouts added yet.")
                    .foregroundStyle(.secondary)
                
                NavigationLink {
                    ProgramEdit(workouts: $workouts)
                } label: {
                    Text("Create a Program")
                        .padding()
                }
                
                Spacer()
            } else {
                List {
                    NavigationLink {
                        ProgramEdit(workouts: $workouts)
                    } label: {
                        Text("Edit Program")
                    }
                    
                    // Sort workouts by day order before displaying
                    ForEach(workouts.sorted { (a, b) in
                        // Compare indices of days in the `daysOrder` array
                        daysOrder.firstIndex(of: a.day)! < daysOrder.firstIndex(of: b.day)!
                    }) { workout in
                        VStack(alignment: .leading) {
                            Text("\(workout.day): \(workout.exercise)")
                                .font(.headline)
                            if let duration = workout.duration {
                                Text("Duration: \(duration)")
                            } else {
                                Text("Sets: \(workout.sets), Reps: \(workout.reps)")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Workout Program")
    }
}

struct ProgramEdit: View {
    @Binding var workouts: [Workout]
    
    @State private var selectedDay = "Monday"
    @State private var exercise: String = ""
    @State private var reps = 0
    @State private var sets = 0
    @State private var toggleTimeInput: Bool = false
    @State private var durationMins = 0
    @State private var durationHrs = 0
    
    var body: some View {
        NavigationStack {
            Form {
                // Day Picker
                Picker("Select Day", selection: $selectedDay) {
                    ForEach(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], id: \.self) { day in
                        Text(day)
                    }
                }
                
                // Exercise Picker
                TextField(
                    "Exercise Name",
                    text: $exercise
                )
                
                Toggle("Use Time", isOn: $toggleTimeInput)
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                
                if toggleTimeInput {
                    VStack {
                        Text("Select Workout Duration")
                            .font(.headline)
                            .padding(.top)
                        // Duration Picker
                        HStack {
                            Picker("Hours", selection: $durationHrs) {
                                ForEach(0...12, id: \.self) { hour in
                                    Text("\(hour) hr")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            
                            Picker("Minutes", selection: $durationMins) {
                                ForEach(0..<60, id: \.self) { minute in
                                    Text("\(minute) min")
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 150)
                    }
                } else {
                    // Reps and Sets Input
                    Stepper("Reps: \(reps)", value: $reps, in: 0...50)
                    Stepper("Sets: \(sets)", value: $sets, in: 0...10)
                }
                
                // Save Button
                Button {
                    let newWorkout = Workout(
                        day: selectedDay,
                        exercise: exercise,
                        reps: toggleTimeInput ? 0 : reps,
                        sets: toggleTimeInput ? 0 : sets,
                        duration: toggleTimeInput ? "\(durationHrs) hr \(durationMins) min" : nil
                    )
                    workouts.append(newWorkout)
                    clearForm()
                } label: {
                    Text("Add to Workout Program")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                // Workout Preview Section
                if !workouts.isEmpty {
                    Section(header: Text("Swipe to remove workouts")) {
                        List {
                            ForEach(workouts) { workout in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(workout.day): \(workout.exercise)")
                                            .font(.headline)
                                        if let duration = workout.duration {
                                            Text("Duration: \(duration)")
                                                .font(.subheadline)
                                        } else {
                                            Text("Sets: \(workout.sets), Reps: \(workout.reps)")
                                                .font(.subheadline)
                                        }
                                    }
                                }
                            }
                            .onDelete(perform: deleteWorkout) // Add ability to delete workouts
                        }
                    }
                }
            }
        }
        .navigationTitle("Edit Your Workout Program")
    }
    
    
    
    // Clear form fields after saving
    private func clearForm() {
        exercise = ""
        reps = 0
        sets = 0
        toggleTimeInput = false
        durationHrs = 0
        durationMins = 0
    }
    
    // Delete workout from the list
    private func deleteWorkout(at offsets: IndexSet) {
        workouts.remove(atOffsets: offsets)
    }
}


struct ExercisesView: View {
    var body: some View {
        Text("Exercises View")
    }
}

#Preview {
    FitnessView()
}
