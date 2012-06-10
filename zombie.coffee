class Human
  constructor: (name) ->
    @name = name ? 'Some guy'

  eat: (food) ->
    food ||= 'a donut'
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
    Human::name = name ? 'A random zombie'

  canDance : true

  # override with call to base
  eat: (food) ->
    food ||= 'brain'
    Human::eat food

  # override with no call to base
  walk: (walks_on) ->
    walks_on ||= 'freeway'
    console.log "#{@name} shambles down the #{walks_on}."

  # override with static value
  # Since zombies can't really speak, only allow them to groan.
  say: ->
    Human::say 'mmmmmmrrrrrrpppphhhh!'

  # override with conditional clause
  # Cuz if you dance anything else, they're all gonna laugh at you.
  dance: -> 
    Human::dance 'Thriller' if @canDance

  # extended method
  kill: (weapon) ->
    weapon ||= 'shotgun'
    console.log "#{@name} is killed with a #{weapon}."


obj = new Human 'Bert'
obj.eat()
obj.walk()
obj.say 'Hola!'
obj.dance()

try
  obj.kill()
catch err
  console.log "#{obj.name} cannot be killed.  Exception was '#{err}'"

console.log ''

obj = new Zombie 'Larry'
obj.eat()
obj.walk()
obj.say 'Hola!'
obj.canDance = false
obj.dance() # Larry never made the cut for MJ's video back in the 80s so he can't dance.
obj.kill 'chainsaw'
console.log ''

obj = new Zombie 'Rob' # lolz, Rob Zombie
obj.eat 'your leg' # Note that you don't need parenthsis if you're passing a parameter.
                   # Probably b/c Coffee assumes that anything with a param is going to be a method.
obj.walk()
obj.say()
obj.dance 'Zombie Slide'
obj.kill()
console.log ''