
instance VLK_490_Buergerin(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 490;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Mace);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_Lilo,BodyTexBabe_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_490;
};


func void Rtn_Start_490()
{
	TA_Stand_Guarding(8,0,22,0,"NW_CITY_HABOUR_04");
	TA_Sleep(22,0,8,0,"NW_CITY_SMITH_01_03_95");
};

