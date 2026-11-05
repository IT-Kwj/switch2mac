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
    texture2d_array<float> cp_t_tcb_16 [[id(14)]];
    sampler cp_t_tcb_16Smplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_14 [[id(16)]];
    sampler cp_t_tcb_14Smplr [[id(17)]];
    sampler cp_t_tcb_14Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1937 = false;
    bool _813 = false;
    float _73 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _75 = as_type<float>(gl_LocalInvocationID.x);
    float _77 = as_type<float>(gl_WorkGroupID.x);
    int _80 = as_type<int>(_77) << 5;
    int _82 = _80 + as_type<int>(_75);
    float _84 = trunc(_73);
    int _86 = int(_84);
    bool _90 = _82 >= _86;
    int _92 = 0;
    float _94 = as_type<float>(_86);
    if (_90)
    {
        _92 = 0;
    }
    int _96 = _92;
    int _98 = _96;
    int _100 = _96;
    float _102 = 0.0;
    if (!_90)
    {
        int _104 = _82 << 4;
        int _106 = _104 + 12;
        uint _109 = uint(int(uint(_106) >> uint(2)));
        float _111 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_109)]);
        float _113 = trunc(_111);
        int _115 = int(_113);
        bool _117 = _115 >= 1;
        int _119 = _117 ? (-1) : 0;
        _94 = as_type<float>(_106);
        _102 = as_type<float>(_115);
        if (!_117)
        {
            _98 = 0;
        }
        int _121 = _98;
        bool _123 = !_117;
        _100 = _121;
        if (!_123)
        {
            float _125 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _127 = uint(int(uint(_106) >> uint(2)));
            float _129 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_127)]);
            float _131 = float(_115);
            float _133 = -_129;
            float _135 = _125 + _133;
            bool _137 = _135 > _131;
            int _139 = as_type<int>(_125);
            _94 = _129;
            _102 = _131;
            if (!_137)
            {
                bool _141 = _125 >= _129;
                bool _143 = isnan(_125);
                bool _145 = _141 || _143;
                bool _147 = isnan(_129);
                bool _149 = _145 || _147;
                _119 = _149 ? (-1) : 0;
            }
            int _151 = _119;
            if (_137)
            {
                _139 = 0;
            }
            int _153 = _139;
            _100 = _153;
            if (!_137)
            {
                int _155 = ~_151;
                int _157 = (_155 != 0) ? 0 : 1;
                _100 = _157;
            }
        }
    }
    int _159 = _100;
    float _161 = _94;
    float _163 = _102;
    int _165 = _159 & 1;
    bool _167 = _165 != 0;
    if (!_167)
    {
        return;
    }
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _171 = _82 << 4;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_173)]);
    int _177 = _171 + 4;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_179)]);
    int _183 = _171 + 8;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_185)]);
    int _189 = as_type<int>(_169) & 512;
    bool _191 = _189 != 0;
    int _193 = _171 + 12;
    uint _195 = uint(int(uint(_171) >> uint(2)));
    float _197 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_195)]);
    int _199 = _171 + 4;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_201)]);
    int _205 = _171 + 8;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_207)]);
    uint _211 = uint(int(uint(_171) >> uint(2)));
    float _213 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_211)]);
    int _215 = _171 + 4;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    float _219 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_217)]);
    int _221 = _171 + 8;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_223)]);
    float _227 = 0.0;
    float _229 = 0.0;
    float _231 = 0.0;
    bool _233 = _191;
    float _235 = _169;
    if (_191)
    {
        float _237 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _241 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _227 = _237;
        _229 = _239;
        _231 = _241;
    }
    float _243 = _227;
    float _245 = _229;
    float _247 = _231;
    float _249 = 0.0;
    float _251 = 0.0;
    float _253 = 0.0;
    if (_191)
    {
        float _255 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _257 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _259 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _249 = _255;
        _251 = _257;
        _253 = _259;
    }
    float _261 = _249;
    float _263 = _251;
    float _265 = _253;
    float _267 = as_type<float>(_159);
    float _269 = _161;
    float _271 = _163;
    if (_191)
    {
        float _273 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _275 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _277 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _267 = _273;
        _269 = _275;
        _271 = _277;
    }
    float _279 = _267;
    float _281 = _269;
    float _283 = _271;
    uint _285 = uint(int(uint(_171) >> uint(2)));
    float _287 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_285)]);
    uint _289 = uint(int(uint(_193) >> uint(2)));
    float _291 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_289)]);
    uint _293 = uint(int(uint(_193) >> uint(2)));
    float _295 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_293)]);
    float _297 = _261;
    float _299 = _263;
    float _301 = _265;
    float _303 = _243;
    float _305 = _245;
    float _307 = _247;
    float _309 = _281;
    float _311 = _279;
    float _313 = _283;
    float _315 = _197;
    float _317 = _203;
    float _319 = _209;
    int _321 = as_type<int>(_213);
    int _323 = as_type<int>(_219);
    int _325 = as_type<int>(_225);
    int _327 = as_type<int>(_213);
    int _329 = as_type<int>(_219);
    int _331 = as_type<int>(_225);
    int _333 = as_type<int>(_213);
    int _335 = as_type<int>(_219);
    int _337 = as_type<int>(_225);
    if (!_191)
    {
        int _339 = _171 + 4;
        uint _341 = uint(int(uint(_171) >> uint(2)));
        float _343 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_341)]);
        int _345 = _171 + 8;
        uint _347 = uint(int(uint(_171) >> uint(2)));
        float _349 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_347)]);
        uint _351 = uint(int(uint(_339) >> uint(2)));
        float _353 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_351)]);
        uint _355 = uint(int(uint(_339) >> uint(2)));
        float _357 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_355)]);
        uint _359 = uint(int(uint(_345) >> uint(2)));
        float _361 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_359)]);
        uint _363 = uint(int(uint(_171) >> uint(2)));
        float _365 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_363)]);
        uint _367 = uint(int(uint(_345) >> uint(2)));
        float _369 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_367)]);
        uint _371 = uint(int(uint(_339) >> uint(2)));
        float _373 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_371)]);
        uint _375 = uint(int(uint(_345) >> uint(2)));
        float _377 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_375)]);
        float _379 = _343 * _343;
        float _381 = fma(_349, _349, _379);
        float _383 = _353 * _353;
        float _385 = fma(_357, _357, _383);
        float _387 = _361 * _361;
        float _389 = fma(_365, _365, _381);
        float _391 = fma(_369, _369, _387);
        float _393 = sqrt(_389);
        float _395 = fma(_373, _373, _385);
        float _397 = fma(_377, _377, _391);
        float _399 = sqrt(_395);
        float _401 = sqrt(_397);
        bool _403 = _393 > 0.0;
        bool _405 = _399 > 0.0;
        bool _407 = _401 > 0.0;
        float _409 = _399;
        float _411 = _401;
        float _413 = _391;
        float _415 = _343;
        float _417 = _393;
        float _419 = _349;
        float _421 = _385;
        float _423 = _353;
        float _425 = _373;
        float _427 = _365;
        if (_403)
        {
            float _429 = rsqrt(_389);
            _409 = _429;
        }
        float _431 = _409;
        float _433 = 0.0;
        if (_405)
        {
            float _435 = rsqrt(_395);
            _433 = _435;
        }
        float _437 = _433;
        float _439 = 0.0;
        if (_407)
        {
            float _441 = rsqrt(_397);
            _439 = _441;
        }
        float _443 = _439;
        if (!_403)
        {
            _411 = 0.0;
        }
        float _445 = _411;
        float _447 = _445;
        if (_403)
        {
            float _449 = _343 * _431;
            _447 = _449;
        }
        float _451 = _447;
        _297 = _451;
        if (!_403)
        {
            _413 = 0.0;
        }
        float _453 = _413;
        float _455 = _453;
        if (_403)
        {
            float _457 = _349 * _431;
            _455 = _457;
        }
        float _459 = _455;
        _303 = _459;
        if (!_403)
        {
            _415 = 0.0;
        }
        float _461 = _415;
        float _463 = _461;
        if (_403)
        {
            float _465 = _365 * _431;
            _463 = _465;
        }
        float _467 = _463;
        _311 = _467;
        if (!_405)
        {
            _417 = 0.0;
        }
        float _469 = _417;
        float _471 = _469;
        if (_405)
        {
            float _473 = _353 * _437;
            _471 = _473;
        }
        float _475 = _471;
        _299 = _475;
        if (!_405)
        {
            _419 = 0.0;
        }
        float _477 = _419;
        float _479 = _477;
        if (_405)
        {
            float _481 = _373 * _437;
            _479 = _481;
        }
        float _483 = _479;
        _309 = _483;
        if (!_405)
        {
            _421 = 0.0;
        }
        float _485 = _421;
        float _487 = _485;
        if (_405)
        {
            float _489 = _357 * _437;
            _487 = _489;
        }
        float _491 = _487;
        _305 = _491;
        if (!_407)
        {
            _423 = 0.0;
        }
        float _493 = _423;
        float _495 = _493;
        if (!_407)
        {
            _425 = 0.0;
        }
        float _497 = _425;
        float _499 = _497;
        if (_407)
        {
            float _501 = _361 * _443;
            _495 = _501;
        }
        float _503 = _495;
        _301 = _503;
        if (!_407)
        {
            _427 = 0.0;
        }
        float _505 = _427;
        _313 = _505;
        if (_407)
        {
            float _507 = _369 * _443;
            _499 = _507;
        }
        float _509 = _499;
        _307 = _509;
        if (_407)
        {
            float _511 = _377 * _443;
            _313 = _511;
        }
    }
    float _513 = _297;
    float _515 = _299;
    float _517 = _301;
    float _519 = _303;
    float _521 = _305;
    float _523 = _307;
    float _525 = _309;
    float _527 = _311;
    float _529 = _313;
    float _531 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _533 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _535 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _537 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _539 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _541 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _543 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _545 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _547 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _549 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _551 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _553 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _555 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _557 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _559 = uint(int(uint(_193) >> uint(2)));
    float _561 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_559)]);
    bool _563 = _533 > 0.0;
    float _565 = abs(_531);
    float _567 = log2(_565);
    bool _569 = _535 > 0.0;
    float _571 = 0.0;
    float _573 = _537;
    float _575 = _533;
    float _577 = _539;
    float _579 = _549;
    float _581 = _551;
    float _583 = _553;
    float _585 = _555;
    float _587 = _557;
    if (_563)
    {
        float _589 = 1.0 / _533;
        _571 = _589;
    }
    float _591 = _571;
    float _593 = _537 * _535;
    float _595 = _541 * _545;
    float _597 = _539 * _545;
    if (_569)
    {
        float _599 = -_593;
        float _601 = fma(_287, _599, _537);
        _573 = _601;
    }
    float _603 = _573;
    float _605 = _543 * _545;
    float _607 = -_295;
    float _609 = _547 + _607;
    float _611 = _595 * _513;
    float _613 = _595 * _515;
    float _615 = _595 * _517;
    float _617 = _549 * _567;
    float _619 = fma(_597, _519, _611);
    float _621 = fma(_597, _521, _613);
    float _623 = fma(_597, _523, _615);
    float _625 = _603;
    float _627 = _621;
    if (_563)
    {
        float _629 = _609 * _591;
        _575 = _629;
    }
    float _631 = _575;
    float _633 = exp2(_617);
    if (_563)
    {
        float _635 = precise::min(_631, 1.0);
        _577 = _635;
    }
    float _637 = _577;
    float _639 = fma(_605, _525, _621);
    float _641 = fma(_605, _527, _619);
    float _643 = fma(_605, _529, _623);
    if (_563)
    {
        float _645 = _637 * _603;
        _625 = _645;
    }
    float _647 = _625;
    float _649 = _549 * _639;
    float _651 = _549 * _641;
    float _653 = _291 * _549;
    float _655 = _549 * _647;
    float _657 = _549 * _643;
    float _659 = fma(_197, _633, _651);
    float _661 = fma(_203, _633, _649);
    float _663 = _551 * _655;
    float _665 = _553 * _655;
    float _667 = fma(_197, _653, _175);
    float _669 = fma(_203, _653, _181);
    float _671 = fma(_209, _653, _187);
    float _673 = fma(_209, _633, _657);
    float _675 = _555 * _655;
    bool _677 = !_191;
    float _679 = _657;
    float _681 = _653;
    float _683 = _663;
    float _685 = _675;
    float _687 = _665;
    float _809;
    float _811;
    if (!_677)
    {
        float _689 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _691 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _693 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _695 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _697 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _699 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _701 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _703 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _705 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _707 = _693 * _695;
        float _709 = _693 * _697;
        float _711 = _691 * _695;
        float _713 = -_707;
        float _715 = fma(_689, _699, _713);
        float _717 = -_709;
        float _719 = fma(_691, _699, _717);
        float _721 = -_711;
        float _723 = fma(_689, _697, _721);
        float _725 = _703 * _689;
        float _727 = _703 * _715;
        float _729 = _705 * _691;
        float _731 = _701 * _697;
        float _733 = -_725;
        float _735 = fma(_701, _691, _733);
        float _737 = -_727;
        float _739 = fma(_701, _719, _737);
        float _741 = _703 * _699;
        float _743 = _705 * _695;
        float _745 = _701 * _693;
        float _747 = fma(_705, _723, _739);
        float _749 = -_741;
        float _751 = fma(_705, _697, _749);
        float _753 = -_743;
        float _755 = fma(_701, _699, _753);
        float _757 = -_731;
        float _759 = fma(_703, _695, _757);
        float _761 = -_745;
        float _763 = fma(_705, _689, _761);
        float _765 = -_689;
        float _767 = fma(_765, _699, _707);
        float _769 = 1.0 / _747;
        float _771 = -_729;
        float _773 = fma(_703, _693, _771);
        float _775 = _751 * _769;
        float _777 = _755 * _769;
        float _779 = _759 * _769;
        float _781 = _663 * _769;
        float _783 = _665 * _775;
        float _785 = _665 * _777;
        float _787 = _767 * _769;
        float _789 = _665 * _779;
        float _791 = _773 * _769;
        float _793 = _763 * _769;
        float _795 = fma(_719, _781, _783);
        float _797 = fma(_663, _787, _785);
        float _799 = _735 * _769;
        float _801 = fma(_723, _781, _789);
        float _803 = fma(_675, _791, _795);
        float _805 = fma(_675, _793, _797);
        float _807 = fma(_675, _799, _801);
        _315 = _793;
        _317 = _797;
        _319 = _795;
        _681 = _801;
        _579 = _701;
        _235 = _703;
        _627 = _705;
        _809 = _769;
        _581 = _781;
        _583 = _697;
        _585 = _699;
        _587 = _707;
        _811 = _805;
        _683 = _803;
        _685 = _807;
        _813 = true;
    }
    else
    {
        int _815 = as_type<int>(_169) & 1024;
        bool _817 = _815 != 0;
        if (_817)
        {
            _233 = true;
        }
        bool _819 = _233;
        bool _821 = _819;
        if (!_817)
        {
            int _823 = as_type<int>(_169) & 2048;
            bool _825 = _823 != 0;
            _821 = _825;
        }
        bool _827 = _821;
        if (!_827)
        {
            _679 = _665;
        }
        float _829 = _679;
        bool _831 = !_827;
        _809 = 0.0;
        _811 = _829;
        if (!_831)
        {
            uint _833 = uint(int(uint(_171) >> uint(2)));
            float _835 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_833)]);
            int _837 = _171 + 4;
            uint _839 = uint(int(uint(_837) >> uint(2)));
            float _841 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_839)]);
            int _843 = _171 + 8;
            uint _845 = uint(int(uint(_843) >> uint(2)));
            float _847 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_845)]);
            uint _849 = uint(int(uint(_171) >> uint(2)));
            float _851 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_849)]);
            int _853 = _171 + 4;
            uint _855 = uint(int(uint(_853) >> uint(2)));
            float _857 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_855)]);
            int _859 = _171 + 8;
            uint _861 = uint(int(uint(_859) >> uint(2)));
            float _863 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_861)]);
            uint _865 = uint(int(uint(_171) >> uint(2)));
            float _867 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_865)]);
            int _869 = _171 + 4;
            uint _871 = uint(int(uint(_869) >> uint(2)));
            float _873 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_871)]);
            int _875 = _171 + 8;
            uint _877 = uint(int(uint(_875) >> uint(2)));
            float _879 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_877)]);
            float _881 = _847 * _851;
            float _883 = _847 * _857;
            float _885 = _841 * _851;
            float _887 = -_881;
            float _889 = fma(_835, _863, _887);
            float _891 = -_883;
            float _893 = fma(_841, _863, _891);
            float _895 = -_885;
            float _897 = fma(_835, _857, _895);
            float _899 = _873 * _835;
            float _901 = _873 * _889;
            float _903 = _879 * _841;
            float _905 = _867 * _857;
            float _907 = -_899;
            float _909 = fma(_867, _841, _907);
            float _911 = -_901;
            float _913 = fma(_867, _893, _911);
            float _915 = _873 * _863;
            float _917 = _879 * _851;
            float _919 = _867 * _847;
            float _921 = fma(_879, _897, _913);
            float _923 = -_915;
            float _925 = fma(_879, _857, _923);
            float _927 = -_917;
            float _929 = fma(_867, _863, _927);
            float _931 = -_905;
            float _933 = fma(_873, _851, _931);
            float _935 = -_919;
            float _937 = fma(_879, _835, _935);
            float _939 = -_835;
            float _941 = fma(_939, _863, _881);
            float _943 = 1.0 / _921;
            float _945 = -_903;
            float _947 = fma(_873, _847, _945);
            float _949 = _925 * _943;
            float _951 = _929 * _943;
            float _953 = _933 * _943;
            float _955 = _663 * _943;
            float _957 = _665 * _949;
            float _959 = _665 * _951;
            float _961 = _941 * _943;
            float _963 = _665 * _953;
            float _965 = _947 * _943;
            float _967 = _937 * _943;
            float _969 = fma(_893, _955, _957);
            float _971 = fma(_663, _961, _959);
            float _973 = _909 * _943;
            float _975 = fma(_897, _955, _963);
            float _977 = fma(_675, _965, _969);
            float _979 = fma(_675, _967, _971);
            float _981 = fma(_675, _973, _975);
            _315 = _967;
            _317 = _971;
            _319 = _969;
            _681 = _975;
            _579 = _867;
            _235 = _873;
            _627 = _879;
            _809 = _943;
            _581 = _955;
            _583 = _857;
            _585 = _863;
            _587 = _881;
            _811 = _979;
            _683 = _977;
            _685 = _981;
        }
    }
    _813 = false;
    float _983 = _315;
    float _985 = _317;
    float _987 = _319;
    float _989 = _681;
    float _991 = _579;
    float _993 = _235;
    float _995 = _627;
    float _997 = _809;
    float _999 = _581;
    float _1001 = _583;
    float _1003 = _585;
    float _1005 = _587;
    float _1007 = _811;
    float _1009 = _683;
    float _1011 = _685;
    uint _1013 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1013)] = as_type<uint>(_561);
    float _1015 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1017 = as_type<int>(_1015) & 512;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>(_1015) & 1024;
    bool _1023 = _1021 != 0;
    float _1025 = _983;
    float _1027 = _985;
    float _1029 = _987;
    float _1031 = _989;
    float _1033 = _1011;
    float _1035 = _1009;
    if (_1019)
    {
        float _1037 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1039 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1041 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1043 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1025 = _1037;
        _1027 = _1039;
        _1029 = _1041;
        _1031 = _1043;
    }
    float _1045 = _1025;
    float _1047 = _1027;
    float _1049 = _1029;
    float _1051 = _1031;
    float _1053 = _991;
    float _1055 = _993;
    float _1057 = _995;
    float _1059 = _997;
    if (_1019)
    {
        float _1061 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1063 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1065 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1067 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1053 = _1061;
        _1055 = _1063;
        _1057 = _1065;
        _1059 = _1067;
    }
    float _1069 = _1053;
    float _1071 = _1055;
    float _1073 = _1057;
    float _1075 = _1059;
    float _1077 = _999;
    float _1079 = _1001;
    float _1081 = _1003;
    float _1083 = _1005;
    if (_1019)
    {
        float _1085 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1087 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1089 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1091 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1077 = _1085;
        _1079 = _1087;
        _1081 = _1089;
        _1083 = _1091;
    }
    float _1093 = _1077;
    float _1095 = _1079;
    float _1097 = _1081;
    float _1099 = _1083;
    float _1101 = _669 + _1007;
    float _1103 = _667 + _1009;
    float _1105 = _671 + _1011;
    float _1107 = 0.0;
    if (!_1019)
    {
        _687 = 0.0;
        _1107 = 0.0;
    }
    float _1109 = _687;
    float _1111 = _1107;
    float _1113 = _1109;
    float _1115 = _1111;
    if (!_1019)
    {
        _1033 = 0.0;
    }
    float _1117 = _1033;
    int _1119 = as_type<int>(_1015) & 2048;
    bool _1121 = _1119 != 0;
    float _1123 = _1045;
    float _1125 = _1117;
    if (_1019)
    {
        float _1127 = _1101 * _1047;
        _1035 = _1127;
    }
    float _1129 = _1035;
    float _1131 = _1071;
    float _1133 = _1095;
    float _1135 = _1093;
    float _1137 = _1073;
    if (_1019)
    {
        float _1139 = _1101 * _1071;
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = _1141;
    if (_1019)
    {
        float _1145 = fma(_1103, _1045, _1129);
        _1123 = _1145;
    }
    float _1147 = _1123;
    float _1149 = _1147;
    if (_1019)
    {
        float _1151 = _1101 * _1095;
        _1133 = _1151;
    }
    float _1153 = _1133;
    if (_1019)
    {
        float _1155 = fma(_1103, _1069, _1141);
        _1143 = _1155;
    }
    float _1157 = _1143;
    if (_1019)
    {
        float _1159 = fma(_1105, _1049, _1147);
        _1149 = _1159;
    }
    float _1161 = _1149;
    if (_1019)
    {
        float _1163 = fma(_1103, _1093, _1153);
        _1135 = _1163;
    }
    float _1165 = _1135;
    float _1167 = _1165;
    if (_1019)
    {
        float _1169 = fma(_1105, _1073, _1157);
        _1137 = _1169;
    }
    float _1171 = _1137;
    if (_1019)
    {
        float _1173 = _1051 + _1161;
        _1125 = _1173;
    }
    float _1175 = _1125;
    float _1177 = _1175;
    if (_1019)
    {
        float _1179 = fma(_1105, _1097, _1165);
        _1167 = _1179;
    }
    float _1181 = _1167;
    if (_1019)
    {
        float _1183 = _1075 + _1171;
        _1113 = _1183;
    }
    float _1185 = _1113;
    float _1187 = _1185;
    if (_1019)
    {
        float _1189 = _1099 + _1181;
        _1115 = _1189;
    }
    float _1191 = _1115;
    bool _1193 = !_1023;
    float _1195 = _1191;
    if (!_1193)
    {
        float _1197 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1199 = uint(int(uint(_171) >> uint(2)));
        float _1201 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1199)]);
        int _1203 = _171 + 4;
        uint _1205 = uint(int(uint(_1203) >> uint(2)));
        float _1207 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1205)]);
        int _1209 = _171 + 8;
        uint _1211 = uint(int(uint(_1209) >> uint(2)));
        float _1213 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1211)]);
        uint _1215 = uint(int(uint(_171) >> uint(2)));
        float _1217 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1215)]);
        int _1219 = _171 + 4;
        uint _1221 = uint(int(uint(_1219) >> uint(2)));
        float _1223 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1221)]);
        int _1225 = _171 + 8;
        uint _1227 = uint(int(uint(_1225) >> uint(2)));
        float _1229 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1227)]);
        uint _1231 = uint(int(uint(_171) >> uint(2)));
        float _1233 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1231)]);
        int _1235 = _171 + 4;
        uint _1237 = uint(int(uint(_1235) >> uint(2)));
        float _1239 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1237)]);
        int _1241 = _171 + 8;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        float _1245 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1243)]);
        float _1247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1249 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1251 = _1101 * _1207;
        float _1253 = _1101 * _1223;
        float _1255 = _1101 * _1239;
        float _1257 = fma(_1103, _1201, _1251);
        float _1259 = fma(_1103, _1217, _1253);
        float _1261 = fma(_1103, _1233, _1255);
        float _1263 = fma(_1105, _1213, _1257);
        float _1265 = fma(_1105, _1229, _1259);
        float _1267 = fma(_1105, _1245, _1261);
        float _1269 = _1197 + _1263;
        float _1271 = _1247 + _1265;
        float _1273 = _1249 + _1267;
        _1187 = _1271;
        _1177 = _1269;
        _1195 = _1273;
    }
    float _1275 = _1187;
    float _1277 = _1177;
    float _1279 = _1195;
    bool _1281 = !_1121;
    float _1283 = _1275;
    float _1285 = _1277;
    float _1287 = _1279;
    if (!_1281)
    {
        uint _1289 = uint(int(uint(_171) >> uint(2)));
        float _1291 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1289)]);
        int _1293 = _171 + 4;
        uint _1295 = uint(int(uint(_1293) >> uint(2)));
        float _1297 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1295)]);
        int _1299 = _171 + 8;
        uint _1301 = uint(int(uint(_1299) >> uint(2)));
        float _1303 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1301)]);
        int _1305 = _171 + 12;
        uint _1307 = uint(int(uint(_1305) >> uint(2)));
        float _1309 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1307)]);
        uint _1311 = uint(int(uint(_171) >> uint(2)));
        float _1313 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1311)]);
        int _1315 = _171 + 4;
        uint _1317 = uint(int(uint(_1315) >> uint(2)));
        float _1319 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1317)]);
        int _1321 = _171 + 8;
        uint _1323 = uint(int(uint(_1321) >> uint(2)));
        float _1325 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1323)]);
        int _1327 = _171 + 12;
        uint _1329 = uint(int(uint(_1327) >> uint(2)));
        float _1331 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1329)]);
        uint _1333 = uint(int(uint(_171) >> uint(2)));
        float _1335 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1333)]);
        int _1337 = _171 + 4;
        uint _1339 = uint(int(uint(_1337) >> uint(2)));
        float _1341 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1339)]);
        int _1343 = _171 + 8;
        uint _1345 = uint(int(uint(_1343) >> uint(2)));
        float _1347 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1345)]);
        int _1349 = _171 + 12;
        uint _1351 = uint(int(uint(_1349) >> uint(2)));
        float _1353 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1351)]);
        float _1355 = _1101 * _1297;
        float _1357 = _1101 * _1319;
        float _1359 = _1101 * _1341;
        float _1361 = fma(_1103, _1291, _1355);
        float _1363 = fma(_1103, _1313, _1357);
        float _1365 = fma(_1103, _1335, _1359);
        float _1367 = fma(_1105, _1303, _1361);
        float _1369 = fma(_1105, _1325, _1363);
        float _1371 = fma(_1105, _1347, _1365);
        float _1373 = _1367 + _1309;
        float _1375 = _1369 + _1331;
        float _1377 = _1371 + _1353;
        _1283 = _1375;
        _1285 = _1373;
        _1287 = _1377;
    }
    float _1379 = _1283;
    float _1381 = _1285;
    float _1383 = _1287;
    float _1385 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1387 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1389 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1391 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1393 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1395 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1397 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1399 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1401 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1403 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1405 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1407 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1409 = _1387 * _1379;
    float _1411 = fma(_1385, _1381, _1409);
    float _1413 = fma(_1389, _1383, _1411);
    float _1415 = _1391 + _1413;
    float _1417 = -_1415;
    bool _1419 = _1393 >= _1417;
    bool _1421 = isnan(_1393);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan(_1417);
    bool _1427 = _1423 || _1425;
    float _1429 = -_1415;
    bool _1431 = _1395 >= _1429;
    bool _1433 = isnan(_1395);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(_1429);
    bool _1439 = _1435 || _1437;
    int _1441 = _1427 ? 0 : 1;
    int _1443 = 2;
    if (_1427)
    {
        _1443 = 1;
    }
    int _1445 = _1443;
    int _1447 = _1445;
    if (_1439)
    {
        _1447 = _1441;
    }
    int _1449 = _1447;
    int _1451 = _1449 << 6;
    int _1453 = _1451 + 96;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    float _1457 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1455)]);
    int _1459 = _1453 + 4;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    float _1463 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1461)]);
    int _1465 = _1453 + 8;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    float _1469 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1467)]);
    int _1471 = _1453 + 12;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    float _1475 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1473)]);
    int _1477 = _1451 + 48;
    int _1479 = _1451 + 64;
    uint _1481 = uint(int(uint(_1477) >> uint(2)));
    float _1483 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1481)]);
    int _1485 = _1477 + 4;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    float _1489 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1487)]);
    int _1491 = _1477 + 8;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    float _1495 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1493)]);
    int _1497 = _1477 + 12;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    float _1501 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1499)]);
    uint _1503 = uint(int(uint(_1479) >> uint(2)));
    float _1505 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1503)]);
    int _1507 = _1479 + 4;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    float _1511 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1509)]);
    int _1513 = _1479 + 8;
    uint _1515 = uint(int(uint(_1513) >> uint(2)));
    float _1517 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1515)]);
    int _1519 = _1479 + 12;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    float _1523 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1521)]);
    int _1525 = _1451 + 80;
    float _1527 = _1397 + 1.0;
    float _1529 = _1527 + _1379;
    uint _1531 = uint(int(uint(_1525) >> uint(2)));
    float _1533 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1531)]);
    int _1535 = _1525 + 4;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    float _1539 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1537)]);
    int _1541 = _1525 + 8;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    float _1545 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1543)]);
    int _1547 = _1525 + 12;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    float _1551 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1549)]);
    float _1553 = _1529 * _1401;
    float _1555 = fma(_1399, _1381, _1553);
    float _1557 = fma(_1403, _1383, _1555);
    float _1559 = _1405 + _1557;
    float _1561 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1563 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1565 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1567 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1569 = trunc(_1559);
    int _1571 = int(_1569);
    int _1573 = ~as_type<int>(_1407);
    int _1575 = _1571 + _1573;
    int _1577 = _1575 + 1;
    float _1579 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1581 = _1577 >= 0;
    int _1583 = _1571;
    float _1585 = as_type<float>(_1449);
    if (_1581)
    {
        float _1587 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1583 = as_type<int>(_1587);
    }
    int _1589 = _1583;
    float _1591 = _1529 * _1463;
    float _1593 = fma(_1457, _1381, _1591);
    float _1595 = fma(_1469, _1383, _1593);
    float _1597 = _1475 + _1595;
    float _1599 = _1529 * _1489;
    float _1601 = 1.0 / _1597;
    float _1603 = fma(_1483, _1381, _1599);
    float _1605 = _1529 * _1511;
    float _1607 = fma(_1495, _1383, _1603);
    float _1609 = fma(_1505, _1381, _1605);
    float _1611 = _1501 + _1607;
    float _1613 = fma(_1517, _1383, _1609);
    float _1615 = _1611 * _1601;
    float _1617 = _1523 + _1613;
    bool _1619 = _1615 >= 0.0;
    float _1621 = _1617 * _1601;
    bool _1623 = _1615 <= 1.0;
    bool _1625 = _1623 && _1619;
    bool _1627 = _1621 >= 0.0;
    bool _1629 = _1627 && _1625;
    bool _1631 = _1621 <= 1.0;
    bool _1633 = _1631 && _1629;
    float _1635 = _1529 * _1539;
    float _1637 = fma(_1533, _1381, _1635);
    if (_1633)
    {
        float _1639 = float(_1449);
        _1585 = _1639;
    }
    float _1641 = _1585;
    float _1643 = fma(_1545, _1383, _1637);
    float _1645 = _1641;
    if (_1633)
    {
        float _1647 = rint(_1641);
        float _1649 = precise::max(_1647, 0.0);
        uint _1651 = uint(_1649);
        uint _1653 = clamp(_1651, 0u, 65535u);
        _1645 = as_type<float>(_1653);
    }
    float _1655 = _1645;
    float _1657 = _1551 + _1643;
    float _1659 = _1657 * _1601;
    float _1661 = _1621;
    if (_1633)
    {
        float3 _4562 = float3(_1615, _1621, float(as_type<int>(_1655)));
        float3 _4566 = select(_4562, float3(0.0), isnan(_4562));
        float _1663 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _4566.xy, uint(rint(_4566.z)), _1659, level(0.0));
        _1661 = _1663;
    }
    float _1665 = _1661;
    float _1667 = _1529 * _1563;
    float _1669 = fma(_1561, _1381, _1667);
    float _1671 = fma(_1565, _1383, _1669);
    float _1673 = _1567 + _1671;
    float _1675 = trunc(_1673);
    int _1677 = int(_1675);
    bool _1679 = _1589 <= _1577;
    bool _1681 = !_1581;
    bool _1683 = _1679 || _1681;
    int _1685 = ~as_type<int>(_1579);
    int _1687 = _1677 + _1685;
    int _1689 = _1687 + 1;
    bool _1691 = _1689 < 0;
    bool _1693 = _1691 || _1683;
    float _1695 = _1669;
    float _1697 = as_type<float>(_1677);
    if (!_1693)
    {
        float _1699 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1695 = _1699;
    }
    float _1701 = _1695;
    bool _1703 = as_type<int>(_1701) <= _1689;
    bool _1705 = _1703 || _1693;
    float _1707 = _1701;
    if (_1705)
    {
        _1697 = 1.0;
    }
    float _1709 = _1697;
    float _1711 = _1709;
    if (!_1705)
    {
        float _1713 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1715 = _1689 * as_type<int>(_1713);
        int _1717 = _1715 + _1577;
        int _1719 = _1717 << 2;
        uint _1721 = uint(int(uint(_1717) >> uint(2)));
        int _1723 = 12 & _1719;
        int _1725 = int(_1721) << 4;
        int _1727 = _1725 + _1723;
        int _1729 = _1727 + 400;
        uint _1731 = uint(int(uint(_1729) >> uint(2)));
        float _1733 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1731)]);
        float _1735 = floor(_1673);
        float _1737 = floor(_1559);
        float _1739 = -_1735;
        float _1741 = _1673 + _1739;
        float _1743 = -_1737;
        float _1745 = _1559 + _1743;
        float _1747 = rint(_1733);
        float _1749 = precise::max(_1747, 0.0);
        uint _1751 = uint(_1749);
        uint _1753 = clamp(_1751, 0u, 65535u);
        float3 _4701 = float3(_1745, _1741, float(int(_1753)));
        float3 _4703 = select(_4701, float3(0.0), isnan(_4701));
        float _1755 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4703.xy, uint(rint(_4703.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4703.xy, uint(rint(_4703.z)), level(0.0)).x;
        int _1757 = _1717 << 4;
        int _1759 = _1757 + 2048;
        uint _1761 = uint(int(uint(_1759) >> uint(2)));
        float _1763 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1761)]);
        int _1765 = _1759 + 4;
        uint _1767 = uint(int(uint(_1765) >> uint(2)));
        float _1769 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1767)]);
        int _1771 = _1759 + 8;
        uint _1773 = uint(int(uint(_1771) >> uint(2)));
        float _1775 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1773)]);
        int _1777 = _1759 + 12;
        uint _1779 = uint(int(uint(_1777) >> uint(2)));
        float _1781 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1779)]);
        float _1783 = _1529 * _1769;
        float _1785 = fma(_1763, _1381, _1783);
        float _1787 = fma(_1775, _1383, _1785);
        float _1789 = _1781 + _1787;
        float _1791 = precise::clamp(_1789, 0.0, 1.0);
        float _1793 = -_1791;
        float _1795 = _1793 + _1755;
        float _1797 = fma(_1795, 500.0, 1.5);
        float _1799 = exp2(_1797);
        float _1801 = 0.0 + _1799;
        float _1803 = precise::clamp(_1801, 0.0, 1.0);
        _1707 = _1733;
        _1711 = _1803;
    }
    float _1805 = _1707;
    float _1807 = _1711;
    uint _1809 = uint(int(uint(_171) >> uint(2)));
    float _1811 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1809)]);
    float _1813 = _1805;
    if (!_1633)
    {
        _1813 = 1.0;
    }
    float _1815 = _1813;
    bool _1817 = _609 > 0.001000000047497451305389404296875;
    bool _1819 = isnan(_609);
    bool _1821 = _1817 || _1819;
    bool _1823 = isnan(0.001000000047497451305389404296875);
    bool _1825 = _1821 || _1823;
    float _1827 = -_181;
    float _1829 = _1827 + _1101;
    float _1831 = _1815;
    if (_1633)
    {
        bool _1833 = _1665 >= _1659;
        bool _1835 = isnan(_1665);
        bool _1837 = _1833 || _1835;
        bool _1839 = isnan(_1659);
        bool _1841 = _1837 || _1839;
        float _1843 = float(_1841);
        _1831 = _1843;
    }
    float _1845 = _1831;
    int _1847 = _171 + 4;
    float _1849 = -_1845;
    float _1851 = fma(_1849, _1807, 1.0);
    int _1853 = _171 + 8;
    float _1855 = -_1811;
    float _1857 = _1851 + _1855;
    float _1859 = _1851;
    if (_1825)
    {
        float _1861 = fma(_1857, 0.0500000007450580596923828125, _1811);
        _1859 = _1861;
    }
    float _1863 = _1859;
    float _1865 = -_187;
    float _1867 = _1865 + _1105;
    float _1869 = precise::max(0.0, _1863);
    float _1871 = precise::min(_1869, 0.999000012874603271484375);
    float _1873 = -_175;
    float _1875 = _1873 + _1103;
    uint _1877 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1877)] = as_type<uint>(_1871);
    uint _1879 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1879)] = as_type<uint>(_561);
    uint _1881 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1881)] = as_type<uint>(_1103);
    uint _1883 = uint(int(uint(_1847) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1883)] = as_type<uint>(_1101);
    uint _1885 = uint(int(uint(_1853) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1885)] = as_type<uint>(_1105);
    uint _1887 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1887)] = as_type<uint>(_659);
    uint _1889 = uint(int(uint(_1847) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1889)] = as_type<uint>(_661);
    uint _1891 = uint(int(uint(_1853) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1891)] = as_type<uint>(_673);
    uint _1893 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1893)] = as_type<uint>(_1875);
    uint _1895 = uint(int(uint(_1847) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1895)] = as_type<uint>(_1829);
    uint _1897 = uint(int(uint(_1853) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1897)] = as_type<uint>(_1867);
    float _1899 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1901 = _1829 * _1829;
    float _1903 = _661 * _661;
    float _1905 = fma(_1875, _1875, _1901);
    float _1907 = fma(_659, _659, _1903);
    float _1909 = fma(_1867, _1867, _1905);
    float _1911 = fma(_673, _673, _1907);
    float _1913 = sqrt(_1911);
    float _1915 = sqrt(_1909);
    bool _1917 = _1915 >= 9.9999999747524270787835121154785e-07;
    bool _1919 = isnan(_1915);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan(9.9999999747524270787835121154785e-07);
    bool _1925 = _1921 || _1923;
    if (!_1925)
    {
        bool _1927 = _547 != _295;
        bool _1929 = isnan(_547);
        bool _1931 = _1927 || _1929;
        bool _1933 = isnan(_295);
        bool _1935 = _1931 || _1933;
        _1937 = _1935;
        if (!_1937)
        {
            float _1939 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1941 = _1939 > 0.0;
            bool _1943 = !_1941;
            if (!_1943)
            {
                float _1945 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1947 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1949 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1951 = _1947 * _515;
                float _1953 = _1947 * _513;
                float _1955 = _1947 * _517;
                float _1957 = fma(_1945, _521, _1951);
                float _1959 = fma(_1945, _519, _1953);
                float _1961 = fma(_1945, _523, _1955);
                float _1963 = fma(_1949, _525, _1957);
                float _1965 = fma(_1949, _527, _1959);
                float _1967 = fma(_1949, _529, _1961);
                float _1969 = _1963 * _1963;
                float _1971 = fma(_1965, _1965, _1969);
                float _1973 = fma(_1967, _1967, _1971);
                float _1975 = rsqrt(_1973);
                float _1977 = _1975 * 9.9999999747524270787835121154785e-07;
                float _1979 = _1965 * _1977;
                float _1981 = _1963 * _1977;
                float _1983 = _1967 * _1977;
                _333 = as_type<int>(_1979);
                _335 = as_type<int>(_1981);
                _337 = as_type<int>(_1983);
                _1937 = true;
            }
            else
            {
                bool _1985 = _1913 >= 9.9999999747524270787835121154785e-07;
                bool _1987 = isnan(_1913);
                bool _1989 = _1985 || _1987;
                bool _1991 = isnan(9.9999999747524270787835121154785e-07);
                bool _1993 = _1989 || _1991;
                if (!_1993)
                {
                    float _1995 = _1101 * _1101;
                    float _1997 = fma(_1103, _1103, _1995);
                    float _1999 = fma(_1105, _1105, _1997);
                    float _2001 = sqrt(_1999);
                    bool _2003 = _2001 >= 9.9999999747524270787835121154785e-07;
                    bool _2005 = isnan(_2001);
                    bool _2007 = _2003 || _2005;
                    bool _2009 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2011 = _2007 || _2009;
                    float _2013 = _2001;
                    if (_2011)
                    {
                        float _2015 = rsqrt(_1999);
                        _2013 = _2015;
                    }
                    float _2017 = _2013;
                    if (!_2011)
                    {
                        _321 = 0;
                    }
                    int _2019 = _321;
                    int _2021 = _2019;
                    if (!_2011)
                    {
                        _323 = 897988541;
                    }
                    int _2023 = _323;
                    int _2025 = _2023;
                    if (!_2011)
                    {
                        _325 = 0;
                    }
                    int _2027 = _325;
                    float _2029 = _2017;
                    int _2031 = _2027;
                    if (_2011)
                    {
                        float _2033 = _2017 * 9.9999999747524270787835121154785e-07;
                        _2029 = _2033;
                    }
                    float _2035 = _2029;
                    if (_2011)
                    {
                        float _2037 = _1103 * _2035;
                        _2021 = as_type<int>(_2037);
                    }
                    int _2039 = _2021;
                    _333 = _2039;
                    if (_2011)
                    {
                        float _2041 = _1101 * _2035;
                        _2025 = as_type<int>(_2041);
                    }
                    int _2043 = _2025;
                    _335 = _2043;
                    if (_2011)
                    {
                        float _2045 = _1105 * _2035;
                        _2031 = as_type<int>(_2045);
                    }
                    int _2047 = _2031;
                    _337 = _2047;
                    _1937 = true;
                }
                else
                {
                    float _2049 = rsqrt(_1911);
                    float _2051 = _2049 * 9.9999999747524270787835121154785e-07;
                    float _2053 = _659 * _2051;
                    float _2055 = _661 * _2051;
                    float _2057 = _673 * _2051;
                    _333 = as_type<int>(_2053);
                    _335 = as_type<int>(_2055);
                    _337 = as_type<int>(_2057);
                    _1937 = true;
                }
            }
        }
    }
    else
    {
        float _2059 = _1913 * _1899;
        bool _2061 = _2059 >= 0.001000000047497451305389404296875;
        bool _2063 = isnan(_2059);
        bool _2065 = _2061 || _2063;
        bool _2067 = isnan(0.001000000047497451305389404296875);
        bool _2069 = _2065 || _2067;
        bool _2071 = _2059 > 0.0;
        bool _2073 = !_2069;
        bool _2075 = _2071 && _2073;
        bool _2077 = _1915 < 0.001000000047497451305389404296875;
        bool _2079 = _2077 && _2075;
        if (!_2079)
        {
            _327 = as_type<int>(_1875);
        }
        int _2081 = _327;
        int _2083 = _2081;
        if (_2079)
        {
            float _2085 = _659 * _1899;
            _2083 = as_type<int>(_2085);
        }
        int _2087 = _2083;
        _333 = _2087;
        if (!_2079)
        {
            _329 = as_type<int>(_1829);
        }
        int _2089 = _329;
        int _2091 = _2089;
        if (_2079)
        {
            float _2093 = _661 * _1899;
            _2091 = as_type<int>(_2093);
        }
        int _2095 = _2091;
        _335 = _2095;
        if (!_2079)
        {
            _331 = as_type<int>(_1867);
        }
        int _2097 = _331;
        _337 = _2097;
        if (_2079)
        {
            float _2099 = _673 * _1899;
            _337 = as_type<int>(_2099);
        }
    }
    _1937 = false;
    int _2101 = _333;
    int _2103 = _335;
    int _2105 = _337;
    uint _2107 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2107)] = uint(_2101);
    uint _2109 = uint(int(uint(_1847) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2109)] = uint(_2103);
    uint _2111 = uint(int(uint(_1853) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2111)] = uint(_2105);
}

