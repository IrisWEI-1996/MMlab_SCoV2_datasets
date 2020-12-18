#ui.R
ui <- tagList(
  # shinythemes::themeSelector(),
  navbarPage(
    theme = shinythemes::shinytheme("cosmo"),  # <--- To use a theme, uncomment this
    "Munschauer group * SARS-COV-2 database",
    tabPanel("Home",
             sidebarPanel(
               textInput("genesymbol", "Gene Symbol:", "CNBP"),
               # sliderInput("slidern", "Show number(Global table)", 1, 1000, 5),
               # actionButton("action", "Submit", class = "btn-primary"),
               checkboxGroupInput(inputId = "datasets",
                                  label = "Select dataset(s):",
                                  choices = c("RAP-MS A549" = "RAP-MS.A549.", "RAP-MS Huh7" = "RAP-MS.Huh7.", "RAP-MS Narry Kim" = "RAPMS.NKim",
                                              "CRISPR-JWEI"="CRISPR_JWEI.","CRISPR-ZDaniloski"="CRISPR_ZDaniloski.","CRISPR_DGordon"="CRISPR_DGordon","CRISPR_HHoffman"="CRISPR_HHoffman","CRISPR_RWang"="CRISPR_RWang"),
                                  selected = "RAP-MS.A549."),
               checkboxGroupInput(inputId = "proteomedatasets",
                                label = "Select dataset(s):",
                                choices = c("Proteome Abundance"="Abundance.",
                                            "Proteome Phosphorylation"="Phospho.",
                                            "Proteome Acetylation"="Acetyl."),
                                selected = "Abundance.")
             ),
             
             mainPanel(
               tabsetPanel(
                 tabPanel("Query",
                          DT::dataTableOutput("table"),
                          br(),
                          br(),
                          verbatimTextOutput("Proteome information"),
                          DT::dataTableOutput("protable")
                          
                 ),
                 tabPanel("Global table", 
                          DT::dataTableOutput("globaltable")
                          ),
                 tabPanel("Proteome table", 
                          DT::dataTableOutput("proteometable")
                 )
                 # ,
                 # tabPanel("Volcano plots", 
                 #          plotOutput("plot1",click = "plot_click"),
                 #          verbatimTextOutput("selectname"),
                 #          verbatimTextOutput("loc"),
                 #          plotOutput("plot2"),
                 #          plotOutput("plot3"),
                 #          plotOutput("plot4"),
                 #          plotOutput("plot5"),
                 #          plotOutput("plot6"),
                 #          plotOutput("plot7")
                 # )
             )
    )),
    tabPanel("Download", "This panel is intentionally left blank"),
    tabPanel("BLANK..", "This panel is intentionally left blank")
  )
)
