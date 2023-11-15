SET @ENTRY           := 601072;
SET @MODELID         := 15665;
SET @NAME            := '宠物易容';
SET @SUBNAME         := '术士/死骑/法师宝宝易容';
SET @SCRIPTNAME      := 'npc_morphsummon';
SET @NPC_TEXT_HELLO  := @ENTRY;
SET @NPC_TEXT_SORRY  := @NPC_TEXT_HELLO + 1;
SET @NPC_TEXT_CHOICE := @NPC_TEXT_HELLO + 2;
SET @MENU_HELLO      := 61072;
SET @MENU_SORRY      := @MENU_HELLO + 1;
SET @MENU_CHOICE     := @MENU_HELLO + 2;

DELETE FROM `creature_template` WHERE `entry` = @ENTRY;
INSERT INTO `creature_template` ( `entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`,`HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, @MODELID, 0, 0, 0, @NAME, @SUBNAME, NULL, 0, 80, 80, 2, 35, 0, 1, 1.14286, 1, 0, 0, 1, 2000, 2000, 8, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 0, 0, 1, 0, 2, @SCRIPTNAME, 0);

DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (@ENTRY);
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES
(@ENTRY, 1, 1, 0, 0, 0, 0, NULL);

DELETE FROM `npc_text` WHERE `ID` IN (@NPC_TEXT_HELLO, @NPC_TEXT_SORRY, @NPC_TEXT_CHOICE);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@NPC_TEXT_HELLO, '向你问候，$N。如果你正在寻找改变你召唤生物外观的方法，我可以帮助你。'),
(@NPC_TEXT_SORRY, '向你问候，$N。非常抱歉，你没有一个我可以变形的召唤生物。'),
(@NPC_TEXT_CHOICE, '请选择:');

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (@MENU_HELLO, @MENU_SORRY, @MENU_CHOICE);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(@MENU_HELLO, 0, 0, '选择宠物变形', 0, 0, 0, 0, 0, 0, 0, '', 0, 0),
(@MENU_HELLO, 1, 0, '选择恶魔卫士的武器', 0, 0, 0, 0, 0, 0, 0, '', 0, 0),
(@MENU_SORRY, 0, 0, '啊哈，没关系', 0, 0, 0, 0, 0, 0, 0, '', 0, 0),
(@MENU_CHOICE, 0, 0, '返回', 0, 0, 0, 0, 0, 0, 0, '', 0, 0),
(@MENU_CHOICE, 1, 4, '下一页', 0, 0, 0, 0, 0, 0, 0, '', 0, 0),
(@MENU_CHOICE, 2, 4, '上一页', 0, 0, 0, 0, 0, 0, 0, '', 0, 0);

UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=601072;
