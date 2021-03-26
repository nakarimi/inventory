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
            },
            {
                url: "/apps/list/customer",
                name: "Customers",
                slug: "customer-list",
            },
            {
                url: "/apps/list/vendor",
                name: "Vendors",
                slug: "vendor-list",
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
            },
            {
                url: "/apps/add/customer",
                name: "Customer",
                slug: "customer-add",
            },
            {
                url: "/apps/add/vendor",
                name: "Vendor",
                slug: "vendor-add",
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
        url: null,
        name: "General",
        icon: "SettingsIcon",
        submenu: [
            {
                url: {name: 'manage-category'},
                name: "Category Management",
                slug: "category",
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
