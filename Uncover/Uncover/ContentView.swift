//
//  ContentView.swift
//  Uncover
//
//  Created by Jun Gu on 2023/11/14.
//
// Proposal:
//https://www.upwork.com/ab/proposals/1724152748511277057
// Job Post:
//https://www.upwork.com/jobs/~01cfec43a0a347755a

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      topBar

      Color("Divider").frame(height: 1)

      ScrollView {
        VStack(alignment: .leading, spacing: 0) {

          Text("New")
            .fontWeight(.black)
            .font(.system(size: 28))
            .foregroundStyle(.text)

          SubHeader(text: "2 hours ago")

          HStack {
            Avatar(imageName: "heart.circle.fill", color: .pink)
            Text("evabiada8908fitness").bold().font(.system(size: 16)) + Text(" like your collection").font(.system(size: 16))

            Spacer(minLength: 0)
            RightImage()
          }

          SubHeader(text: "3 hours ago")

          HStack {
            Avatar(imageName: "checkmark.circle.fill", color: .badge)
            Text("minasz").bold().font(.system(size: 16)) + Text(" created new collection").font(.system(size: 16))
            Spacer()
            RightImage()
          }

          SubHeader(text: "3 hours ago")

          HStack {
            Avatar(imageName: "person.circle.fill", color: .badge)
            Text("Robert9").bold().font(.system(size: 16)) + Text(" followed you").font(.system(size: 16))
            Spacer()
            Text("Following")
              .foregroundStyle(Color("PrimaryColor"))
              .bold()
              .frame(width: 100)
              .padding(.vertical, 4)
              .background(.primaryBackground)
              .clipShape(RoundedRectangle(cornerRadius: 15))
          }



          Text("Recent")
            .fontWeight(.black)
            .font(.system(size: 28))
            .foregroundStyle(.text)
            .padding(.top, 20)

          SubHeader(text: "1 week ago")

          HStack {
            Avatar(imageName: "ellipsis.circle.fill", color: Color("Badge"))
            Text("Diana and 4 others").bold().font(.system(size: 16)) + Text(" replied to your comment in collection")
              .font(.system(size: 16))
            Spacer()
            RightImage()
          }

          SubHeader(text: "1 week ago")

          HStack {
            Avatar(imageName: "checkmark.circle.fill", color: Color("Badge"))
            Text("matrixforever").bold().font(.system(size: 16)) + Text(" finished a book").font(.system(size: 16))
            Spacer()
            RightImage()
          }

          SubHeader(text: "1 week ago")

          HStack {
            Avatar(imageName: "person.circle.fill", color: Color("Badge"))
            Text("Anna").bold().font(.system(size: 16)) + Text(" followed you").font(.system(size: 16))
            Spacer()
            Text("Follow")
              .foregroundStyle(.white)
              .bold()
              .frame(width: 100)
              .padding(.vertical, 4)
              .background(Color("PrimaryColor"))
              .clipShape(RoundedRectangle(cornerRadius: 15))

          }


          Spacer()
        }
        .padding()
      }
    }
  }


  var topBar: some View {
    HStack {
      Spacer()
      Text("notifications")
        .fontWeight(.black)
        .font(.system(size: 28))
        .foregroundStyle(.text)
      Text("20+")
        .foregroundStyle(.white)
        .padding(4)
        .background(Color("PrimaryColor"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
      Spacer()
    }
  }
}


struct Avatar: View {
  var imageName: String
  var color: Color

  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      Image("Avatar")
        .resizable()
        .foregroundStyle(.gray)
        .frame(width: 60, height: 60)
      ZStack {
        Circle()
          .foregroundStyle(.white)
          .frame(width: 20)
        Image(systemName: imageName)
          .foregroundStyle(color)
      }
    }
  }
}

struct RightImage: View {

  var body: some View {
    Image("PlaceholderImage")
      .resizable()
      .frame(width: 70, height: 70)
      .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}
struct SubHeader: View {
  var text: String
  var body: some View {
    Text(text).font(.system(size: 14))
      .foregroundStyle(.secondary)
      .padding(.top, 20)
      .padding(.bottom, 10)
  }
}
#Preview {
  ContentView()
}
