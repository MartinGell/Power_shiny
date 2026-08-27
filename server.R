shinyServer(function(input, output, session) {

	output$page1 <- renderUI({
	  inclRmd("./page1.Rmd")
	})

	output$page2 <- renderUI({
	  inclRmd("./page2.Rmd")
	})
})
