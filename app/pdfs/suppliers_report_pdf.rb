class SuppliersReportPdf < PdfReport
  def initialize(suppliers = [])
    super()
    @suppliers = suppliers

    header 'Relatório Geral de Fornecedores'
    display_event_table
    footer
  end

  private

  def display_event_table
    table_row_colors = %w[FFFFFF DDDDDD]
    table_widths = [200, 180, 100]

    if table_data.empty?
      text 'Sem dados para apresentar.'
    else
      table table_data,
            column_widths: table_widths,
            row_colors: table_row_colors
      # font_size: TABLE_FONT_SIZE
    end
  end

  def table_data
    @table_data ||= @suppliers.map { |s| [s.corporate_name, s.fantasy_name, s.cnpj] }
  end
end
