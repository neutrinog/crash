module Crash
  # The base class for a system.
  #
  # A system is part of the core functionality of the game. After a system is added to the engine, its
  # update method will be called on every frame of the engine. When the system is removed from the engine,
  # the update method is no longer called.
  #
  # The aggregate of all systems in the engine is the functionality of the game, with the update
  # methods of those systems collectively constituting the engine update loop. Systems generally operate on
  # node lists - collections of nodes. Each node contains the components from an entity in the engine
  # that match the node.
  abstract class System
    # Used internally to hold the priority of this system within the system list. This is
    # used to order the systems so they are updated in the correct order.
    @priority : Int32 = 0
    protected property priority

    # Used internally to hold the type of the system class.
    # This is used to retrieve systems by class type.
    @type : Crash::System.class = Crash::System
    protected property type

    #
    # Called just after the system is added to the engine, before any calls to the update method.
    # Override this method to add your own functionality.
    #
    # @param engine The engine the system was added to.
    #
    def add_to_engine(engine : Crash::Engine)
    end

    #
    # Called just after the system is removed from the engine, after all calls to the update method.
    # Override this method to add your own functionality.
    #
    # @param engine The engine the system was removed from.
    #
    def remove_from_engine(engine : Crash::Engine)
    end

    #
    # After the system is added to the engine, this method is called every frame until the system
    # is removed from the engine. Override this method to add your own functionality.
    #
    # If you need to perform an action outside of the update loop (e.g. you need to change the
    # systems in the engine and you don't want to do it while they're updating) add a listener to
    # the engine's updateComplete signal to be notified when the update loop completes.
    #
    def update
    end
  end
end
