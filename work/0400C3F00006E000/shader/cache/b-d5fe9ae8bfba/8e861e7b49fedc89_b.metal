#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
    device _21* cp_s2 [[id(2)]];
    device _21* cp_s3 [[id(3)]];
    device _21* cp_s4 [[id(4)]];
    device _21* cp_s5 [[id(5)]];
    device _21* cp_s6 [[id(6)]];
    device _21* cp_s7 [[id(7)]];
    device _21* cp_s8 [[id(8)]];
    device _21* cp_s9 [[id(9)]];
    device _21* cp_s10 [[id(10)]];
    device _21* cp_s11 [[id(11)]];
    device _21* cp_s12 [[id(12)]];
    device _21* cp_s13 [[id(13)]];
    device _21* cp_s14 [[id(14)]];
    texture2d_array<float> cp_t_tcb_16 [[id(15)]];
    sampler cp_t_tcb_16Smplr [[id(16)]];
    texture2d_array<float> cp_t_tcb_14 [[id(17)]];
    sampler cp_t_tcb_14Smplr [[id(18)]];
    sampler cp_t_tcb_14Smplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2729 = false;
    bool _535 = false;
    float _75 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _77 = as_type<float>(gl_LocalInvocationID.x);
    float _79 = as_type<float>(gl_WorkGroupID.x);
    int _82 = as_type<int>(_79) << 5;
    int _84 = _82 + as_type<int>(_77);
    float _86 = trunc(_75);
    int _88 = int(_86);
    bool _92 = _84 >= _88;
    int _94 = 0;
    if (_92)
    {
        _94 = 0;
    }
    int _96 = _94;
    int _98 = _96;
    int _100 = _96;
    if (!_92)
    {
        int _102 = _84 << 4;
        int _104 = _102 + 12;
        uint _107 = uint(int(uint(_104) >> uint(2)));
        float _109 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_107)]);
        float _111 = trunc(_109);
        int _113 = int(_111);
        bool _115 = _113 >= 1;
        int _117 = _115 ? (-1) : 0;
        if (!_115)
        {
            _98 = 0;
        }
        int _119 = _98;
        bool _121 = !_115;
        _100 = _119;
        if (!_121)
        {
            float _123 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _125 = uint(int(uint(_104) >> uint(2)));
            float _127 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_125)]);
            float _129 = float(_113);
            float _131 = -_127;
            float _133 = _123 + _131;
            bool _135 = _133 > _129;
            int _137 = as_type<int>(_123);
            if (!_135)
            {
                bool _139 = _123 >= _127;
                bool _141 = isnan(_123);
                bool _143 = _139 || _141;
                bool _145 = isnan(_127);
                bool _147 = _143 || _145;
                _117 = _147 ? (-1) : 0;
            }
            int _149 = _117;
            if (_135)
            {
                _137 = 0;
            }
            int _151 = _137;
            _100 = _151;
            if (!_135)
            {
                int _153 = ~_149;
                int _155 = (_153 != 0) ? 0 : 1;
                _100 = _155;
            }
        }
    }
    int _157 = _100;
    int _159 = _157 & 1;
    bool _161 = _159 != 0;
    if (!_161)
    {
        return;
    }
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _167 = _84 << 4;
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _171 = _167 + 12;
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _177 = uint(int(uint(_171) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_177)]);
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _183 = uint(int(uint(_167) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_183)]);
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    uint _191 = uint(int(uint(_167) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_191)]);
    int _195 = _167 + 4;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_197)]);
    int _201 = _167 + 8;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_203)]);
    float _207 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _213 = uint(int(uint(_171) >> uint(2)));
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_213)]);
    uint _217 = uint(int(uint(_167) >> uint(2)));
    float _219 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_217)]);
    int _221 = _167 + 4;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_223)]);
    int _227 = _167 + 8;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_229)]);
    float _233 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _235 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _237 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _239 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _241 = uint(int(uint(_167) >> uint(2)));
    float _243 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_241)]);
    int _245 = _167 + 4;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    float _249 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_247)]);
    int _251 = _167 + 8;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    float _255 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_253)]);
    int _257 = _167 + 12;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    float _261 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_259)]);
    uint _263 = uint(int(uint(_171) >> uint(2)));
    float _265 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_263)]);
    bool _267 = _163 > 0.0;
    float _269 = abs(_165);
    float _271 = log2(_269);
    bool _273 = _169 > 0.0;
    float _275 = 0.0;
    float _277 = _181;
    float _279 = _189;
    float _281 = _211;
    float _283 = _207;
    float _285 = _193;
    float _287 = _199;
    float _289 = _205;
    float _291 = _233;
    float _293 = _235;
    float _295 = _237;
    float _297 = _239;
    float _299 = _187;
    if (_267)
    {
        float _301 = 1.0 / _163;
        _275 = _301;
    }
    float _303 = _275;
    float _305 = _173 * _271;
    float _307 = -_179;
    float _309 = _175 + _307;
    float _311 = _181 * _169;
    float _313 = exp2(_305);
    float _315 = _303;
    float _317 = _309;
    if (_267)
    {
        float _319 = _309 * _303;
        _315 = _319;
    }
    float _321 = _315;
    if (_273)
    {
        float _323 = -_311;
        float _325 = fma(_185, _323, _181);
        _277 = _325;
    }
    float _327 = _277;
    int _329 = as_type<int>(_187) & 512;
    bool _331 = _329 != 0;
    float _333 = _173 * _189;
    float _335 = _327;
    bool _337 = _331;
    if (_267)
    {
        float _339 = precise::min(_321, 1.0);
        _279 = _339;
    }
    float _341 = _279;
    float _343 = _341;
    if (_267)
    {
        float _345 = _341 * _327;
        _335 = _345;
    }
    float _347 = _335;
    float _349 = _207 * _333;
    float _351 = _209 * _333;
    float _353 = _211 * _333;
    float _355 = _215 * _173;
    float _357 = _173 * _347;
    float _359 = fma(_193, _313, _349);
    float _361 = fma(_199, _313, _351);
    float _363 = fma(_205, _313, _353);
    float _365 = fma(_193, _355, _219);
    float _367 = fma(_199, _355, _225);
    float _369 = fma(_205, _355, _231);
    float _371 = _233 * _357;
    float _373 = _235 * _357;
    float _375 = _237 * _357;
    bool _377 = !_331;
    float _379 = _261;
    float _381 = _355;
    float _383 = _313;
    float _385 = _353;
    float _387 = _357;
    float _389 = _373;
    int _391 = as_type<int>(_243);
    int _393 = as_type<int>(_249);
    int _395 = as_type<int>(_255);
    int _397 = as_type<int>(_243);
    int _399 = as_type<int>(_249);
    int _401 = as_type<int>(_255);
    int _403 = as_type<int>(_243);
    int _405 = as_type<int>(_249);
    int _407 = as_type<int>(_255);
    float _529;
    float _531;
    float _533;
    if (!_377)
    {
        float _409 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _411 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _413 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _415 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _417 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _419 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _421 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _423 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _425 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _427 = _413 * _415;
        float _429 = _413 * _417;
        float _431 = _411 * _415;
        float _433 = -_427;
        float _435 = fma(_409, _419, _433);
        float _437 = -_429;
        float _439 = fma(_411, _419, _437);
        float _441 = -_431;
        float _443 = fma(_409, _417, _441);
        float _445 = _423 * _409;
        float _447 = _423 * _435;
        float _449 = _425 * _411;
        float _451 = _421 * _417;
        float _453 = -_445;
        float _455 = fma(_421, _411, _453);
        float _457 = -_447;
        float _459 = fma(_421, _439, _457);
        float _461 = _423 * _419;
        float _463 = _425 * _415;
        float _465 = _421 * _413;
        float _467 = fma(_425, _443, _459);
        float _469 = -_461;
        float _471 = fma(_425, _417, _469);
        float _473 = -_463;
        float _475 = fma(_421, _419, _473);
        float _477 = -_451;
        float _479 = fma(_423, _415, _477);
        float _481 = 1.0 / _467;
        float _483 = -_465;
        float _485 = fma(_425, _409, _483);
        float _487 = -_409;
        float _489 = fma(_487, _419, _427);
        float _491 = -_449;
        float _493 = fma(_423, _413, _491);
        float _495 = _471 * _481;
        float _497 = _475 * _481;
        float _499 = _479 * _481;
        float _501 = _489 * _481;
        float _503 = _373 * _495;
        float _505 = _371 * _481;
        float _507 = _373 * _497;
        float _509 = _373 * _499;
        float _511 = _493 * _481;
        float _513 = fma(_439, _505, _503);
        float _515 = _485 * _481;
        float _517 = _455 * _481;
        float _519 = fma(_371, _501, _507);
        float _521 = fma(_443, _505, _509);
        float _523 = fma(_375, _511, _513);
        float _525 = fma(_375, _515, _519);
        float _527 = fma(_375, _517, _521);
        _285 = _415;
        _287 = _417;
        _289 = _419;
        _381 = _467;
        _291 = _519;
        _293 = _505;
        _295 = _521;
        _297 = _427;
        _299 = _421;
        _383 = _423;
        _343 = _425;
        _385 = _507;
        _529 = _525;
        _531 = _523;
        _533 = _527;
        _387 = _443;
        _535 = true;
    }
    else
    {
        int _537 = as_type<int>(_187) & 1024;
        bool _539 = _537 != 0;
        if (_539)
        {
            _337 = true;
        }
        bool _541 = _337;
        bool _543 = _541;
        if (!_539)
        {
            int _545 = as_type<int>(_187) & 2048;
            bool _547 = _545 != 0;
            _543 = _547;
        }
        bool _549 = _543;
        if (!_549)
        {
            _281 = _371;
        }
        float _551 = _281;
        _531 = _551;
        if (!_549)
        {
            _379 = _373;
        }
        float _553 = _379;
        _529 = _553;
        if (!_549)
        {
            _283 = _375;
        }
        float _555 = _283;
        bool _557 = !_549;
        _533 = _555;
        if (!_557)
        {
            uint _559 = uint(int(uint(_167) >> uint(2)));
            float _561 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_559)]);
            int _563 = _167 + 4;
            uint _565 = uint(int(uint(_563) >> uint(2)));
            float _567 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_565)]);
            int _569 = _167 + 8;
            uint _571 = uint(int(uint(_569) >> uint(2)));
            float _573 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_571)]);
            uint _575 = uint(int(uint(_167) >> uint(2)));
            float _577 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_575)]);
            int _579 = _167 + 4;
            uint _581 = uint(int(uint(_579) >> uint(2)));
            float _583 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_581)]);
            int _585 = _167 + 8;
            uint _587 = uint(int(uint(_585) >> uint(2)));
            float _589 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_587)]);
            uint _591 = uint(int(uint(_167) >> uint(2)));
            float _593 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_591)]);
            int _595 = _167 + 4;
            uint _597 = uint(int(uint(_595) >> uint(2)));
            float _599 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_597)]);
            int _601 = _167 + 8;
            uint _603 = uint(int(uint(_601) >> uint(2)));
            float _605 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_603)]);
            float _607 = _573 * _577;
            float _609 = _573 * _583;
            float _611 = _567 * _577;
            float _613 = -_607;
            float _615 = fma(_561, _589, _613);
            float _617 = -_609;
            float _619 = fma(_567, _589, _617);
            float _621 = -_611;
            float _623 = fma(_561, _583, _621);
            float _625 = _599 * _561;
            float _627 = _599 * _615;
            float _629 = _605 * _567;
            float _631 = _593 * _583;
            float _633 = -_625;
            float _635 = fma(_593, _567, _633);
            float _637 = -_627;
            float _639 = fma(_593, _619, _637);
            float _641 = _599 * _589;
            float _643 = _605 * _577;
            float _645 = _593 * _573;
            float _647 = fma(_605, _623, _639);
            float _649 = -_641;
            float _651 = fma(_605, _583, _649);
            float _653 = -_643;
            float _655 = fma(_593, _589, _653);
            float _657 = -_631;
            float _659 = fma(_599, _577, _657);
            float _661 = 1.0 / _647;
            float _663 = -_645;
            float _665 = fma(_605, _561, _663);
            float _667 = -_561;
            float _669 = fma(_667, _589, _607);
            float _671 = -_629;
            float _673 = fma(_599, _573, _671);
            float _675 = _651 * _661;
            float _677 = _655 * _661;
            float _679 = _659 * _661;
            float _681 = _669 * _661;
            float _683 = _373 * _675;
            float _685 = _371 * _661;
            float _687 = _373 * _677;
            float _689 = _373 * _679;
            float _691 = _673 * _661;
            float _693 = fma(_619, _685, _683);
            float _695 = _665 * _661;
            float _697 = _635 * _661;
            float _699 = fma(_371, _681, _687);
            float _701 = fma(_623, _685, _689);
            float _703 = fma(_375, _691, _693);
            float _705 = fma(_375, _695, _699);
            float _707 = fma(_375, _697, _701);
            _285 = _577;
            _287 = _583;
            _289 = _589;
            _381 = _647;
            _291 = _699;
            _293 = _685;
            _295 = _701;
            _297 = _607;
            _299 = _593;
            _383 = _599;
            _343 = _605;
            _385 = _687;
            _529 = _705;
            _531 = _703;
            _533 = _707;
            _387 = _623;
        }
    }
    _535 = false;
    float _709 = _285;
    float _711 = _287;
    float _713 = _289;
    float _715 = _381;
    float _717 = _291;
    float _719 = _293;
    float _721 = _295;
    float _723 = _297;
    float _725 = _299;
    float _727 = _383;
    float _729 = _343;
    float _731 = _385;
    float _733 = _529;
    float _735 = _531;
    float _737 = _533;
    float _739 = _387;
    uint _741 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_741)] = as_type<uint>(_265);
    float _743 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _745 = as_type<int>(_743) & 512;
    bool _747 = _745 != 0;
    int _749 = as_type<int>(_743) & 1024;
    bool _751 = _749 != 0;
    float _753 = _709;
    float _755 = _711;
    float _757 = _713;
    float _759 = _715;
    float _761 = _733;
    float _763 = _739;
    float _765 = _735;
    if (_747)
    {
        float _767 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _769 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _771 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _773 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _753 = _767;
        _755 = _769;
        _757 = _771;
        _759 = _773;
    }
    float _775 = _753;
    float _777 = _755;
    float _779 = _757;
    float _781 = _759;
    float _783 = _717;
    float _785 = _719;
    float _787 = _721;
    float _789 = _723;
    if (_747)
    {
        float _791 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _793 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _795 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _797 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _783 = _791;
        _785 = _793;
        _787 = _795;
        _789 = _797;
    }
    float _799 = _783;
    float _801 = _785;
    float _803 = _787;
    float _805 = _789;
    float _807 = _725;
    float _809 = _727;
    float _811 = _729;
    float _813 = _731;
    if (_747)
    {
        float _815 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _817 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _819 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _821 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _807 = _815;
        _809 = _817;
        _811 = _819;
        _813 = _821;
    }
    float _823 = _807;
    float _825 = _809;
    float _827 = _811;
    float _829 = _813;
    float _831 = _367 + _733;
    float _833 = _365 + _735;
    float _835 = _369 + _737;
    if (!_747)
    {
        _761 = 0.0;
    }
    float _837 = _761;
    float _839 = _837;
    if (!_747)
    {
        _389 = 0.0;
    }
    float _841 = _389;
    float _843 = _841;
    if (!_747)
    {
        _763 = 0.0;
    }
    float _845 = _763;
    int _847 = as_type<int>(_743) & 2048;
    bool _849 = _847 != 0;
    float _851 = _775;
    float _853 = _845;
    if (_747)
    {
        float _855 = _831 * _777;
        _765 = _855;
    }
    float _857 = _765;
    float _859 = _801;
    float _861 = _803;
    if (_747)
    {
        float _863 = _831 * _801;
        _859 = _863;
    }
    float _865 = _859;
    float _867 = _865;
    if (_747)
    {
        float _869 = fma(_833, _775, _857);
        _851 = _869;
    }
    float _871 = _851;
    float _873 = _825;
    float _875 = _871;
    float _877 = _823;
    if (_747)
    {
        float _879 = _831 * _825;
        _873 = _879;
    }
    float _881 = _873;
    if (_747)
    {
        float _883 = fma(_833, _799, _865);
        _867 = _883;
    }
    float _885 = _867;
    if (_747)
    {
        float _887 = fma(_835, _779, _871);
        _875 = _887;
    }
    float _889 = _875;
    if (_747)
    {
        float _891 = fma(_833, _823, _881);
        _877 = _891;
    }
    float _893 = _877;
    float _895 = _893;
    if (_747)
    {
        float _897 = fma(_835, _803, _885);
        _861 = _897;
    }
    float _899 = _861;
    if (_747)
    {
        float _901 = _781 + _889;
        _839 = _901;
    }
    float _903 = _839;
    float _905 = _903;
    if (_747)
    {
        float _907 = fma(_835, _827, _893);
        _895 = _907;
    }
    float _909 = _895;
    if (_747)
    {
        float _911 = _805 + _899;
        _843 = _911;
    }
    float _913 = _843;
    float _915 = _913;
    if (_747)
    {
        float _917 = _829 + _909;
        _853 = _917;
    }
    float _919 = _853;
    bool _921 = !_751;
    float _923 = _919;
    if (!_921)
    {
        float _925 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _927 = uint(int(uint(_167) >> uint(2)));
        float _929 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_927)]);
        int _931 = _167 + 4;
        uint _933 = uint(int(uint(_931) >> uint(2)));
        float _935 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_933)]);
        int _937 = _167 + 8;
        uint _939 = uint(int(uint(_937) >> uint(2)));
        float _941 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_939)]);
        uint _943 = uint(int(uint(_167) >> uint(2)));
        float _945 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_943)]);
        int _947 = _167 + 4;
        uint _949 = uint(int(uint(_947) >> uint(2)));
        float _951 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_949)]);
        int _953 = _167 + 8;
        uint _955 = uint(int(uint(_953) >> uint(2)));
        float _957 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_955)]);
        uint _959 = uint(int(uint(_167) >> uint(2)));
        float _961 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_959)]);
        int _963 = _167 + 4;
        uint _965 = uint(int(uint(_963) >> uint(2)));
        float _967 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_965)]);
        int _969 = _167 + 8;
        uint _971 = uint(int(uint(_969) >> uint(2)));
        float _973 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_971)]);
        float _975 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _977 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _979 = _831 * _935;
        float _981 = _831 * _951;
        float _983 = _831 * _967;
        float _985 = fma(_833, _929, _979);
        float _987 = fma(_833, _945, _981);
        float _989 = fma(_833, _961, _983);
        float _991 = fma(_835, _941, _985);
        float _993 = fma(_835, _957, _987);
        float _995 = fma(_835, _973, _989);
        float _997 = _925 + _991;
        float _999 = _975 + _993;
        float _1001 = _977 + _995;
        _915 = _999;
        _905 = _997;
        _923 = _1001;
    }
    float _1003 = _915;
    float _1005 = _905;
    float _1007 = _923;
    bool _1009 = !_849;
    float _1011 = _1003;
    float _1013 = _1005;
    float _1015 = _1007;
    if (!_1009)
    {
        uint _1017 = uint(int(uint(_167) >> uint(2)));
        float _1019 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1017)]);
        int _1021 = _167 + 4;
        uint _1023 = uint(int(uint(_1021) >> uint(2)));
        float _1025 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1023)]);
        int _1027 = _167 + 8;
        uint _1029 = uint(int(uint(_1027) >> uint(2)));
        float _1031 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1029)]);
        int _1033 = _167 + 12;
        uint _1035 = uint(int(uint(_1033) >> uint(2)));
        float _1037 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1035)]);
        uint _1039 = uint(int(uint(_167) >> uint(2)));
        float _1041 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1039)]);
        int _1043 = _167 + 4;
        uint _1045 = uint(int(uint(_1043) >> uint(2)));
        float _1047 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1045)]);
        int _1049 = _167 + 8;
        uint _1051 = uint(int(uint(_1049) >> uint(2)));
        float _1053 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1051)]);
        int _1055 = _167 + 12;
        uint _1057 = uint(int(uint(_1055) >> uint(2)));
        float _1059 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1057)]);
        uint _1061 = uint(int(uint(_167) >> uint(2)));
        float _1063 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1061)]);
        int _1065 = _167 + 4;
        uint _1067 = uint(int(uint(_1065) >> uint(2)));
        float _1069 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1067)]);
        int _1071 = _167 + 8;
        uint _1073 = uint(int(uint(_1071) >> uint(2)));
        float _1075 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1073)]);
        int _1077 = _167 + 12;
        uint _1079 = uint(int(uint(_1077) >> uint(2)));
        float _1081 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1079)]);
        float _1083 = _831 * _1025;
        float _1085 = _831 * _1047;
        float _1087 = _831 * _1069;
        float _1089 = fma(_833, _1019, _1083);
        float _1091 = fma(_833, _1041, _1085);
        float _1093 = fma(_833, _1063, _1087);
        float _1095 = fma(_835, _1031, _1089);
        float _1097 = fma(_835, _1053, _1091);
        float _1099 = fma(_835, _1075, _1093);
        float _1101 = _1095 + _1037;
        float _1103 = _1097 + _1059;
        float _1105 = _1099 + _1081;
        _1011 = _1103;
        _1013 = _1101;
        _1015 = _1105;
    }
    float _1107 = _1011;
    float _1109 = _1013;
    float _1111 = _1015;
    float _1113 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1115 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1117 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1119 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1121 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1123 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1125 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1127 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1129 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1131 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1133 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1135 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1137 = _1115 * _1107;
    float _1139 = fma(_1113, _1109, _1137);
    float _1141 = fma(_1117, _1111, _1139);
    float _1143 = _1119 + _1141;
    float _1145 = -_1143;
    bool _1147 = _1121 >= _1145;
    bool _1149 = isnan(_1121);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan(_1145);
    bool _1155 = _1151 || _1153;
    float _1157 = -_1143;
    bool _1159 = _1123 >= _1157;
    bool _1161 = isnan(_1123);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan(_1157);
    bool _1167 = _1163 || _1165;
    int _1169 = _1155 ? 0 : 1;
    int _1171 = 2;
    float _1173 = _1109;
    int _1175 = as_type<int>(_1111);
    if (_1155)
    {
        _1171 = 1;
    }
    int _1177 = _1171;
    int _1179 = _1177;
    if (_1167)
    {
        _1179 = _1169;
    }
    int _1181 = _1179;
    int _1183 = _1181 << 6;
    int _1185 = _1183 + 96;
    uint _1187 = uint(int(uint(_1185) >> uint(2)));
    float _1189 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1187)]);
    int _1191 = _1185 + 4;
    uint _1193 = uint(int(uint(_1191) >> uint(2)));
    float _1195 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1193)]);
    int _1197 = _1185 + 8;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    float _1201 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1199)]);
    int _1203 = _1185 + 12;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    float _1207 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1205)]);
    int _1209 = _1183 + 48;
    int _1211 = _1183 + 64;
    uint _1213 = uint(int(uint(_1209) >> uint(2)));
    float _1215 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1213)]);
    int _1217 = _1209 + 4;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    float _1221 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1219)]);
    int _1223 = _1209 + 8;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    float _1227 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1225)]);
    int _1229 = _1209 + 12;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    float _1233 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1231)]);
    uint _1235 = uint(int(uint(_1211) >> uint(2)));
    float _1237 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1235)]);
    int _1239 = _1211 + 4;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    float _1243 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1241)]);
    int _1245 = _1211 + 8;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    float _1249 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1247)]);
    int _1251 = _1211 + 12;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    float _1255 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1253)]);
    int _1257 = _1183 + 80;
    float _1259 = _1125 + 1.0;
    float _1261 = _1259 + _1107;
    uint _1263 = uint(int(uint(_1257) >> uint(2)));
    float _1265 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1263)]);
    int _1267 = _1257 + 4;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    float _1271 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1269)]);
    int _1273 = _1257 + 8;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    float _1277 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1275)]);
    int _1279 = _1257 + 12;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    float _1283 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1281)]);
    float _1285 = _1261 * _1129;
    float _1287 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1289 = fma(_1127, _1109, _1285);
    float _1291 = fma(_1131, _1111, _1289);
    float _1293 = _1133 + _1291;
    float _1295 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1297 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1299 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1301 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1303 = trunc(_1293);
    int _1305 = int(_1303);
    int _1307 = ~as_type<int>(_1135);
    int _1309 = _1305 + _1307;
    int _1311 = _1309 + 1;
    bool _1313 = _1311 >= 0;
    int _1315 = _1305;
    float _1317 = as_type<float>(_1181);
    if (_1313)
    {
        float _1319 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1315 = as_type<int>(_1319);
    }
    int _1321 = _1315;
    float _1323 = _1261 * _1195;
    float _1325 = fma(_1189, _1109, _1323);
    float _1327 = fma(_1201, _1111, _1325);
    float _1329 = _1207 + _1327;
    float _1331 = _1261 * _1221;
    float _1333 = 1.0 / _1329;
    float _1335 = fma(_1215, _1109, _1331);
    float _1337 = _1261 * _1243;
    float _1339 = fma(_1227, _1111, _1335);
    float _1341 = fma(_1237, _1109, _1337);
    float _1343 = _1233 + _1339;
    float _1345 = fma(_1249, _1111, _1341);
    float _1347 = _1343 * _1333;
    float _1349 = _1255 + _1345;
    bool _1351 = _1347 >= 0.0;
    float _1353 = _1349 * _1333;
    bool _1355 = _1347 <= 1.0;
    bool _1357 = _1355 && _1351;
    bool _1359 = _1353 >= 0.0;
    bool _1361 = _1359 && _1357;
    bool _1363 = _1353 <= 1.0;
    bool _1365 = _1363 && _1361;
    float _1367 = _1261 * _1271;
    float _1369 = fma(_1265, _1109, _1367);
    float _1371 = _1215;
    float _1373 = _1335;
    float _1375 = _1343;
    float _1377 = _1233;
    float _1379 = _1255;
    if (_1365)
    {
        float _1381 = float(_1181);
        _1317 = _1381;
    }
    float _1383 = _1317;
    float _1385 = fma(_1277, _1111, _1369);
    float _1387 = _1383;
    if (_1365)
    {
        float _1389 = rint(_1383);
        float _1391 = precise::max(_1389, 0.0);
        uint _1393 = uint(_1391);
        uint _1395 = clamp(_1393, 0u, 65535u);
        _1387 = as_type<float>(_1395);
    }
    float _1397 = _1387;
    float _1399 = _1283 + _1385;
    float _1401 = _1399 * _1333;
    float _1403 = _1353;
    if (_1365)
    {
        float3 _4956 = float3(_1347, _1353, float(as_type<int>(_1397)));
        float3 _4960 = select(_4956, float3(0.0), isnan(_4956));
        float _1405 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _4960.xy, uint(rint(_4960.z)), _1401, level(0.0));
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1261 * _1297;
    float _1411 = fma(_1295, _1109, _1409);
    float _1413 = fma(_1299, _1111, _1411);
    float _1415 = _1301 + _1413;
    float _1417 = trunc(_1415);
    int _1419 = int(_1417);
    bool _1421 = _1321 <= _1311;
    bool _1423 = !_1313;
    bool _1425 = _1421 || _1423;
    int _1427 = ~as_type<int>(_1287);
    int _1429 = _1419 + _1427;
    int _1431 = _1429 + 1;
    bool _1433 = _1431 < 0;
    bool _1435 = _1433 || _1425;
    int _1437 = as_type<int>(_1411);
    float _1439 = as_type<float>(_1419);
    if (!_1435)
    {
        float _1441 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1437 = as_type<int>(_1441);
    }
    int _1443 = _1437;
    bool _1445 = _1443 <= _1431;
    bool _1447 = _1445 || _1435;
    if (_1447)
    {
        _1439 = 1.0;
    }
    float _1449 = _1439;
    float _1451 = _1449;
    float _1453 = _1407;
    if (!_1447)
    {
        float _1455 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1457 = _1431 * as_type<int>(_1455);
        int _1459 = _1457 + _1311;
        int _1461 = _1459 << 2;
        uint _1463 = uint(int(uint(_1459) >> uint(2)));
        int _1465 = 12 & _1461;
        int _1467 = int(_1463) << 4;
        int _1469 = _1467 + _1465;
        int _1471 = _1469 + 400;
        uint _1473 = uint(int(uint(_1471) >> uint(2)));
        float _1475 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1473)]);
        float _1477 = floor(_1415);
        float _1479 = floor(_1293);
        float _1481 = -_1477;
        float _1483 = _1415 + _1481;
        float _1485 = -_1479;
        float _1487 = _1293 + _1485;
        float _1489 = rint(_1475);
        float _1491 = precise::max(_1489, 0.0);
        uint _1493 = uint(_1491);
        uint _1495 = clamp(_1493, 0u, 65535u);
        float3 _5096 = float3(_1487, _1483, float(int(_1495)));
        float3 _5098 = select(_5096, float3(0.0), isnan(_5096));
        float _1497 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _5098.xy, uint(rint(_5098.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _5098.xy, uint(rint(_5098.z)), level(0.0)).x;
        int _1499 = _1459 << 4;
        int _1501 = _1499 + 2048;
        uint _1503 = uint(int(uint(_1501) >> uint(2)));
        float _1505 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1503)]);
        int _1507 = _1501 + 4;
        uint _1509 = uint(int(uint(_1507) >> uint(2)));
        float _1511 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1509)]);
        int _1513 = _1501 + 8;
        uint _1515 = uint(int(uint(_1513) >> uint(2)));
        float _1517 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1515)]);
        int _1519 = _1501 + 12;
        uint _1521 = uint(int(uint(_1519) >> uint(2)));
        float _1523 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1521)]);
        float _1525 = _1261 * _1511;
        float _1527 = fma(_1505, _1109, _1525);
        float _1529 = fma(_1517, _1111, _1527);
        float _1531 = _1523 + _1529;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + _1497;
        float _1539 = fma(_1537, 500.0, 1.5);
        float _1541 = exp2(_1539);
        float _1543 = 0.0 + _1541;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        _1173 = 500.0;
        _1451 = _1545;
        _1371 = _1505;
        _1373 = _1527;
        _1375 = _1541;
        _1377 = _1523;
        _1379 = _1487;
    }
    float _1547 = _1173;
    float _1549 = _1451;
    float _1551 = _1371;
    float _1553 = _1373;
    float _1555 = _1375;
    float _1557 = _1377;
    float _1559 = _1379;
    uint _1561 = uint(int(uint(_167) >> uint(2)));
    float _1563 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1561)]);
    float _1565 = _1547;
    float _1567 = _1559;
    if (!_1365)
    {
        _1565 = 1.0;
    }
    float _1569 = _1565;
    bool _1571 = _309 > 0.001000000047497451305389404296875;
    bool _1573 = isnan(_309);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan(0.001000000047497451305389404296875);
    bool _1579 = _1575 || _1577;
    float _1581 = _1569;
    if (_1365)
    {
        bool _1583 = _1407 >= _1401;
        bool _1585 = isnan(_1407);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan(_1401);
        bool _1591 = _1587 || _1589;
        float _1593 = float(_1591);
        _1581 = _1593;
    }
    float _1595 = _1581;
    float _1597 = -_1595;
    float _1599 = fma(_1597, _1549, 1.0);
    float _1601 = -_1563;
    float _1603 = _1599 + _1601;
    float _1605 = _1599;
    if (_1579)
    {
        float _1607 = fma(_1603, 0.0500000007450580596923828125, _1563);
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = precise::max(0.0, _1609);
    float _1613 = precise::min(_1611, 0.999000012874603271484375);
    uint _1615 = uint(int(uint(_167) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1615)] = as_type<uint>(_1613);
    float _1617 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _1619 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[16]);
    float _1621 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[17]);
    float _1623 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[18]);
    float _1625 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[13]);
    int _1627 = as_type<int>(_1617) & 512;
    bool _1629 = _1627 != 0;
    int _1631 = as_type<int>(_1617) & 1024;
    bool _1633 = _1631 != 0;
    float _1635 = _1551;
    float _1637 = _1553;
    float _1639 = _1555;
    float _1641 = _1557;
    float _1643 = _1613;
    bool _1645 = _1633;
    bool _1647 = false;
    if (_1629)
    {
        float _1649 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1651 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1653 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1655 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1635 = _1649;
        _1637 = _1651;
        _1639 = _1653;
        _1641 = _1655;
    }
    float _1657 = _1635;
    float _1659 = _1637;
    float _1661 = _1639;
    float _1663 = _1641;
    float _1665 = _1415;
    float _1667 = _1369;
    float _1669 = _1385;
    float _1671 = _1283;
    if (_1629)
    {
        float _1673 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1675 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1677 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1679 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1665 = _1673;
        _1667 = _1675;
        _1669 = _1677;
        _1671 = _1679;
    }
    float _1681 = _1665;
    float _1683 = _1667;
    float _1685 = _1669;
    float _1687 = _1671;
    float _1689 = _1189;
    float _1691 = _1333;
    float _1693 = _1329;
    float _1695 = _1207;
    if (_1629)
    {
        float _1697 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1699 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1701 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1703 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1689 = _1697;
        _1691 = _1699;
        _1693 = _1701;
        _1695 = _1703;
    }
    float _1705 = _1689;
    float _1707 = _1691;
    float _1709 = _1693;
    float _1711 = _1695;
    if (!_1629)
    {
        _1567 = 0.0;
    }
    float _1713 = _1567;
    int _1715 = as_type<int>(_1617) & 2048;
    bool _1717 = _1715 != 0;
    float _1719 = _1661;
    float _1721 = _1713;
    if (_1629)
    {
        float _1723 = _831 * _1659;
        _1453 = _1723;
    }
    float _1725 = _1453;
    float _1727 = _1683;
    float _1729 = _1725;
    float _1731 = _1685;
    if (_1629)
    {
        float _1733 = _831 * _1683;
        _1727 = _1733;
    }
    float _1735 = _1727;
    float _1737 = _1735;
    if (_1629)
    {
        float _1739 = _831 * _1707;
        _317 = _1739;
    }
    float _1741 = _317;
    float _1743 = _1741;
    if (_1629)
    {
        float _1745 = fma(_833, _1657, _1725);
        _1729 = _1745;
    }
    float _1747 = _1729;
    float _1749 = _1747;
    if (_1629)
    {
        float _1751 = fma(_833, _1681, _1735);
        _1737 = _1751;
    }
    float _1753 = _1737;
    if (_1629)
    {
        float _1755 = fma(_833, _1705, _1741);
        _1743 = _1755;
    }
    float _1757 = _1743;
    float _1759 = _1757;
    if (_1629)
    {
        float _1761 = fma(_835, _1661, _1747);
        _1719 = _1761;
    }
    float _1763 = _1719;
    if (_1629)
    {
        float _1765 = fma(_835, _1685, _1753);
        _1731 = _1765;
    }
    float _1767 = _1731;
    if (_1629)
    {
        float _1769 = fma(_835, _1709, _1757);
        _1759 = _1769;
    }
    float _1771 = _1759;
    if (!_1629)
    {
        _1749 = 0.0;
        _1643 = 0.0;
    }
    float _1773 = _1749;
    float _1775 = _1643;
    float _1777 = _1773;
    float _1779 = _1775;
    if (_1629)
    {
        float _1781 = _1663 + _1763;
        _1721 = _1781;
    }
    float _1783 = _1721;
    float _1785 = _1783;
    if (_1629)
    {
        float _1787 = _1687 + _1767;
        _1777 = _1787;
    }
    float _1789 = _1777;
    float _1791 = _1789;
    if (_1629)
    {
        float _1793 = _1711 + _1771;
        _1779 = _1793;
    }
    float _1795 = _1779;
    bool _1797 = !_1633;
    float _1799 = _1795;
    if (!_1797)
    {
        float _1801 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1803 = uint(int(uint(_167) >> uint(2)));
        float _1805 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1803)]);
        int _1807 = _167 + 4;
        uint _1809 = uint(int(uint(_1807) >> uint(2)));
        float _1811 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1809)]);
        int _1813 = _167 + 8;
        uint _1815 = uint(int(uint(_1813) >> uint(2)));
        float _1817 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1815)]);
        uint _1819 = uint(int(uint(_167) >> uint(2)));
        float _1821 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1819)]);
        int _1823 = _167 + 4;
        uint _1825 = uint(int(uint(_1823) >> uint(2)));
        float _1827 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1825)]);
        int _1829 = _167 + 8;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        float _1833 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1831)]);
        uint _1835 = uint(int(uint(_167) >> uint(2)));
        float _1837 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1835)]);
        int _1839 = _167 + 4;
        uint _1841 = uint(int(uint(_1839) >> uint(2)));
        float _1843 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1841)]);
        int _1845 = _167 + 8;
        uint _1847 = uint(int(uint(_1845) >> uint(2)));
        float _1849 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1847)]);
        float _1851 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1853 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1855 = _831 * _1811;
        float _1857 = _831 * _1827;
        float _1859 = fma(_833, _1805, _1855);
        float _1861 = _831 * _1843;
        float _1863 = fma(_833, _1821, _1857);
        float _1865 = fma(_833, _1837, _1861);
        float _1867 = fma(_835, _1817, _1859);
        float _1869 = fma(_835, _1833, _1863);
        float _1871 = fma(_835, _1849, _1865);
        float _1873 = _1801 + _1867;
        float _1875 = _1851 + _1869;
        float _1877 = _1853 + _1871;
        _1791 = _1875;
        _1799 = _1877;
        _1785 = _1873;
        _1175 = as_type<int>(_1853);
    }
    float _1879 = _1791;
    float _1881 = _1799;
    float _1883 = _1785;
    int _1885 = _1175;
    bool _1887 = !_1717;
    float _1889 = _1879;
    float _1891 = _1883;
    float _1893 = _1881;
    int _1895 = _1885;
    if (!_1887)
    {
        uint _1897 = uint(int(uint(_167) >> uint(2)));
        float _1899 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1897)]);
        int _1901 = _167 + 4;
        uint _1903 = uint(int(uint(_1901) >> uint(2)));
        float _1905 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1903)]);
        int _1907 = _167 + 8;
        uint _1909 = uint(int(uint(_1907) >> uint(2)));
        float _1911 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1909)]);
        int _1913 = _167 + 12;
        uint _1915 = uint(int(uint(_1913) >> uint(2)));
        float _1917 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1915)]);
        uint _1919 = uint(int(uint(_167) >> uint(2)));
        float _1921 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1919)]);
        int _1923 = _167 + 4;
        uint _1925 = uint(int(uint(_1923) >> uint(2)));
        float _1927 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1925)]);
        int _1929 = _167 + 8;
        uint _1931 = uint(int(uint(_1929) >> uint(2)));
        float _1933 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1931)]);
        int _1935 = _167 + 12;
        uint _1937 = uint(int(uint(_1935) >> uint(2)));
        float _1939 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1937)]);
        uint _1941 = uint(int(uint(_167) >> uint(2)));
        float _1943 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1941)]);
        int _1945 = _167 + 4;
        uint _1947 = uint(int(uint(_1945) >> uint(2)));
        float _1949 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1947)]);
        int _1951 = _167 + 8;
        uint _1953 = uint(int(uint(_1951) >> uint(2)));
        float _1955 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1953)]);
        int _1957 = _167 + 12;
        uint _1959 = uint(int(uint(_1957) >> uint(2)));
        float _1961 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1959)]);
        float _1963 = _831 * _1905;
        float _1965 = _831 * _1927;
        float _1967 = fma(_833, _1899, _1963);
        float _1969 = _831 * _1949;
        float _1971 = fma(_833, _1921, _1965);
        float _1973 = fma(_833, _1943, _1969);
        float _1975 = fma(_835, _1911, _1967);
        float _1977 = fma(_835, _1933, _1971);
        float _1979 = fma(_835, _1955, _1973);
        float _1981 = _1975 + _1917;
        float _1983 = _1977 + _1939;
        float _1985 = _1979 + _1961;
        _1889 = _1983;
        _1891 = _1981;
        _1893 = _1985;
    }
    float _1987 = _1889;
    float _1989 = _1891;
    float _1991 = _1893;
    float _1993 = -_1987;
    float _1995 = _1621 + _1993;
    float _1997 = -_1989;
    float _1999 = _1619 + _1997;
    float _2001 = -_1991;
    float _2003 = _1623 + _2001;
    float _2005 = _1995 * _1995;
    float _2007 = fma(_1999, _1999, _2005);
    float _2009 = fma(_2003, _2003, _2007);
    float _2011 = sqrt(_2009);
    float _2013 = _2003;
    int _2015 = 0;
    float _2017 = 0.0;
    float _2019 = 0.0;
    float _2021 = 0.0;
    if (!_1579)
    {
        bool _2023 = _2011 > _1625;
        float _2025 = float(_2023);
        _2013 = _2025;
    }
    float _2027 = _2013;
    bool _2029 = !_1579;
    float _2031 = _2027;
    if (!_2029)
    {
        float _2033 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[20]);
        float _2035 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[21]);
        float _2037 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[22]);
        float _2039 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[23]);
        float _2041 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[24]);
        float _2043 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[25]);
        float _2045 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[26]);
        float _2047 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[27]);
        float _2049 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[28]);
        float _2051 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[29]);
        float _2053 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[30]);
        uint _2055 = uint(int(uint(_171) >> uint(2)));
        float _2057 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2055)]);
        bool _2059 = _2011 > _1625;
        float _2061 = -_1987;
        float _2063 = _2035 + _2061;
        float _2065 = -_1989;
        float _2067 = _2033 + _2065;
        float _2069 = -_1991;
        float _2071 = _2037 + _2069;
        float _2073 = -_1987;
        float _2075 = _2043 + _2073;
        float _2077 = _2063 * _2063;
        float _2079 = -_1989;
        float _2081 = _2041 + _2079;
        float _2083 = -_1991;
        float _2085 = _2045 + _2083;
        float _2087 = -_1987;
        float _2089 = _2051 + _2087;
        float _2091 = _2075 * _2075;
        float _2093 = -_1989;
        float _2095 = _2049 + _2093;
        float _2097 = fma(_2067, _2067, _2077);
        float _2099 = _2089 * _2089;
        float _2101 = fma(_2081, _2081, _2091);
        float _2103 = -_1991;
        float _2105 = _2053 + _2103;
        float _2107 = fma(_2071, _2071, _2097);
        float _2109 = fma(_2095, _2095, _2099);
        float _2111 = fma(_2085, _2085, _2101);
        float _2113 = _2095;
        int _2115 = as_type<int>(_2111);
        if (!_2059)
        {
            float _2117 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _2113 = _2117;
        }
        float _2119 = _2113;
        float _2121 = sqrt(_2107);
        float _2123 = fma(_2105, _2105, _2109);
        float _2125 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[14]);
        float _2127 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _2129 = sqrt(_2111);
        float _2131 = sqrt(_2123);
        bool _2133 = _2121 > _1625;
        bool _2135 = _2129 > _1625;
        float _2137 = _2039;
        if (!_2133)
        {
            float _2139 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _2137 = _2139;
        }
        float _2141 = _2137;
        bool _2143 = _2131 > _1625;
        float _2145 = _2047;
        if (!_2135)
        {
            float _2147 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _2145 = _2147;
        }
        float _2149 = _2145;
        float _2151 = _1707;
        if (!_2143)
        {
            float _2153 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _2151 = _2153;
        }
        float _2155 = _2151;
        int _2157 = as_type<int>(_2057) << 24;
        int _2159 = _2157 >> 24;
        float _2161 = float(_2159);
        float _2163 = _2161 * 0.0078740157186985015869140625;
        float _2165 = precise::min(_2163, 1.0);
        float _2167 = precise::max(_2165, -1.0);
        int _2169 = as_type<int>(_2057) << 16;
        int _2171 = as_type<int>(_2057) << 8;
        bool _2173 = _2167 > 0.0;
        bool _2175 = _2173 || _2059;
        int _2177 = _2169 >> 24;
        int _2179 = _2171 >> 24;
        int _2181 = _2177;
        if (!_2059)
        {
            bool _2183 = _2167 >= 0.0;
            bool _2185 = isnan(_2167);
            bool _2187 = _2183 || _2185;
            bool _2189 = isnan(0.0);
            bool _2191 = _2187 || _2189;
            _1645 = _2191;
        }
        bool _2193 = _1645;
        float _2195 = float(_2177);
        int _2197 = as_type<int>(_2057) >> 24;
        float _2199 = float(_2179);
        float _2201 = _2195 * 0.0078740157186985015869140625;
        float _2203 = _2195;
        bool _2205 = _2193;
        if (!_2059)
        {
            int _2207 = _2193 ? 0 : 1;
            _2015 = _2207;
        }
        int _2209 = _2015;
        float _2211 = float(_2197);
        float _2213 = _2199 * 0.0078740157186985015869140625;
        if (!_2059)
        {
            int _2215 = ~_2209;
            int _2217 = _2215 + 1;
            int _2219 = _2217 + 1;
            _2181 = _2219;
        }
        int _2221 = _2181;
        int _2223 = _2221;
        if (!_2175)
        {
            int _2225 = ~_2209;
            int _2227 = _2225 + 1;
            _2223 = _2227;
        }
        int _2229 = _2223;
        float _2231 = _2211 * 0.0078740157186985015869140625;
        float _2233 = precise::min(_2201, 1.0);
        int _2235 = _2229;
        int _2237 = as_type<int>(_2233);
        if (!_2059)
        {
            float _2239 = float(_2229);
            _2235 = as_type<int>(_2239);
        }
        int _2241 = _2235;
        float _2243 = precise::min(_2231, 1.0);
        int _2245 = _2241;
        int _2247 = as_type<int>(_2243);
        if (_2059)
        {
            _2203 = 1.0;
        }
        float _2249 = _2203;
        float _2251 = precise::max(_2243, -1.0);
        float _2253 = _2249;
        if (!_2059)
        {
            bool _2255 = _2011 >= _2119;
            bool _2257 = isnan(_2011);
            bool _2259 = _2255 || _2257;
            bool _2261 = isnan(_2119);
            bool _2263 = _2259 || _2261;
            _2205 = _2263;
        }
        bool _2265 = _2205;
        float _2267 = precise::min(_2213, 1.0);
        float _2269 = precise::max(_2233, -1.0);
        bool _2271 = _2265;
        int _2273 = as_type<int>(_2267);
        if (!_2059)
        {
            float _2275 = _2265 ? as_type<float>(_2241) : (-1.0);
            _2253 = _2275;
        }
        float _2277 = _2253;
        float _2279 = precise::max(_2267, -1.0);
        if (!_2133)
        {
            bool _2281 = _2269 >= 0.0;
            bool _2283 = isnan(_2269);
            bool _2285 = _2281 || _2283;
            bool _2287 = isnan(0.0);
            bool _2289 = _2285 || _2287;
            _2271 = _2289;
        }
        bool _2291 = _2271;
        bool _2293 = _2269 > 0.0;
        bool _2295 = _2293 || _2133;
        bool _2297 = _2295;
        if (!_2135)
        {
            bool _2299 = _2279 >= 0.0;
            bool _2301 = isnan(_2279);
            bool _2303 = _2299 || _2301;
            bool _2305 = isnan(0.0);
            bool _2307 = _2303 || _2305;
            _1647 = _2307;
        }
        bool _2309 = _1647;
        bool _2311 = _2279 > 0.0;
        bool _2313 = _2311 || _2135;
        bool _2315 = _2309;
        bool _2317 = _2313;
        if (!_2133)
        {
            int _2319 = _2291 ? 0 : 1;
            _2273 = _2319;
        }
        int _2321 = _2273;
        bool _2323 = _2251 > 0.0;
        bool _2325 = _2323 || _2143;
        bool _2327 = _2325;
        float _2329 = as_type<float>(_2321);
        if (!_2135)
        {
            int _2331 = _2309 ? 0 : 1;
            _2115 = _2331;
        }
        int _2333 = _2115;
        float _2335 = 1.0 / _2125;
        float _2337 = _2125;
        if (!_2143)
        {
            bool _2339 = _2251 >= 0.0;
            bool _2341 = isnan(_2251);
            bool _2343 = _2339 || _2341;
            bool _2345 = isnan(0.0);
            bool _2347 = _2343 || _2345;
            _2315 = _2347;
        }
        bool _2349 = _2315;
        if (!_2143)
        {
            int _2351 = _2349 ? 0 : 1;
            _2245 = _2351;
        }
        int _2353 = _2245;
        float _2355 = as_type<float>(_2353);
        if (!_2133)
        {
            int _2357 = ~_2321;
            int _2359 = _2357 + 1;
            int _2361 = _2359 + 1;
            _2237 = _2361;
        }
        int _2363 = _2237;
        int _2365 = _2363;
        if (!_2135)
        {
            int _2367 = ~_2333;
            int _2369 = _2367 + 1;
            int _2371 = _2369 + 1;
            _2247 = _2371;
        }
        int _2373 = _2247;
        int _2375 = _2373;
        if (!_2295)
        {
            int _2377 = ~_2321;
            int _2379 = _2377 + 1;
            _2365 = _2379;
        }
        int _2381 = _2365;
        int _2383 = _2381;
        if (!_2143)
        {
            int _2385 = ~_2353;
            int _2387 = _2385 + 1;
            int _2389 = _2387 + 1;
            _1895 = _2389;
        }
        int _2391 = _1895;
        int _2393 = _2391;
        if (!_2313)
        {
            int _2395 = ~_2333;
            int _2397 = _2395 + 1;
            _2375 = _2397;
        }
        int _2399 = _2375;
        int _2401 = _2399;
        if (!_2325)
        {
            int _2403 = ~_2353;
            int _2405 = _2403 + 1;
            _2393 = _2405;
        }
        int _2407 = _2393;
        int _2409 = _2407;
        if (!_2133)
        {
            bool _2411 = _2121 >= _2141;
            bool _2413 = isnan(_2121);
            bool _2415 = _2411 || _2413;
            bool _2417 = isnan(_2141);
            bool _2419 = _2415 || _2417;
            _2297 = _2419;
        }
        bool _2421 = _2297;
        if (!_2135)
        {
            bool _2423 = _2129 >= _2149;
            bool _2425 = isnan(_2129);
            bool _2427 = _2423 || _2425;
            bool _2429 = isnan(_2149);
            bool _2431 = _2427 || _2429;
            _2317 = _2431;
        }
        bool _2433 = _2317;
        if (!_2133)
        {
            float _2435 = float(_2381);
            _2383 = as_type<int>(_2435);
        }
        int _2437 = _2383;
        if (!_2135)
        {
            float _2439 = float(_2399);
            _2401 = as_type<int>(_2439);
        }
        int _2441 = _2401;
        if (!_2143)
        {
            bool _2443 = _2131 >= _2155;
            bool _2445 = isnan(_2131);
            bool _2447 = _2443 || _2445;
            bool _2449 = isnan(_2155);
            bool _2451 = _2447 || _2449;
            _2327 = _2451;
        }
        bool _2453 = _2327;
        if (!_2143)
        {
            float _2455 = float(_2407);
            _2409 = as_type<int>(_2455);
        }
        int _2457 = _2409;
        if (_2133)
        {
            _2337 = 1.0;
        }
        float _2459 = _2337;
        float _2461 = _2459;
        if (_2135)
        {
            _2329 = 1.0;
        }
        float _2463 = _2329;
        float _2465 = _2127 * _2335;
        float _2467 = _2463;
        if (_2143)
        {
            _2355 = 1.0;
        }
        float _2469 = _2355;
        float _2471 = _2469;
        if (!_2133)
        {
            float _2473 = _2421 ? as_type<float>(_2437) : (-1.0);
            _2461 = _2473;
        }
        float _2475 = _2461;
        if (!_2135)
        {
            float _2477 = _2433 ? as_type<float>(_2441) : (-1.0);
            _2467 = _2477;
        }
        float _2479 = _2467;
        if (!_2143)
        {
            float _2481 = _2453 ? as_type<float>(_2457) : (-1.0);
            _2471 = _2481;
        }
        float _2483 = _2471;
        float _2485 = abs(_2167);
        float _2487 = fma(_2465, _2277, _2485);
        float _2489 = precise::clamp(_2487, 0.0, 1.0);
        float _2491 = abs(_2269);
        float _2493 = fma(_2465, _2475, _2491);
        float _2495 = precise::clamp(_2493, 0.0, 1.0);
        float _2497 = abs(_2279);
        float _2499 = fma(_2465, _2479, _2497);
        float _2501 = precise::clamp(_2499, 0.0, 1.0);
        float _2503 = abs(_2251);
        float _2505 = fma(_2465, _2483, _2503);
        float _2507 = precise::clamp(_2505, 0.0, 1.0);
        float _2509 = _2489 * _2277;
        float _2511 = _2495 * _2475;
        float _2513 = _2501 * _2479;
        float _2515 = _2507 * _2483;
        _2031 = _2509;
        _2017 = _2511;
        _2019 = _2513;
        _2021 = _2515;
    }
    float _2517 = _2031;
    float _2519 = _2017;
    float _2521 = _2019;
    float _2523 = _2021;
    float _2525 = precise::min(_2517, 1.0);
    float _2527 = -_231;
    float _2529 = _2527 + _835;
    float _2531 = precise::max(_2525, -1.0);
    float _2533 = precise::min(_2519, 1.0);
    float _2535 = _2531 * 127.0;
    float _2537 = precise::max(_2533, -1.0);
    float _2539 = precise::min(_2521, 1.0);
    float _2541 = precise::min(_2523, 1.0);
    float _2543 = _2537 * 127.0;
    float _2545 = precise::max(_2539, -1.0);
    float _2547 = rint(_2535);
    int _2549 = int(_2547);
    float _2551 = precise::max(_2541, -1.0);
    float _2553 = _2545 * 127.0;
    float _2555 = _2551 * 127.0;
    float _2557 = rint(_2543);
    int _2559 = int(_2557);
    float _2561 = rint(_2553);
    int _2563 = int(_2561);
    uint _2565 = extract_bits(uint(_2549), 0u, 8u);
    int _2567 = int(_2565) & 255;
    float _2569 = rint(_2555);
    int _2571 = int(_2569);
    uint _2573 = extract_bits(uint(_2567), 0u, 8u);
    int _2575 = int(_2573) & 255;
    uint _2577 = extract_bits(uint(_2559), 0u, 8u);
    int _2579 = int(_2577) & 255;
    int _2581 = _2579 << 8;
    int _2583 = _2575 | _2581;
    uint _2585 = extract_bits(uint(_2567), 16u, 8u);
    int _2587 = int(_2585) & 255;
    int _2589 = _2587 << 16;
    int _2591 = _2583 | _2589;
    uint _2593 = extract_bits(uint(_2567), 24u, 8u);
    int _2595 = int(_2593) & 255;
    int _2597 = _2595 << 24;
    int _2599 = _2591 | _2597;
    float _2601 = -_225;
    float _2603 = _2601 + _831;
    int _2605 = _167 + 8;
    uint _2607 = extract_bits(uint(_2599), 0u, 8u);
    int _2609 = int(_2607) & 255;
    uint _2611 = extract_bits(uint(_2599), 8u, 8u);
    int _2613 = int(_2611) & 255;
    int _2615 = _2613 << 8;
    int _2617 = _2609 | _2615;
    uint _2619 = extract_bits(uint(_2563), 0u, 8u);
    int _2621 = int(_2619) & 255;
    int _2623 = _2621 << 16;
    int _2625 = _2617 | _2623;
    uint _2627 = extract_bits(uint(_2599), 24u, 8u);
    int _2629 = int(_2627) & 255;
    int _2631 = _2629 << 24;
    int _2633 = _2625 | _2631;
    uint _2635 = extract_bits(uint(_2633), 0u, 8u);
    int _2637 = int(_2635) & 255;
    uint _2639 = extract_bits(uint(_2633), 8u, 8u);
    int _2641 = int(_2639) & 255;
    int _2643 = _2641 << 8;
    int _2645 = _2637 | _2643;
    uint _2647 = extract_bits(uint(_2633), 16u, 8u);
    int _2649 = int(_2647) & 255;
    int _2651 = _2649 << 16;
    int _2653 = _2645 | _2651;
    uint _2655 = extract_bits(uint(_2571), 0u, 8u);
    int _2657 = int(_2655) & 255;
    int _2659 = _2657 << 24;
    int _2661 = _2653 | _2659;
    float _2663 = -_219;
    float _2665 = _2663 + _833;
    int _2667 = _167 + 4;
    uint _2669 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2669)] = uint(_2661);
    uint _2671 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2671)] = as_type<uint>(_265);
    uint _2673 = uint(int(uint(_167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2673)] = as_type<uint>(_833);
    uint _2675 = uint(int(uint(_2667) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2675)] = as_type<uint>(_831);
    uint _2677 = uint(int(uint(_2605) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2677)] = as_type<uint>(_835);
    uint _2679 = uint(int(uint(_167) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2679)] = as_type<uint>(_359);
    uint _2681 = uint(int(uint(_2667) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2681)] = as_type<uint>(_361);
    uint _2683 = uint(int(uint(_2605) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2683)] = as_type<uint>(_363);
    uint _2685 = uint(int(uint(_167) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2685)] = as_type<uint>(_2665);
    uint _2687 = uint(int(uint(_2667) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2687)] = as_type<uint>(_2603);
    uint _2689 = uint(int(uint(_2605) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2689)] = as_type<uint>(_2529);
    float _2691 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2693 = _2603 * _2603;
    float _2695 = _361 * _361;
    float _2697 = fma(_2665, _2665, _2693);
    float _2699 = fma(_359, _359, _2695);
    float _2701 = fma(_2529, _2529, _2697);
    float _2703 = fma(_363, _363, _2699);
    float _2705 = sqrt(_2703);
    float _2707 = sqrt(_2701);
    bool _2709 = _2707 >= 9.9999999747524270787835121154785e-07;
    bool _2711 = isnan(_2707);
    bool _2713 = _2709 || _2711;
    bool _2715 = isnan(9.9999999747524270787835121154785e-07);
    bool _2717 = _2713 || _2715;
    if (!_2717)
    {
        bool _2719 = _175 != _179;
        bool _2721 = isnan(_175);
        bool _2723 = _2719 || _2721;
        bool _2725 = isnan(_179);
        bool _2727 = _2723 || _2725;
        _2729 = _2727;
        if (!_2729)
        {
            float _2731 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _2733 = _2731 > 0.0;
            bool _2735 = !_2733;
            if (!_2735)
            {
                float _2737 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _2739 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _2741 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _2743 = _2739 * _2739;
                float _2745 = fma(_2737, _2737, _2743);
                float _2747 = fma(_2741, _2741, _2745);
                float _2749 = rsqrt(_2747);
                float _2751 = _2749 * 9.9999999747524270787835121154785e-07;
                float _2753 = _2737 * _2751;
                float _2755 = _2739 * _2751;
                float _2757 = _2741 * _2751;
                _403 = as_type<int>(_2753);
                _405 = as_type<int>(_2755);
                _407 = as_type<int>(_2757);
                _2729 = true;
            }
            else
            {
                bool _2759 = _2705 >= 9.9999999747524270787835121154785e-07;
                bool _2761 = isnan(_2705);
                bool _2763 = _2759 || _2761;
                bool _2765 = isnan(9.9999999747524270787835121154785e-07);
                bool _2767 = _2763 || _2765;
                if (!_2767)
                {
                    float _2769 = _831 * _831;
                    float _2771 = fma(_833, _833, _2769);
                    float _2773 = fma(_835, _835, _2771);
                    float _2775 = sqrt(_2773);
                    bool _2777 = _2775 >= 9.9999999747524270787835121154785e-07;
                    bool _2779 = isnan(_2775);
                    bool _2781 = _2777 || _2779;
                    bool _2783 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2785 = _2781 || _2783;
                    float _2787 = _2775;
                    if (_2785)
                    {
                        float _2789 = rsqrt(_2773);
                        _2787 = _2789;
                    }
                    float _2791 = _2787;
                    if (!_2785)
                    {
                        _391 = 0;
                    }
                    int _2793 = _391;
                    int _2795 = _2793;
                    if (!_2785)
                    {
                        _393 = 897988541;
                    }
                    int _2797 = _393;
                    int _2799 = _2797;
                    if (!_2785)
                    {
                        _395 = 0;
                    }
                    int _2801 = _395;
                    float _2803 = _2791;
                    int _2805 = _2801;
                    if (_2785)
                    {
                        float _2807 = _2791 * 9.9999999747524270787835121154785e-07;
                        _2803 = _2807;
                    }
                    float _2809 = _2803;
                    if (_2785)
                    {
                        float _2811 = _833 * _2809;
                        _2795 = as_type<int>(_2811);
                    }
                    int _2813 = _2795;
                    _403 = _2813;
                    if (_2785)
                    {
                        float _2815 = _831 * _2809;
                        _2799 = as_type<int>(_2815);
                    }
                    int _2817 = _2799;
                    _405 = _2817;
                    if (_2785)
                    {
                        float _2819 = _835 * _2809;
                        _2805 = as_type<int>(_2819);
                    }
                    int _2821 = _2805;
                    _407 = _2821;
                    _2729 = true;
                }
                else
                {
                    float _2823 = rsqrt(_2703);
                    float _2825 = _2823 * 9.9999999747524270787835121154785e-07;
                    float _2827 = _359 * _2825;
                    float _2829 = _361 * _2825;
                    float _2831 = _363 * _2825;
                    _403 = as_type<int>(_2827);
                    _405 = as_type<int>(_2829);
                    _407 = as_type<int>(_2831);
                    _2729 = true;
                }
            }
        }
    }
    else
    {
        float _2833 = _2705 * _2691;
        bool _2835 = _2833 >= 0.001000000047497451305389404296875;
        bool _2837 = isnan(_2833);
        bool _2839 = _2835 || _2837;
        bool _2841 = isnan(0.001000000047497451305389404296875);
        bool _2843 = _2839 || _2841;
        bool _2845 = _2833 > 0.0;
        bool _2847 = !_2843;
        bool _2849 = _2845 && _2847;
        bool _2851 = _2707 < 0.001000000047497451305389404296875;
        bool _2853 = _2851 && _2849;
        if (!_2853)
        {
            _397 = as_type<int>(_2665);
        }
        int _2855 = _397;
        int _2857 = _2855;
        if (_2853)
        {
            float _2859 = _359 * _2691;
            _2857 = as_type<int>(_2859);
        }
        int _2861 = _2857;
        _403 = _2861;
        if (!_2853)
        {
            _399 = as_type<int>(_2603);
        }
        int _2863 = _399;
        int _2865 = _2863;
        if (_2853)
        {
            float _2867 = _361 * _2691;
            _2865 = as_type<int>(_2867);
        }
        int _2869 = _2865;
        _405 = _2869;
        if (!_2853)
        {
            _401 = as_type<int>(_2529);
        }
        int _2871 = _401;
        _407 = _2871;
        if (_2853)
        {
            float _2873 = _363 * _2691;
            _407 = as_type<int>(_2873);
        }
    }
    _2729 = false;
    int _2875 = _403;
    int _2877 = _405;
    int _2879 = _407;
    uint _2881 = uint(int(uint(_167) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2881)] = uint(_2875);
    uint _2883 = uint(int(uint(_2667) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2883)] = uint(_2877);
    uint _2885 = uint(int(uint(_2605) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2885)] = uint(_2879);
}

