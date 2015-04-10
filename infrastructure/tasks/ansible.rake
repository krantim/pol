#
# Wrapper tasks for ansible
#

namespace :ansible do
  namespace :create do
    desc "Create a new role"
    task :role, :name do |t, args|
      set_role_template(args.name)
    end
  end

  desc "Create an image of the inventory structure"
  task :graph do
    FileUtils.mkdir_p "doc"
    `bin/inventory-grapher -i ansible/inventory.yml -d test all -o -  | dot -Tpng > doc/inventory_graph.png`
  end

  desc "Test roles with syntax-check"
  task :syntax_check do
    sh "ansible-playbook --syntax-check -i ansible/inventory.yml ansible/playbook.yml"
  end
end
