//
//  ContentView.swift
//  UI-598
//
//  Created by nyannyan0328 on 2022/06/28.
//

import SwiftUI

struct ContentView: View {
    @State var generatedImage : Image?
    @State var genereatedPDF : URL?
    
    @State var showSeet : Bool = false
    var body: some View {
        GeometryReader{proxy in
            
             let size = proxy.size
            
            ZStack(alignment:.top){
                
                ReciptView()
                
                HStack{
                    
                    
                    Button {
                        
                    } label: {
                        
                         Image(systemName: "xmark")
                            .font(.callout)
                    }
                    
                    
                    Spacer()
                    
                    if let generatedImage{
                      
                        ShareLink(item:generatedImage,preview: SharePreview("A")){
                           
                             Image(systemName: "square.and.arrow.up.fill")
                            
                        }
                        
                    }
                    
                    
                    if let _ = genereatedPDF{
                        
                        Button {
                            
                            showSeet.toggle()
                        } label: {
                            
                             Image(systemName: "arrow.up.doc")
                                .font(.title3)
                        }

                    }

                }
                .foregroundColor(.gray)
                .padding(.horizontal)
            }
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .onAppear{
                  
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                      
                      renderView(viewSize: size)
                  }
                  
              }
        }
        .sheet(isPresented: $showSeet) {
            
            if let genereatedPDF{
                
                shareSheet(items: [genereatedPDF])
            }
        }
    }
    @MainActor
    func renderView(viewSize : CGSize){
        
        let renderd = ImageRenderer(content: ReciptView().frame(width:viewSize.width,height: viewSize.height))
        
        
        if let image = renderd.uiImage{
            
            generatedImage = Image(uiImage: image)
            
        }
        
        let tempURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        
        
        let renderURL = tempURL.appending(path: "\(UUID().uuidString).pdf")
        
        
        if let consumer = CGDataConsumer(url:renderURL as CFURL),let contex = CGContext(consumer: consumer, mediaBox: nil, nil){
            
            
            renderd.render { size, render in
                
                var mediaBOX = CGRect(origin: .zero, size: size)
                contex.beginPage(mediaBox: &mediaBOX)
                render(contex)
                contex.endPDFPage()
                contex.closePDF()
                
                genereatedPDF = renderURL
                
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct shareSheet : UIViewControllerRepresentable{
    
    var items : [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return view
        
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
