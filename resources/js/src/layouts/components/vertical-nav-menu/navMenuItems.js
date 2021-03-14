export default [
    {
        url: "/",
        name: "Home",
        slug: "home",
        icon: "HomeIcon"
    },
    {
        url: null,
        name: "Content List",
        icon: "ListIcon",
        submenu: [
            {
                url: "/apps/list/branch",
                name: "Branch",
                slug: "branch-list",
            }
        ]
    },
    {
        url: null,
        name: "Add Content",
        icon: "PlusSquareIcon",
        // i18n: 'eCommerce',
        submenu: [
            {
                url: "/apps/add/branch",
                name: "Branch",
                slug: "branch-add",
            }
        ]
    },
    {
        url: null,
        name: "Users",
        icon: "UsersIcon",
        // i18n: 'eCommerce',
        submenu: [
            {
                url: "/register",
                name: "Register",
                slug: "register",
                icon: "UserPlusIcon"
            }
        ]
    },
    {
        url: "/pages/logout",
        name: "Logout",
        slug: "logout",
        icon: "LogOutIcon"
    }
];
