package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1214:BigInteger;
      
      private var var_605:BigInteger;
      
      private var var_1490:BigInteger;
      
      private var var_1491:BigInteger;
      
      private var var_1935:BigInteger;
      
      private var var_1934:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1214 = param1;
         var_1490 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1935.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1491 = new BigInteger();
         var_1491.fromRadix(param1,param2);
         var_1935 = var_1491.modPow(var_605,var_1214);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1934.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1214.toString() + ",generator: " + var_1490.toString() + ",secret: " + param1);
         var_605 = new BigInteger();
         var_605.fromRadix(param1,param2);
         var_1934 = var_1490.modPow(var_605,var_1214);
         return true;
      }
   }
}
