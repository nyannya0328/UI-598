//
//  ReciptView.swift
//  UI-598
//
//  Created by nyannyan0328 on 2022/06/28.
//

import SwiftUI

struct ReciptView: View {
    var body: some View {
        VStack{
            
            VStack(spacing:10){
                
                 Image(systemName: "checkmark.circle")
                    .font(.system(size: 20))
                    .foregroundColor(.green)
                
                Text("Payment Recivied")
                    .font(.title2.bold())
                    .foregroundColor(.green)
                
                
                VStack(spacing:15){
                    
                    Image("Pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:50,height:50)
                        .clipShape(Circle())
                        .padding(10)
                        .background{
                         
                            Capsule()
                                .fill(.white)
                        }
                    
                    Text("The Anheim Hotel")
                        .font(.title3.bold())
                    
                    
                    LabeledContent {
                        
                        
                        Text("150.698")
                            .foregroundColor(.gray)
                        
                    } label: {
                     
                          Text("Total Bill")
                            .font(.callout)
                    }
                    
                    
                    LabeledContent {
                        
                        
                        Text("0")
                            .foregroundColor(.gray)
                        
                    } label: {
                     
                          Text("Total Tax")
                            .font(.callout)
                    }
                    
                    
                    Label {
                        
                          Text("You got 250 points")
                            .foregroundColor(Color("Purple"))
                    } icon: {
                        
                        Image("Prize")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20,height:20)
                        
                    }
                    .padding(.vertical,13)
                    .padding(.horizontal)
                      .frame(maxWidth: .infinity,alignment: .leading)
                      .background{
                       
                          RoundedRectangle(cornerRadius: 10,style: .continuous)
                              .fill(Color("Purple").opacity(0.3))
                      }
                      



                    
                }
                .padding()
               
                .background{
                 
                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .fill(
                            .white.shadow(.drop(color:.black.opacity(0.05),radius: 10,x: 5,y:5)).shadow(.drop(color:.black.opacity(0.05),radius: 35,x:-5,y: -5))
                        )
                        .padding(.top,55)
                       
                }
                
                Text("Tansaction Details")
                    .font(.title.bold())
                    .foregroundColor(.black.opacity(0.3))
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                VStack(spacing:15){
                    
                    LabeledContent {
                        
                        Text("Apple Pay")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.gray)
                        
                    } label: {
                        
                        Text("Payment Methodo")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    
                    
                    LabeledContent {
                        
                        Text("In Prosess")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.gray)
                        
                    } label: {
                        
                        Text("Status")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    
                    
                    LabeledContent {
                        
                        Text("Apple Pay")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.gray)
                        
                    } label: {
                        
                        Text("Payment Methodo")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    
                    
                    
                    LabeledContent {
                        
                        Text("25 jun 2022")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.gray)
                        
                    } label: {
                        
                        Text("Transaction Date")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    
                    LabeledContent {
                        
                        Text("9:25")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.gray)
                        
                    } label: {
                        
                        Text("Transaction Time")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    
                    
                    
                }
              
                
            }
            .padding()
            .background{
                Color.white.ignoresSafeArea()
            }
         
                
                    LabeledContent {
                     
                          Text("$150.069")
                            .font(.title)
                        
                    } label: {
                        
                        
                        Text("Total Payment")
                          .font(.title2.weight(.semibold))
                          .foregroundColor(.gray)
                      
                        
                    }
         
           
            .padding(.vertical)
            .background{
             
                RoundedRectangle(cornerRadius: 1,style: .continuous)
                    .fill(.white)
            }

                
                
            
    
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
         
            Color("BG").ignoresSafeArea()
        }
        
    }
}

struct ReciptView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
