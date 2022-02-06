//
//  ProfilePage.swift
//  Online_Shop2
//
//  Created by Stanley Pan on 2022/02/06.
//

import SwiftUI

struct ProfilePage: View {
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("My Profile")
                        .font(.custom(customFont, size: 28).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15) {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom, -30)
                        
                        Text("Sanghwa Kim")
                            .font(.custom(customFont, size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(Color.gray)
                                .rotationEffect(.init(degrees: 180))
                            
                            Text("Address: 43 Oxford Road\nM13 4GR\nManchester, UK")
                                .font(.custom(customFont, size: 15))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal, .bottom])
                    .background(
                        Color.white
                            .cornerRadius(12)
                    )
                    .padding()
                    .padding(.top, 40)
                }
                .padding(.horizontal, 22)
                .padding(.vertical, 20)
                
                // MARK: Custom Navigation Links
                CustomNavigationLink(title: "Edit Profile") {
                    Text("")
                        .navigationTitle("Edit Profile")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("homeBG").ignoresSafeArea())
                }
                
                CustomNavigationLink(title: "Shipping address") {
                    Text("")
                        .navigationTitle("Shipping address")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("homeBG").ignoresSafeArea())
                }
                
                CustomNavigationLink(title: "Order history") {
                    Text("")
                        .navigationTitle("Order history")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("homeBG").ignoresSafeArea())
                }
                
                CustomNavigationLink(title: "Payment methods") {
                    Text("")
                        .navigationTitle("Payment Methods")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("homeBG").ignoresSafeArea())
                }
                
                CustomNavigationLink(title: "Notifications") {
                    Text("")
                        .navigationTitle("Notifications")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("homeBG").ignoresSafeArea())
                }
                
                CustomNavigationLink(title: "Support Center") {
                    Text("")
                        .navigationTitle("Support Center")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("homeBG").ignoresSafeArea())
                }
                
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("homeBG")
                    .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping () -> Detail) -> some View {
        NavigationLink {
            content()
        } label: {
            HStack {
                Text(title)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(Color.black)
            .padding()
            .background(
                Color.white
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
