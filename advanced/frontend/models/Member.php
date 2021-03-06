<?php
namespace frontend\models;
use Yii;
use yii\web\IdentityInterface;

class Member extends \yii\db\ActiveRecord implements IdentityInterface {
    public $password; //密码明文输入
    public $password2;//确认密码
    public $code;//验证码
    public $rememberMe;
    public $smsCode;//短信验证码
    const SCENARIO_REGISTER='register';
	 const SCENARIO_LOGIN='login';
    const SCENARIO_API_REGISTER='api_register';//api注册
 public static function tableName(){
     return 'member';
 }
 public function rules(){
//     return [
//         [['username'],'required'],
//         [['last_login_time','last_login_ip','status','created_at','updated_at'],'integer'],
//         [['username'],'string','max'=>50],
//         ['username','unique','on'=>'register'],
//         ['password','required','message'=>'密码不能为空'],
//         ['password2','required','message'=>'确认密码不能为空','on'=>'register'],
//         ['password2','compare','compareAttribute'=>'password','message'=>'密码和确认密码不一致','on'=>'register'],
//         [['auth_key'],'string','max'=>32],
//         [['password_hash','email'],'string','max'=>100],
//         ['tel','required','on'=>'register'],
//         ['tel','match','pattern'=>'/^((1[0-9]))\d{9}$/','message'=>'手机格式不正确','on'=>'register'],
//         ['email','required','message'=>'邮箱不能为空','on'=>'register'],
//         ['email','match','pattern'=>'/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/','message'=>'邮箱格式不正确','on'=>'register'],
//         ['code', 'captcha','captchaAction'=>'member/captcha','message'=>'验证码不正确'],
//         ['rememberMe','boolean','on'=>'login']
//     ];
     return [
         [['username'], 'required'],
		 [['email','tel'],'required','on'=>self::SCENARIO_REGISTER],
         ['password','required','message'=>'密码不能为空'],
         [['password2','smsCode'], 'required','on'=>self::SCENARIO_REGISTER],
         [['password2'], 'compare','compareAttribute'=>'password','on'=>self::SCENARIO_REGISTER],
        ['code', 'captcha','on'=>self::SCENARIO_LOGIN,'captchaAction'=>'member/captcha','message'=>'验证码不正确'],
         ['code','captcha','on'=>self::SCENARIO_REGISTER,],
         ['code','captcha','on'=>self::SCENARIO_API_REGISTER,'captchaAction'=>'api/captcha'],
         [['last_login_time', 'last_login_ip', 'status', 'created_at', 'updated_at'], 'integer','on'=>self::SCENARIO_REGISTER],
         [['username'], 'string', 'max' => 50],
         [['auth_key'], 'string', 'max' => 32,'on'=>self::SCENARIO_REGISTER],
         [['password_hash', 'email'], 'string', 'max' => 100,'on'=>self::SCENARIO_REGISTER],
         [['tel'], 'string', 'max' => 11,'on'=>self::SCENARIO_REGISTER],
         [['email'], 'email','on'=>self::SCENARIO_REGISTER],
         ['email','match','pattern'=>'/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/','message'=>'邮箱格式不正确','on'=>self::SCENARIO_REGISTER],
         ['rememberMe','boolean','on'=>'login'],
         //验证短信验证码
         ['smsCode','validateSms','on'=>self::SCENARIO_REGISTER]
     ];
 }
 public function attributeLabels(){
     return [
       'id'=>'ID',
         'username'=>'用户名',
         'auth_key'=>'Auth Key',
         'password_hash'=>'密码:  ',
         'email'=>'邮箱',
         'tel'=>'电话',
         'last_login_time'=>'最后登录时间',
         'last_login_ip'=>'最后登录ip',
         'status'=>'status',
         'created_at'=>'添加时间',
         'updated_at'=>'修改时间',
         'code'=>'验证码',
         'password'=>'密码',
         'password2'=>'确认密码',
         'rememberMe'=>'',
         'smsCode'=>'短信验证码'
     ];
 }
    public function beforeSave($insert)
    {
        if($insert){
            $this->created_at=time();
            $this->status=1;
            //生成随机字符串
            $this->auth_key=Yii::$app->security->generateRandomString();
        }
        if($this->password){
            $this->password_hash=Yii::$app->security->generatePasswordHash($this->password);
        }
        return parent::beforeSave($insert); // TODO: Change the autogenerated stub
    }
    /**
     * Finds an identity by the given ID.
     * @param string|int $id the ID to be looked for
     * @return IdentityInterface the identity object that matches the given ID.
     * Null should be returned if such an identity cannot be found
     * or the identity is not in an active state (disabled, deleted, etc.)
     */
    public static function findIdentity($id)
    {
        return self::findOne(['id'=>$id]);
    }
    /**
     * Finds an identity by the given token.
     * @param mixed $token the token to be looked for
     * @param mixed $type the type of the token. The value of this parameter depends on the implementation.
     * For example, [[\yii\filters\auth\HttpBearerAuth]] will set this parameter to be `yii\filters\auth\HttpBearerAuth`.
     * @return IdentityInterface the identity object that matches the given token.
     * Null should be returned if such an identity cannot be found
     * or the identity is not in an active state (disabled, deleted, etc.)
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {

    }
    /**
     * Returns an ID that can uniquely identify a user identity.
     * @return string|int an ID that uniquely identifies a user identity.
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns a key that can be used to check the validity of a given identity ID.
     *
     * The key should be unique for each individual user, and should be persistent
     * so that it can be used to check the validity of the user identity.
     *
     * The space of such keys should be big enough to defeat potential identity attacks.
     *
     * This is required if [[User::enableAutoLogin]] is enabled.
     * @return string a key that is used to check the validity of a given identity ID.
     * @see validateAuthKey()
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * Validates the given auth key.
     *
     * This is required if [[User::enableAutoLogin]] is enabled.
     * @param string $authKey the given auth key
     * @return bool whether the given auth key is valid.
     * @see getAuthKey()
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() == $authKey;
    }
    //member登录
    public function login(){
        //1。根据用户名查找用户
        $member=Member::findOne(['username'=>$this->username]);
        //2,验证密码
        if($member){
            if(\yii::$app->security->validatePassword($this->password,$member->password_hash)){
                //3登录和自动登录
                $lifeTime=$member->rememberMe?7*24*3600:0;
                \yii::$app->user->login($member,$lifeTime);
                return true;
            }else{
                $this->addError('password','用户名或密码不正确');
            }
        }else{
            $this->addError('password','用户名或密码不正确');
        }
        return false;
    }
    //验证短信验证码
    public function validateSms()
    {
        //缓存里面没有该电话号码
        $value = Yii::$app->cache->get('tel_'.$this->tel);
        if(!$value || $this->smsCode != $value){
            $this->addError('smsCode','验证码不正确');
        }
    }
}