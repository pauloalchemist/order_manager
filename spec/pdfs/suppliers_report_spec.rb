require 'rails_helper'

RSpec.describe SuppliersReportPdf do
  context 'Gerar pdf' do
    let(:suppliers) { [build(:supplier)] }
    context 'render pdf content' do
      let(:pdf) { SuppliersReportPdf.new(suppliers) }
      let(:pdf_content) { PDF::Reader.new(StringIO.new(pdf.render)).page(1).to_s }

      it 'contains corporate company' do
        expect(pdf_content).to include(suppliers[0][:corporate_name])
      end
      it 'contains fantasy company' do
        expect(pdf_content).to include(suppliers[0][:fantasy_name])
      end
    end
  end
end
