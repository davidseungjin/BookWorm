//
//  ContentView.swift
//  BookWorm
//
//  Created by David Lee on 6/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false
    @AppStorage("notes") private var notes = ""
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
//    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.title, order: .reverse)]) var books: FetchedResults<Book>
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.title), SortDescriptor(\.author)]) var books: FetchedResults<Book>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var books: FetchedResults<Book>
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingAddScreen = false
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]
            // delete it from the context
            moc.delete(book)
        }
        // save the context
        try? moc.save()
    }
    
    var body: some View {
        NavigationView {
//            Text("Count: \(books.count)")
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }

        }
//        VStack {
//            List(students) { student in
//                Text(student.name ?? "Unknown")
//            }
//            Button("Add") {
//                let firstNames = ["David", "Jinhee", "Abraham", "Amelia"]
//                let lastNames = ["Kim", "Lee", "Park", "Han", "Kang"]
//
//                let chosenFirstName = firstNames.randomElement()!
//                let chosenLastName = lastNames.randomElement()!
//                let student = Student(context: moc)
//                student.id = UUID()
//                student.name = "\(chosenFirstName) \(chosenLastName)"
//
//                try? moc.save()
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView()
            
    }
}
