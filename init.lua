minetest.register_node(
    "wsor_mines:mine",
    {
        description = "mine",
        tiles = {
            "8080.png"
        },
        groups = {cracky = 3, wood = 1},
        drop = "wsormine:mine",
        on_construct = function(pos)
            local timer = minetest.get_node_timer(pos)
            minetest.chat_send_all("arming")
            timer:start(5)
        end,
        on_timer = function(pos, elapsed)
            local objs = minetest.get_objects_inside_radius(pos, 6)
            for _, obj in pairs(objs) do
                local name = obj:get_player_name()
                if name ~= nil then
                    obj:set_hp(obj:get_hp() - 2)
                    minetest.swap_node(pos, {name = "air"})
                end
            end
            minetest.get_node_timer(pos):start(1)
        end
    }
)

minetest.register_craft(
    {
        type = "shapeless",
        output = "wsor_mines:mine 1",
        recipe = {
            "default:stone",
            "default:stone",
            "default:stick"
        }
    }
)
