using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ball : MonoBehaviour
{
    public float force = 10f;
    public Rigidbody2D rb;

    public bool isMouseDown = false;
    public bool isDrag = false;
    private Vector3 lastMousePosition = Vector3.zero;
    private Vector3 offset;

    public float borderX = 0;
    public float borderY = 0;
    void Awake()
    {
        rb = GetComponent<Rigidbody2D>();
        //rb.velocity = new Vector2(-force, 0);


        //float halfSreenHeight = Camera.main.orthographicSize;
        //halfScreenWidth = Screen.width / (float)Screen.height * halfSreenHeight;
        //Debug.Log(halfScreenWidth);
        ////
        //leftBorderCollider.position = new Vector3(-halfScreenWidth - halfColliderWidth, leftBorderCollider.position.y, leftBorderCollider.position.z);
        //rightBorderCollider.position = new Vector3(halfScreenWidth + halfColliderWidth, rightBorderCollider.position.y, rightBorderCollider.position.z);

        Vector3 borderV3 = Camera.main.ScreenToWorldPoint(new Vector3(0, 0, 0));
        borderX = Mathf.Abs(borderV3.x);
        borderY = Mathf.Abs(borderV3.y);
    }
    
    void Update()
    {
        Vector2 pos = transform.position;
        float x = pos.x;
        float y = pos.y;

        Debug.Log(rb.velocity == Vector2.zero);

        //if (rb.velocity == Vector2.zero)
        //{
            rb.velocity = new Vector2(-force , 0) * Time.deltaTime;
        //}
        //else
        //{

        //}

        return;


        Vector2 oldVelocity = rb.velocity * Time.deltaTime * 100;
        if (x < -borderX)
        {
            rb.velocity = new Vector2(Mathf.Abs(oldVelocity.x), oldVelocity.y);
            
        }
        else if (x > borderX)
        {
            
            rb.velocity = new Vector2(-Mathf.Abs(oldVelocity.x), oldVelocity.y);
        }
        //rb.velocity = -rb.velocity;


        if (Input.GetMouseButtonDown(0))
        {
            isMouseDown = true;

            //Debug.Log("屏幕宽度: " + UnityEngine.Screen.width);
            //Debug.Log("屏幕高度: " + UnityEngine.Screen.height);
            //Debug.Log(Camera.main.WorldToScreenPoint(transform.position));
            //Debug.Log("鼠标坐标: " + Input.mousePosition);

            //Debug.Log("ScreenToWorldPoint: " + Camera.main.ScreenToWorldPoint(Input.mousePosition));
            
            //Debug.Log(Camera.main.ScreenToWorldPoint(new Vector3(0,0,0)));
        }
        if (Input.GetMouseButtonUp(0))
        {
            isMouseDown = false;
            isDrag = false;
        }
        //Debug.Log("isMouseDown: " + isMouseDown);

        if(isMouseDown)
        {
            RaycastHit2D hit = Physics2D.Raycast(Camera.main.ScreenToWorldPoint(Input.mousePosition), Vector2.zero, Mathf.Infinity);
            if (hit.collider != null)
            {
                if (hit.collider.tag == "Ball")
                {
                    //print("OK");
                    isDrag = true;
                }
            }
        }

        if (isDrag)
        {
            MoveCube();
        }

    }

    void MoveCube()
    {
        offset = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        offset.z = 0;
        // Debug.Log("offset:" + offset);
        transform.position = offset;
        lastMousePosition = transform.position;
    }

}
