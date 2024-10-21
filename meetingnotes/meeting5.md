# meeting notes 5

- no longer doing "as you like it"

- `<depiction>`
    - `role=""`, add "respect"
- chara name vs sp chara 
- `<act number="">` `<scene number="">`
- marking up gender when necessary vs all the time 

- relax ng draft sunday night: bradley

- html homepage: lily

- read me: quinn? 



- MARKUP LIST: 
- `<play>` : root element
- `<meta>` : forematter, not important
- `<toc>` : table of contents, if applicable
- `<chara>` : each character that speaks during the play
    - attributes: `name=""` `gender=""` `dress=""`
        - dress is primarily for cross-dressing, so this should be "male" or "female"
- `<act number="">` 
- `<scene number="">`
- `<stage>` : stage directions 
-  `<tone vibe="">` : 
    - ADDED: ("anger" "sad" "guilt" "romantic" "happy" "comedic" "begging")
- `<color>`
    - `is=""` : here is where you define the color being prescribed
    - `context=""` : here you'll explain what the context the color is being used in ("purity", "unloyalty", "sin")
- `<depiction>`
    - `role=""` ("wife" "mother" "villain" "victim" "smart" "insanity" "patriarch" "race" "class" "weakness" "aside" "manipulation" "impure" "respect")
    - `gender=""` ("male" or "female")
- `<power>` element
    - use `role` as attribute, can add any other attributes that seem fit
        - note that "aside" is under the `role` attribute
- `<sp>` as element for speaker, `chara` as attribute to who is speaking
- `<violence>` element
    - `type` attribute = ("threat" "insult" "murder" "plotting" "sex")
- `<love>` element
    - `action` attribute = ("wedding" "verbal" "physical") 