using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public class LuaHuiDiao : MonoBehaviour
{
    [CSharpCallLua]
    public delegate void CsCallLua(string keyCode);

    void OnGUI()
    {
        KeyBoardEventCallBack();
    }

    void Update()
    {
        GameManager.luaenv.DoString("GameUpdate.Update()");
    }

    //键盘监听回调
    public void KeyBoardEventCallBack()
    {
        if (Event.current.rawType == EventType.KeyDown)
        {
            Event e = Event.current;
            e.Use(); // 防止执行多次
            //if (KeyCode.A <= e.keyCode && e.keyCode <= KeyCode.Z)
            if (KeyCode.Backspace <= e.keyCode && e.keyCode <= KeyCode.Joystick8Button19)
            {
                //Debug.Log(e.keyCode);
                CsCallLua csCallLua = GameManager.luaenv.Global.GetInPath<CsCallLua>("AgentManager.CsCallLua");
                csCallLua((e.keyCode).ToString());
            }
        }
    }

}
