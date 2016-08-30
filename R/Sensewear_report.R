#' Generate Report for SenseWear activity data.
#'
#' Summarize sedentary, mild, moderate, and MVPA related activity measures.
#' @param data csv file from SenseWear
#' @return \code{Year}	The calendar year of recorded event
#' @return \code{Month}	The calendar month of recorded event
#' @return \code{Day}	The calendar day of recorded event
#' @return \code{Dayofweek}	The day of that week
#' @return \code{Time_on_body_Hrs} Total time (hours) of SenseWear on body
#' @return \code{Time_waking_wearing_Hrs}	Total waking time (hours) during wearing time
#' @return \code{Time_on_body_percent}	 Percent of wearing time of a day
#' @return \code{Steps} Total steps of the day
#' @return \code{Time_lying_Hrs}  Total lying time (hours)
#' @return \code{Time_sleeping_Hrs} Total sleeping time (hours)
#' @return \code{Time_sed_Hrs} Total sedentary time (hours)
#' @return \code{TEE_Kcal} Total energy expenditure (Kcal)
#' @return \code{Time_waking_Sedentary_Hrs}	When the wearer is waking, the total sedentary time (hours)
#' @return \code{Percent_waking_sed}	When the wearer is waking, the percentage of sedentary time to wearing time
#' @return \code{Time_waking_Mild_Hrs}	When the wearer is waking, the total mild time (hours)
#' @return \code{Percent_waking_mild}	When the wearer is waking, the percentage of mild time to wearing time
#' @return \code{Time_waking_Moderate_Hrs}	When the wearer is waking, the total moderate time (hours)
#' @return \code{Percent_waking_moderate}	When the wearer is waking, the percentage of moderate time to wearing time
#' @return \code{Time_waking_MVPA_Hrs}	When the wearer is waking, the total MVPA time (hours)
#' @return \code{Percent_waking_MVPA}	When the wearer is waking, the percentage of MVPA time to wearing time
#' @return \code{Time_waking_Vigorous_Hrs}	When the wearer is waking, the total vigorous time (hours)
#' @return \code{Percent_waking_vigorous}	When the wearer is waking, the percentage of vigorous time to wearing time
#' @return \code{No_sed_breaks} Number of sedentary breaks (at least one minute interruption counting as a break)
#' @return \code{Time_all_break_length_Hrs} Summation of time (hours) of breaks
#' @return \code{Average_EE_break_kcal} Average energy expenditure of breaks
#' @return \code{Time_below_1_METs_Hrs}	Total time (hours) of MET less than 1
#' @return \code{Time_btw_1_2_METs_Hrs}	Total time (hours) of MET between 1 and 2
#' @return \code{Time_btw_2_3_METs_Hrs}	Total time (hours) of MET between 2 and 3
#' @return \code{Time_btw_3_4_METs_Hrs}	Total time (hours) of MET between 3 and 4
#' @return \code{Time_btw_4_5_METs_Hrs}	Total time (hours) of MET between 4 and 5
#' @return \code{Time_btw_5_6_METs_Hrs}	Total time (hours) of MET between 5 and 6
#' @return \code{Time_above_6_METS_Hrs}	Total time (hours) of MET over 6
#' @return \code{Steps_above_1.5_METs} Summation of step count when energy expenditure is >1.5 METs with step counts not equal to 0
#' @return \code{EE_steps_above_1.5METs_kcal} Summation of energy expenditure for in Kcal when energy expenditure is >1.5 METs with step counts not equal to 0
#' @return \code{Steps_above_3_METs} Summation of step count when energy expenditure is >3 METs with step counts not equal to 0
#' @return \code{EE_steps_above_3METs_kcal} Summation of energy expenditure for in Kcal when energy expenditure is >3 METs with step counts not equal to 0
#' @return \code{Time_100_steps_per_day_Hrs} Summation of time (hours) for Steps>=100 per minute
#' @return \code{PAEE_above_1.5METs_kcal}  Summation of energy expenditure in Kcal when energy expenditure is >1.5 METs
#' @return \code{Time_PAEE_1.5METs_Hrs}  Summation of time (hours) when energy expenditure is >1.5 METs
#' @return \code{PAEE_above_3METs_kcal} Summation of energy expenditure in Kcal when energy expenditure is >3 METs
#' @return \code{Time_PAEE_3METs_Hrs} Summation of time (hours) energy expenditure is >3 METs
#' @return \code{No_unBouted_10min}  Summation of number of MVPA bout which energy expenditure is >3 METs and length is less than 10 minutes
#' @return \code{EE_unBouted_10min_Kcal} Summation of energy expenditure of bout which energy expenditure is >3 METs and length is less than 10 minutes
#' @return \code{Time_unBouted_10min_Hrs} Summation of time (hours) of bout which length is less than 10 minutes
#' @return \code{No_Bout_10min} Summation of number of bout which length is more than 10 minutes
#' @return \code{EE_Bouted_10min_Kcal} Summation of energy expenditure of MVPA bout which length is more than 10 minutes
#' @return \code{Time_Bouted_10min_Hrs} Summation of time (hours) of MVPA bout which length is more than 10 minutes
#' @return \code{No_Bout_20min} Summation of number of MVPA bout which length is more than 20 minutes
#' @return \code{EE_Bouted_20min_Kcal} Summation of number of MVPA bout which length is more than 20 minutes
#' @return \code{Time_Bouted_20min_Hrs} Summation of time (hours) of MVPA bout which length is more than 20 minutes
#' @return \code{No_Bout_30min} Summation of number of MVPA bout which length is more than 30 minutes
#' @return \code{EE_Bouted_30min_Kcal} Summation of energy expenditure of MVPA bout which length is more than 30 minutes
#' @return \code{Time_Bouted_30min_Hrs}  Summation of time (hours) of MVPA bout which length is more than 30 minutes
#' @return \code{Mean_bout_duration}  Mean MVPA bout duration which bout length is more than 10 minutes: Time_Bouted_10min_Hrs/No_Bout_10min
#' @return \code{No_Bouts_Extra_Long_steps} The number of bouts of 'extra long' (>500 steps) walks in each day
#' @return \code{No_Bouts_Long_steps} The number of bouts of 'long' (100-499 steps) walks in each day
#' @return \code{No_Bouts_Moderate_steps} The number of bouts of 'moderate' (20-99 steps) walks in each day
#' @return \code{No_Bouts_Short_steps} The number of bouts of 'short' walks (<20 steps) in each day
#' @return \code{Mean_cadence_extra_long} Mean cadence (steps/min) in 'extra long' bouts of walking
#' @return \code{Mean_cadence_long} Mean cadence (steps/min) in 'long' bouts of walking
#' @return \code{Mean_cadence_moderate} Mean cadence (steps/min) in 'moderate' bouts of walking
#' @return \code{Mean_cadence_short} Mean cadence (steps/min) in 'short' bouts of walking
#' @return \code{Mean_cadence_day} Mean cadence (steps/min) in each day
#' @importFrom grDevices colorRampPalette
#' @importFrom stats aggregate  na.omit
#' @examples Sensewear_report(sampledata)
#' @details MVPA long bout is defined as at least 10 consecutive minutes with METs>=3 (allowing 2 min below that threshold).
#' @export



