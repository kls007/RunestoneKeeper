using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using XLua;

public class GameManager : MonoBehaviour
{
    public List<GameObject> DontDestroyOnLoadGoList;
    public static LuaEnv luaenv;
    
    void Awake()
    {
        MyDontDestroyOnLoad();
        XLuaInit();
    }

    //XLua初始化
    void XLuaInit()
    {
        luaenv = new XLua.LuaEnv();
        ////luaenv.DoString("print('C#-GameManager-Awake')");
        luaenv.AddLoader(MyLoader);
        luaenv.DoString("require 'Main'");

        //luaenv.Dispose();
    }

    //DontDestroyOnLoad列表
    void MyDontDestroyOnLoad()
    {
        foreach (var go in DontDestroyOnLoadGoList)
        {
            DontDestroyOnLoad(go.gameObject);
        }
    }

    private byte[] MyLoader(ref string filePath)
    {
        string absPath = @Application.dataPath + "/Shuai/Scripts/lua/" + filePath + ".lua";
        return System.Text.Encoding.UTF8.GetBytes(File.ReadAllText(absPath));
    }

}
