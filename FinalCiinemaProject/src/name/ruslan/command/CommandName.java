package name.ruslan.command;

public enum CommandName {
    LOGIN(new Authorization()); 
    
    
    protected Command command;

    CommandName(Command command) {
        this.command = command;
    }
}
