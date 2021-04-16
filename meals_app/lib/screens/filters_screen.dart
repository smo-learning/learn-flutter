import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    this._glutenFree = widget.currentFilters['gluten'];
    this._lactoseFree = widget.currentFilters['lactose'];
    this._vegetarian = widget.currentFilters['vegetarian'];
    this._vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                });
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
                _buildSwitchListTile('Lactose Free',
                    'Only include lactose-free meals.', _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _vegan, (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile _buildSwitchListTile(String title, String subtitle,
      bool currentValue, Function updateHandler) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateHandler,
    );
  }
}
