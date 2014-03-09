class TicketPrezafra
  
  GRAY  = "F5F5F5"

  def TicketPrezafra.poner_logos(x, y, ancho, scale, pdf)
    x_inta = 20 + x # 225 x 225 px
    x_proicsa = ancho -20 - (290*scale) + x # 290 x 174 px
    
    y_inta = (225*scale)/2 + y    # 225 x 225 px
    y_proicsa = (174*scale)/2 + y # 290 x 174 px
    
    pdf.image Rails.root.join('app', 'assets', 'images', 'inta.jpg'), :at => [x_inta, y_inta], :scale => scale
    pdf.image Rails.root.join('app', 'assets', 'images', 'proicsa.jpg'), :at => [x_proicsa, y_proicsa], :scale => scale
  end

  def TicketPrezafra.rectangulo_identificador(x, y, identificacion, pdf)
    lw = pdf.line_width
    pdf.dash(8, space: 4, phase: 4)
    pdf.stroke do
      pdf.line_width = 4

      pdf.fill_color GRAY
      pdf.fill_rounded_rectangle [x, y], 150, 40, 7
      pdf.fill_color "000000"
      pdf.rounded_rectangle [x, y], 150, 40, 7

      pdf.bounding_box([x, y], :width => 150, :height => 40) do
        pdf.move_down 10
        pdf.font("Courier", :style => :bold) do
          pdf.text identificacion, :align => :center, :size => 13
        end
        pdf.font "Times-Roman"
        pdf.text "ID análisis prezafra", :align => :center, :size => 12
      end
    end  
    pdf.dash(8, space: 0, phase: 0)
    pdf.line_width = lw
  end

  def TicketPrezafra.linea_corte y, pdf
    pdf.dash(8, space: 4, phase: 4)
    pdf.stroke_horizontal_line -20, 520, :at => y
    # Back to normal line
    pdf.dash(8, space: 0)
  end

  def TicketPrezafra.firma x, y, font_size, pdf
    pdf.text_box ("."*40), :at => [x, y], :width => 200, :align => :center, :size => font_size
    pdf.text_box "Firma", :at => [x,y-20], :width => 200, :align => :center, :size => font_size      
  end

  def TicketPrezafra.firma_en_linea x, y, font_size, pdf
    pdf.text_box ("Firma: " + "."*35), :at => [x, y], :width => 200, :align => :center, :size => font_size
  end

  def render analisis_prezafra

    Prawn::Document.new(:page_size => "A4",:margin => 45,
    :info => {:Title => "Ticket Análisis Prezafra", :Author => "Héctor A. Valdecantos", :CreationDate => Time.now }
    ) do

      TicketPrezafra.rectangulo_identificador(330, 750-20, analisis_prezafra.identificacion, self)
      stroke do
        rounded_rectangle [0, 750], 500, 180, 20
        bounding_box([0+10, 750-10], :width => 500-10, :height => 180-10) do

          move_down 15
          text "Comprobante de extracción", :align => :left, :style => :bold, :size => 20
          move_down 10
          text "Fecha de extracción: " + "." * 30, :align => :left, :size => 16
          move_down 10
          text "Responsable: " + "." * 42, :align => :left, :size => 16
          move_down 20
        
          TicketPrezafra.firma 30, 60, 16, self

          TicketPrezafra.poner_logos(310, 40, 170, 0.2, self)            
        end
      end
      TicketPrezafra.linea_corte 560, self
      
      TicketPrezafra.rectangulo_identificador(330, 510-20, analisis_prezafra.identificacion, self)
      stroke do
        rounded_rectangle [0, 550], 500, 350, 20
        bounding_box([0+10, 550-10], :width => 500-10, :height => 350-10) do

          move_down 15
          text "Comprobante de extracción y recepción de muestra", :align => :left, :style => :bold, :size => 20
          move_down 10
          text "Fecha generación ticket: " + "." * 25, :align => :left, :size => 16
          move_down 10
          text "Fecha de extracción: " + "." * 30, :align => :left, :size => 16
          move_down 20
          text "Responsable: " + "." * 42, :align => :left, :size => 16 
          TicketPrezafra.firma_en_linea 280, cursor + 20, 16, self
          move_down 10
          text "Productor: " + "." * 45, :align => :left, :size => 16 
          TicketPrezafra.firma_en_linea 280, cursor + 20, 16, self
          move_down 20
          text "Variedad de caña de azúcar: " + "." * 18, :align => :left, :size => 16
          text "Año plantación: " + "." * 37, :align => :left, :size => 16
          text "Latitud: " + "." * 50, :align => :left, :size => 16  
          text "Longitud: " + "." * 47, :align => :left, :size => 16    

          move_down 20
          text "Fecha ingreso laboratorio: " + "." * 22, :align => :left, :size => 16
          text "Laboratorista: " + "." * 42, :align => :left, :size => 16
          TicketPrezafra.firma_en_linea 280, cursor + 20, 16, self
          
          TicketPrezafra.poner_logos(310, 120, 170, 0.2, self)    
        end
      end

      TicketPrezafra.linea_corte 190, self

      dash(8, space: 4, phase: 4)
      self.line_width = 4
      stroke do
        rounded_rectangle [0, 180], 500, 180, 20
        bounding_box([0+10, 180-10], :width => 500-10, :height => 180-10) do
          move_down 10
          font "Times-Roman"
          text "Muestra de análisis prezafra", :align => :center, :style => :bold, :size => 30
          move_down 10
          font("Courier", :style => :bold) do
            text analisis_prezafra.identificacion, :align => :center, :size => 45
          end
          TicketPrezafra.poner_logos(100, 40, 300, 0.2, self)      
        end
      end
    end.render
  end

end