library(ggplot2)
library(gridExtra)
df <- data.frame(trt=rep(c("A", "B", "C", "D", "E", "F"), each=4),
                 trt2=rep(c("A", "B", "C", "D", "E", "F"), each=4),
                 visit=rep(c(1, 2, 3, 4),6),
                 response=c(rnorm(4,2,1),rnorm(4,3,1),rnorm(4,2.5,1),
                            rnorm(4,2,1),rnorm(4,2.5,1),rnorm(4,3,0.5)))
head(df)

lineplot <- ggplot(df, aes(x=visit, y=response, group=trt, color=trt)) + 
  geom_line(size = 1.1, aes(linetype=trt)) + 
  geom_point(size = 2.5, aes(shape=trt))+
  scale_x_continuous(limits = c(1, 4), breaks = c(1, 2, 3,4)) +
  scale_y_continuous(limits = c(0, 5), breaks = c(0,2.5,5)) +
  scale_color_brewer(palette="Paired") + 
  theme_bw(base_size = 20) +  theme(legend.position="none")

lineplot

lineplot <- lineplot  +  xlab("") 
lineplot <- lineplot  +  ylab("") 
lineplot <- lineplot + theme(panel.grid.minor=element_blank())
lineplot <- lineplot + theme(panel.border=element_blank())
lineplot

lineplot3 <- ggplot(subset(df,trt=="A" | trt=="B" | trt=="C" | trt=="D"), aes(x=visit, y=response, group=trt, color=trt)) + 
  geom_line(size = 1.2) + 
  scale_x_continuous(limits = c(1, 4), breaks = c(1, 2, 3,4)) +
  scale_y_continuous(limits = c(0, 5), breaks = c(0,2.5,5)) +
  scale_colour_brewer(palette  = "OrRd")+ 
  theme_bw(base_size = 20) +  theme(legend.position="none")

lineplot3

lineplot3 <- lineplot3  +  xlab("") 
lineplot3 <- lineplot3  +  ylab("") 
lineplot3 <- lineplot3 + theme(panel.grid.minor=element_blank())
lineplot3 <- lineplot3 + theme(panel.border=element_blank())
lineplot3



lineplot2 <- ggplot(df, aes(x=visit, y=response, group = trt)) + 
  geom_line (data=transform(df,trt=NULL),aes(x=visit, y=response, group = trt2), size=0.5, color = "light gray")+   
  geom_line(size = 1.1) + 
  scale_x_continuous(limits = c(1, 4), breaks = c(1, 2, 3,4)) +
  scale_y_continuous(limits = c(0, 5), breaks = c(0,2.5,5)) +
  scale_color_brewer(palette="Paired") + 
  theme_bw(base_size = 20) +  theme(legend.position="none") + facet_wrap (~trt)



lineplot2 <- lineplot2  +  xlab("") 
lineplot2 <- lineplot2  +  ylab("") 
lineplot2 <- lineplot2 + theme(panel.grid.minor=element_blank())
lineplot2 <- lineplot2 + theme(panel.border=element_blank())
lineplot2 <-lineplot2 +  theme(strip.background = element_blank(), strip.text = element_blank()) 

lineplot2

grid.arrange(lineplot, lineplot2, ncol=2, nrow=1)
