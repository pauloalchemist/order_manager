class PdfReport < Prawn::Document
  # Often-Used Constants
  TABLE_FONT_SIZE = 9
  TABLE_BORDER_STYLE = :grid

  def initialize(default_prawn_options = {})
    super(default_prawn_options)
    font_size 10
  end

  def header(title = nil)
    # image "#{Rails.root}/public/logo.png", height: 30
    text 'StockManeiro', size: 18, style: :bold, align: :center
    text title, size: 14, style: :bold_italic, align: :center if title
    t = Time.now
    text t.strftime('%d/%m/%Y às %Hh:%Mmin'), size: 10, align: :center
    move_down 5
  end

  def footer
    # ...implementar
  end

  # ... mais detalhes
end
