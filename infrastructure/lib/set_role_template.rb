def set_role_template(role_name)
  role_dir = File.join("ansible", "roles", role_name)

  %w[
    defaults
    files
    handlers
    meta
    tasks
    templates
    vars
  ].each do |sub_dir|
    FileUtils.mkdir_p File.join(role_dir, sub_dir)

    case sub_dir
    when "meta"
      f = File.new(File.join(role_dir, sub_dir, "main.yml"), "wb")
      f.puts <<-CONTENT.gsub(/^ {8}/, '')
        ---
        galaxy_info:
          author: SCB 10x Team
          description: Installs/Configures #{role_name} settings
          company: SCB
          license: MIT
          min_ansible_version: 1.6
          platforms:
            - name: CentOS
              versions:
                - all
          categories:
            - system
        dependencies: []
      CONTENT
      f.close
    when "files", "templates"
      # nothing
    else
      f = File.new(File.join(role_dir, sub_dir, "main.yml"), "wb")
      f.puts <<-CONTENT.gsub(/^ {8}/, '')
        ---
        # #{sub_dir} file for #{role_name}
      CONTENT
      f.close
    end
  end

  f = File.new(File.join(role_dir, "README.md"), "wb")
  f.puts  <<-CONTENT.gsub(/^ {4}/, '')
    # Overview

    Installs and configures #{role_name}.


    ## Requirements

    none

    ## Role Variables

    none

    ## Dependencies

    none

    ## Example Playbook

        - hosts: all
          roles:
             - role: #{role_name}

    ## License

    MIT

    ## Author Information

    SCB 10x Team <scb10x@gmail.com>
  CONTENT
  f.close
end
