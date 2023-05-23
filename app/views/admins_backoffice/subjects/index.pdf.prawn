prawn_document do |pdf|
  pdf.text 'Lista dos assuntos/áreas cadastrados', :align => :center, :size => 20
  pdf.move_down 20
  pdf.table @subjects.collect{ |s| [s.id, s.description]}
end