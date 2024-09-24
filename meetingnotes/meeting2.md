# Meeting notes, #2:

# Agenda:
- Go over texts, plots
- Think about comparisons
- Come up with a plan for markup

# Discussion: 
- Titus Andronicus: story of revenge and violence
    - Titus returns to war from Rome, captures woman and sons, kills her oldest son
    - She's out for him!
    - Emperor of Rome marries her, then plan revenge against Titus 
    - Frame killing on Titus' sons, rape and mutilate the wife of someone they killed (Titus' daughter) 
    - Titus then kills two of her sons, bakes them in a pie, serves it to the mother 
    - Reveals that she's eating a pie with her sons, kills basically everyone after that
    - Erin the moor, secret lover of woman 
        - markup: barbarism vs civilization, women and revenge vs men and violence (portrayal of evil capacities)
        - blood, madness, power 
- Othello: Othello comes back from war, is going to marry Desdemona
    - talk about Othello's race and how he can taint her purity
    - Iago and revenge, planning to destroy relationship 
    - Handkerchief, fragility, betrayal
        - markup: talks of beauty, purity
    - kills Desdemona
        - markup: betrayal, race relations and power, darkness = badness
- As You Like It: cross dressing
    - Rosalynd and Cecilia get banished 
        - Cecilia is one way or the other, loyal and love
        - Rosalynd is adventurous, smart, mature
        - men: volatile, but sad 
    - Rosalynd's cross dressing 
        - teaches men how to be more romantic
    - Almost everybody except for a few people get married 
    - ends in quadruple wedding
- Much Ado: comedy with layered romances 
    - word play 
    - women all portrayed distinctly
    - Beatrice and Benedick 
        - shrew 
        - weakness of women
    - Claudio and Hero marriage and seemingness, cheating, unloyalty
        - colors 
    - "seeming" 

# Markup 
- talking about female faculty, autonomy, role
    - mother, wife, lover, damned
    - only way to have agency is when dressed as a man
- power relations 
- colors 

# Elements
- `<play>` : root element
- `<chara>` : each character that speaks during the play
    - attributes: `name=""` `gender=""` `dress=""`
        - dress is primarily for cross-dressing, so this should be "male" or "female"
- `<act number="">` 
- `<scene number="">`
- `<stage>` : stage directions 
-  `<tone vibe="">` : "positive" "neutral" "negative" 
    - can expand later
- `<color>`
    - `is=""` : here is where you define the color being prescribed
    - `context=""` : here you'll explain what the context the color is being used in ("purity", "unloyalty", "sin")
- `<depiction>`
    - `role=""` ("wife" "mother" "villain" "victim" "smart" "insanity")
    - `gender=""` ("male" or "female")
    
# Terminal instructions:
- First, you'll have to go into the terminal and make sure you're in the "shakespeare" folder directory. 
    - For me, it's "cd desktop/shakespeare" 
    - If you're unsure, you can do cd ./shakespeare (this says: any folder can contain this, just take me to shakespeare)
- EVERY TIME you go into the terminal, you'll start with "git pull"
    - This will update anything that your teammates have pushed to the terminal and get you on track before pushing new docs
- Next, you'll do "git status" 
    - This will update your own working tree and let you know what changes have been made
- "git add ."
    - This adds every file that has been modified or added to the repo
- "git commit -m "...""
    - What you put in the "" is the message that will appear on our Github. You'll just add a brief explanation of what you did, for example "markup" (you can go on our Github and see the messages I've done, too)
- "git push" 
    - This is what sends everything to everyone else's repo! But, they all will have to "git pull" to see these changes. It's one big cycle :)
