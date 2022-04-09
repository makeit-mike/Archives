#include <iostream>
#include <string>

#pragma region Without Virtual Functions
class Entity
{
public:
    std::string GetName() { return "Entity"; }
};

class Player : public Entity
{
private:
    std::string m_Name;

public:
    Player(const std::string &name) : m_Name(name) {}

    std::string GetName() { return m_Name; } // cant be marked "override"
};
void printName(Entity *entity)
{
    std::cout << entity->GetName() << std::endl;
}
#pragma endregion

#pragma region With Virtual Functions
class EntityV
{
public:
    virtual std::string GetName() { return "Entity"; } // Tells Compiler to generate a V-Table for this function, such that when this is called, it can accurately point to the over-ridden method.
};

class PlayerV : public EntityV
{
private:
    std::string m_Name;

public:
    PlayerV(const std::string &name) : m_Name(name) {}

    std::string GetName() override { return m_Name; } // "override" is not required, but makes it easier to see what the program is doing
};
void printName(EntityV *entity)
{
    std::cout << entity->GetName() << std::endl;
}
#pragma endregion

int main()
{

    Entity *e1 = new Entity();
    printName(e1); // Prints "Entity" as expected

    Player *p1 = new Player("I am not virtual");
    printName(p1);
    ; // Would have expected "Cherno" to print, but this also prints "Entity" because it is not virtualized

    PlayerV *pv = new PlayerV("I am totes virtual");
    printName(pv); // Prints "I am totes virtual" as expected

    std::cout << "hello there";
    return 0;
}

/*
    Virtual Functions.
        Basically, these allow overriding for classes.

    Downside:
    1, needs additional mem for storing in V-Table.
    2. On every call another read is needed in the V-Table (more operations).

    in practice, this is likely negligable.
*/