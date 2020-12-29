!function (document, window, $) {
    "use strict";
    var Site = window.Site;
    $(document).ready(function ($) {

    }), jsGrid.setDefaults({
        tableClass: "jsgrid-table table table-striped table-hover"
    }), jsGrid.setDefaults("text", {
        _createTextBox: function () {
            return $("<input>").attr("type", "text").attr("class", "form-control input-sm")
        }
    }), jsGrid.setDefaults("number", {
        _createTextBox: function () {
            return $("<input>").attr("type", "number").attr("class", "form-control input-sm")
        }
    }), jsGrid.setDefaults("textarea", {
        _createTextBox: function () {
            return $("<input>").attr("type", "textarea").attr("class", "form-control")
        }
    }), jsGrid.setDefaults("control", {
        headerTemplate: function () {
            return "THAO TÁC";
        },
        _createGridButton: function (cls, tooltip, clickHandler) {
            var grid = this._grid;
            return $("<button>").addClass(this.buttonClass).addClass(cls).attr({
                type: "button",
                title: tooltip
            }).on("click", function (e) {
                clickHandler(grid, e)
            })

        }
    }), jsGrid.setDefaults("select", {
        _createSelect: function () {
            var $result = $("<select>").attr("class", "form-control input-sm"),
                valueField = this.valueField,
                textField = this.textField,
                selectedIndex = this.selectedIndex;
            return $.each(this.items, function (index, item) {
                var value = valueField ? item[valueField] : index,
                    text = textField ? item[textField] : item,
                    $option = $("<option>").attr("value", value).text(text).appendTo($result);
                $option.prop("selected", selectedIndex === index)
            }), $result
        }
    }),
        function () {
            $("#basicgrid").jsGrid({
                height: "500px",
                width: "100%",
                editing: !0,
                sorting: !0,
                paging: !0,
                autoload: !0,
                pageSize: 15,
                pageButtonCount: 5,
                deleteConfirm: "Bạn có chắc chắn xóa sản phẩm này?",
                controller: db,
                fields: [{
                    name: "Id_Product",
                    type: "text",
                    width: 70,
                    title: "ID S.PHẨM",
                    align: "center"
                }, {
                    name: "Product",
                    type: "text",
                    title: "SẢN PHẨM",
                    width: 150,
                    align: "left"

                }, {
                    name: "Size",
                    type: "number",
                    width: 50,
                    title: "SIZE",
                    align: "center",
                }, {
                    name: "Price",
                    type: "text",
                    title: "GIÁ",
                    width: 80,
                    align: "right"
                }, {
                    name: "Country",
                    type: "select",
                    items: db.countries,
                    valueField: "Id",
                    textField: "Name",
                    width: 80,
                    title: "NHÃN HIỆU",
                    align: "left"
                },
                    {
                        name: "Img",
                        type: "text",
                        width: 80,
                        title: "HÌNH",
                        align: "left"
                    },
                    {
                        type: "control",
                        width: 60
                    }]
            })
        }(), function () {
        $("#ordertable").jsGrid({
            height: "500px",
            width: "100%",
            editing: !0,
            sorting: !0,
            paging: !0,
            autoload: !0,
            pageSize: 15,
            pageButtonCount: 5,
            deleteConfirm: "Bạn có chắc chắn xóa đơn hàng này?",
            controller: db,
            fields: [{
                name: "Id_Order",
                type: "text",
                title: "ID Đ.HÀNG",
                width: 68,
                align: "center"
            }, {
                name: "Id_Product",
                type: "text",
                title: "ID S.PHẨM",
                width: 68,
                align: "center"
            },
                {
                    name: "Customer",
                    title: "KHÁCH HÀNG",
                    type: "text",
                    width: 130,
                    align: "left"
                }, {
                    name: "Address",
                    title: "ĐỊA CHỈ",
                    type: "text",
                    width: 130,
                    align: "left"
                }, {
                    name: "Total",
                    title: "TỔNG CỘNG",
                    type: "text",
                    align: "right"
                },
                {
                    name: "Status",
                    type: "checkbox",
                    title: "ĐÃ GIAO",
                    sorting: !1,
                    width: 60

                },
                {
                    type: "control",
                    width: 70
                }]
        })
    }(), function () {
        $("#saletable").jsGrid({
            height: "500px",
            width: "100%",
            editing: !0,
            sorting: !0,
            paging: !0,
            autoload: !0,
            pageSize: 15,
            pageButtonCount: 5,
            deleteConfirm: "Bạn có chắc chắn xóa chương trình khuyến mãi này?",
            controller: db,
            fields: [{
                name: "Id_Sale",
                type: "text",
                title: "ID CTKM",
                width: 68,
                align: "center"
            }, {
                name: "Name",
                type: "text",
                title: "TÊN CHƯƠNG TRÌNH",
                width: 130,
                align: "left"
            },
                {
                    name: "Sale",
                    title: "HÌNH THỨC KHUYẾN MÃI",
                    type: "text",
                    width: 130,
                    align: "left"
                }, {
                    name: "From",
                    title: "TỪ NGÀY",
                    type: "text",
                    align: "left"
                }, {
                    name: "To",
                    type: "text",
                    title: "ĐẾN NGÀY",
                    align: "left"
                },
                {
                    name: "Status",
                    type: "checkbox",
                    title: "KÍCH HOẠT",
                    sorting: !1

                },
                {
                    type: "control",
                    width: 70
                }]
        })
    }(),
        function () {
            $("#customertable").jsGrid({
                height: "500px",
                width: "100%",
                editing: !0,
                sorting: !0,
                paging: !0,
                autoload: !0,
                pageSize: 15,
                pageButtonCount: 5,
                deleteConfirm: "Bạn có chắc chắn xóa người dùng này?",
                controller: db,

                fields: [{
                    name: "ID",
                    width: 40,
                    align: "center",
                    title: "ID"
                }, {
                    name: "Account",
                    width: 80,
                    title: "TÀI KHOẢN"
                }, {
                    name: "Name",
                    type: "text",
                    title: "TÊN NGƯỜI DÙNG",
                    width:80
                }, {
                    name: "Address",
                    type: "text",
                    title: "ĐỊA CHỈ",
                    width:100
                }, {
                    name: "Phone",
                    type: "number",
                    width: 70,
                    align:"left",
                    title: "SĐT",
                }, {
                    name: "Admin",
                    type: "checkbox",
                    title: "ADMIN",
                    sorting: !1,
                    width:40
                }, {
                    name: "Status",
                    type: "checkbox",
                    title: "ACTIVE",
                    sorting: !1,
                    width:40
                }, {
                    type: "control",
                }
                ]
            })
        }(),

        function () {
            $("#staticgrid").jsGrid({
                height: "500px",
                width: "100%",
                sorting: !0,
                paging: !0,
                data: db.clients,
                fields: [{
                    name: "Name",
                    type: "text",
                    width: 150
                }, {
                    name: "Age",
                    type: "number",
                    width: 70
                }, {
                    name: "Address",
                    type: "text",
                    width: 200
                }, {
                    name: "Country",
                    type: "select",
                    items: db.countries,
                    valueField: "Id",
                    textField: "Name"
                }, {
                    name: "Married",
                    type: "checkbox",
                    title: "Is Married"
                }]
            })
        }(),

        function () {
            $("#exampleSorting").jsGrid({
                height: "500px",
                width: "100%",
                autoload: !0,
                selecting: !1,
                controller: db,
                fields: [{
                    name: "Name",
                    type: "text",
                    width: 150
                }, {
                    name: "Age",
                    type: "number",
                    width: 50
                }, {
                    name: "Address",
                    type: "text",
                    width: 200
                }, {
                    name: "Country",
                    type: "select",
                    items: db.countries,
                    valueField: "Id",
                    textField: "Name"
                }, {
                    name: "Married",
                    type: "checkbox",
                    title: "Is Married"
                }]
            }), $("#sortingField").on("change", function () {
                var field = $(this).val();
                $("#exampleSorting").jsGrid("sort", field)
            })
        }(),

        function () {
            var MyDateField = function (config) {
                jsGrid.Field.call(this, config)
            };
            MyDateField.prototype = new jsGrid.Field({
                sorter: function (date1, date2) {
                    return new Date(date1) - new Date(date2)
                },
                itemTemplate: function (value) {
                    return new Date(value).toDateString()
                },
                insertTemplate: function () {
                    if (!this.inserting) return "";
                    var $result = this.insertControl = this._createTextBox();
                    return $result
                },
                editTemplate: function (value) {
                    if (!this.editing) return this.itemTemplate(value);
                    var $result = this.editControl = this._createTextBox();
                    return $result.val(value), $result
                },
                insertValue: function () {
                    return this.insertControl.datepicker("getDate")
                },
                editValue: function () {
                    return this.editControl.datepicker("getDate")
                },
                _createTextBox: function () {
                    return $("<input>").attr("type", "text").addClass("form-control input-sm").datepicker({
                        autoclose: !0
                    })
                }
            }), jsGrid.fields.myDateField = MyDateField, $("#exampleCustomGridField").jsGrid({
                height: "500px",
                width: "100%",
                inserting: !0,
                editing: !0,
                sorting: !0,
                paging: !0,
                data: db.users,
                fields: [{
                    name: "Account",
                    width: 150,
                    align: "center"
                }, {
                    name: "Name",
                    type: "text"
                }, {
                    name: "RegisterDate",
                    type: "myDateField",
                    width: 100,
                    align: "center"
                }, {
                    type: "control",
                    editButton: !1,
                    modeSwitchButton: !1
                }]
            })
        }()
}(document, window, jQuery);