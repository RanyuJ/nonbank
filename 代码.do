**** 全球经济不确定性、非银行金融机构与信贷风险溢价 ****

******************************************************************************
******************************************************************************

*********正文********
global loan_control facamt maturity loantype seniority secured num_lender

use "$datapath/贷款层面数据.dta", clear

	************************************************
	* 表 1：主要变量描述性统计 
	************************************************
	asdoc sum Spread Nonbank Uncertainty $loan_control ,replace font(Times New Roman) dec(3) save(描述性统计.doc)
	
		
	************************************************
	* 表 2：基准回归结果 
	************************************************
	reghdfe Spread c.Uncertainty##i.Nonbank , absorb(  bcomid#year lcomid#year lcid#year bcid#year ) vce(cluster lcomid#bcid )
	outreg2 using 基准回归结果.doc,replace tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank $loan_control, absorb( lcomid bcomid year) vce(cluster lcomid#bcid )
	outreg2 using 基准回归结果.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank $loan_control, absorb( lcomid bcomid lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 基准回归结果.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank $loan_control, absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 基准回归结果.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	
	************************************************
	* 表 3：流动性机制 
	************************************************
	reghdfe Spread c.Uncertainty##i.Nonbank##c.Liquidity_Depository $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性机制.doc,replace tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.Liquidity_Depository ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.Liquidity_Otherfin $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性机制.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.Liquidity_Otherfin ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.Ted_Spread $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性机制.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.Ted_Spread ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.Equity_Index $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性机制.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.Equity_Index ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.Capital_Adequacy $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性机制.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.Capital_Adequacy ) ///
	adjr2 nocons
	
	
	************************************************
	* 表 4：贷款内部异质性 
	************************************************
	reghdfe Spread c.Uncertainty##i.Nonbank##i.Dollar_loan $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 贷款内部异质性.doc,replace tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#i.Dollar_loan ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##i.With_border $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 贷款内部异质性.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#i.With_border ) ///
	adjr2 nocons
	
	
	************************************************
	* 表 5：贷款人所在地的流动性救助能力的影响 
	************************************************
	reghdfe Spread c.Uncertainty##i.Nonbank##c.Reserve $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性救助能力.doc,replace tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.Reserve ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.GFSN_CARD $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性救助能力.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.GFSN_CARD ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.IMFQuota $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性救助能力.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.IMFQuota ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.SwapAmount $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性救助能力.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.SwapAmount ) ///
	adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.RFALendingCapacity $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) ///
	vce(cluster lcomid#bcid )
	outreg2 using 流动性救助能力.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.RFALendingCapacity ) ///
	adjr2 nocons
	   
	
	************************************************
	* 表 6：更依赖非银贷款企业的实际影响 
	************************************************	
	global firm_control b_Size b_ROA b_Leverage b_Liquidity
    use "$datapath/企业层面数据.dta", clear
	
	reghdfe Growth_ppe c.Uncertainty_Y##c.Nonbank_dependence $firm_control , absorb( bcomid countryid#year industryid#year) ///
	vce(cluster bcomid )
	outreg2 using 企业经济影响.doc,replace tstat bdec(3) tdec(3) keep( Nonbank_dependence c.Uncertainty_Y#c.Nonbank_dependence  ) adjr2 nocons
	
	reghdfe Growth_rev c.Uncertainty_Y##c.Nonbank_dependence $firm_control , absorb( bcomid countryid#year industryid#year) ///
	vce(cluster bcomid )
	outreg2 using 企业经济影响.doc,append tstat bdec(3) tdec(3) keep( Nonbank_dependence c.Uncertainty_Y#c.Nonbank_dependence  ) adjr2 nocons
	
	reghdfe Growth_emp c.Uncertainty_Y##c.Nonbank_dependence $firm_control , absorb( bcomid countryid#year industryid#year) ///
	vce(cluster bcomid )
	outreg2 using 企业经济影响.doc,append tstat bdec(3) tdec(3) keep( Nonbank_dependence c.Uncertainty_Y#c.Nonbank_dependence  ) adjr2 nocons  
	
	

********附录********

use "$datapath/贷款层面数据.dta", clear

	************************************************
	* 附表 1：稳健性检验-替换不确定性指标 
	************************************************
	reghdfe Spread c.VIX##i.Nonbank $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 稳健性检验-替换不确定性指标.doc,replace tstat bdec(3) tdec(3) keep( VIX c.VIX#i.Nonbank) adjr2 nocons
	
	reghdfe Spread c.GF##i.Nonbank $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 稳健性检验-替换不确定性指标.doc,append tstat bdec(3) tdec(3) keep( GF c.GF#i.Nonbank) adjr2 nocons
	
	reghdfe Spread c.EPU##i.Nonbank $loan_control , absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 稳健性检验-替换不确定性指标.doc,append tstat bdec(3) tdec(3) keep( EPU c.EPU#i.Nonbank) adjr2 nocons
	
	
    ************************************************
	* 附表 2：稳健性检验-调整贷款层面样本 
	************************************************
	reghdfe Spread c.Uncertainty##i.Nonbank $loan_control if Leadbank==1, absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 稳健性检验-调整贷款层面样本.doc,replace tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	use "$datapath/稳健性检验2-加权平均利差.dta", clear
	reghdfe Spread_w c.Uncertainty##i.Nonbank maturity_w facamt_w num_lender_w loantype_w seniority_w secured_w, ///
	absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 稳健性检验-调整贷款层面样本.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	
	************************************************
	* 附表 3：稳健性检验-排除特定国家或地区贷款人 
	************************************************
	use "$datapath/贷款层面数据.dta", clear

	reghdfe Spread c.Uncertainty##i.Nonbank $loan_control if US_lender!=1, absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 稳健性检验-排除特定国家或地区贷款人.doc,replace tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank $loan_control if IFC!=1, absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 稳健性检验-排除特定国家或地区贷款人.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank $loan_control if Tax_Haven!=1, absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 稳健性检验-排除特定国家或地区贷款人.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty ) adjr2 nocons
	
	
	************************************************
	* 附表 4：稳健性检验-内生性问题 
	************************************************ 	
	gen Uncertainty_Nonbank= Uncertainty*Nonbank 
	gen xziv = EPU*Nonbank
    egen id2=group(lcomid bcid)
	gen xziv_UK = UK_EPU* Nonbank 
    gen xziv_US = US_EPU* Nonbank
    ivreghdfe Spread ( Uncertainty Uncertainty_Nonbank = EPU xziv ) $loan_control , ///
	absorb(bcomid#year lcomid#year lcid#year bcid#year) cluster(id2)
	outreg2 using 稳健性检验-内生性问题.doc,replace tstat bdec(3) tdec(3) e(idstat rkf) keep( Uncertainty Uncertainty_Nonbank ) nocons
	
    ivreghdfe Spread ( Uncertainty Uncertainty_Nonbank = US_EPU xziv_US ) $loan_control if US_lender!=1 , ///
	absorb(bcomid#year lcomid#year lcid#year bcid#year) cluster(id2)
    outreg2 using 稳健性检验-内生性问题.doc,append tstat bdec(3) tdec(3) e(idstat rkf) keep( Uncertainty Uncertainty_Nonbank ) nocons 
		
    ivreghdfe Spread ( Uncertainty Uncertainty_Nonbank = UK_EPU xziv_UK ) $loan_control if UK_lender!=1 , ///
	absorb(bcomid#year lcomid#year lcid#year bcid#year) cluster(id2)
    outreg2 using 稳健性检验-内生性问题.doc,append tstat bdec(3) tdec(3) e(idstat rkf) keep( Uncertainty Uncertainty_Nonbank ) nocons
	//idstat、rkf分别为识别不足检验汇报的Kleibergen-Paap rk LM统计量和弱工具变量检验汇报的Kleibergen-Paap rk Wald F统计量
		
	************************************************
	* 附表 5：稳健性检验-改变贷款金额分配方式 
	************************************************
	reghdfe Spread c.Uncertainty##i.Nonbank facamt_hat maturity loantype seniority secured num_lender, ///
	absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 改变贷款金额分配方式.doc,replace tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty facamt_hat) adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank facamt_total maturity loantype seniority secured num_lender, ///
	absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 改变贷款金额分配方式.doc,append tstat bdec(3) tdec(3) keep( Uncertainty Nonbank#c.Uncertainty facamt_total) adjr2 nocons
	
	
	************************************************
	* 附表 6：排除其他渠道-借贷关系 
	************************************************
	reghdfe Spread c.Uncertainty##i.Nonbank##i.Relation_lending $loan_control, absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 排除其他渠道-借贷关系.doc,replace tstat bdec(3) tdec(3) ///
	keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#i.Relation_lending) adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.Relation_number $loan_control, absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 排除其他渠道-借贷关系.doc,append tstat bdec(3) tdec(3) ///
	keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.Relation_number) adjr2 nocons
	
	reghdfe Spread c.Uncertainty##i.Nonbank##c.Relation_amount $loan_control, absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 排除其他渠道-借贷关系.doc,append tstat bdec(3) tdec(3) ///
	keep( Uncertainty Nonbank#c.Uncertainty Nonbank#c.Uncertainty#c.Relation_amount) adjr2 nocons
	
	
	************************************************
	* 附表 7：排除其他渠道-非银机构主动风险承担意愿 
	************************************************
	reghdfe Spread c.Uncertainty##i.Nonbank_high c.Uncertainty##i.Nonbank_low $loan_control , ///
	absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 排除其他渠道-非银机构主动风险承担意愿.doc,replace tstat bdec(3) tdec(3) ///
	keep( Uncertainty c.Uncertainty#Nonbank_high c.Uncertainty#Nonbank_low) adjr2 nocons
	  
	reghdfe Spread c.Uncertainty##i.Investment_bank c.Uncertainty##i.Finance_company $loan_control , ///
	absorb( bcomid#year lcomid#year lcid#year bcid#year) vce(cluster lcomid#bcid )
	outreg2 using 排除其他渠道-非银机构主动风险承担意愿.doc,append tstat bdec(3) tdec(3) ///
	keep( Uncertainty c.Uncertainty#Investment_bank c.Uncertainty#Finance_company) adjr2 nocons
	
	
	
	
	
	
	
	
	