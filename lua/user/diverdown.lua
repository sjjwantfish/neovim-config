local status_ok, diverdown = pcall(require, "diverdown")
if not status_ok then
    print("require diverdown failed")
    return
end

diverdown.setup({
    databases = {
        {
            name = "ge from setup",
            category = "mysql",
            desc = "golden-experience project mysql db",
            host = "127.0.0.1",
            user = "root",
            passwd = "123456",
            db = "golden-experience",
        }
    }
})
