# Meeting 4 notes!

## Check-in
- need more markup, more things to choose from 

## Things to update
- tone: more emotions represented, "anger, revenge"
- insulting things
- asides, revealing motives
- actions? 
- combining the role attribute and type attribute values

## Markdown: 
- `<play>` : root element
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
    - `role=""` ("wife" "mother" "villain" "victim" "smart" "insanity" "patriarch" "race" "class" "weakness" "aside" "manipulation" "impure")
    - `gender=""` ("male" or "female")
- `<power>` element
    - use `role` as attribute, can add any other attributes that seem fit
        - note that "aside" is under the `role` attribute
- `<sp>` as element for speaker, `chara` as attribute to who is speaking

#### Adding: 
- `<violence>` element
    - `type` attribute = ("threat" "insult" "murder" "plotting" "sex")
- `<love>` element
    - `action` attribute = ("wedding" "verbal" "physical") 

## For next week: 
- Go through all of your files and adjust your markup as needed! By next week, we should freeze our initial markup, that way we can begin on Relax NG. 
