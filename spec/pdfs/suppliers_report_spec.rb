# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SuppliersReportPdf do
  context 'when rendering pdf' do
    let(:suppliers) { [build(:supplier)] }
    context 'should have in the report' do
      let(:pdf) { SuppliersReportPdf.new(suppliers) }
      let(:pdf_content) { PDF::Reader.new(StringIO.new(pdf.render)).page(1).to_s }

      it 'field with corporate name of the company' do
        expect(pdf_content).to include(suppliers[0][:corporate_name])
      end
      it 'field with fantasy name of the company' do
        expect(pdf_content).to include(suppliers[0][:fantasy_name])
      end
      it 'field with cnpj of the company' do
        expect(pdf_content).to include(suppliers[0][:cnpj])
      end
    end
  end
end
