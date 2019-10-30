using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class PlayerController : MonoBehaviour
{

    public Rigidbody2D rb;
    public Animator anim;
    public Collider2D coll;
    public Collider2D DisColl;
    public Transform cellingCheck;
    public float speed;
    public float jumpForce;
    public LayerMask ground;
    public int cherry = 0;
    public int gem = 0;

    public Text cherryNum;
    public Text gemNum;

    public bool isHurt = false;


    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();

    }

    void FixedUpdate()
    {
        if (!isHurt)
        {
            Movement();
        }

        SwitchAnim();
    }
    void Update()
    {
        Jump();
        Crouch();
    }

    void Movement()
    {
        float horizontalMove = Input.GetAxis("Horizontal");
        float facedirection = Input.GetAxisRaw("Horizontal");

        // 角色移动
        if (horizontalMove != 0)
        {
            rb.velocity = new Vector2(horizontalMove * speed * Time.fixedDeltaTime, rb.velocity.y);
            anim.SetFloat("running", Mathf.Abs(facedirection));
        }
        if (facedirection != 0)
        {
            transform.localScale = new Vector3(facedirection, 1, 1);
        }
        
    }


    void SwitchAnim()
    {
        //anim.SetBool("idle", false);

        if (rb.velocity.y < 0.1f && coll.IsTouchingLayers(ground))
        {
            anim.SetBool("falling", true);
        }

        if (anim.GetBool("jumping"))
        {
            if (rb.velocity.y < 0)
            {
                anim.SetBool("jumping", false);
                anim.SetBool("falling", true);
            }
        }
        else if (isHurt)
        {
            anim.SetBool("hurt", true);
            anim.SetFloat("running", 0);
            if (Mathf.Abs(rb.velocity.x) < 0.1f)
            {
                anim.SetBool("hurt", false);
                //anim.SetBool("idle", true);
                isHurt = false;
            }
        }
        else if (coll.IsTouchingLayers(ground))
        {
            anim.SetBool("falling", false);
            //anim.SetBool("idle", true);

        }
    }

    // 角色跳跃
    void Jump()
    {
        if (Input.GetButtonDown("Jump") && coll.IsTouchingLayers(ground))
        {
            rb.velocity = new Vector2(rb.velocity.x, jumpForce * Time.deltaTime);
            anim.SetBool("jumping", true);
        }
    }

    //下蹲
    void Crouch()
    {
        if (!Physics2D.OverlapCircle(cellingCheck.position, 0.2f, ground))
        {
            if(Input.GetButton("Crouch"))
            {
                anim.SetBool("crouching", true);
                DisColl.enabled = false;
            }
            else
            {
                anim.SetBool("crouching", false);
                DisColl.enabled = true;
            }
        }
    }

    //捡垃圾
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.tag == "cherry")
        {
            Destroy(collision.gameObject);
            cherry += 1;
            cherryNum.text = cherry.ToString();
        }
        if (collision.tag == "gem")
        {
            Destroy(collision.gameObject);
            gem += 1;
            gemNum.text = gem.ToString();
        }
        if (collision.tag == "DeadLine")
        {
            //Restart();
            Invoke("Restart", 2f);
        }
    }
    
    private void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.gameObject.tag == "Enemy")
        {
            if (anim.GetBool("falling"))
            {
                Destroy(collision.gameObject);
                rb.velocity = new Vector2(rb.velocity.x, jumpForce * Time.deltaTime);
                anim.SetBool("jumping", true);
            }
            else if(transform.position.x < collision.gameObject.transform.position.x)
            {
                rb.velocity = new Vector2(-4, rb.velocity.y);
                isHurt = true;
            }
            else if (transform.position.x > collision.gameObject.transform.position.x)
            {
                rb.velocity = new Vector2(4, rb.velocity.y);
                isHurt = true;
            }
        }
    }

    void Restart()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }
}
