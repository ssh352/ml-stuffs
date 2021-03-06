
 data WORK.Alberton                               ;
      %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
       infile 'C:\Users\dhanasekaran\Desktop\Sales2012\Nov11Dec11Jan12\Alberton.txt' delimiter=',' DSD lrecl=32767 firstobs=2 PAD ;
informat Type_1 $50.;
informat Deed_Number $50.;
informat Township $50.;
informat Buyer $50.;
informat Buyer_Id $50.;
informat Share $50.;
informat Erf_Portion $50.;
informat Extent $50.;
informat PurDate $50.;
informat RegDate $50.;
informat PurPrice $50.;
informat Bond_Holder $50.;
informat Amount $50.;
informat Seller $50.;
informat Seller_Id $50.;
informat Remainder $50.;
informat Farm_Name_Situated_At $50.;
informat Type_2 $50.;
informat Additional_Buyer $50.;
informat Buyer_Id $50.;
informat Share $50.;
informat Type_3 $50.;
informat Additional_Seller $50.;
informat Seller_Id $50.;
informat Type_4 $50.;
informat Additional_Bond_Holder $50.;
informat Bond_Amount $50.;
informat Type_5 $50.;
informat Consolidation_Sub_division $50.;
informat Erf_Ptn $50.;
informat Orig_Seller_Buyer $50.;
informat Id $50.;
informat Type_6 $50.;
informat Intermediate_Owner $50.;
informat Owner_Id $50.;
informat PurDt $50.;
informat PurPrice $50.;
informat Title_Deed $50.;
informat RegDte $50.;
informat Share $50.;
informat Type_7 $50.;
informat Street_Address $50.;

format Type_1 $50.;
format Deed_Number $50.;
format Township $50.;
format Buyer $50.;
format Buyer_Id $50.;
format Share $50.;
format Erf_Portion $50.;
format Extent $50.;
format PurDate $50.;
format RegDate $50.;
format PurPrice $50.;
format Bond_Holder $50.;
format Amount $50.;
format Seller $50.;
format Seller_Id $50.;
format Remainder $50.;
format Farm_Name_Situated_At $50.;
format Type_2 $50.;
format Additional_Buyer $50.;
format Buyer_Id $50.;
format Share $50.;
format Type_3 $50.;
format Additional_Seller $50.;
format Seller_Id $50.;
format Type_4 $50.;
format Additional_Bond_Holder $50.;
format Bond_Amount $50.;
format Type_5 $50.;
format Consolidation_Sub_division $50.;
format Erf_Ptn $50.;
format Orig_Seller_Buyer $50.;
format Id $50.;
format Type_6 $50.;
format Intermediate_Owner $50.;
format Owner_Id $50.;
format PurDt $50.;
format PurPrice $50.;
format Title_Deed $50.;
format RegDte $50.;
format Share $50.;
format Type_7 $50.;
format Street_Address $50.;
input

 Type_1 ~ $
 Deed_Number  ~ $
 Township  ~ $
 Buyer  ~ $
 Buyer_Id  ~ $
 Share  ~ $
 Erf_Portion  ~ $
 Extent  ~ $
 PurDate  ~ $
 RegDate  ~ $
 PurPrice ~ $
 Bond_Holder  ~ $
 Amount  ~ $
 Seller  ~ $
 Seller_Id  ~ $
 Remainder  ~ $
 Farm_Name_Situated_At  ~ $
 Type_2  ~ $
 Additional_Buyer  ~ $
 Buyer_Id  ~ $
 Share  ~ $
 Type_3  ~ $
 Additional_Seller  ~ $
 Seller_Id  ~ $
 Type_4  ~ $
 Additional_Bond_Holder  ~ $
 Bond_Amount  ~ $
 Type_5  ~ $
 Consolidation_Sub_division  ~ $
 Erf_Ptn  ~ $
 Orig_Seller_Buyer  ~ $
 Id  ~ $
 Type_6  ~ $
 Intermediate_Owner  ~ $
 Owner_Id  ~ $
 PurDt ~  $
 PurPrice  ~ $
 Title_Deed  ~ $
 RegDte  ~ $
 Share  ~ $
 Type_7  ~ $
 Street_Address  ~ $
;
       if _ERROR_ then call symput('_EFIERR_',1);  /* set ERROR detection macro variable */
       run;
