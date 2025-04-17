import SwiftUI

struct ImageGalleryView: View {
    @StateObject private var viewModel = ImageGalleryViewModel()
    @State private var selectedImage: ImageModel? = nil

    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(viewModel.images.indices, id: \.self) { index in
                            let imageModel = viewModel.images[index]
                            
                            Image(uiImage: imageModel.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedImage = imageModel
                                }
                                .onAppear {
                                    if index == viewModel.images.count - 1 {
                                        viewModel.fetchImages()
                                    }
                                }
                        }
                    }
                    .padding()
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .padding()
                    }
                }

                Button("Load More") {
                    viewModel.fetchImages()
                }
                .padding()
            }
            .navigationTitle("Pinterest Gallery")
            .sheet(item: $selectedImage) { imageModel in
                ImageDetailView(image: imageModel.image)
            }
        }
    }
}
