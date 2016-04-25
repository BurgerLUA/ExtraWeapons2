// Created by Crowbar 0.29.0.0

$ModelName "weapons/v_plasmarifle.mdl"

$BodyGroup "studio"
{
	studio "v_plasmarifle_reference.smd"
}


$SurfaceProp "default"

$Contents "solid"

$MaxEyeDeflection 90

$CDMaterials "models\weapons\haloweapons\"

$CBox 0 0 0 0 0 0

$BBox -6.139 -14.527 -20.403 24.233 12.05 -1.716

// $HBoxSet "default"


$Sequence "idle" {
	"v_plasmarifle_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "melee" {
	"v_plasmarifle_anims\melee.smd"
	activity "ACT_VM_HITCENTER" 1
	{ event 5004 1 "Weapons_HPlasmaRifle.Melee" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "overheat" {
	"v_plasmarifle_anims\overheat.smd"
	activity "ACT_VM_FIDGET" 1
	{ event 5004 1 "Weapon_HPlasmaRifle.OH" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "reload" {
	"v_plasmarifle_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 1 "Weapon_HPlasmaRifle.StopOH" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "draw" {
	"v_plasmarifle_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	{ event 5004 1 "Weapon_HPlasmaRifle.Ready" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "fire" {
	"v_plasmarifle_anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5004 1 "Weapon_HPlasmaRifle.Fire" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$Sequence "nade" {
	"v_plasmarifle_anims\nade.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	{ event 5004 1 "Weapon_HPlasmaRifle.Nade" }
	fadein 0.2
	fadeout 0.2
	fps 30
}
