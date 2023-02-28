cbPalette <- c("#0015BC", "purple", "green", "black", "#DE0100", "yellow")

ggplot(df,aes(x=Date,fill=Party,color=Party)) + 
  geom_dotplot(binwidth=365, method='histodot')  + 
  ylab("Number of Presidential Executive Orders") + 
  xlab("Year") + 
  theme(legend.text=element_text(size=16),axis.title=element_text(size=12)) + 
  scale_y_continuous(limits=c(0,218)) + 
  scale_fill_manual(values=cbPalette) + 
  scale_color_manual(values=cbPalette) +
  theme_bw()
