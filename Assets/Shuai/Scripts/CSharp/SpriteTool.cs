
using UnityEngine;
using System.Collections;
using UnityEngine.UI;

namespace UnityEngine
{
    // 自定义一个工具类
    public class SpriteTool
    {
        // 加载Resources文件下的Sprite图片
        public static Sprite ResourcesSprite(string path)
        {

            return Resources.Load<Sprite>(path);
        }
    }
}