Sensewear_report=function(data){

  if (substr(names(data)[6],1,1)=="T")
  {data=na.omit(data)
  colnames(data)=c("Time","Trans_accel_peaks","Forw_accel_peaks","Longi_accel_peaks","skin_temp_aver","Trans_accel_aver","Longi_accel_aver","Near_body_temp_aver","Trans_accel_MAD","Longi_accel_MAD","Step_counter","Forw_accel_aver","Forw_accel_MAD","GSR_aver","Lying_down","Sleep","Physical_Activity","EE","Sedentary","Mild","Moderate","Vigorous","METs","Speed","Distance","Activity_Class","Sleep_Class","Heat_flux_aver")
  }else{
    data=na.omit(data)
    colnames(data)=c("Time","Trans_accel_peaks","Forw_accel_peaks","Longi_accel_peaks","skin_temp_aver","GSR_aver","Trans_accel_aver","Longi_accel_aver","Near_body_temp_aver","Trans_accel_MAD","Longi_accel_MAD","Step_counter","Forw_accel_aver","Forw_accel_MAD","Lying_down","Sleep","Physical_Activity","EE","Sedentary","Mild","Moderate","Vigorous","METs","Speed","Distance","Activity_Class","Sleep_Class","Heat_flux_aver")
  }

  ##what? different csv file have different colomn order?!!

  date=0
data=cbind(data,date)
 data$date=data$Time
data$date=as.Date(data$Time, format = "%Y-%m-%d")



METs_lt15=aggregate(data[data$METs<1.5,]$METs,list(data[data$METs<1.5,]$date),length)
colnames(METs_lt15)=c("Date","Time_all_Sedentary_Hrs")
METs_btw_15_3=aggregate(data[(data$METs>=1.5)&(data$METs<3),]$METs,list(data[(data$METs>=1.5)&(data$METs<3),]$date),length)
colnames(METs_btw_15_3)=c("Date","Time_Mild_Hrs")
if(nrow(data[(data$METs>=3)&(data$METs<5),])!=0)
{METs_btw_3_5=aggregate(data[(data$METs>=3)&(data$METs<5),]$METs,list(data[(data$METs>=3)&(data$METs<5),]$date),length)
}else
  {METs_btw_3_5=METs_lt15
  METs_btw_3_5[,2]=0}
colnames(METs_btw_3_5)=c("Date","Time_Moderate_Hrs")
if(nrow(data[data$METs>=5,])!=0)
{METs_gt5=aggregate(data[data$METs>=5,]$METs,list(data[data$METs>=5,]$date),length)
}else
{METs_gt5=METs_btw_15_3
  METs_gt5[,2]=0}
colnames(METs_gt5)=c("Date","Time_Vigorous_Hrs")

if(nrow(data[data$METs>=3,])!=0)

{METs_gt3=aggregate(data[data$METs>=3,]$METs,list(data[data$METs>=3,]$date),length)
}else
{METs_gt3=METs_btw_15_3
METs_gt3[,2]=0}

colnames(METs_gt3)=c("Date","Time_all_MVPA_Hrs")

METs_lt1=aggregate(data[data$METs<=1,]$METs,list(data[data$METs<=1,]$date),length)
colnames(METs_lt1)=c("Date","Time_below_1_METs_Hrs")
METs_lt1[,2]=METs_lt1[,2]/60
METs_btw_1_2=aggregate(data[(data$METs>1)&(data$METs<2),]$METs,list(data[(data$METs>1)&(data$METs<2),]$date),length)
colnames(METs_btw_1_2)=c("Date","Time_btw_1_2_METs_Hrs")
METs_btw_1_2[,2]=METs_btw_1_2[,2]/60
METs_btw_2_3=aggregate(data[(data$METs>=2)&(data$METs<3),]$METs,list(data[(data$METs>=2)&(data$METs<3),]$date),length)
colnames(METs_btw_2_3)=c("Date","Time_btw_2_3_METs_Hrs")
METs_btw_2_3[,2]=METs_btw_2_3[,2]/60
if(nrow(data[(data$METs>=3)&(data$METs<4),])!=0)

{METs_btw_3_4=aggregate(data[(data$METs>=3)&(data$METs<4),]$METs,list(data[(data$METs>=3)&(data$METs<4),]$date),length)
}else{METs_btw_3_4=METs_btw_1_2
METs_btw_3_4[,2]=0}

colnames(METs_btw_3_4)=c("Date","Time_btw_3_4_METs_Hrs")
METs_btw_3_4[,2]=METs_btw_3_4[,2]/60
if(nrow(data[(data$METs>=4)&(data$METs<5),])!=0)
{METs_btw_4_5=aggregate(data[(data$METs>=4)&(data$METs<5),]$METs,list(data[(data$METs>=4)&(data$METs<5),]$date),length)
}else{METs_btw_4_5=METs_btw_1_2
METs_btw_4_5[,2]=0}
colnames(METs_btw_4_5)=c("Date","Time_btw_4_5_METs_Hrs")
METs_btw_4_5[,2]=METs_btw_4_5[,2]/60
if(nrow(data[data$METs>=5,])!=0)
{METs_btw_5_6=aggregate(data[(data$METs>=5)&(data$METs<6),]$METs,list(data[(data$METs>=5)&(data$METs<6),]$date),length)
}else
  {METs_btw_5_6=METs_btw_1_2
  METs_btw_5_6[,2]=0}
colnames(METs_btw_5_6)=c("Date","Time_btw_5_6_METs_Hrs")
METs_btw_5_6[,2]=METs_btw_5_6[,2]/60

if (nrow(data[data$METs>=6,])!=0)
{
METs_gt6=aggregate(data[data$METs>=6,]$METs,list(data[data$METs>=6,]$date),length)
METs_gt6[,2]=METs_gt6[,2]/60}else{
  METs_gt6=METs_btw_5_6
  METs_gt6[,2]=0
}
colnames(METs_gt6)=c("Date","Time_above_6_METS_Hrs")



Time_on_body=aggregate(data$METs,list(data$date),length)
colnames(Time_on_body)=c("Date","Time_on_body_Hrs")
Time_on_body[,2]=Time_on_body[,2]/60
Time_on_body_percent=Time_on_body
Time_on_body_percent[,2]=Time_on_body_percent[,2]/24
colnames(Time_on_body_percent)=c("Date","Time_on_body_percent")
METs_lt15[,2]=METs_lt15[,2]/60
METs_btw_15_3[,2]=METs_btw_15_3[,2]/60
METs_btw_3_5[,2]=METs_btw_3_5[,2]/60
METs_gt5[,2]=METs_gt5[,2]/60
METs_gt3[,2]=METs_gt3[,2]/60
Step_count=aggregate(data$Step_counter,list(data$date),sum)
colnames(Step_count)=c("Date","Steps")
Lying_down=aggregate(data$Lying_down,list(data$date),sum)
colnames(Lying_down)=c("Date","Time_lying_Hrs")
Lying_down[,2]=Lying_down[,2]/60
Sleep=aggregate(data$Sleep,list(data$date),sum)
colnames(Sleep)=c("Date","Time_sleeping_Hrs")
Sleep[,2]=Sleep[,2]/60
Waking_wearing_Time=Sleep
Waking_wearing_Time[,2]=Time_on_body[,2]-Sleep[,2]
colnames(Waking_wearing_Time)=c("Date","Time_waking_wearing_Hrs")
Sed=aggregate(data$Sedentary,list(data$date),sum)
colnames(Sed)=c("Date","Time_sed_Hrs")
Sed[,2]=Sed[,2]/60


####Calculate waking wearing time spent in sedentary,mild,moderate and vigorous, so will be the same METS criteria plus non-sleeping####
Waking_METs_lt15=aggregate(data[data$METs<=1.5&data$Sleep==0,]$METs,list(data[data$METs<=1.5&data$Sleep==0,]$date),length)
colnames(Waking_METs_lt15)=c("Date","Time_waking_Sedentary_Hrs")
Waking_METs_lt15[,2]=Waking_METs_lt15[,2]/60

Waking_METs_btw_15_3=aggregate(data[(data$METs>1.5)&(data$METs<3)&(data$Sleep==0),]$METs,list(data[(data$METs>1.5)&(data$METs<3)&(data$Sleep==0),]$date),length)
colnames(Waking_METs_btw_15_3)=c("Date","Time_waking_Mild_Hrs")
Waking_METs_btw_15_3[,2]=Waking_METs_btw_15_3[,2]/60
if(nrow(data[(data$METs>=3)&(data$METs<5)&(data$Sleep==0),])!=0)

{Waking_METs_btw_3_5=aggregate(data[(data$METs>=3)&(data$METs<5)&(data$Sleep==0),]$METs,list(data[(data$METs>=3)&(data$METs<5)&(data$Sleep==0),]$date),length)
}else{
  Waking_METs_btw_3_5=Waking_METs_btw_15_3
  Waking_METs_btw_3_5[,2]=0
}

colnames(Waking_METs_btw_3_5)=c("Date","Time_waking_Moderate_Hrs")
Waking_METs_btw_3_5[,2]=Waking_METs_btw_3_5[,2]/60
if(nrow(data[data$METs>=5,])!=0)

{Waking_METs_gt5=aggregate(data[(data$METs>=5)&(data$Sleep==0),]$METs,list(data[(data$METs>=5)&(data$Sleep==0),]$date),length)
}else{
  Waking_METs_gt5=Waking_METs_lt15
  Waking_METs_gt5[,2]=0
}
colnames(Waking_METs_gt5)=c("Date","Time_waking_Vigorous_Hrs")
Waking_METs_gt5[,2]=Waking_METs_gt5[,2]/60

if(nrow(data[(data$METs>=3)&(data$Sleep==0),])!=0)

{Waking_METs_gt3=aggregate(data[(data$METs>=3)&(data$Sleep==0),]$METs,list(data[(data$METs>=3)&(data$Sleep==0),]$date),length)
}else
{Waking_METs_gt3=Waking_METs_gt5
Waking_METs_gt3[,2]=0}

colnames(Waking_METs_gt3)=c("Date","Time_waking_MVPA_Hrs")
Waking_METs_gt3[,2]=Waking_METs_gt3[,2]/60

#### Percentage of waking wearing time spent in sedentary, mild, moderate, and vigorous ####
Waking_METs_Sed=merge(Waking_wearing_Time,Waking_METs_lt15)
Waking_METs_Sed[,2]=Waking_METs_Sed[,3]/Waking_METs_Sed[,2]
Waking_METs_Sed_percent=Waking_METs_Sed[,1:2]
colnames(Waking_METs_Sed_percent)=c("Date","Percent_waking_sed")


Waking_METs_Mild=merge(Waking_wearing_Time,Waking_METs_btw_15_3)
Waking_METs_Mild[,2]=Waking_METs_Mild[,3]/Waking_METs_Mild[,2]
Waking_METs_Mild_percent=Waking_METs_Mild[,1:2]
colnames(Waking_METs_Mild_percent)=c("Date","Percent_waking_mild")

Waking_METs_Moderate=merge(Waking_wearing_Time,Waking_METs_btw_3_5)
Waking_METs_Moderate[,2]=Waking_METs_Moderate[,3]/Waking_METs_Moderate[,2]
Waking_METs_Moderate_percent=Waking_METs_Moderate[,1:2]
colnames(Waking_METs_Moderate_percent)=c("Date","Percent_waking_moderate")

Waking_METs_Vigo=merge(Waking_wearing_Time,Waking_METs_gt5,all=TRUE)
Waking_METs_Vigo[,2]=Waking_METs_Vigo[,3]/Waking_METs_Vigo[,2]
Waking_METs_Vigo_percent=Waking_METs_Vigo[,1:2]
colnames(Waking_METs_Vigo_percent)=c("Date","Percent_waking_vigorous")


Waking_METs_MVPA=merge(Waking_wearing_Time,Waking_METs_gt3,all=TRUE)
Waking_METs_MVPA[,2]=Waking_METs_MVPA[,3]/Waking_METs_MVPA[,2]
Waking_METs_MVPA_percent=Waking_METs_MVPA[,1:2]
colnames(Waking_METs_MVPA_percent)=c("Date","Percent_waking_MVPA")

####Calculate breaks in sedentary time in each day####
breakdat=data[,c("EE","Sedentary","date")]#  break_day=aggregate(breakdat$Sedentary,list(c(0,cumsum(abs(diff(breakdat$Sedentary))))),sum)
break_dat=cbind(aggregate(Sedentary~c(0,cumsum(abs(diff(breakdat$Sedentary))))+date,breakdat,sum),
                aggregate(Sedentary~c(0,cumsum(abs(diff(breakdat$Sedentary))))+date,breakdat,length)[,3],
                aggregate(EE~c(0,cumsum(abs(diff(breakdat$Sedentary))))+date,breakdat,sum)[,3])
colnames(break_dat)=c("Category","Date","Sedentary","Time","EE") #category is the cumsum, sedentary is sedentary indicator (0 or non-zero), time of that stage, ee of that stage

if (break_dat$Sedentary[1]==0) {break_dat=break_dat[-1,]} # if the first one is movement, remove it, because we are calculating break from sedentary to movement
if (break_dat$Sedentary[length(break_dat$Sedentary)]==0) {break_dat=break_dat[-length(break_dat$Sedentary),]} # if the last one is movement, remove it
break_dat=break_dat[break_dat$Sedentary!=0,] # if sedentary is not 0, after removing first one and last one, those will be the breaks
breaks=cbind(aggregate(break_dat$Time,list(break_dat$Date),sum),
aggregate(break_dat$Time,list(break_dat$Date),length)[,2],
aggregate(break_dat$EE,list(break_dat$Date),mean)[,2])
breaks[,2]=breaks[,2]/60
breaks=breaks[, c(1, 3, 2, 4)]

colnames(breaks)=c("Date","No_sed_breaks","Time_all_break_length_Hrs","Average_EE_break_kcal")

####
Total_Energy_Exp=aggregate(data$EE,list(data$date),sum)
colnames(Total_Energy_Exp)=c("Date","TEE_Kcal")
####Step_count_gt15	Step_EE_gt15	Step_count_gt3	Step_EE_gt3	Step_gt_100min_time

Step_count_gt15=aggregate(data[(data$METs>1.5)&(data$Step_counter!=0),]$Step_counter,list(data[(data$METs>1.5)&(data$Step_counter!=0),]$date),sum)
colnames(Step_count_gt15)=c("Date","Steps_above_1.5_METs")

Step_EE_gt15=aggregate(data[(data$METs>1.5)&(data$Step_counter!=0),]$EE,list(data[(data$METs>1.5)&(data$Step_counter!=0),]$date),sum)
colnames(Step_EE_gt15)=c("Date","EE_steps_above_1.5METs_kcal")
if(nrow(data[(data$METs>3)&(data$Step_counter!=0),])!=0)
{Step_count_gt3=aggregate(data[(data$METs>3)&(data$Step_counter!=0),]$Step_counter,list(data[(data$METs>3)&(data$Step_counter!=0),]$date),sum)
Step_EE_gt3=aggregate(data[(data$METs>3)&(data$Step_counter!=0),]$EE,list(data[(data$METs>3)&(data$Step_counter!=0),]$date),sum)
}else{Step_count_gt3=Step_count_gt15
Step_count_gt3[,2]=0
Step_EE_gt3=Step_EE_gt15
Step_EE_gt3[,2]=0}

colnames(Step_count_gt3)=c("Date","Steps_above_3_METs")
colnames(Step_EE_gt3)=c("Date","EE_steps_above_3METs_kcal")
if(nrow(data[data$Step_counter>=100,])!=0)
{Step_gt_100min_time=aggregate(data[data$Step_counter>=100,]$METs,list(data[data$Step_counter>=100,]$date),length)
}else{Step_gt_100min_time=Step_count_gt15
Step_gt_100min_time[,2]=0}
Step_gt_100min_time[,2]=Step_gt_100min_time[,2]/60
colnames(Step_gt_100min_time)=c("Date","Time_100_steps_per day_Hrs")

PAEE_gt15=aggregate(data[data$METs>1.5,]$EE,list(data[data$METs>1.5,]$date),sum)
colnames(PAEE_gt15)=c("Date","PAEE_above_1.5METs_kcal")

PAEE_gt15_time=aggregate(data[data$METs>1.5,]$EE,list(data[data$METs>1.5,]$date),length)
PAEE_gt15_time[,2]=PAEE_gt15_time[,2]/60
colnames(PAEE_gt15_time)=c("Date","Time_PAEE_1.5METs_Hrs")
if (nrow(data[data$METs>3,])!=0){
PAEE_gt3=aggregate(data[data$METs>3,]$EE,list(data[data$METs>3,]$date),sum)
PAEE_gt3_time=aggregate(data[data$METs>3,]$EE,list(data[data$METs>3,]$date),length)
}else{PAEE_gt3=PAEE_gt15
PAEE_gt3[,2]=0
PAEE_gt3_time=PAEE_gt15_time
PAEE_gt3_time[,2]=0}
colnames(PAEE_gt3)=c("Date","PAEE_above_3METs_kcal")

PAEE_gt3_time[,2]=PAEE_gt3_time[,2]/60
colnames(PAEE_gt3_time)=c("Date","Time_PAEE_3METs_Hrs")
# PAEE_gt3_lt10min=aggregate(data[(data$METs>2.995)&,]$EE,list(data[data$METs>2.995,]$date),sum)
# PAEE_gt3_time=aggregate(data[data$METs>2.995,]$EE,list(data[data$METs>2.995,]$date),length)

low=0
high=0
data=cbind(data,low,high)
#define sedentary and mild as low, and moderate and vigorous as high, because what we need to count is high only (> or < 10min), low is saved for possible other use
data$low[which((data$Sedentary==1 | data$Mild==1))]=1
data$high[which((data$Moderate==1 | data$Vigorous==1))]=1
#do each day seperatly, need to find a way to do all days together--found, see below
# day1=data[(data$date=="2014-04-03"),]
# dat1=sqldf("select low, high, EE from day1")
# aggregate(dat1,list(c(0,cumsum(abs(diff(dat1$low))))),sum)
# day1_bout=aggregate(.~g,cbind(dat1,g=c(0,cumsum(abs(diff(dat1$low))))),sum)[-1]
# day1_bout_gt10min_EE=sum(day1_bout[day1_bout$high>=10,]$EE)
# day1_bout_gt10min_number=sum(day1_bout[day1_bout$high>=10,]$high)
# day1_bout_lt10min_EE=sum(day1_bout[(day1_bout$high<10) &(day1_bout$high!=0),]$EE)
# day1_bout_lt10min_number=sum(day1_bout[(day1_bout$high<10) &(day1_bout$high!=0),]$high)
####define bout####
dat2=data[,c("date","low","high","EE","Step_counter")]
#first aggregate by high and date to get number of high and sum (EE) on each day
bout=aggregate(cbind(EE,low,high,Step_counter)~c(0,cumsum(abs(diff(high))))+date,data=dat2,sum)[-1]

bout=cbind(bout,0)
colnames(bout)[6]='cut'

# we don't allow low over 2 minutes
for (i in 1:nrow(bout)){
  if (bout[,3][i]>2) {bout[,6][i]=1}else{
    bout[,6][i]=0
  }
}
#Set a count variable 'summ' to delete activity where sum(low)>2min
summ=0
for (i in 1:nrow(bout))
{if (bout[i,6]==0)
{summ=summ+bout[i,3]
if (summ>=3) {bout[i,6]=1
summ=0} }else if (bout[i,6]==1){
  summ=0
}
}

####bout2 is created to generate MVPA bouts (), sum each chunk(0/1) to get total activity time
bout2=aggregate(cbind(EE,low,high,Step_counter,cut)~c(0,cumsum(abs(diff(cut))))+date,data=bout,sum)[-1]
bout2[,3]=bout2[,3]+bout2[,4]
colnames(bout2)[3]='time'
bout2=bout2[bout2$cut==0,] #remove the sedentary activities which are flagged as cut=1

#Then select the right bout (number of high) for each case
if (nrow(bout2[(bout2$time<10) &(bout2$time!=0),])!=0){
bout_lt10min_EE=aggregate(cbind(EE,high)~date,data=bout2[(bout2$time<10) &(bout2$time!=0),],sum)[,1:2]
bout_lt10min_time=aggregate(cbind(EE,time)~date,data=bout2[(bout2$time<10) &(bout2$time!=0),],sum)[,c(1,3)]
bout_lt10min_number=aggregate(high~date,data=bout2[(bout2$time<10) &(bout2$time!=0),],length)
}else{
  bout_lt10min_EE=PAEE_gt15
  bout_lt10min_EE[,2]=0
  bout_lt10min_time= bout_lt10min_EE
    bout_lt10min_time[,2]=0
    bout_lt10min_number=bout_lt10min_EE
    bout_lt10min_number[,2]=0
}


bout_lt10min_time[,2]=bout_lt10min_time[,2]/60
colnames(bout_lt10min_time)=c("Date","Time_unBouted_10min_Hrs")

colnames(bout_lt10min_EE)=c("Date","EE_unBouted_10min_Kcal")
colnames(bout_lt10min_number)=c("Date","No_unBouted_10min")

if (nrow(bout2[bout2$time>=10,])!=0){
bout_gt10min_EE=aggregate(cbind(EE,high)~date,data=bout2[bout2$time>=10,],sum)[,1:2]

bout_gt10min_time=aggregate(cbind(EE,time)~date,data=bout2[bout2$time>=10,],sum)[,c(1,3)]
bout_gt10min_time[,2]=bout_gt10min_time[,2]/60
bout_gt10min_number=aggregate(high~date,data=bout2[bout2$time>=10,],length)
mean_bout_duration=bout_gt10min_number
mean_bout_duration[,2]=bout_gt10min_time$Time_Bouted_10min_Hrs/bout_gt10min_number$No_Bout_10min
}else{
  bout_gt10min_time=bout_lt10min_time
  bout_gt10min_time[,2]=0
  bout_gt10min_EE= bout_lt10min_EE
  bout_gt10min_EE[,2]=0
  bout_gt10min_number=bout_lt10min_number
  bout_gt10min_number[,2]=0
  mean_bout_duration=bout_lt10min_time
  mean_bout_duration[,2]=0

}

colnames(bout_gt10min_time)=c("Date","Time_Bouted_10min_Hrs")
colnames(bout_gt10min_number)=c("Date","No_Bout_10min")
colnames(bout_gt10min_EE)=c("Date","EE_Bouted_10min_Kcal")
colnames(mean_bout_duration)=c("Date","Mean_10min_bout_duration")



if (nrow(bout2[bout2$high>=20,])!=0){

  Number_bouts_gt_20min=aggregate(bout2[bout2$time>=20,]$date,list(bout2[bout2$time>=20,]$date),length)

  bout_gt20min_EE=aggregate(cbind(EE,high)~date,data=bout2[bout2$time>=20,],sum)[,1:2]
  bout_gt20min_time=aggregate(cbind(EE,time)~date,data=bout2[bout2$time>=20,],sum)[,c(1,3)]
  bout_gt20min_time[,2]=bout_gt20min_time[,2]/60

  }else{
  Number_bouts_gt_20min=bout_gt10min_number
  Number_bouts_gt_20min[,2]=0
  bout_gt20min_EE= bout_gt10min_EE
  bout_gt20min_EE[,2]=0
  bout_gt20min_time= bout_gt10min_time
  bout_gt20min_time[,2]=0


}
if (nrow(bout2[bout2$high>=30,])!=0){
  Number_bouts_gt_30min=aggregate(bout2[bout2$time>=30,]$date,list(bout2[bout2$time>=30,]$date),length)
  bout_gt30min_EE=aggregate(cbind(EE,high)~date,data=bout2[bout2$time>=30,],sum)[,1:2]

  bout_gt30min_time=aggregate(cbind(EE,time)~date,data=bout2[bout2$time>=30,],sum)[,c(1,3)]
  bout_gt30min_time[,2]=bout_gt30min_time[,2]/60}else{
    Number_bouts_gt_30min=Number_bouts_gt_20min
    Number_bouts_gt_30min[,2]=0
    bout_gt30min_EE= bout_gt20min_EE
    bout_gt30min_EE[,2]=0
    bout_gt30min_time= bout_gt20min_time
    bout_gt30min_time[,2]=0}

colnames(Number_bouts_gt_20min)=c("Date","No_Bout_20min")
colnames(Number_bouts_gt_30min)=c("Date","No_Bout_30min")
colnames(bout_gt20min_EE)=c("Date","EE_Bouted_20min_Kcal")
colnames(bout_gt20min_time)=c("Date","Time_Bouted_20min_Hrs")
colnames(bout_gt30min_EE)=c("Date","EE_Bouted_30min_Kcal")
colnames(bout_gt30min_time)=c("Date","Time_Bouted_30min_Hrs")

####The number of bouts of steps in each day####
if(nrow(bout2[(bout2$Step_counter>20)&(bout2$Step_counter<=100),])!=0)

{Moderate_steps=aggregate(Step_counter~date,data=bout2[(bout2$Step_counter<=100)&(bout2$Step_counter>20),],length)
}else
  {Moderate_steps=bout_gt30min_EE
  Moderate_steps[,2]=0
  }
colnames(Moderate_steps)=c("Date","No_Bouts_Moderate_steps")
if(nrow(bout2[(bout2$Step_counter>0)&(bout2$Step_counter<=20),])!=0)

{Short_steps=aggregate(Step_counter~date,data=bout2[(bout2$Step_counter<=20),],length)}else{
  Short_steps=Moderate_steps
  Short_steps[,2]=0
}
colnames(Short_steps)=c("Date","No_Bouts_Short_steps")
if(nrow(bout2[bout2$Step_counter>500,])!=0)
{Extra_long_steps=aggregate(Step_counter~date,data=bout2[bout2$Step_counter>500,],length)
Mean_cadence_dat=bout2[bout2$Step_counter>500,]
Mean_cadence_dat[,2]=Mean_cadence_dat[,5]/abs(Mean_cadence_dat[,3])
Mean_cadence_dat=Mean_cadence_dat[,1:2]
Mean_cadence_extra_long=aggregate(Mean_cadence_dat$EE,list(Mean_cadence_dat$date),mean)
}else{
  Extra_long_steps=Moderate_steps
  Extra_long_steps[,2]=0
  Mean_cadence_extra_long=Short_steps
  Mean_cadence_extra_long[,2]=0}
colnames(Extra_long_steps)=c("Date","No_Bouts_Extra_Long_steps")
if(nrow(bout2[(bout2$Step_counter<=500)&(bout2$Step_counter>100),])!=0)
{Long_steps=aggregate(Step_counter~date,data=bout2[(bout2$Step_counter<=500)&(bout2$Step_counter>100),],length)

Mean_cadence_dat=bout2[(bout2$Step_counter<=500)&(bout2$Step_counter>100),]
Mean_cadence_dat[,2]=Mean_cadence_dat[,5]/abs(Mean_cadence_dat[,3])
Mean_cadence_dat=Mean_cadence_dat[,1:2]
Mean_cadence_long=aggregate(Mean_cadence_dat$EE,list(Mean_cadence_dat$date),mean)}else{
  Long_steps=Short_steps
  Long_steps[,2]=0
  Mean_cadence_long=Short_steps
  Mean_cadence_long[,2]=0
}
  colnames(Long_steps)=c("Date","No_Bouts_Long_steps")

####Mean cadence in bouts####

colnames(Mean_cadence_extra_long)=c("Date","Mean_cadence_extra_long")

colnames(Mean_cadence_long)=c("Date","Mean_cadence_long")
if(nrow(bout2[(bout2$Step_counter>20)&(bout2$Step_counter<=100),])!=0)

{Mean_cadence_dat=bout2[(bout2$Step_counter<=100)&(bout2$Step_counter>20),]
Mean_cadence_dat[,2]=Mean_cadence_dat[,5]/abs(Mean_cadence_dat[,3])
Mean_cadence_dat=Mean_cadence_dat[,1:2]
Mean_cadence_moderate=aggregate(Mean_cadence_dat$EE,list(Mean_cadence_dat$date),mean)}else{
  Mean_cadence_moderate=Short_steps
  Mean_cadence_moderate[,2]=0
}

colnames(Mean_cadence_moderate)=c("Date","Mean_cadence_moderate")
if(nrow(bout2[(bout2$Step_counter>0)&(bout2$Step_counter<=20),])!=0)
{Mean_cadence_dat=bout2[(bout2$Step_counter>0)&(bout2$Step_counter<=20),]
Mean_cadence_dat[,2]=Mean_cadence_dat[,5]/abs(Mean_cadence_dat[,3])
Mean_cadence_dat=Mean_cadence_dat[,1:2 ]
Mean_cadence_short=aggregate(Mean_cadence_dat$EE,list(Mean_cadence_dat$date),mean)}else{
  Mean_cadence_short=Mean_cadence_moderate
  Mean_cadence_short[,2]=0
}
colnames(Mean_cadence_short)=c("Date","Mean_cadence_short")

####Mean cadence in days####
data_cadence=data[data$Step_counter!=0,]
Mean_cadence_day=aggregate(data_cadence$Step_counter,list(data_cadence$date),mean)
colnames(Mean_cadence_day)=c("Date","Mean_cadence_day")

list.of.data.frames=list(Time_on_body, Time_on_body_percent,Waking_wearing_Time,Step_count,Lying_down,Sleep,Sed,Total_Energy_Exp,Waking_METs_lt15,Waking_METs_Sed_percent,Waking_METs_btw_15_3,Waking_METs_Mild_percent,Waking_METs_btw_3_5,Waking_METs_Moderate_percent,Waking_METs_gt3,Waking_METs_MVPA_percent,Waking_METs_gt5,Waking_METs_Vigo_percent,breaks,METs_lt1,METs_btw_1_2,METs_btw_2_3,METs_btw_3_4,METs_btw_4_5,METs_btw_5_6,METs_gt6,Step_count_gt15,Step_EE_gt15,Step_count_gt3,Step_EE_gt3,Step_gt_100min_time,PAEE_gt15,PAEE_gt15_time,PAEE_gt3,PAEE_gt3_time,bout_lt10min_number,bout_lt10min_EE,bout_lt10min_time,bout_gt10min_number,bout_gt10min_EE,bout_gt10min_time,mean_bout_duration,Number_bouts_gt_20min,bout_gt20min_EE,bout_gt20min_time,Number_bouts_gt_30min,bout_gt30min_EE,bout_gt30min_time,Extra_long_steps,Long_steps,Moderate_steps,Short_steps,Mean_cadence_extra_long,Mean_cadence_long,Mean_cadence_moderate,Mean_cadence_short,Mean_cadence_day)
result=Reduce(function(...) merge(..., all=T), list.of.data.frames)
Month=as.matrix(as.numeric(format(result$Date,"%m")),ncol=1)
Day=as.matrix(as.numeric(format(result$Date,"%d")),ncol=1)
Year=as.matrix(as.numeric(format(result$Date,"%Y")),ncol=1)
Dayofweek<-as.matrix(as.numeric(format(result$Date,"%w")),ncol=1)

result=cbind(Year,Month,Day,Dayofweek,result)
result=result[,-5]
result[is.na(result)] <- 0

return(result)
}


