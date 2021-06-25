set.seed(98122)

csv.data.file.ch <- "data/opioid.txt"
                                    
csv.data.df <- read.csv( 
                         csv.data.file.ch, 
                         header = TRUE, 
                         quote="\"",
                         sep = ",", 
                         na.strings = c( "NA", "-" ),
                         allowEscapes = TRUE,
                         strip.white  = TRUE,
                         stringsAsFactors = TRUE,
                         comment.char="#" 
                       )

#
# Guidance on plotting symbols from the following website:
#
#   http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r
#


viz.opioid.deaths.tumblr <- function( out.name ) {
  #
  # Smaller version of plot for Tumblr
  #
  png( out.name, width = 500, height = 375, units = "px", pointsize = 9,
      bg = rgb( 248, 245, 236, maxColorValue = 255 ) )

  par( 
      cex.main = 3, cex.axis = 1.75, cex.lab = 2,
      # margins: bottom, left, top and right
      par( mar = c( 6, 7, 4, 4 ) + 0.1 )  
  )

  plot( 
       csv.data.df$year, csv.data.df$opioid.only,
       ylim = c( 125, 175 ),
       main = "Opioid-only deaths by year",
       xlab="Year", ylab="Number of deaths", 
       pch = 24, cex=3, col="blue", bg="red", lwd=2
  )
}

#
# Add two horizontal "guides"
#
viz.opioid.deaths.tumblr( "viz/opioid-only-deaths.png" )
abline( h = c( 134, 156 ), col = "blue" )

#
# Add a trend line
#
viz.opioid.deaths.tumblr( "viz/opioid-only-deaths-trend.png" )
abline( lm( csv.data.df$opioid.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

dev.off()


viz.opioid.deaths.large <- function( out.name ) {
  #
  # Larger version of plot
  #
  png( out.name, 
       width = 1200, height = 900, 
       units = "px", pointsize = 16, 
       bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
  )

  par( 
      cex.main = 5, cex.axis = 2.50, cex.lab = 3,
      # margins: bottom, left, top and right
      par( mar = c( 10, 11, 8, 8 ) + 0.1 )  
  )

  plot( 
       csv.data.df$year, csv.data.df$opioid.only,
       ylim = c( 125, 175 ),
       main = "Opioid-only deaths by year",
       xlab="", ylab = "",
       pch = 24, cex=3, col="blue", bg="red", lwd=2
  )

  title( xlab="Year", cex.lab = 3, line = 5 )
  title( ylab="Number of deaths", cex.lab = 3, line = 5 )

}

#
# Add two horizontal "guides"
#
viz.opioid.deaths.large( "viz/opioid-only-deaths-large.png" )

abline( h = c( 134, 156 ), col = "blue" )

dev.off()


#
# Add a trend line
#
viz.opioid.deaths.large( "viz/opioid-only-deaths-trend-large.png" )
                         
abline( lm( csv.data.df$ opioid.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )
                         
dev.off()

#
# Get the intercept and slope
#
lm( csv.data.df$opioid.only ~ csv.data.df$year )


viz.stim.deaths.large <- function( out.name ) {
  #
  # Larger version of plot
  #
  png( out.name, 
       width = 1200, height = 900, 
       units = "px", pointsize = 16, 
       bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
  )

  par( 
      cex.main = 4.5, cex.axis = 2.50, cex.lab = 3,
      # margins: bottom, left, top and right
      par( mar = c( 10, 11, 8, 8 ) + 0.1 )  
  )

  plot( 
       csv.data.df$year, csv.data.df$stim.only,
       ylim = c( 30, 130 ),
       main = "Stimulant-only deaths by year",
       xlab="", ylab = "",
       pch = 24, cex=3, col="blue", bg="red", lwd=2
  )

  title( xlab="Year", cex.lab = 3, line = 5 )
  title( ylab="Number of deaths", cex.lab = 3, line = 5 )

}

#
# Add a trend line
#
viz.stim.deaths.large( "viz/stim-only-deaths-trend-large.png" )
                         
abline( lm( csv.data.df$stim.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

points( 
        x = 2019,
        y = csv.data.df$opioid.only[ csv.data.df$year == 2019 ],
        pch = 24, cex=3, col="black", bg="orange", lwd=2
)
                         
dev.off()

#
# Get the intercept and slope
#
lm( csv.data.df$stim.only ~ csv.data.df$year )


viz.opistim.deaths.large <- function( out.name ) {
  #
  # Larger version of plot
  #
  png( out.name, 
       width = 1200, height = 900, 
       units = "px", pointsize = 16, 
       bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
  )

  par( 
      cex.main = 4, cex.axis = 2.50, cex.lab = 3,
      # margins: bottom, left, top and right
      par( mar = c( 10, 11, 8, 8 ) + 0.1 )  
  )

  plot( 
       csv.data.df$year, csv.data.df$opioid.and.stim,
       ylim = c( 20, 210 ),
       main = "Opioid + Stimulant deaths by year",
       xlab="", ylab = "",
       pch = 24, cex=3, col="blue", bg="red", lwd=2
  )

  title( xlab="Year", cex.lab = 3, line = 5 )
  title( ylab="Number of deaths", cex.lab = 3, line = 5 )

}

#
# Add a trend line
#
viz.opistim.deaths.large( "viz/opioid-stim-deaths-trend-large.png" )
                         
abline( lm( csv.data.df$opioid.and.stim ~ csv.data.df$year ), lwd = 3, col = "slategrey" )
                         
dev.off()

#
# Get the intercept and slope
#
lm( csv.data.df$opioid.and.stim ~ csv.data.df$year )


# --- END --- #

