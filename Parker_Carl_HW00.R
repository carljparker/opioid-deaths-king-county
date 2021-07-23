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


#
# Opioid-only deaths: Viz for Tumblr
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


#
# Opioid-only deaths: Viz for GitHub (large)
#
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


#
# Stimulant-only deaths: Viz for Tumblr
#
viz.stim.deaths.tumblr <- function( out.name ) {
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
       csv.data.df$year, csv.data.df$stim.only,
       ylim = c( 30, 130 ),
       main = "Stimulant-only deaths by year",
       xlab="Year", ylab="Number of deaths", 
       pch = 24, cex=3, col="blue", bg="red", lwd=2
  )
}

#
# Add a trend line
#
viz.stim.deaths.tumblr( "viz/stim-only-deaths-trend-tumblr.png" )
                         
abline( lm( csv.data.df$stim.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

points( 
        x = 2019,
        y = csv.data.df$opioid.only[ csv.data.df$year == 2019 ],
        pch = 24, cex=3, col="black", bg="orange", lwd=2
)
                         
text( c( 2016.25 ), c( 129 ), c( "Lowest level for opioid-only deaths" ) )

dev.off()


#
# Stimulant-only deaths: Viz for GitHub (large)
#
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
      cex.main = 4, cex.axis = 2.50, cex.lab = 3,
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
                         
text( c( 2016.75 ), c( 129 ), c( "Lowest level for opioid-only deaths" ) )

dev.off()

#
# Get the intercept and slope
#
lm( csv.data.df$stim.only ~ csv.data.df$year )


#
# Opioid + Stimulant deaths: Viz for Tumblr 
#
viz.opistim.deaths.tumblr <- function( out.name ) {
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
       csv.data.df$year, csv.data.df$opioid.and.stim,
       ylim = c( 20, 210 ),
       main = "Opioid + Stimulant deaths by year",
       xlab="Year", ylab="Number of deaths", 
       pch = 24, cex=3, col="black", bg="blue", lwd=2
  )
}

#
# Add a trend line
#
viz.opistim.deaths.tumblr( "viz/opioid-stim-deaths-trend-tumblr.png" )
                         
abline( lm( csv.data.df$opioid.and.stim ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

#
# Add the opioid-only data points
#
points( 
        x = csv.data.df$year,
        y = csv.data.df$opioid.only,
        pch = 24, cex=3, col="black", bg="orange", lwd=2
)

#
# Add the opioid-only trend line
#
abline( lm( csv.data.df$opioid.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

#
# Add the intersection line
#
abline( v = c( 2018 + ( 8 * 1/12 ) ), col = "red" )

dev.off()


#
# Opioid + Stimulant deaths: Viz for GitHub (large)
#
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
       pch = 24, cex=3, col="black", bg="blue", lwd=2
  )

  title( xlab="Year", cex.lab = 3, line = 5 )
  title( ylab="Number of deaths", cex.lab = 3, line = 5 )

}

#
# Add a trend line
#
viz.opistim.deaths.large( "viz/opioid-stim-deaths-trend-large.png" )
                         
abline( lm( csv.data.df$opioid.and.stim ~ csv.data.df$year ), lwd = 3, col = "slategrey" )
                         
#
# Add the opioid-only data points
#
points( 
        x = csv.data.df$year,
        y = csv.data.df$opioid.only,
        pch = 24, cex=3, col="black", bg="orange", lwd=2
)

#
# Add the opioid-only trend line
#
abline( lm( csv.data.df$opioid.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

#
# Add the intersection line
#
abline( v = c( 2018 + ( 8 * 1/12 ) ), col = "red" )

dev.off()

#
# Get the intercept and slope
#
lm( csv.data.df$opioid.and.stim ~ csv.data.df$year )


#
# Function to visualize a comparison of opioid-only and stim-only
# deaths.
#
# Tumblr size
#
viz.oscomp.deaths.tumblr <- function( out.name ) {
  #
  # Smaller version of plot for Tumblr
  #
  png( out.name, 
       width = 500, height = 375, 
       units = "px", pointsize = 9,
       bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
  )

  #
  # The value for `cex.axis` given here appears to be overriden by the
  # values in the calls to `title()` further down.
  #
  par( 
      cex.main = 2, cex.axis = 1.75, cex.lab = 2,
      # margins: bottom, left, top and right
      par( mar = c( 6, 7, 4, 4 ) + 0.1 )  
  )

  plot( 
       csv.data.df$year, csv.data.df$stim.only,
       ylim = c( 0, 200 ),
       xlim = c( 2008, 2030 ),
       main = "Opioid-only and stim-only deaths by year",
       xlab="", ylab = "",
       pch = 24, cex=3, col="blue", bg="red", lwd=2
  )

  title( xlab="Year", cex.lab = 2, line = 3 )
  title( ylab="Number of deaths", cex.lab = 2, line = 3 )

}

#
# Add the stim-only trend line
#
viz.oscomp.deaths.tumblr( "viz/opioid-stim-compare-deaths-trend-tumblr.png" )
                         
abline( lm( csv.data.df$stim.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

points( 
        x = csv.data.df$year,
        y = csv.data.df$opioid.only,
        pch = 24, cex=3, col="black", bg="orange", lwd=2
)
                         
#
# Add the opioid-only trend line
#
abline( lm( csv.data.df$opioid.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

abline( v = c( 2027 + ( 5 * 1/12 ) ), col = "red" )
                         
dev.off()


#
# Function to visualize a comparison of opioid-only and stim-only
# deaths.
#
# Large size
#
viz.oscomp.deaths.large <- function( out.name ) {
  #
  # Larger version of plot
  #
  png( out.name, 
       width = 1200, height = 900, 
       units = "px", pointsize = 16, 
       bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
  )

  par( 
      cex.main = 3, cex.axis = 2.50, cex.lab = 3,
      # margins: bottom, left, top and right
      par( mar = c( 10, 11, 8, 8 ) + 0.1 )  
  )

  plot( 
       csv.data.df$year, csv.data.df$stim.only,
       ylim = c( 0, 200 ),
       xlim = c( 2008, 2030 ),
       main = "Opioid-only and stim-only deaths by year",
       xlab="", ylab = "",
       pch = 24, cex=3, col="blue", bg="red", lwd=2
  )

  title( xlab="Year", cex.lab = 3, line = 5 )
  title( ylab="Number of deaths", cex.lab = 3, line = 5 )

}

#
# Add the stim-only trend line
#
viz.oscomp.deaths.large( "viz/opioid-stim-compare-deaths-trend-large.png" )
                         
abline( lm( csv.data.df$stim.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

points( 
        x = csv.data.df$year,
        y = csv.data.df$opioid.only,
        pch = 24, cex=3, col="black", bg="orange", lwd=2
)
                         
#
# Add the opioid-only trend line
#
abline( lm( csv.data.df$opioid.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

abline( v = c( 2027 + ( 5 * 1/12 ) ), col = "red" )
                         
dev.off()



# --- END --- #

