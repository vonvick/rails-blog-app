# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Permission.delete_all
permissions = Permission.create([
  { title: 'delete', description: 'Permissions for deleting only' },
  { title: 'edit', description: 'Permissions for editing only' },
  { title: 'private', description: 'Permissions for private viewing only' },
  { title: 'members', description: 'Permissions for registered members' }
])

Role.delete_all
roles = Role.create([
  { title: 'admin', description: 'Role for admin users'},
  { title: 'moderator', description: 'Role for moderators'},
  { title: 'regular', description: 'Role for regular users'},
])

Role.first.permissions << permissions
Role.second.permissions << permissions.second << permissions.fourth
Role.third.permissions << permissions.fourth
