TeleportMenu()
{
    self createMenu("TeleportMenu", "Teleport Menu");
    if(Blackout()){
        if(level.CurrentMap == "wz_open_skyscrapers"){
            self addOption("TeleportMenu", "Teleport To Asylum", &Teleport, "asylum");
            self addOption("TeleportMenu", "Teleport To Buried", &Teleport, "buried");
            self addOption("TeleportMenu", "Teleport To Dam", &Teleport, "dam");
            self addOption("TeleportMenu", "Teleport To Dock", &Teleport, "dock");
            self addOption("TeleportMenu", "Teleport To Factory", &Teleport, "factory");
            self addOption("TeleportMenu", "Teleport To Firing Range", &Teleport, "firing_range");
            self addOption("TeleportMenu", "Teleport To Lighthouse", &Teleport, "lighthouse");
            self addOption("TeleportMenu", "Teleport To Nuketown", &Teleport, "nuketown");
            self addOption("TeleportMenu", "Teleport To Raid", &Teleport, "raid");
            self addOption("TeleportMenu", "Teleport To Rivertown", &Teleport, "rivertown");
            self addOption("TeleportMenu", "Teleport To Array", &Teleport, "array");
            self addOption("TeleportMenu", "Teleport To Train Station", &Teleport, "train_station");
        }
        if (level.CurrentMap == "wz_escape" || level.CurrentMap == "wz_escape_alt"){
            self addOption("TeleportMenu", "Teleport To Shipwreck", &Teleport, "boat");
            self addOption("TeleportMenu", "Teleport To Docks", &Teleport, "docks");
            self addOption("TeleportMenu", "Teleport To Island", &Teleport, "island");
            self addOption("TeleportMenu", "Teleport To Cellhouse", &Teleport, "main_building");
            self addOption("TeleportMenu", "Teleport To Model Industries", &Teleport, "model_industries");
            self addOption("TeleportMenu", "Teleport To New Industries", &Teleport, "new_industries");
            self addOption("TeleportMenu", "Teleport To Submarine", &Teleport, "submarine");
            self addOption("TeleportMenu", "Teleport To Parade Grounds", &Teleport, "white_house");
        }
    }
    if(Multiplayer()){
        //
    }
    if(Zombies()){
        //
    }
    self addOption("TeleportMenu", "Save Current Location", &PlayerLocation, "Save");
    self addOption("TeleportMenu", "Load Saved Location", &PlayerLocation, "Load");
}

Teleport(Location) 
{
    self.Locations = array(
        array("asylum", (9904.15, -41700.2, 4013.05)), array("buried", (-55217.4, -38466.2, 1996.18)),
        array("dam", (37654.7, -45952.6, 4072.38)), array("dock", (-31249, 25237, 1148.13)),
        array("factory", (-40143, -13333, 1366.13)), array("firing_range", (12296.2, -2656.55, 1326.5)),
        array("lighthouse", (-45981, 27144, 1240.13)), array("nuketown", (-11560, 45393, 1650.82)),
        array("raid", (48010, 5174, 5132.13)), array("rivertown", (-2899, -17123, 1308.13)),
        array("array", (4510.68, 17379.9, 4031.51)), array("train_station", (26605, -19024, 2015.11)),
        array("boat", (-9045, -4126, 117.117)), array("docks", (2049, -4510, 144.125)),
        array("island", (-9868, -7088, 199.947)), array("main_building", (-70, 419, 1392.13)),
        array("model_industries", (5636, 9464, 1144.13)), array("new_industries", (3268, 6574, 527.625)),
        array("submarine", (9503, 5888, 117)), array("white_house", (-4057, -4664, 693.125))
    );

    foreach (loc in self.Locations) 
    {
        if (loc[0] == Location) 
        {
            self setOrigin(loc[1]);
            break;
        }
    }
}

PlayerLocation(Switch)
{
    if(Switch == "Save")
    {
        self.SaveLocation = self.origin;
        self.SaveLocationAngle = self.angles;
        if(!IsDefined(self.SaveLocationToggle))
            self.SaveLocationToggle = true;
            
        self iPrintLnBold("Current Position: ^2Saved.");
    }
    else if(Switch == "Load")
    {
        if(!IsDefined(self.SaveLocationToggle))
            return self iPrintLnBold("^1Error: ^7No Location Saved");
            
        self SetPlayerAngles(self.SaveLocationAngle);
        self SetOrigin(self.SaveLocation);
        self iPrintLnBold("Saved Position: ^2Loaded.");
    }
    else
    {
        self.SaveLocTog = undefined;
        self.SaveLocation = undefined;
        self.SaveLocationAngle = undefined;
    }
}