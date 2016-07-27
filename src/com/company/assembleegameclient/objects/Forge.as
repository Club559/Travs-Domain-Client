package com.company.assembleegameclient.objects {
import _R_v.Panel;

import com.company.assembleegameclient.game.GameSprite;

import _R_v.Forge;

public class Forge extends GameObject implements _G_4 {

    public function Forge(param1:XML) {
        super(param1);
        _064 = true;
    }

    public function getPanel(param1:GameSprite):Panel {
        return new _R_v.Forge(param1, this);
    }
}
}
