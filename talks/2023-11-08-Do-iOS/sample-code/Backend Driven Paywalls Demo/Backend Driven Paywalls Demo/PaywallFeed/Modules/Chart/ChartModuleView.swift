import SwiftUI

struct ChartModuleView: View {
    var module: ChartModule
    
    let checkColumnWidth: CGFloat = 50
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(module.title)
                .font(.headline)
                .padding(.horizontal)
            VStack(spacing: 0) {
                headerRow
                ForEach(Array(module.chartRows.enumerated()), id: \.1.name) { (i, chartRow) in
                    chartRowView(chartRow, isEven: i % 2 == 0)
                }
            }
//            .padding(.vertical, 8)
            .background(Marketing.Color5)
            .foregroundColor(Marketing.Color1)
            .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .padding(.horizontal)
        }
    }
    
    private func chartRowView(_ chartRow: ChartRow, isEven: Bool) -> some View {
        HStack {
            Text(chartRow.name)
            Spacer(minLength: 0)
            ZStack {
                if chartRow.isFree {
                    Image(systemName: "checkmark.circle.fill")
                }
            }
            .frame(width: checkColumnWidth)
            ZStack {
                if chartRow.isPro {
                    Image(systemName: "checkmark.circle.fill")
                }
            }
            .frame(width: checkColumnWidth)
        }
        .padding(12)
        .background(isEven ? .white.opacity(0.4) : .clear)
    }
    
    var headerRow: some View {
        HStack {
            Text("Feature")
                .font(.headline)
            Spacer(minLength: 0)
            
            Text("Free")
                .font(.headline)
                .frame(width: checkColumnWidth)
            
            Text("Pro")
                .font(.headline)
                .frame(width: checkColumnWidth)
        }
        .padding(12)
    }
}

#Preview {
    ChartModuleView(module: .fixture())
}
