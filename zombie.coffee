class Human
  constructor: (name) ->
    @name = name ? 'Some guy'

  eat: (food) ->
    food ||= 'a doughnut'
    console.log "#{@name} eats #{food}."

  walk: (walks_on) ->
    walks_on ||= 'road'
    console.log "#{@name} walks down the #{walks_on}."

  say: (text_to_say) ->
    text_to_say ||= '...'
    console.log "#{@name} says '#{text_to_say}'."

  dance: (move) ->
    move ||= 'Chicken Dance'
    console.log "#{@name} dances the #{move}."

class Zombie extends Human
  constructor: (name) ->
    Human::name = name ? 'Some guy'

  canDance : true

  eat: (food) ->
    food ||= 'brain'
    Human::eat food

  walk: (walks_on) ->
    walks_on ||= 'freeway'
    Human::walk walks_on 

  # Since zombies can't really speak, only allow them to groan.
  say: ->
    Human::say 'mmmmmmrrrrrrpppphhhh!'

  dance: -> 
    Human::dance 'Thriller' if @canDance


guy = new Human 'Bert'
guy.eat()
guy.walk()
guy.say('Hola!')
guy.dance()
console.log ''

guy = new Zombie 'Larry'
guy.eat()
guy.walk()
guy.say('Hola!')
guy.canDance = false
guy.dance() # Larry never made the cut for the Thriller video back in the 80s so he can't dance.
console.log ''

guy = new Zombie 'Rob' # lolz, Rob Zombie
guy.eat('your leg')
guy.walk()
guy.say()
guy.dance('Zombie Slide')
