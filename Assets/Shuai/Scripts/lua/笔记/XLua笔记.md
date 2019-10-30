# XLua笔记

##   快速入门
一个完整的例子仅需3行代码：

安装好xLua，建一个MonoBehaviour拖到场景，在Start加入如下代码：

XLua.LuaEnv luaenv = new XLua.LuaEnv();
luaenv.DoString("CS.UnityEngine.Debug.Log('hello world')");
luaenv.Dispose();


1. lua入口: Main.lua ===> Game.lua

2. ShuaiTest

3. lua事件分发

4. UnityEngine = CS.UnityEngine

