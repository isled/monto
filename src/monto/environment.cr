require "./environment/**"

module Monto::Environment
    alias EnvType = String | Symbol

    # macro 钩子：
    # inherited在定义子类时调用。@type是继承类型。
    # included在包含模块时被调用。@type是包含类型。
    # extended在扩展模块时被调用。@type是扩展类型。
    # method_missing 在未找到方法时调用。
    # method_added 在当前范围中定义新方法时调用。
    # finished 在所有类的实例变量类型已知之后调用。
    macro included 
        class_property path : String = "./config/environments/"
        @@settings : String?

        def self.settings
            @@settings ||= Loader.new(self.env.to_s, path).settings
        rescue Monto::Exceptions::Environment
            @@settings = Settings.from_yaml("default: settings")
        end

        def self.logger
            self.settings.logger
        end

        def self.env=(env : EnvType)
            @@evn = Env.new(env.to_s)
        end

        def self.env
            @@env ||=Env.new
        end
    end
end