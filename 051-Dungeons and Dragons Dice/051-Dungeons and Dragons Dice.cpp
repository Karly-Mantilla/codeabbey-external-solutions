#include <algorithm>
#include <cmath>
#include <iostream>
#include <utility>
#include <vector>

int kNumOfTests = 3;
int kMaxDiceCount = 5;
int kMaxSideCount = 12;
int kMaxRoll = kMaxDiceCount * kMaxSideCount;
int kNumRolls = 100;

class DieFit {
public:
  void set_init_values(int min, int max, double avg);
  void fit_die();

  friend std::ostream &operator<<(std::ostream &os, DieFit &die);

private:
  int min_roll{0};
  int max_roll{0};
  double avg_roll{0};

  int num_die{0};
  int die_sides{0};
  double expected_avg{0};

  int alt_num_die{0};
  int alt_die_sides{0};
  double alt_expected_avg{0};
  void generate_alt_die();
  bool gen_validate_die();
  bool check_avg(double new_avg);
};

std::istream &operator>>(std::istream &is, DieFit &die);

int main() {
  for (int i = kNumOfTests; i > 0; --i) {
    DieFit die;
    std::cin >> die;
    die.fit_die();

    std::cout << die << ' ';
  }
}

/**
 * @brief      Sets the required values for a DieFit instance
 *
 * @param[in]  min   The minimum observed in a sequence of rolls for a given set
 *                   of die
 *
 * @param[in]  max   The maximum observed in a sequence of rolls for a given set
 *                   of die
 *
 * @param[in]  avg   The average value observed in a sequence of rolls for a
 *                   given set of die
 */
void DieFit::set_init_values(int min, int max, double avg) {
  min_roll = {min};
  max_roll = {max};
  avg_roll = {avg};
  alt_num_die = {min};
}

/**
 * @brief      Gets the number of sides each dice in a set must have to roll the
 *             maximum observed value
 *
 * @param[in]  num_die  The number die in the set
 * @param[in]  max      The maximum observed value in the rolls provided
 *
 * @return     The number of sides on each dice
 */
int get_sides(int num_die, int max) {
  int sides = std::ceil(static_cast<double>(max) / num_die);
  if (sides % 2) {
    ++sides;
  }
  return sides;
}

/**
 * @brief      Gets the expected average roll for a given set of die
 *
 * @param[in]  num_die    The number die in the set
 * @param[in]  die_sides  The number of sides on each dice
 *
 * @return     The expected value for the set of die
 */
double get_avg_roll(int num_die, int die_sides) {
  // for multiple die the mean of the rolls is the given by the following
  return num_die * (1 + die_sides) / 2.;
}

/**
 * @brief      Generates new die by decreasing the quantity of die and uses that
 *             to generate the required number of sides and the expected average
 *             roll
 */
void DieFit::generate_alt_die() {
  --alt_num_die;
  alt_die_sides = get_sides(alt_num_die, max_roll);
  alt_expected_avg = get_avg_roll(alt_num_die, alt_die_sides);
}

/**
 * @brief      Generates new die and tests to ensure the new die are valid die
 */
bool DieFit::gen_validate_die() {
  generate_alt_die();
  return alt_num_die > 0 && alt_die_sides < kMaxSideCount;
}

/**
 * @brief      Compares a given expected value to the previous expected value
 *             returns true if the given value is closer to the observed average
 *             roll
 */
bool DieFit::check_avg(double new_avg) {
  return std::abs(avg_roll - new_avg) < std::abs(avg_roll - expected_avg);
}

/**
 * @brief      Gets the best fit for a die, the best fit is determined by how
 *             well the expected value for a set of die compares to the observed
 *             average roll
 */
void DieFit::fit_die() {
  // generate the first die with the maximum possible die
  num_die = min_roll;
  die_sides = get_sides(num_die, max_roll);
  expected_avg = get_avg_roll(num_die, die_sides);

  // generate die until they are no longer within specified parameters
  while (gen_validate_die()) {
    // checks if alternate die will on average roll closer to the observed
    // average roll and updates accordingly
    if (check_avg(alt_expected_avg)) {
      num_die = alt_num_die;
      die_sides = alt_die_sides;
      expected_avg = alt_expected_avg;
    }
  }
}

/**
 * @brief      Reads a the die rolls associated with a single set of die from
 *             istream, and sets the appropriate DieFit values.
 *             The sequence for a given set of die is terminated by a 0
 */
std::istream &operator>>(std::istream &is, DieFit &die) {
  int roll = 0;
  double avg = 0;
  is >> roll;
  int min = roll;
  int max = roll;

  while (is && roll) {
    if (min > roll) {
      min = roll;
    } else if (max < roll) {
      max = roll;
    }
    avg += static_cast<double>(roll) / kNumRolls;
    is >> roll;
  }
  die.set_init_values(min, max, avg);
  return is;
}

/**
 * @brief      Writes a representation of the die set (number of die and number
 *             of sides on each dice) to ostream
 */
std::ostream &operator<<(std::ostream &os, DieFit &die) {
  return os << die.num_die << 'd' << die.die_sides;
}