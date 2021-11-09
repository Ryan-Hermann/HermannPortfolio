#Ryan Hermann 
#Module 9 
#3/9/2021

#
library(ggplot2)
mtcars<- mtcars

ggplot(mtcars, aes(x =hp, y = mpg, col = cyl)) + 
  geom_smooth(colour = "red") + geom_point(aes(size = wt)) +
  ggtitle("Miles Per Gallon Over Horsepower", subtitle = "Data From Mtcars")+
  xlab("HorsePower")+ ylab("Miles Per Gallon") +
  guides(col = guide_legend(title = "Cylinder \nCount"  ), size = guide_legend(title ="Weight"))+
  theme(plot.title =element_text(hjust = 0.5, vjust = -2 ,face = "bold"), 
        plot.subtitle = element_text(hjust = 1.225,size =8, vjust = -245  ),
        axis.title.x = element_text( size = 12),
        axis.title.y = element_text( size = 12))



