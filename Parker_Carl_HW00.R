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
# Smaller version of plot for Tumblr
#
png( "viz/opioid-only-deaths.png", 
      width = 500, height = 375, 
      units = "px", pointsize = 9, 
      bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
)

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

# abline( h = c( 134, 156 ), col = "blue" )

abline( lm( csv.data.df$opioid.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

dev.off()


#
# Larger version of plot
#
png( "viz/opioid-only-deaths-large.png", 
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

# abline( h = c( 134, 156 ), col = "blue" )

abline( lm( csv.data.df$opioid.only ~ csv.data.df$year ), lwd = 3, col = "slategrey" )

dev.off()

lm( csv.data.df$opioid.only ~ csv.data.df$year )


# --- END --- #

