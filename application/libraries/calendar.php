<?php

final class Calendar
{
    private $days = array(
        01, 02, 03, 04, 05, 06, 07, 08, 09, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31
    );

    private $months = array(
        01 => 'january',
        02 => 'february',
        03 => 'march',
        04 => 'april',
        05 => 'may',
        06 => 'june',
        07 => 'july',
        08 => 'august',
        09 => 'september',
        10 => 'october',
        11 => 'november',
        12 => 'december'
    );

    final public function getDays()
    {
        return $this->days;
    }

    final public function getDay($day = false)
    {
        if(!is_numeric($day))
            return false;

        if(!in_array($day, $this->days))
            return false;

        return true;
    }

    final public function getMonths()
    {
        return $this->months;
    }

    final public function getMonth($month = false)
    {
        if(!is_numeric($month))
            return false;

        if(!isset($this->months[$month]))
            return false;

        return $this->months[$month];
    }

    final public function getYears()
    {
        static $years;

        if(is_null($years)) // fill years once
            $years = range(1970, date('Y'));

        return $years;
    }

    final public function getYear($year = false)
    {
        if(!is_numeric($year))
            return false;

        if(!in_array($year, $this->getYears()))
            return false;

        return true;
    }
}