module ApplicationHelper
  def qr_code(url)
    RQRCode::QRCode.new(url).as_svg(module_size: 5).html_safe
  end
end
