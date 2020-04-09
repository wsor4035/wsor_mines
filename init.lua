math.randomseed(os.time())

minetest.register_node(
    "wsor_mines:mine",
    {
        description = "mine",
        tiles = {
            "8080.png" --top
            --"8080.png", --bottem
            --"8080.png", --right
            --"8080.png", --left
            --"8080.png", --back
            --"8080.png" --front
        },
        --paramtype = "light",
        --light_source = 13,
        groups = {cracky = 3, wood = 1},
        sounds = default.node_sound_wood_defaults(),
        drop = "wsor_mines:mine"
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
