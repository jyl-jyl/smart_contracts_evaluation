contract Shib {
  struct TotalInTuple {
    uint n;
    bool _valid;
  }
  struct TotalOutTuple {
    uint n;
    bool _valid;
  }
  struct OwnerTuple {
    address p;
    bool _valid;
  }
  struct TotalMintTuple {
    uint n;
    bool _valid;
  }
  struct AllMintTuple {
    uint n;
    bool _valid;
  }
  struct AllowanceTuple {
    uint n;
    bool _valid;
  }
  struct TotalBurnTuple {
    uint n;
    bool _valid;
  }
  struct TotalBalancesTuple {
    uint m;
    bool _valid;
  }
  struct AllBurnTuple {
    uint n;
    bool _valid;
  }
  mapping(address=>TotalInTuple) totalIn;
  mapping(address=>TotalOutTuple) totalOut;
  mapping(address=>TotalBurnTuple) totalBurn;
  OwnerTuple owner;
  mapping(address=>TotalMintTuple) totalMint;
  AllMintTuple allMint;
  TotalBalancesTuple totalBalances;
  AllBurnTuple allBurn;
  mapping(address=>mapping(address=>AllowanceTuple)) allowance;
  event Burn(address p,uint amount);
  event Mint(address p,uint amount);
  event DecreaseAllowance(address p,address s,uint n);
  event IncreaseAllowance(address p,address s,uint n);
  event Transfer(address from,address to,uint amount);
  constructor(uint name,uint symbol,uint decimals,uint totalSupply,address feeReceiver,address tokenOwnerAddress) public {
    updateBalanceOfOnInsertConstructor_r0(totalSupply,tokenOwnerAddress);
    updateSendOnInsertConstructor_r2(feeReceiver);
    updateTotalSupplyOnInsertConstructor_r4(totalSupply);
    updateOwnerOnInsertConstructor_r15();
    updateTotalBalancesOnInsertConstructor_r28(totalSupply);
  }
  function getTotalSupply() public view  returns (uint) {
      uint n = totalSupply();
      return n;
  }
  function getAllowance(address p,address s) public view  returns (uint) {
      uint n = allowance[p][s].n;
      return n;
  }
  function burn(uint amount) public    {
      bool r5 = updateBurnOnInsertRecv_burn_r5(amount);
      if(r5==false) {
        revert("Rule condition failed");
      }
  }
  function approve(address s,uint n) public    {
      bool r18 = updateIncreaseAllowanceOnInsertRecv_approve_r18(s,n);
      bool r13 = updateDecreaseAllowanceOnInsertRecv_approve_r13(s,n);
      if(r18==false && r13==false) {
        revert("Rule condition failed");
      }
  }
  function transfer(address to,uint amount) public    {
      bool r20 = updateTransferOnInsertRecv_transfer_r20(to,amount);
      if(r20==false) {
        revert("Rule condition failed");
      }
  }
  function decreaseAllowance(address s,uint n) public    {
      bool r24 = updateDecreaseAllowanceOnInsertRecv_decreaseAllowance_r24(s,n);
      if(r24==false) {
        revert("Rule condition failed");
      }
  }
  function getBalanceOf(address p) public view  returns (uint) {
      uint n = balanceOf(p);
      return n;
  }
  function increaseAllowance(address s,uint n) public    {
      bool r11 = updateIncreaseAllowanceOnInsertRecv_increaseAllowance_r11(s,n);
      if(r11==false) {
        revert("Rule condition failed");
      }
  }
  function transferFrom(address from,address to,uint amount) public    {
      bool r26 = updateTransferFromOnInsertRecv_transferFrom_r26(from,to,amount);
      if(r26==false) {
        revert("Rule condition failed");
      }
  }
  function updateSendOnInsertConstructor_r2(address p) private    {
      uint n = msg.value;
      payable(p).send(n);
  }
  function updateDecreaseAllowanceOnInsertRecv_decreaseAllowance_r24(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      updateDecreaseAllowanceTotalOnInsertDecreaseAllowance_r8(o,s,n);
      emit DecreaseAllowance(o,s,n);
      return true;
      return false;
  }
  function updateIncreaseAllowanceOnInsertRecv_approve_r18(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      uint m = allowance[o][s].n;
      if(n>=m) {
        uint d = n-m;
        updateIncreaseAllowanceTotalOnInsertIncreaseAllowance_r29(o,s,d);
        emit IncreaseAllowance(o,s,d);
        return true;
      }
      return false;
  }
  function updateAllBurnOnInsertBurn_r27(uint n) private    {
      int delta0 = int(n);
      updateTotalSupplyOnIncrementAllBurn_r17(delta0);
      allBurn.n += n;
  }
  function updateAllowanceOnIncrementIncreaseAllowanceTotal_r1(address o,address s,int m) private    {
      int _delta = int(m);
      uint newValue = updateuintByint(allowance[o][s].n,_delta);
      allowance[o][s].n = newValue;
  }
  function updateTotalSupplyOnInsertConstructor_r4(uint n) private    {
      // Empty()
  }
  function updateBalanceOfOnIncrementTotalBurn_r7(address p,int m) private    {
      // Empty()
  }
  function updateuintByint(uint x,int delta) private   returns (uint) {
      int convertedX = int(x);
      int value = convertedX+delta;
      uint convertedValue = uint(value);
      return convertedValue;
  }
  function updateBurnOnInsertRecv_burn_r5(uint n) private   returns (bool) {
      address s = msg.sender;
      uint m = balanceOf(s);
      if(s!=address(0) && n<=m) {
        updateTotalBurnOnInsertBurn_r16(s,n);
        updateAllBurnOnInsertBurn_r27(n);
        emit Burn(s,n);
        return true;
      }
      return false;
  }
  function updateTransferFromOnInsertRecv_transferFrom_r26(address o,address r,uint n) private   returns (bool) {
      address s = msg.sender;
      uint k = allowance[o][s].n;
      uint m = balanceOf(o);
      if(m>=n && k>=n) {
        updateSpentTotalOnInsertTransferFrom_r9(o,s,n);
        updateTransferOnInsertTransferFrom_r12(o,r,n);
        return true;
      }
      return false;
  }
  function updateAllowanceOnIncrementDecreaseAllowanceTotal_r1(address o,address s,int d) private    {
      int _delta = int(-d);
      uint newValue = updateuintByint(allowance[o][s].n,_delta);
      allowance[o][s].n = newValue;
  }
  function updateBalanceOfOnInsertConstructor_r0(uint n,address p) private    {
      // Empty()
  }
  function totalSupply() private view  returns (uint) {
      uint b = allBurn.n;
      uint m = allMint.n;
      uint n = m-b;
      return n;
  }
  function updateTotalBurnOnInsertBurn_r16(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalBurn_r7(p,delta0);
      totalBurn[p].n += n;
  }
  function updateTransferOnInsertTransferFrom_r12(address o,address r,uint n) private    {
      updateTotalInOnInsertTransfer_r30(r,n);
      updateTotalOutOnInsertTransfer_r22(o,n);
      emit Transfer(o,r,n);
  }
  function updateTransferOnInsertRecv_transfer_r20(address r,uint n) private   returns (bool) {
      address s = msg.sender;
      uint m = balanceOf(s);
      if(n<=m) {
        updateTotalInOnInsertTransfer_r30(r,n);
        updateTotalOutOnInsertTransfer_r22(s,n);
        emit Transfer(s,r,n);
        return true;
      }
      return false;
  }
  function updateSpentTotalOnInsertTransferFrom_r9(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementSpentTotal_r1(o,s,delta0);
  }
  function updateIncreaseAllowanceTotalOnInsertIncreaseAllowance_r29(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementIncreaseAllowanceTotal_r1(o,s,delta0);
  }
  function balanceOf(address p) private view  returns (uint) {
      uint i = totalIn[p].n;
      uint o = totalOut[p].n;
      uint m = totalBurn[p].n;
      uint n = totalMint[p].n;
      uint s = ((n+i)-m)-o;
      return s;
  }
  function updateBalanceOfOnIncrementTotalIn_r7(address p,int i) private    {
      // Empty()
  }
  function updateBalanceOfOnIncrementTotalOut_r7(address p,int o) private    {
      // Empty()
  }
  function updateTotalInOnInsertTransfer_r30(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalIn_r7(p,delta0);
      totalIn[p].n += n;
  }
  function updateIncreaseAllowanceOnInsertRecv_increaseAllowance_r11(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      updateIncreaseAllowanceTotalOnInsertIncreaseAllowance_r29(o,s,n);
      emit IncreaseAllowance(o,s,n);
      return true;
      return false;
  }
  function updateOwnerOnInsertConstructor_r15() private    {
      address s = msg.sender;
      owner = OwnerTuple(s,true);
  }
  function updateTotalOutOnInsertTransfer_r22(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalOut_r7(p,delta0);
      totalOut[p].n += n;
  }
  function updateAllowanceOnIncrementSpentTotal_r1(address o,address s,int l) private    {
      int _delta = int(-l);
      uint newValue = updateuintByint(allowance[o][s].n,_delta);
      allowance[o][s].n = newValue;
  }
  function updateDecreaseAllowanceOnInsertRecv_approve_r13(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      uint m = allowance[o][s].n;
      if(n<m) {
        uint d = m-n;
        updateDecreaseAllowanceTotalOnInsertDecreaseAllowance_r8(o,s,d);
        emit DecreaseAllowance(o,s,d);
        return true;
      }
      return false;
  }
  function updateTotalBalancesOnInsertConstructor_r28(uint n) private    {
      totalBalances = TotalBalancesTuple(n,true);
  }
  function updateTotalSupplyOnIncrementAllBurn_r17(int b) private    {
      // Empty()
  }
  function updateDecreaseAllowanceTotalOnInsertDecreaseAllowance_r8(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementDecreaseAllowanceTotal_r1(o,s,delta0);
  }
}