using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy_frog : MonoBehaviour
{
    private Rigidbody2D rb;
    public Animator anim;
    public Collider2D coll;
    public LayerMask ground;
    public Transform leftPoint;
    public Transform rightPoint;
    public float speed;
    public float jumpForce;
    public float leftX, rightX;

    private bool faceLeft = true;
    

    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
        coll = GetComponent<Collider2D>();
        //transform.DetachChildren();
        leftX = leftPoint.position.x;
        rightX = rightPoint.position.x;
    }
    
    void Update()
    {
        //Movement();
        SwitchAnim();
    }

    void Movement()
    {
        if (faceLeft)
        {
            if (coll.IsTouchingLayers(ground))
            {
                anim.SetBool("jumping", true);
                rb.velocity = new Vector2(-speed, jumpForce);
            }
            
            if (transform.position.x < leftX)
            {
                transform.localScale = new Vector3(-1, 1, 1);
                faceLeft = false;
            }
        }
        else
        {
            if (coll.IsTouchingLayers(ground))
            {
                anim.SetBool("jumping", true);
                rb.velocity = new Vector2(speed, jumpForce);
            }
            
            if (transform.position.x > rightX)
            {
                transform.localScale = new Vector3(1, 1, 1);
                faceLeft = true;
            }
        }
    }

    void SwitchAnim()
    {
        if (anim.GetBool("jumping"))
        {
            if(rb.velocity.y < 0.1f)
            {
                anim.SetBool("jumping", false);
                anim.SetBool("falling", true);
            }
        }
        if (coll.IsTouchingLayers(ground) && anim.GetBool("falling"))
        {
            anim.SetBool("falling", false);
        }
    }

}
