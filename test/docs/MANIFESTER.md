# **Manifester Tests**

## **CONSTANTS**
- [ .. ] **INIT_CODE_PAIR_HASH**
    - [ .. ] verify hash
- [ .. ] **wnativeAddress**
    - [ .. ] verify address
- [ .. ] **usdcAddress**
    - [ .. ] verify address
- [ .. ] **nativeOracle**
    - [ .. ] verify oracle
- [ .. ] **nativeSymbol**
    - [ .. ] verify symbol
- [ .. ] **oracleDecimals**
    - [ .. ] verify decimals

## **VARIABLES**
- [ .√. ] **isPaused**
    - [ .√. ] **togglePause(true**)
    - [ .√. ] **togglePause(false)**
- [ .. ] **bloodSacrifice**
    - [ .. ] **updateSacrifice**
        - [ .. ] updates: **bloodSacrifice**
        - [ .. ] calculate: **getSacrifice**()
- [ .. ] **enchantedShare**
    - [ .. ] **updateSacrifice**
        - [ .. ] updates: **enchantedShare**
- [ .. ] **soulDAO**
    - [ .. ] **([ updateDAO ])**
        - [ .. ] updates soulDAO
- [ .. ] **SoulSwapFactory**
    - [ .. ] **([ updateFactory ])**
        - [ .. ] updates SoulSwapFactory
- [ .. ] **totalManifestations**
    - [ .. ] increments upon manifestation created  
- [ .. ] **manifestations[]**
    - [ .. ] checks indexed mAddress: when new manifestation created  
- [ .. ] **daos[]**
    - [ .. ] verify indexed daoAddress: when new manifestation created  

## **Manifestations**
- [ .. ] **createManifestation()**
    - [ .. ] [insert expectations...]
- [ .. ] **initializeManifestation()**
    - [ .. ] [insert expectations...]
- [ .. ] **launchManifestation()**
    - [ .. ] [insert expectations...]

## **Modifiers**
- [ .√. ] **whileActive()**
    - [ .. ] createManifestation()
- [ .. ] **exists(id, limit)**
    - [ .. ] **initializeManifestation()**

## **Getters**
- [ .. ] **getUserInfo()**
    - [ .. ] verify: expectations vs. results