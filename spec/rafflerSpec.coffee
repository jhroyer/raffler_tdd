describe 'Raffler class', ->
it 'should define an object', ->
expect(Raffler).toBeDefined();

  describe 'Raffler model', ->
    model = new Raffler.Models.Entry

    it 'can add name', ->
      model.set(name:"Larry")
      expect(model.get("name")).toEqual("Larry")

    it 'default value for winner is false', ->
      expect(model.get("winner")).toEqual(false)

    it 'can change winner to true', ->
      model.set(winner:true)
      expect(model.get("winner")).toEqual(true)  

  
  
    
  describe 'Raffler collection', ->
    
    collection = new Raffler.Collections.Entries


    it 'starts with zero entries', ->
      expect(collection.length).toEqual(0)

    it 'can add entries', ->
      currLength = collection.length
      collection.create name: "Gary"
      expect(collection.length).toEqual(currLength+1)


  describe 'Raffler router', ->

    Router = new Raffler.Routers.Entries;
    it 'should define a collection of entries', ->
      expect(Router.collection).toBeDefined()

    it 'should define default route as index', ->
      expect(Router.routes['']).toBe('index')

  
  describe 'Raffler view', ->

    view = null
    entries = null

    beforeEach ->
      entries = new Raffler.Routers.Entries
      view = new Raffler.Views.EntriesIndex(collection: entries.collection)


    it 'can reset winners', ->
      view.resetWinners()
      winner=view.collection.find (model) ->
        model.get("winner") is true
      expect(winner).toBeUndefined()

    it 'can choose winners', ->
      
      view.drawWinner()
      winner=view.collection.find (model) ->
        model.get("winner") is true
      expect(winner).toBeDefined()
      



        
      





