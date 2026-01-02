import area

print("1. Area of Circle")
print("2. Area of Triangle")
print("3. Area of Square")
print("4. Area of Rectangle")

choice = int(input("Enter your choice: "))

if choice == 1:
    area.circle()
elif choice == 2:
    area.triangle()
elif choice == 3:
    area.square()
elif choice == 4:
    area.rectangle()
else:
    print("Invalid choice")