function setDefault(selector, default_value){
  $(selector).each(function(i){
    this.default_value = default_value;
    this.showDefault = showDefault;
    this.showDefault();
    
    this.removeDefault = removeDefault
    $(this).focus(removeDefault)
    
    // if the page isn't displaying the default value for some reason
    // when the page loads, display it when the input's contents
    // are cleared.
    if(this.value != this.default_value && this.value != "")
    {
      $(this).keyup(function(){
        if(this.value == "" && this.defaultShown != true){
          this.defaultShown = true;
          this.showDefault()
        } else {
          this.removeDefault()
        }
      })
    }
  })
}

function setDefaults() {  
  setDefault("#verb_command", "point target")
  setDefault("#verb_your_status", "standing/sitting/kneeling/hiding/invis")
  setDefault("#verb_roundtime", "0")
  setDefault("#verb_you_see", "You point at Zirakh.")
  setDefault("#verb_target_sees", "Barumpharumph points at you.")
  setDefault("#verb_others_see", "Barumpharumph points at Zirakh.")
  setDefault("#verb_notes", "Pointing is rude!")
  setDefault("#verb_tag_list", "races, guilds, comma-separated")
}

function showDefault(){
  if(this.value == "") this.value = this.default_value
  if(this.value == this.default_value) $(this).addClass("defaulted")
}

function removeDefaults(){
  // default default value
  $("input[type=text], input[type=password], textarea")
    .each(function(){
      if(this.default_value == undefined)
      {
        this.default_value = ""
      } 
    })
    
  $("input[type=text], input[type=password], textarea").focus(removeDefault)
  $("form").submit(function(){
    $("input[type=text], input[type=password], textarea").each(removeDefault)
  })
}

function removeDefault(){
  if($(this).hasClass("defaulted")){
    this.value = ""
  }
  $(this).removeClass("defaulted")
}

$(setDefaults)
$(removeDefaults)