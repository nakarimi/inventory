export default [
    {
        url: "/",
        name: "Home",
        slug: "home",
        icon: "HomeIcon",
        rule: 'isAdmin',
    },
    {
        url: null,
        name: "Content List",
        icon: "ListIcon",
        rule: 'isCustomer',
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
            },
            {
                url: "/apps/list/stock",
                name: "Stocks",
                slug: "stock-list",
            },
            {
                url: "/apps/list/product",
                name: "Products",
                slug: "product-list",
            },
            {
                url: "/apps/list/sale",
                name: "Sales",
                slug: "sale-list",
            },
            {
                url: "/apps/list/purchase",
                name: "Purchases",
                slug: "purchase-list",
            },
            {
                url: "/apps/list/payment",
                name: "Payments",
                slug: "payment-list",
            },
            {
                url: "/apps/list/fixpayment",
                name: "Fix Payments",
                slug: "fixpayment-list",
            },
            {
                url: "/apps/list/transfer",
                name: "Transfers",
                slug: "transfer-list",
            },
            {
                url: "/apps/list/transaction",
                name: "Transactions",
                slug: "transaction-list",
            },
            {
                url: "/apps/list/order",
                name: "Order",
                slug: "order-list",
            }
        ].reverse()
    },
    {
        url: null,
        name: "Add Content",
        icon: "PlusSquareIcon",
        // i18n: 'eCommerce',
        rule: 'isCustomer',
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
            },
            {
                url: "/apps/add/stock",
                name: "Stock",
                slug: "stock-add",
            },
            {
                url: "/apps/add/product",
                name: "Product",
                slug: "product-add",
            },
            {
                url: "/apps/add/sale",
                name: "Sale",
                slug: "sale-add",
            },
            {
                url: "/apps/add/purchase",
                name: "Purchase",
                slug: "purchase-add",
            },
            {
                url: "/apps/add/payment",
                name: "Payment",
                slug: "payment-add",
            },
            {
                url: "/apps/add/fixpayment",
                name: "Fix Payment",
                slug: "fixpayment-add",
            },
            {
                url: "/apps/add/transfer",
                name: "Transfer",
                slug: "transfer-add",
            },
            {
                url: "/apps/add/order",
                name: "Order",
                slug: "order-add",
            }
        ].reverse()
    },
    {
        url: null,
        name: "Users",
        icon: "UsersIcon",
        rule: 'isAccounter',
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
        url: '/manage/reports',
        name: "Reports",
        icon: "FileTextIcon",
        rule: 'isAdmin',
    },
    {
        url: null,
        name: "General",
        icon: "SettingsIcon",
        rule: 'isAccounter',
        submenu: [
            {
                url: '/manage/category',
                name: "Category Management",
                slug: "category",
            },
            {
                url: '/manage/activity-log',
                name: "Activity Log",
                slug: "activity-log",
            },
            {
                url: '/manage/notifications',
                name: "All Notifications",
                slug: "manage-notifications",
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
