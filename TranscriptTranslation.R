setwd("C:/University of Chicago/Project/MOUD/Transcripts")
library(translate)
library(stringr)


set.key("<insert key here>")


files=Sys.glob("*.csv")
files
listOfFiles <- lapply(files, function(x) read.table(x, header = TRUE,sep=";")) 
#length(listOfFiles[[1]][,3])

numberOfFiles = length(listOfFiles)

TranslatedText=c()
Annotation=c()




for(i in 1:numberOfFiles) {
  for(j in 1:nrow(listOfFiles[[i]])) {
    englishtext = translate(listOfFiles[[i]][j,3],"es","en",key=get.key())
    englishtext = str_replace_all(englishtext, "[^[:alnum:][:space:]]", "")
    TranslatedText= c(TranslatedText,englishtext)
    Annotation=c(Annotation,listOfFiles[[i]][j,4])
  }
}


AllTextDataFrame=cbind.data.frame(TranslatedText,Annotation)
PositiveText = AllTextDataFrame[Annotation==1,]
NegativeText = AllTextDataFrame[Annotation==-1,]
NeutralText = AllTextDataFrame[Annotation==0,]
NotPositiveText = AllTextDataFrame[Annotation != 1,]

write.csv(AllTextDataFrame,"AllText.csv")
write.csv(PositiveText,"PositiveText.csv")
write.csv(NegativeText,"NegativeText.csv")
write.csv(NeutralText,"NeutralText.csv")
write.csv(NotPositiveText,"NotPositiveText.csv")

