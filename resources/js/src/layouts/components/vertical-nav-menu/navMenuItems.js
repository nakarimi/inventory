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
                name: "Branches",
                slug: "branch-list",
            },
            {
                url: "/apps/list/account",
                name: "Accounts",
                slug: "account-list",
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
            },
            {
                url: "/apps/add/account",
                name: "Account",
                slug: "account-add",
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
                url: "/user/register",
                name: "Register",
                slug: "register",
                icon: "UserPlusIcon"
            },
            {
                url: "/list/users",
                name: "Users List",
                slug: "users-list",
                icon: "UsersIcon"
            },
        ]
    },
    {
        url: "/pages/logout",
        name: "Logout",
        slug: "logout",
        icon: "LogOutIcon"
    }
];
