
instance DIA_Addon_Juan_EXIT(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 999;
	condition = DIA_Addon_Juan_EXIT_Condition;
	information = DIA_Addon_Juan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Juan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Juan_PICKPOCKET(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 900;
	condition = DIA_Addon_Juan_PICKPOCKET_Condition;
	information = DIA_Addon_Juan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Juan_PICKPOCKET_Condition()
{
	return C_Beklauen(65,73);
};

func void DIA_Addon_Juan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,Dialog_Back,DIA_Addon_Juan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Juan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Juan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};

func void DIA_Addon_Juan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};


instance DIA_Addon_Juan_HI(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_HI_Condition;
	information = DIA_Addon_Juan_HI_Info;
	permanent = FALSE;
	description = "Co se děje?";
};


func int DIA_Addon_Juan_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//Co se děje?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//Co chceš? Chceš mi něco říct? Jestli ne tak běž pryč.
	if(!Npc_IsDead(Freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//Jinak můj přítel tě naseká na kousky. Je to jasný?
		B_StartOtherRoutine(Freund,"STAND");
	};
};


instance DIA_Addon_Juan_Losung(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_Losung_Condition;
	information = DIA_Addon_Juan_Losung_Info;
	permanent = FALSE;
	description = "Mluv... Nabizíš prý zajimavé zboží...";
};


func int DIA_Addon_Juan_Losung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_HI) && ((Tom_Tells == TRUE) || (MIS_Huno_Stahl == LOG_Running)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Juan_Losung_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//Mluv... Nabízíš prý zajimavé zboží...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//A co? Esteban mě chce zabit. Schovávám se tu celý dny v této mizerné díře...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//... A jen tak si někoho pošle vyzvednout své věci? Nejsem sklad!
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//No a? To není můj problém.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//Tak ja ti vytvořím problém. Chceš zboží? Zaplať za něj.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//Dones zlato od Estebana nebo třeba od Ravena mě to nezajímá. Pokud někdo potřebuje moje zboží bude muset za něj zaplatit!
};


instance DIA_Addon_Juan_AufsMaul(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_AufsMaul_Condition;
	information = DIA_Addon_Juan_AufsMaul_Info;
	permanent = FALSE;
	description = "Nepřišel jsem kvůli Estebanovi!";
};

func int DIA_Addon_Juan_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Juan_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//Nepřišel jsem kvůli Estebanovi!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//Ano? No tak počkej... Dostaneš pořádnej výprask!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Juan_Trade(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 99;
	condition = DIA_Addon_Juan_Trade_Condition;
	information = DIA_Addon_Juan_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};

func int DIA_Addon_Juan_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Juan_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_3");
};
