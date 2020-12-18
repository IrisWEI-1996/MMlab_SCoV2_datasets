server <- function(input, output) {
  # output$txtout <- renderText({
  #   paste(input$genesymbol, input$slider, format(input$date), sep = ", ")
  # })
  output$table <- DT::renderDataTable({
    if(!is.null(input$datasets)){
      mergesep <- mergeall %>% select(geneSymbol:accession_number | starts_with(input$datasets))
      mergesep[geneSymbol==toupper(input$genesymbol)]
    }})
  output$protable <- DT::renderDataTable({
    if(!is.null(input$proteomedatasets)){
      protable <- promerge %>% select(accession_number:id.mapped | starts_with(input$proteomedatasets))%>%unique()
      if(input$genesymbol%in%promerge$id.mapped){
        protable[id.mapped==toupper(input$genesymbol)]
      }
    }
    })
  output$globaltable <- DT::renderDataTable({
    mergeall  
  })
  output$proteometable <- DT::renderDataTable({
    promerge  
  })
  output$plot1 <- renderPlot({
    ggplot(new_pro1plot,aes(x=Abundance.logFC.SCoV.over.Mock,y=-log10(Abundance.adj.P.Val.SCoV.over.Mock),color=type))+
      geom_point()+scale_color_manual(values = c('#029294','#FD2E92'))+
      ggtitle("proteome-abundance")
  })
  output$loc <- renderText({
    paste0("logFC=", input$plot_click$x,'\n',"-log10(adj.p)=",input$plot_click$y)
  })
  # output$selectname <- renderPrint(
  #   
  # )
  output$plot2 <- renderPlot({
    ggplot(new_pro2plot,aes(x=Phospho.logFC.SCoV.over.Mock,y=-log10(Phospho.adj.P.Val.SCoV.over.Mock),color=type))+
      geom_point()+scale_color_manual(values = c('#029294','#FD2E92'))+
      ggtitle("proteome-phosph")
  })
  output$plot3 <- renderPlot({
    ggplot(new_pro3plot,aes(x=Acetyl.logFC.SCoV.over.Mock,y=-log10(Acetyl.adj.P.Val.SCoV.over.Mock),color=type))+
      geom_point()+scale_color_manual(values = c('#029294','#FD2E92'))+
      ggtitle("proteome-Acetyl")
  })
  output$plot4 <- renderPlot({
    ggplot(new_RAPMS1plot,aes(x=`RAP-MS.Huh7.logFC.SCoV2.over.RMRP`,y=-log10(`RAP-MS.Huh7.adj.P.Val.SCoV2.over.RMRP`),color=type))+
      geom_point()+scale_color_manual(values = c('#029294','#FF238C'))+
      ggtitle('RAP-MS.Huh7')
  })
  output$plot5 <- renderPlot({
    ggplot(new_RAPMS2plot,aes(x=`RAP-MS.A549.logFC.SCoV2`,y=-log10(`RAP-MS.A549.adj.P.Val.SCoV2`),color=SCoVsign))+
      geom_point()+scale_color_manual(values = c('#029294','#FD2E92'))+
      ggtitle('RAP-MS A549.SCov2')
  })
  output$plot6 <- renderPlot({
    ggplot(new_RAPMS2plot,aes(x=`RAP-MS.A549.logFC.gRNA`,y=-log10(`RAP-MS.A549.adj.P.Val.gRNA`),color=gRNAsign))+
      geom_point()+scale_color_manual(values = c('#029294','#FD2E92'))+
      ggtitle('RAP-MS A549.gRNA')
  })
  output$plot7 <- renderPlot({
    ggplot(new_RAPMS2plot,aes(x=`RAP-MS.A549.logFC.sgm`,y=-log10(`RAP-MS.A549.adj.P.Val.sgm`),color=sgmsign))+
      geom_point()+scale_color_manual(values = c('#029294','#FD2E92'))+
      ggtitle('RAP-MS A549.sgRNA')
  })
}
