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
    bool _3019 = false;
    bool _815 = false;
    float _75 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _77 = as_type<float>(gl_LocalInvocationID.x);
    float _79 = as_type<float>(gl_WorkGroupID.x);
    int _82 = as_type<int>(_79) << 5;
    int _84 = _82 + as_type<int>(_77);
    float _86 = trunc(_75);
    int _88 = int(_86);
    bool _92 = _84 >= _88;
    int _94 = 0;
    float _96 = as_type<float>(_88);
    if (_92)
    {
        _94 = 0;
    }
    int _98 = _94;
    int _100 = _98;
    int _102 = _98;
    float _104 = 0.0;
    if (!_92)
    {
        int _106 = _84 << 4;
        int _108 = _106 + 12;
        uint _111 = uint(int(uint(_108) >> uint(2)));
        float _113 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_111)]);
        float _115 = trunc(_113);
        int _117 = int(_115);
        bool _119 = _117 >= 1;
        int _121 = _119 ? (-1) : 0;
        _96 = as_type<float>(_108);
        _104 = as_type<float>(_117);
        if (!_119)
        {
            _100 = 0;
        }
        int _123 = _100;
        bool _125 = !_119;
        _102 = _123;
        if (!_125)
        {
            float _127 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _129 = uint(int(uint(_108) >> uint(2)));
            float _131 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_129)]);
            float _133 = float(_117);
            float _135 = -_131;
            float _137 = _127 + _135;
            bool _139 = _137 > _133;
            int _141 = as_type<int>(_127);
            _96 = _131;
            _104 = _133;
            if (!_139)
            {
                bool _143 = _127 >= _131;
                bool _145 = isnan(_127);
                bool _147 = _143 || _145;
                bool _149 = isnan(_131);
                bool _151 = _147 || _149;
                _121 = _151 ? (-1) : 0;
            }
            int _153 = _121;
            if (_139)
            {
                _141 = 0;
            }
            int _155 = _141;
            _102 = _155;
            if (!_139)
            {
                int _157 = ~_153;
                int _159 = (_157 != 0) ? 0 : 1;
                _102 = _159;
            }
        }
    }
    int _161 = _102;
    float _163 = _96;
    float _165 = _104;
    int _167 = _161 & 1;
    bool _169 = _167 != 0;
    if (!_169)
    {
        return;
    }
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _173 = _84 << 4;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_175)]);
    int _179 = _173 + 4;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_181)]);
    int _185 = _173 + 8;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_187)]);
    int _191 = as_type<int>(_171) & 512;
    bool _193 = _191 != 0;
    int _195 = _173 + 12;
    uint _197 = uint(int(uint(_173) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_197)]);
    int _201 = _173 + 4;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_203)]);
    int _207 = _173 + 8;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_209)]);
    uint _213 = uint(int(uint(_173) >> uint(2)));
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_213)]);
    int _217 = _173 + 4;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    float _221 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_219)]);
    int _223 = _173 + 8;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    float _227 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_225)]);
    float _229 = 0.0;
    float _231 = 0.0;
    float _233 = 0.0;
    float _235 = _171;
    if (_193)
    {
        float _237 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _241 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _229 = _237;
        _231 = _239;
        _233 = _241;
    }
    float _243 = _229;
    float _245 = _231;
    float _247 = _233;
    float _249 = 0.0;
    float _251 = 0.0;
    float _253 = 0.0;
    if (_193)
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
    float _267 = as_type<float>(_161);
    float _269 = _163;
    float _271 = _165;
    if (_193)
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
    uint _285 = uint(int(uint(_173) >> uint(2)));
    float _287 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_285)]);
    uint _289 = uint(int(uint(_195) >> uint(2)));
    float _291 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_289)]);
    uint _293 = uint(int(uint(_195) >> uint(2)));
    float _295 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_293)]);
    float _297 = _261;
    float _299 = _263;
    float _301 = _265;
    float _303 = _243;
    float _305 = _245;
    float _307 = _247;
    float _309 = _279;
    float _311 = _281;
    float _313 = _283;
    float _315 = _199;
    float _317 = _205;
    float _319 = _211;
    int _321 = as_type<int>(_215);
    int _323 = as_type<int>(_221);
    int _325 = as_type<int>(_227);
    int _327 = as_type<int>(_215);
    int _329 = as_type<int>(_221);
    int _331 = as_type<int>(_227);
    int _333 = as_type<int>(_215);
    int _335 = as_type<int>(_221);
    int _337 = as_type<int>(_227);
    if (!_193)
    {
        int _339 = _173 + 4;
        uint _341 = uint(int(uint(_173) >> uint(2)));
        float _343 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_341)]);
        int _345 = _173 + 8;
        uint _347 = uint(int(uint(_173) >> uint(2)));
        float _349 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_347)]);
        uint _351 = uint(int(uint(_339) >> uint(2)));
        float _353 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_351)]);
        uint _355 = uint(int(uint(_339) >> uint(2)));
        float _357 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_355)]);
        uint _359 = uint(int(uint(_345) >> uint(2)));
        float _361 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_359)]);
        uint _363 = uint(int(uint(_173) >> uint(2)));
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
        _309 = _467;
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
        _311 = _483;
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
    float _535 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _537 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _539 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _541 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _543 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _545 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _547 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _549 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _551 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _553 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _555 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _557 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _559 = uint(int(uint(_195) >> uint(2)));
    float _561 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_559)]);
    bool _563 = _533 > 0.0;
    float _565 = abs(_531);
    float _567 = log2(_565);
    float _569 = 0.0;
    float _571 = _549;
    float _573 = _539;
    float _575 = _533;
    float _577 = _545;
    float _579 = _551;
    float _581 = _553;
    float _583 = _555;
    float _585 = _557;
    if (_563)
    {
        float _587 = 1.0 / _533;
        _569 = _587;
    }
    float _589 = _569;
    float _591 = _535 * _541;
    float _593 = _537 * _541;
    float _595 = _539 * _541;
    bool _597 = _543 > 0.0;
    float _599 = _545 * _567;
    float _601 = -_295;
    float _603 = _547 + _601;
    float _605 = _593 * _513;
    float _607 = _593 * _515;
    float _609 = exp2(_599);
    float _611 = _549 * _543;
    float _613 = _593 * _517;
    float _615 = _567;
    bool _617 = _597;
    if (_563)
    {
        float _619 = _603 * _589;
        _615 = _619;
    }
    float _621 = _615;
    float _623 = fma(_591, _519, _605);
    float _625 = fma(_591, _521, _607);
    float _627 = _623;
    if (_597)
    {
        float _629 = -_611;
        float _631 = fma(_287, _629, _549);
        _571 = _631;
    }
    float _633 = _571;
    float _635 = _633;
    if (_563)
    {
        float _637 = precise::min(_621, 1.0);
        _573 = _637;
    }
    float _639 = _573;
    float _641 = fma(_591, _523, _613);
    float _643 = fma(_595, _525, _623);
    float _645 = fma(_595, _527, _625);
    if (_563)
    {
        float _647 = _639 * _633;
        _635 = _647;
    }
    float _649 = _635;
    float _651 = fma(_595, _529, _641);
    float _653 = _545 * _643;
    float _655 = _545 * _645;
    float _657 = _291 * _545;
    float _659 = _545 * _649;
    float _661 = _545 * _651;
    float _663 = fma(_199, _609, _653);
    float _665 = fma(_205, _609, _655);
    float _667 = fma(_199, _657, _177);
    float _669 = fma(_205, _657, _183);
    float _671 = _551 * _659;
    float _673 = _553 * _659;
    float _675 = fma(_211, _657, _189);
    float _677 = fma(_211, _609, _661);
    float _679 = _555 * _659;
    bool _681 = !_193;
    float _683 = _661;
    float _685 = _671;
    float _687 = _679;
    float _689 = _673;
    float _811;
    float _813;
    if (!_681)
    {
        float _691 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _693 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _695 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _697 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _699 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _701 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _703 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _705 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _707 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _709 = _695 * _697;
        float _711 = _695 * _699;
        float _713 = _693 * _697;
        float _715 = -_709;
        float _717 = fma(_691, _701, _715);
        float _719 = -_711;
        float _721 = fma(_693, _701, _719);
        float _723 = -_713;
        float _725 = fma(_691, _699, _723);
        float _727 = _705 * _691;
        float _729 = _705 * _717;
        float _731 = _707 * _693;
        float _733 = _703 * _699;
        float _735 = -_727;
        float _737 = fma(_703, _693, _735);
        float _739 = -_729;
        float _741 = fma(_703, _721, _739);
        float _743 = _705 * _701;
        float _745 = _707 * _697;
        float _747 = _703 * _695;
        float _749 = fma(_707, _725, _741);
        float _751 = -_743;
        float _753 = fma(_707, _699, _751);
        float _755 = -_745;
        float _757 = fma(_703, _701, _755);
        float _759 = -_733;
        float _761 = fma(_705, _697, _759);
        float _763 = -_747;
        float _765 = fma(_707, _691, _763);
        float _767 = -_691;
        float _769 = fma(_767, _701, _709);
        float _771 = 1.0 / _749;
        float _773 = -_731;
        float _775 = fma(_705, _695, _773);
        float _777 = _753 * _771;
        float _779 = _757 * _771;
        float _781 = _761 * _771;
        float _783 = _671 * _771;
        float _785 = _673 * _777;
        float _787 = _673 * _779;
        float _789 = _769 * _771;
        float _791 = _673 * _781;
        float _793 = _775 * _771;
        float _795 = _765 * _771;
        float _797 = fma(_721, _783, _785);
        float _799 = fma(_671, _789, _787);
        float _801 = _737 * _771;
        float _803 = fma(_725, _783, _791);
        float _805 = fma(_679, _793, _797);
        float _807 = fma(_679, _795, _799);
        float _809 = fma(_679, _801, _803);
        _315 = _795;
        _317 = _799;
        _319 = _797;
        _575 = _803;
        _577 = _703;
        _235 = _705;
        _627 = _707;
        _811 = _771;
        _579 = _783;
        _581 = _699;
        _583 = _701;
        _585 = _709;
        _813 = _807;
        _685 = _805;
        _687 = _809;
        _815 = true;
    }
    else
    {
        int _817 = as_type<int>(_171) & 1024;
        bool _819 = _817 != 0;
        if (_819)
        {
            _617 = true;
        }
        bool _821 = _617;
        bool _823 = _821;
        if (!_819)
        {
            int _825 = as_type<int>(_171) & 2048;
            bool _827 = _825 != 0;
            _823 = _827;
        }
        bool _829 = _823;
        if (!_829)
        {
            _683 = _673;
        }
        float _831 = _683;
        bool _833 = !_829;
        _811 = 0.0;
        _813 = _831;
        if (!_833)
        {
            uint _835 = uint(int(uint(_173) >> uint(2)));
            float _837 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_835)]);
            int _839 = _173 + 4;
            uint _841 = uint(int(uint(_839) >> uint(2)));
            float _843 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_841)]);
            int _845 = _173 + 8;
            uint _847 = uint(int(uint(_845) >> uint(2)));
            float _849 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_847)]);
            uint _851 = uint(int(uint(_173) >> uint(2)));
            float _853 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_851)]);
            int _855 = _173 + 4;
            uint _857 = uint(int(uint(_855) >> uint(2)));
            float _859 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_857)]);
            int _861 = _173 + 8;
            uint _863 = uint(int(uint(_861) >> uint(2)));
            float _865 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_863)]);
            uint _867 = uint(int(uint(_173) >> uint(2)));
            float _869 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_867)]);
            int _871 = _173 + 4;
            uint _873 = uint(int(uint(_871) >> uint(2)));
            float _875 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_873)]);
            int _877 = _173 + 8;
            uint _879 = uint(int(uint(_877) >> uint(2)));
            float _881 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_879)]);
            float _883 = _849 * _853;
            float _885 = _849 * _859;
            float _887 = _843 * _853;
            float _889 = -_883;
            float _891 = fma(_837, _865, _889);
            float _893 = -_885;
            float _895 = fma(_843, _865, _893);
            float _897 = -_887;
            float _899 = fma(_837, _859, _897);
            float _901 = _875 * _837;
            float _903 = _875 * _891;
            float _905 = _881 * _843;
            float _907 = _869 * _859;
            float _909 = -_901;
            float _911 = fma(_869, _843, _909);
            float _913 = -_903;
            float _915 = fma(_869, _895, _913);
            float _917 = _875 * _865;
            float _919 = _881 * _853;
            float _921 = _869 * _849;
            float _923 = fma(_881, _899, _915);
            float _925 = -_917;
            float _927 = fma(_881, _859, _925);
            float _929 = -_919;
            float _931 = fma(_869, _865, _929);
            float _933 = -_907;
            float _935 = fma(_875, _853, _933);
            float _937 = -_921;
            float _939 = fma(_881, _837, _937);
            float _941 = -_837;
            float _943 = fma(_941, _865, _883);
            float _945 = 1.0 / _923;
            float _947 = -_905;
            float _949 = fma(_875, _849, _947);
            float _951 = _927 * _945;
            float _953 = _931 * _945;
            float _955 = _935 * _945;
            float _957 = _671 * _945;
            float _959 = _673 * _951;
            float _961 = _673 * _953;
            float _963 = _943 * _945;
            float _965 = _673 * _955;
            float _967 = _949 * _945;
            float _969 = _939 * _945;
            float _971 = fma(_895, _957, _959);
            float _973 = fma(_671, _963, _961);
            float _975 = _911 * _945;
            float _977 = fma(_899, _957, _965);
            float _979 = fma(_679, _967, _971);
            float _981 = fma(_679, _969, _973);
            float _983 = fma(_679, _975, _977);
            _315 = _969;
            _317 = _973;
            _319 = _971;
            _575 = _977;
            _577 = _869;
            _235 = _875;
            _627 = _881;
            _811 = _945;
            _579 = _957;
            _581 = _859;
            _583 = _865;
            _585 = _883;
            _813 = _981;
            _685 = _979;
            _687 = _983;
        }
    }
    _815 = false;
    float _985 = _315;
    float _987 = _317;
    float _989 = _319;
    float _991 = _575;
    float _993 = _577;
    float _995 = _235;
    float _997 = _627;
    float _999 = _811;
    float _1001 = _579;
    float _1003 = _581;
    float _1005 = _583;
    float _1007 = _585;
    float _1009 = _813;
    float _1011 = _685;
    float _1013 = _687;
    uint _1015 = uint(int(uint(_195) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1015)] = as_type<uint>(_561);
    float _1017 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1019 = as_type<int>(_1017) & 512;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>(_1017) & 1024;
    bool _1025 = _1023 != 0;
    float _1027 = _985;
    float _1029 = _987;
    float _1031 = _989;
    float _1033 = _991;
    float _1035 = _1013;
    float _1037 = _1011;
    if (_1021)
    {
        float _1039 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1041 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1043 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1045 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1027 = _1039;
        _1029 = _1041;
        _1031 = _1043;
        _1033 = _1045;
    }
    float _1047 = _1027;
    float _1049 = _1029;
    float _1051 = _1031;
    float _1053 = _1033;
    float _1055 = _993;
    float _1057 = _995;
    float _1059 = _997;
    float _1061 = _999;
    if (_1021)
    {
        float _1063 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1065 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1067 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1069 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1055 = _1063;
        _1057 = _1065;
        _1059 = _1067;
        _1061 = _1069;
    }
    float _1071 = _1055;
    float _1073 = _1057;
    float _1075 = _1059;
    float _1077 = _1061;
    float _1079 = _1001;
    float _1081 = _1003;
    float _1083 = _1005;
    float _1085 = _1007;
    if (_1021)
    {
        float _1087 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1089 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1091 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1093 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1079 = _1087;
        _1081 = _1089;
        _1083 = _1091;
        _1085 = _1093;
    }
    float _1095 = _1079;
    float _1097 = _1081;
    float _1099 = _1083;
    float _1101 = _1085;
    float _1103 = _669 + _1009;
    float _1105 = _667 + _1011;
    float _1107 = _675 + _1013;
    float _1109 = 0.0;
    if (!_1021)
    {
        _689 = 0.0;
        _1109 = 0.0;
    }
    float _1111 = _689;
    float _1113 = _1109;
    float _1115 = _1111;
    float _1117 = _1113;
    if (!_1021)
    {
        _1035 = 0.0;
    }
    float _1119 = _1035;
    int _1121 = as_type<int>(_1017) & 2048;
    bool _1123 = _1121 != 0;
    float _1125 = _1047;
    float _1127 = _1119;
    if (_1021)
    {
        float _1129 = _1103 * _1049;
        _1037 = _1129;
    }
    float _1131 = _1037;
    float _1133 = _1073;
    float _1135 = _1097;
    float _1137 = _1095;
    float _1139 = _1075;
    if (_1021)
    {
        float _1141 = _1103 * _1073;
        _1133 = _1141;
    }
    float _1143 = _1133;
    float _1145 = _1143;
    if (_1021)
    {
        float _1147 = fma(_1105, _1047, _1131);
        _1125 = _1147;
    }
    float _1149 = _1125;
    float _1151 = _1149;
    if (_1021)
    {
        float _1153 = _1103 * _1097;
        _1135 = _1153;
    }
    float _1155 = _1135;
    if (_1021)
    {
        float _1157 = fma(_1105, _1071, _1143);
        _1145 = _1157;
    }
    float _1159 = _1145;
    if (_1021)
    {
        float _1161 = fma(_1107, _1051, _1149);
        _1151 = _1161;
    }
    float _1163 = _1151;
    if (_1021)
    {
        float _1165 = fma(_1105, _1095, _1155);
        _1137 = _1165;
    }
    float _1167 = _1137;
    float _1169 = _1167;
    if (_1021)
    {
        float _1171 = fma(_1107, _1075, _1159);
        _1139 = _1171;
    }
    float _1173 = _1139;
    if (_1021)
    {
        float _1175 = _1053 + _1163;
        _1127 = _1175;
    }
    float _1177 = _1127;
    float _1179 = _1177;
    if (_1021)
    {
        float _1181 = fma(_1107, _1099, _1167);
        _1169 = _1181;
    }
    float _1183 = _1169;
    if (_1021)
    {
        float _1185 = _1077 + _1173;
        _1115 = _1185;
    }
    float _1187 = _1115;
    float _1189 = _1187;
    if (_1021)
    {
        float _1191 = _1101 + _1183;
        _1117 = _1191;
    }
    float _1193 = _1117;
    bool _1195 = !_1025;
    float _1197 = _1193;
    if (!_1195)
    {
        float _1199 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1201 = uint(int(uint(_173) >> uint(2)));
        float _1203 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1201)]);
        int _1205 = _173 + 4;
        uint _1207 = uint(int(uint(_1205) >> uint(2)));
        float _1209 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1207)]);
        int _1211 = _173 + 8;
        uint _1213 = uint(int(uint(_1211) >> uint(2)));
        float _1215 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1213)]);
        uint _1217 = uint(int(uint(_173) >> uint(2)));
        float _1219 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1217)]);
        int _1221 = _173 + 4;
        uint _1223 = uint(int(uint(_1221) >> uint(2)));
        float _1225 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1223)]);
        int _1227 = _173 + 8;
        uint _1229 = uint(int(uint(_1227) >> uint(2)));
        float _1231 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1229)]);
        uint _1233 = uint(int(uint(_173) >> uint(2)));
        float _1235 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1233)]);
        int _1237 = _173 + 4;
        uint _1239 = uint(int(uint(_1237) >> uint(2)));
        float _1241 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1239)]);
        int _1243 = _173 + 8;
        uint _1245 = uint(int(uint(_1243) >> uint(2)));
        float _1247 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1245)]);
        float _1249 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1253 = _1103 * _1209;
        float _1255 = _1103 * _1225;
        float _1257 = _1103 * _1241;
        float _1259 = fma(_1105, _1203, _1253);
        float _1261 = fma(_1105, _1219, _1255);
        float _1263 = fma(_1105, _1235, _1257);
        float _1265 = fma(_1107, _1215, _1259);
        float _1267 = fma(_1107, _1231, _1261);
        float _1269 = fma(_1107, _1247, _1263);
        float _1271 = _1199 + _1265;
        float _1273 = _1249 + _1267;
        float _1275 = _1251 + _1269;
        _1189 = _1273;
        _1179 = _1271;
        _1197 = _1275;
    }
    float _1277 = _1189;
    float _1279 = _1179;
    float _1281 = _1197;
    bool _1283 = !_1123;
    float _1285 = _1277;
    float _1287 = _1279;
    float _1289 = _1281;
    if (!_1283)
    {
        uint _1291 = uint(int(uint(_173) >> uint(2)));
        float _1293 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1291)]);
        int _1295 = _173 + 4;
        uint _1297 = uint(int(uint(_1295) >> uint(2)));
        float _1299 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1297)]);
        int _1301 = _173 + 8;
        uint _1303 = uint(int(uint(_1301) >> uint(2)));
        float _1305 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1303)]);
        int _1307 = _173 + 12;
        uint _1309 = uint(int(uint(_1307) >> uint(2)));
        float _1311 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1309)]);
        uint _1313 = uint(int(uint(_173) >> uint(2)));
        float _1315 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1313)]);
        int _1317 = _173 + 4;
        uint _1319 = uint(int(uint(_1317) >> uint(2)));
        float _1321 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1319)]);
        int _1323 = _173 + 8;
        uint _1325 = uint(int(uint(_1323) >> uint(2)));
        float _1327 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1325)]);
        int _1329 = _173 + 12;
        uint _1331 = uint(int(uint(_1329) >> uint(2)));
        float _1333 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1331)]);
        uint _1335 = uint(int(uint(_173) >> uint(2)));
        float _1337 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1335)]);
        int _1339 = _173 + 4;
        uint _1341 = uint(int(uint(_1339) >> uint(2)));
        float _1343 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1341)]);
        int _1345 = _173 + 8;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        float _1349 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1347)]);
        int _1351 = _173 + 12;
        uint _1353 = uint(int(uint(_1351) >> uint(2)));
        float _1355 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1353)]);
        float _1357 = _1103 * _1299;
        float _1359 = _1103 * _1321;
        float _1361 = _1103 * _1343;
        float _1363 = fma(_1105, _1293, _1357);
        float _1365 = fma(_1105, _1315, _1359);
        float _1367 = fma(_1105, _1337, _1361);
        float _1369 = fma(_1107, _1305, _1363);
        float _1371 = fma(_1107, _1327, _1365);
        float _1373 = fma(_1107, _1349, _1367);
        float _1375 = _1369 + _1311;
        float _1377 = _1371 + _1333;
        float _1379 = _1373 + _1355;
        _1285 = _1377;
        _1287 = _1375;
        _1289 = _1379;
    }
    float _1381 = _1285;
    float _1383 = _1287;
    float _1385 = _1289;
    float _1387 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1389 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1391 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1393 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1395 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1397 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1399 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1401 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1403 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1405 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1407 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1409 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1411 = _1389 * _1381;
    float _1413 = fma(_1387, _1383, _1411);
    float _1415 = fma(_1391, _1385, _1413);
    float _1417 = _1393 + _1415;
    float _1419 = -_1417;
    bool _1421 = _1395 >= _1419;
    bool _1423 = isnan(_1395);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(_1419);
    bool _1429 = _1425 || _1427;
    float _1431 = -_1417;
    bool _1433 = _1397 >= _1431;
    bool _1435 = isnan(_1397);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan(_1431);
    bool _1441 = _1437 || _1439;
    int _1443 = _1429 ? 0 : 1;
    int _1445 = 2;
    float _1447 = _1383;
    if (_1429)
    {
        _1445 = 1;
    }
    int _1449 = _1445;
    int _1451 = _1449;
    if (_1441)
    {
        _1451 = _1443;
    }
    int _1453 = _1451;
    int _1455 = _1453 << 6;
    int _1457 = _1455 + 96;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    float _1461 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1459)]);
    int _1463 = _1457 + 4;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    float _1467 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1465)]);
    int _1469 = _1457 + 8;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    float _1473 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1471)]);
    int _1475 = _1457 + 12;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    float _1479 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1477)]);
    int _1481 = _1455 + 48;
    int _1483 = _1455 + 64;
    uint _1485 = uint(int(uint(_1481) >> uint(2)));
    float _1487 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1485)]);
    int _1489 = _1481 + 4;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    float _1493 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1491)]);
    int _1495 = _1481 + 8;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    float _1499 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1497)]);
    int _1501 = _1481 + 12;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    float _1505 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1503)]);
    uint _1507 = uint(int(uint(_1483) >> uint(2)));
    float _1509 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1507)]);
    int _1511 = _1483 + 4;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    float _1515 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1513)]);
    int _1517 = _1483 + 8;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    float _1521 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1519)]);
    int _1523 = _1483 + 12;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    float _1527 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1525)]);
    int _1529 = _1455 + 80;
    float _1531 = _1399 + 1.0;
    float _1533 = _1531 + _1381;
    uint _1535 = uint(int(uint(_1529) >> uint(2)));
    float _1537 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1535)]);
    int _1539 = _1529 + 4;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    float _1543 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1541)]);
    int _1545 = _1529 + 8;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    float _1549 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1547)]);
    int _1551 = _1529 + 12;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    float _1555 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1553)]);
    float _1557 = _1533 * _1403;
    float _1559 = fma(_1401, _1383, _1557);
    float _1561 = fma(_1405, _1385, _1559);
    float _1563 = _1407 + _1561;
    float _1565 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1567 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1569 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1571 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1573 = trunc(_1563);
    int _1575 = int(_1573);
    int _1577 = ~as_type<int>(_1409);
    int _1579 = _1575 + _1577;
    int _1581 = _1579 + 1;
    float _1583 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1585 = _1581 >= 0;
    int _1587 = _1575;
    float _1589 = as_type<float>(_1453);
    if (_1585)
    {
        float _1591 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1587 = as_type<int>(_1591);
    }
    int _1593 = _1587;
    float _1595 = _1533 * _1467;
    float _1597 = fma(_1461, _1383, _1595);
    float _1599 = fma(_1473, _1385, _1597);
    float _1601 = _1479 + _1599;
    float _1603 = _1533 * _1493;
    float _1605 = 1.0 / _1601;
    float _1607 = fma(_1487, _1383, _1603);
    float _1609 = _1533 * _1515;
    float _1611 = fma(_1499, _1385, _1607);
    float _1613 = fma(_1509, _1383, _1609);
    float _1615 = _1505 + _1611;
    float _1617 = fma(_1521, _1385, _1613);
    float _1619 = _1615 * _1605;
    float _1621 = _1527 + _1617;
    bool _1623 = _1619 >= 0.0;
    float _1625 = _1621 * _1605;
    bool _1627 = _1619 <= 1.0;
    bool _1629 = _1627 && _1623;
    bool _1631 = _1625 >= 0.0;
    bool _1633 = _1631 && _1629;
    bool _1635 = _1625 <= 1.0;
    bool _1637 = _1635 && _1633;
    float _1639 = _1533 * _1543;
    float _1641 = fma(_1537, _1383, _1639);
    float _1643 = _1509;
    float _1645 = _1613;
    float _1647 = _1617;
    float _1649 = _1527;
    float _1651 = _1615;
    float _1653 = _1505;
    float _1655 = _1601;
    if (_1637)
    {
        float _1657 = float(_1453);
        _1589 = _1657;
    }
    float _1659 = _1589;
    float _1661 = fma(_1549, _1385, _1641);
    float _1663 = _1659;
    if (_1637)
    {
        float _1665 = rint(_1659);
        float _1667 = precise::max(_1665, 0.0);
        uint _1669 = uint(_1667);
        uint _1671 = clamp(_1669, 0u, 65535u);
        _1663 = as_type<float>(_1671);
    }
    float _1673 = _1663;
    float _1675 = _1555 + _1661;
    float _1677 = _1675 * _1605;
    float _1679 = _1625;
    if (_1637)
    {
        float3 _5652 = float3(_1619, _1625, float(as_type<int>(_1673)));
        float3 _5656 = select(_5652, float3(0.0), isnan(_5652));
        float _1681 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _5656.xy, uint(rint(_5656.z)), _1677, level(0.0));
        _1679 = _1681;
    }
    float _1683 = _1679;
    float _1685 = _1533 * _1567;
    float _1687 = fma(_1565, _1383, _1685);
    float _1689 = fma(_1569, _1385, _1687);
    float _1691 = _1571 + _1689;
    float _1693 = trunc(_1691);
    int _1695 = int(_1693);
    bool _1697 = _1593 <= _1581;
    bool _1699 = !_1585;
    bool _1701 = _1697 || _1699;
    int _1703 = ~as_type<int>(_1583);
    int _1705 = _1695 + _1703;
    int _1707 = _1705 + 1;
    bool _1709 = _1707 < 0;
    bool _1711 = _1709 || _1701;
    int _1713 = as_type<int>(_1687);
    float _1715 = as_type<float>(_1695);
    if (!_1711)
    {
        float _1717 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1713 = as_type<int>(_1717);
    }
    int _1719 = _1713;
    bool _1721 = _1719 <= _1707;
    bool _1723 = _1721 || _1711;
    if (_1723)
    {
        _1715 = 1.0;
    }
    float _1725 = _1715;
    float _1727 = _1725;
    if (!_1723)
    {
        float _1729 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1731 = _1707 * as_type<int>(_1729);
        int _1733 = _1731 + _1581;
        int _1735 = _1733 << 2;
        uint _1737 = uint(int(uint(_1733) >> uint(2)));
        int _1739 = 12 & _1735;
        int _1741 = int(_1737) << 4;
        int _1743 = _1741 + _1739;
        int _1745 = _1743 + 400;
        uint _1747 = uint(int(uint(_1745) >> uint(2)));
        float _1749 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1747)]);
        float _1751 = floor(_1691);
        float _1753 = floor(_1563);
        float _1755 = -_1751;
        float _1757 = _1691 + _1755;
        float _1759 = -_1753;
        float _1761 = _1563 + _1759;
        float _1763 = rint(_1749);
        float _1765 = precise::max(_1763, 0.0);
        uint _1767 = uint(_1765);
        uint _1769 = clamp(_1767, 0u, 65535u);
        float3 _5791 = float3(_1761, _1757, float(int(_1769)));
        float3 _5793 = select(_5791, float3(0.0), isnan(_5791));
        float _1771 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _5793.xy, uint(rint(_5793.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _5793.xy, uint(rint(_5793.z)), level(0.0)).x;
        int _1773 = _1733 << 4;
        int _1775 = _1773 + 2048;
        uint _1777 = uint(int(uint(_1775) >> uint(2)));
        float _1779 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1777)]);
        int _1781 = _1775 + 4;
        uint _1783 = uint(int(uint(_1781) >> uint(2)));
        float _1785 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1783)]);
        int _1787 = _1775 + 8;
        uint _1789 = uint(int(uint(_1787) >> uint(2)));
        float _1791 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1789)]);
        int _1793 = _1775 + 12;
        uint _1795 = uint(int(uint(_1793) >> uint(2)));
        float _1797 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1795)]);
        float _1799 = _1533 * _1785;
        float _1801 = fma(_1779, _1383, _1799);
        float _1803 = fma(_1791, _1385, _1801);
        float _1805 = _1797 + _1803;
        float _1807 = precise::clamp(_1805, 0.0, 1.0);
        float _1809 = -_1807;
        float _1811 = _1809 + _1771;
        float _1813 = fma(_1811, 500.0, 1.5);
        float _1815 = exp2(_1813);
        float _1817 = 0.0 + _1815;
        float _1819 = precise::clamp(_1817, 0.0, 1.0);
        _1447 = 500.0;
        _1727 = _1819;
        _1643 = _1779;
        _1645 = _1801;
        _1647 = _1815;
        _1649 = _1797;
        _1651 = as_type<float>(_1769);
        _1653 = _1761;
    }
    float _1821 = _1447;
    float _1823 = _1727;
    float _1825 = _1643;
    float _1827 = _1645;
    float _1829 = _1647;
    float _1831 = _1649;
    float _1833 = _1651;
    float _1835 = _1653;
    uint _1837 = uint(int(uint(_173) >> uint(2)));
    float _1839 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1837)]);
    float _1841 = _1821;
    if (!_1637)
    {
        _1841 = 1.0;
    }
    float _1843 = _1841;
    bool _1845 = _603 > 0.001000000047497451305389404296875;
    bool _1847 = isnan(_603);
    bool _1849 = _1845 || _1847;
    bool _1851 = isnan(0.001000000047497451305389404296875);
    bool _1853 = _1849 || _1851;
    float _1855 = _1843;
    if (_1637)
    {
        bool _1857 = _1683 >= _1677;
        bool _1859 = isnan(_1683);
        bool _1861 = _1857 || _1859;
        bool _1863 = isnan(_1677);
        bool _1865 = _1861 || _1863;
        float _1867 = float(_1865);
        _1855 = _1867;
    }
    float _1869 = _1855;
    float _1871 = -_1869;
    float _1873 = fma(_1871, _1823, 1.0);
    float _1875 = -_1839;
    float _1877 = _1873 + _1875;
    float _1879 = _1873;
    if (_1853)
    {
        float _1881 = fma(_1877, 0.0500000007450580596923828125, _1839);
        _1879 = _1881;
    }
    float _1883 = _1879;
    float _1885 = precise::max(0.0, _1883);
    float _1887 = precise::min(_1885, 0.999000012874603271484375);
    uint _1889 = uint(int(uint(_173) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1889)] = as_type<uint>(_1887);
    float _1891 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _1893 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[16]);
    float _1895 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[17]);
    float _1897 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[18]);
    float _1899 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[13]);
    int _1901 = as_type<int>(_1891) & 512;
    bool _1903 = _1901 != 0;
    int _1905 = as_type<int>(_1891) & 1024;
    bool _1907 = _1905 != 0;
    float _1909 = _1825;
    float _1911 = _1827;
    float _1913 = _1829;
    float _1915 = _1831;
    float _1917 = _1887;
    bool _1919 = _1907;
    bool _1921 = false;
    if (_1903)
    {
        float _1923 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1925 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1927 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1929 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1909 = _1923;
        _1911 = _1925;
        _1913 = _1927;
        _1915 = _1929;
    }
    float _1931 = _1909;
    float _1933 = _1911;
    float _1935 = _1913;
    float _1937 = _1915;
    float _1939 = _1691;
    float _1941 = _1641;
    float _1943 = _1661;
    float _1945 = _1555;
    if (_1903)
    {
        float _1947 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1949 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1951 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1953 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1939 = _1947;
        _1941 = _1949;
        _1943 = _1951;
        _1945 = _1953;
    }
    float _1955 = _1939;
    float _1957 = _1941;
    float _1959 = _1943;
    float _1961 = _1945;
    float _1963 = _1683;
    float _1965 = _1677;
    float _1967 = _1833;
    float _1969 = _1835;
    if (_1903)
    {
        float _1971 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1973 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1975 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1977 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1963 = _1971;
        _1965 = _1973;
        _1967 = _1975;
        _1969 = _1977;
    }
    float _1979 = _1963;
    float _1981 = _1965;
    float _1983 = _1967;
    float _1985 = _1969;
    if (!_1903)
    {
        _1917 = 0.0;
    }
    float _1987 = _1917;
    int _1989 = as_type<int>(_1891) & 2048;
    bool _1991 = _1989 != 0;
    float _1993 = _1933;
    float _1995 = _1931;
    float _1997 = _1935;
    float _1999 = _1987;
    float _2001 = _1937;
    if (_1903)
    {
        float _2003 = _1103 * _1933;
        _1993 = _2003;
    }
    float _2005 = _1993;
    float _2007 = _2005;
    if (_1903)
    {
        float _2009 = fma(_1105, _1931, _2005);
        _2007 = _2009;
    }
    float _2011 = _2007;
    float _2013 = _1955;
    float _2015 = _1979;
    float _2017 = _2011;
    if (_1903)
    {
        float _2019 = _1103 * _1957;
        _1655 = _2019;
    }
    float _2021 = _1655;
    if (_1903)
    {
        float _2023 = _1103 * _1981;
        _1995 = _2023;
    }
    float _2025 = _1995;
    float _2027 = _2025;
    if (_1903)
    {
        float _2029 = fma(_1105, _1955, _2021);
        _2013 = _2029;
    }
    float _2031 = _2013;
    float _2033 = _2031;
    if (_1903)
    {
        float _2035 = fma(_1105, _1979, _2025);
        _2015 = _2035;
    }
    float _2037 = _2015;
    float _2039 = _2037;
    if (_1903)
    {
        float _2041 = fma(_1107, _1959, _2031);
        _2033 = _2041;
    }
    float _2043 = _2033;
    if (_1903)
    {
        float _2045 = fma(_1107, _1935, _2011);
        _1997 = _2045;
    }
    float _2047 = _1997;
    if (_1903)
    {
        float _2049 = fma(_1107, _1983, _2037);
        _2039 = _2049;
    }
    float _2051 = _2039;
    if (!_1903)
    {
        _2027 = 0.0;
        _2017 = 0.0;
    }
    float _2053 = _2027;
    float _2055 = _2017;
    float _2057 = _2055;
    float _2059 = _2053;
    if (_1903)
    {
        float _2061 = _1961 + _2043;
        _2057 = _2061;
    }
    float _2063 = _2057;
    float _2065 = _2063;
    if (_1903)
    {
        float _2067 = _1937 + _2047;
        _2059 = _2067;
    }
    float _2069 = _2059;
    float _2071 = _2069;
    if (_1903)
    {
        float _2073 = _1985 + _2051;
        _1999 = _2073;
    }
    float _2075 = _1999;
    bool _2077 = !_1907;
    float _2079 = _2075;
    if (!_2077)
    {
        float _2081 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2083 = uint(int(uint(_173) >> uint(2)));
        float _2085 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2083)]);
        int _2087 = _173 + 4;
        uint _2089 = uint(int(uint(_2087) >> uint(2)));
        float _2091 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2089)]);
        int _2093 = _173 + 8;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        float _2097 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2095)]);
        int _2099 = _173 + 12;
        uint _2101 = uint(int(uint(_2099) >> uint(2)));
        float _2103 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2101)]);
        uint _2105 = uint(int(uint(_173) >> uint(2)));
        float _2107 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2105)]);
        int _2109 = _173 + 4;
        uint _2111 = uint(int(uint(_2109) >> uint(2)));
        float _2113 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2111)]);
        int _2115 = _173 + 8;
        uint _2117 = uint(int(uint(_2115) >> uint(2)));
        float _2119 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2117)]);
        uint _2121 = uint(int(uint(_173) >> uint(2)));
        float _2123 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2121)]);
        int _2125 = _173 + 4;
        uint _2127 = uint(int(uint(_2125) >> uint(2)));
        float _2129 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2127)]);
        int _2131 = _173 + 8;
        uint _2133 = uint(int(uint(_2131) >> uint(2)));
        float _2135 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2133)]);
        float _2137 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2139 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2141 = _1103 * _2091;
        float _2143 = _1103 * _2113;
        float _2145 = fma(_1105, _2085, _2141);
        float _2147 = _1103 * _2129;
        float _2149 = fma(_1105, _2107, _2143);
        float _2151 = fma(_1105, _2123, _2147);
        float _2153 = fma(_1107, _2097, _2145);
        float _2155 = fma(_1107, _2119, _2149);
        float _2157 = fma(_1107, _2135, _2151);
        float _2159 = _2081 + _2153;
        float _2161 = _2137 + _2155;
        float _2163 = _2139 + _2157;
        _2071 = _2161;
        _2065 = _2159;
        _2001 = _2103;
        _2079 = _2163;
    }
    float _2165 = _2071;
    float _2167 = _2065;
    float _2169 = _2001;
    float _2171 = _2079;
    bool _2173 = !_1991;
    float _2175 = _2165;
    float _2177 = _2167;
    float _2179 = _2171;
    float _2181 = _2169;
    if (!_2173)
    {
        uint _2183 = uint(int(uint(_173) >> uint(2)));
        float _2185 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2183)]);
        int _2187 = _173 + 4;
        uint _2189 = uint(int(uint(_2187) >> uint(2)));
        float _2191 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2189)]);
        int _2193 = _173 + 8;
        uint _2195 = uint(int(uint(_2193) >> uint(2)));
        float _2197 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2195)]);
        int _2199 = _173 + 12;
        uint _2201 = uint(int(uint(_2199) >> uint(2)));
        float _2203 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2201)]);
        uint _2205 = uint(int(uint(_173) >> uint(2)));
        float _2207 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2205)]);
        int _2209 = _173 + 4;
        uint _2211 = uint(int(uint(_2209) >> uint(2)));
        float _2213 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2211)]);
        int _2215 = _173 + 8;
        uint _2217 = uint(int(uint(_2215) >> uint(2)));
        float _2219 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2217)]);
        int _2221 = _173 + 12;
        uint _2223 = uint(int(uint(_2221) >> uint(2)));
        float _2225 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2223)]);
        uint _2227 = uint(int(uint(_173) >> uint(2)));
        float _2229 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2227)]);
        int _2231 = _173 + 4;
        uint _2233 = uint(int(uint(_2231) >> uint(2)));
        float _2235 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2233)]);
        int _2237 = _173 + 8;
        uint _2239 = uint(int(uint(_2237) >> uint(2)));
        float _2241 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2239)]);
        int _2243 = _173 + 12;
        uint _2245 = uint(int(uint(_2243) >> uint(2)));
        float _2247 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2245)]);
        float _2249 = _1103 * _2191;
        float _2251 = _1103 * _2213;
        float _2253 = fma(_1105, _2185, _2249);
        float _2255 = _1103 * _2235;
        float _2257 = fma(_1105, _2207, _2251);
        float _2259 = fma(_1105, _2229, _2255);
        float _2261 = fma(_1107, _2197, _2253);
        float _2263 = fma(_1107, _2219, _2257);
        float _2265 = fma(_1107, _2241, _2259);
        float _2267 = _2261 + _2203;
        float _2269 = _2263 + _2225;
        float _2271 = _2265 + _2247;
        _2175 = _2269;
        _2177 = _2267;
        _2179 = _2271;
        _2181 = _2203;
    }
    float _2273 = _2175;
    float _2275 = _2177;
    float _2277 = _2179;
    float _2279 = _2181;
    float _2281 = -_2273;
    float _2283 = _1895 + _2281;
    float _2285 = -_2275;
    float _2287 = _1893 + _2285;
    float _2289 = -_2277;
    float _2291 = _1897 + _2289;
    float _2293 = _2283 * _2283;
    float _2295 = fma(_2287, _2287, _2293);
    float _2297 = fma(_2291, _2291, _2295);
    float _2299 = sqrt(_2297);
    float _2301 = _2291;
    int _2303 = as_type<int>(_2273);
    float _2305 = 0.0;
    float _2307 = 0.0;
    float _2309 = 0.0;
    if (!_1853)
    {
        bool _2311 = _2299 > _1899;
        float _2313 = float(_2311);
        _2301 = _2313;
    }
    float _2315 = _2301;
    bool _2317 = !_1853;
    float _2319 = _2315;
    if (!_2317)
    {
        float _2321 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[20]);
        float _2323 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[21]);
        float _2325 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[22]);
        float _2327 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[23]);
        float _2329 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[24]);
        float _2331 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[25]);
        float _2333 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[26]);
        float _2335 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[28]);
        float _2337 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[29]);
        float _2339 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[30]);
        float _2341 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[31]);
        uint _2343 = uint(int(uint(_195) >> uint(2)));
        float _2345 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2343)]);
        bool _2347 = _2299 > _1899;
        float _2349 = -_2273;
        float _2351 = _2323 + _2349;
        float _2353 = -_2275;
        float _2355 = _2321 + _2353;
        float _2357 = -_2277;
        float _2359 = _2325 + _2357;
        float _2361 = -_2273;
        float _2363 = _2331 + _2361;
        float _2365 = _2351 * _2351;
        float _2367 = -_2275;
        float _2369 = _2329 + _2367;
        float _2371 = -_2277;
        float _2373 = _2333 + _2371;
        float _2375 = -_2273;
        float _2377 = _2337 + _2375;
        float _2379 = _2363 * _2363;
        float _2381 = -_2275;
        float _2383 = _2335 + _2381;
        float _2385 = fma(_2355, _2355, _2365);
        float _2387 = _2377 * _2377;
        float _2389 = fma(_2369, _2369, _2379);
        float _2391 = -_2277;
        float _2393 = _2339 + _2391;
        float _2395 = fma(_2359, _2359, _2385);
        float _2397 = fma(_2383, _2383, _2387);
        float _2399 = fma(_2373, _2373, _2389);
        float _2401 = _2277;
        int _2403 = as_type<int>(_2393);
        int _2405 = as_type<int>(_2327);
        int _2407 = as_type<int>(_2341);
        if (!_2347)
        {
            float _2409 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _2401 = _2409;
        }
        float _2411 = _2401;
        float _2413 = sqrt(_2395);
        float _2415 = fma(_2393, _2393, _2397);
        float _2417 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[14]);
        float _2419 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _2421 = sqrt(_2399);
        float _2423 = sqrt(_2415);
        bool _2425 = _2413 > _1899;
        bool _2427 = _2421 > _1899;
        float _2429 = _2275;
        if (!_2425)
        {
            float _2431 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _2429 = _2431;
        }
        float _2433 = _2429;
        bool _2435 = _2423 > _1899;
        float _2437 = _2279;
        if (!_2427)
        {
            float _2439 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _2437 = _2439;
        }
        float _2441 = _2437;
        float _2443 = _2395;
        if (!_2435)
        {
            float _2445 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _2443 = _2445;
        }
        float _2447 = _2443;
        int _2449 = as_type<int>(_2345) << 24;
        int _2451 = _2449 >> 24;
        float _2453 = float(_2451);
        float _2455 = _2453 * 0.0078740157186985015869140625;
        float _2457 = precise::min(_2455, 1.0);
        float _2459 = precise::max(_2457, -1.0);
        int _2461 = as_type<int>(_2345) << 16;
        int _2463 = as_type<int>(_2345) << 8;
        bool _2465 = _2459 > 0.0;
        bool _2467 = _2465 || _2347;
        int _2469 = _2461 >> 24;
        int _2471 = _2463 >> 24;
        int _2473 = _2469;
        if (!_2347)
        {
            bool _2475 = _2459 >= 0.0;
            bool _2477 = isnan(_2459);
            bool _2479 = _2475 || _2477;
            bool _2481 = isnan(0.0);
            bool _2483 = _2479 || _2481;
            _1919 = _2483;
        }
        bool _2485 = _1919;
        float _2487 = float(_2469);
        int _2489 = as_type<int>(_2345) >> 24;
        float _2491 = float(_2471);
        float _2493 = _2487 * 0.0078740157186985015869140625;
        float _2495 = _2487;
        bool _2497 = _2485;
        if (!_2347)
        {
            int _2499 = _2485 ? 0 : 1;
            _2403 = _2499;
        }
        int _2501 = _2403;
        float _2503 = float(_2489);
        float _2505 = _2491 * 0.0078740157186985015869140625;
        if (!_2347)
        {
            int _2507 = ~_2501;
            int _2509 = _2507 + 1;
            int _2511 = _2509 + 1;
            _2473 = _2511;
        }
        int _2513 = _2473;
        int _2515 = _2513;
        if (!_2467)
        {
            int _2517 = ~_2501;
            int _2519 = _2517 + 1;
            _2515 = _2519;
        }
        int _2521 = _2515;
        float _2523 = _2503 * 0.0078740157186985015869140625;
        float _2525 = precise::min(_2493, 1.0);
        int _2527 = _2521;
        int _2529 = as_type<int>(_2525);
        if (!_2347)
        {
            float _2531 = float(_2521);
            _2527 = as_type<int>(_2531);
        }
        int _2533 = _2527;
        float _2535 = precise::min(_2523, 1.0);
        int _2537 = _2533;
        if (_2347)
        {
            _2495 = 1.0;
        }
        float _2539 = _2495;
        float _2541 = precise::max(_2535, -1.0);
        float _2543 = _2539;
        if (!_2347)
        {
            bool _2545 = _2299 >= _2411;
            bool _2547 = isnan(_2299);
            bool _2549 = _2545 || _2547;
            bool _2551 = isnan(_2411);
            bool _2553 = _2549 || _2551;
            _2497 = _2553;
        }
        bool _2555 = _2497;
        float _2557 = precise::min(_2505, 1.0);
        float _2559 = precise::max(_2525, -1.0);
        bool _2561 = _2555;
        int _2563 = as_type<int>(_2557);
        if (!_2347)
        {
            float _2565 = _2555 ? as_type<float>(_2533) : (-1.0);
            _2543 = _2565;
        }
        float _2567 = _2543;
        float _2569 = precise::max(_2557, -1.0);
        if (!_2425)
        {
            bool _2571 = _2559 >= 0.0;
            bool _2573 = isnan(_2559);
            bool _2575 = _2571 || _2573;
            bool _2577 = isnan(0.0);
            bool _2579 = _2575 || _2577;
            _2561 = _2579;
        }
        bool _2581 = _2561;
        if (!_2427)
        {
            bool _2583 = _2569 >= 0.0;
            bool _2585 = isnan(_2569);
            bool _2587 = _2583 || _2585;
            bool _2589 = isnan(0.0);
            bool _2591 = _2587 || _2589;
            _1921 = _2591;
        }
        bool _2593 = _1921;
        bool _2595 = _2593;
        if (!_2425)
        {
            int _2597 = _2581 ? 0 : 1;
            _2563 = _2597;
        }
        int _2599 = _2563;
        bool _2601 = _2559 > 0.0;
        bool _2603 = _2601 || _2425;
        bool _2605 = _2569 > 0.0;
        bool _2607 = _2605 || _2427;
        bool _2609 = _2541 > 0.0;
        bool _2611 = _2609 || _2435;
        bool _2613 = _2603;
        bool _2615 = _2607;
        bool _2617 = _2611;
        float _2619 = as_type<float>(_2599);
        if (!_2427)
        {
            int _2621 = _2593 ? 0 : 1;
            _2405 = _2621;
        }
        int _2623 = _2405;
        if (!_2435)
        {
            bool _2625 = _2541 >= 0.0;
            bool _2627 = isnan(_2541);
            bool _2629 = _2625 || _2627;
            bool _2631 = isnan(0.0);
            bool _2633 = _2629 || _2631;
            _2595 = _2633;
        }
        bool _2635 = _2595;
        float _2637 = 1.0 / _2417;
        float _2639 = _2417;
        if (!_2435)
        {
            int _2641 = _2635 ? 0 : 1;
            _2537 = _2641;
        }
        int _2643 = _2537;
        float _2645 = as_type<float>(_2643);
        if (!_2425)
        {
            int _2647 = ~_2599;
            int _2649 = _2647 + 1;
            int _2651 = _2649 + 1;
            _2529 = _2651;
        }
        int _2653 = _2529;
        int _2655 = _2653;
        if (!_2427)
        {
            int _2657 = ~_2623;
            int _2659 = _2657 + 1;
            int _2661 = _2659 + 1;
            _2407 = _2661;
        }
        int _2663 = _2407;
        int _2665 = _2663;
        if (!_2435)
        {
            int _2667 = ~_2643;
            int _2669 = _2667 + 1;
            int _2671 = _2669 + 1;
            _2303 = _2671;
        }
        int _2673 = _2303;
        int _2675 = _2673;
        if (!_2603)
        {
            int _2677 = ~_2599;
            int _2679 = _2677 + 1;
            _2655 = _2679;
        }
        int _2681 = _2655;
        int _2683 = _2681;
        if (!_2607)
        {
            int _2685 = ~_2623;
            int _2687 = _2685 + 1;
            _2665 = _2687;
        }
        int _2689 = _2665;
        int _2691 = _2689;
        if (!_2611)
        {
            int _2693 = ~_2643;
            int _2695 = _2693 + 1;
            _2675 = _2695;
        }
        int _2697 = _2675;
        int _2699 = _2697;
        if (!_2425)
        {
            bool _2701 = _2413 >= _2433;
            bool _2703 = isnan(_2413);
            bool _2705 = _2701 || _2703;
            bool _2707 = isnan(_2433);
            bool _2709 = _2705 || _2707;
            _2613 = _2709;
        }
        bool _2711 = _2613;
        if (!_2427)
        {
            bool _2713 = _2421 >= _2441;
            bool _2715 = isnan(_2421);
            bool _2717 = _2713 || _2715;
            bool _2719 = isnan(_2441);
            bool _2721 = _2717 || _2719;
            _2615 = _2721;
        }
        bool _2723 = _2615;
        if (!_2435)
        {
            bool _2725 = _2423 >= _2447;
            bool _2727 = isnan(_2423);
            bool _2729 = _2725 || _2727;
            bool _2731 = isnan(_2447);
            bool _2733 = _2729 || _2731;
            _2617 = _2733;
        }
        bool _2735 = _2617;
        if (!_2425)
        {
            float _2737 = float(_2681);
            _2683 = as_type<int>(_2737);
        }
        int _2739 = _2683;
        if (!_2427)
        {
            float _2741 = float(_2689);
            _2691 = as_type<int>(_2741);
        }
        int _2743 = _2691;
        if (!_2435)
        {
            float _2745 = float(_2697);
            _2699 = as_type<int>(_2745);
        }
        int _2747 = _2699;
        if (_2425)
        {
            _2639 = 1.0;
        }
        float _2749 = _2639;
        float _2751 = _2749;
        if (_2427)
        {
            _2619 = 1.0;
        }
        float _2753 = _2619;
        float _2755 = _2753;
        if (_2435)
        {
            _2645 = 1.0;
        }
        float _2757 = _2645;
        float _2759 = _2419 * _2637;
        float _2761 = _2757;
        if (!_2425)
        {
            float _2763 = _2711 ? as_type<float>(_2739) : (-1.0);
            _2751 = _2763;
        }
        float _2765 = _2751;
        if (!_2427)
        {
            float _2767 = _2723 ? as_type<float>(_2743) : (-1.0);
            _2755 = _2767;
        }
        float _2769 = _2755;
        if (!_2435)
        {
            float _2771 = _2735 ? as_type<float>(_2747) : (-1.0);
            _2761 = _2771;
        }
        float _2773 = _2761;
        float _2775 = abs(_2459);
        float _2777 = fma(_2759, _2567, _2775);
        float _2779 = precise::clamp(_2777, 0.0, 1.0);
        float _2781 = abs(_2559);
        float _2783 = fma(_2759, _2765, _2781);
        float _2785 = precise::clamp(_2783, 0.0, 1.0);
        float _2787 = abs(_2569);
        float _2789 = fma(_2759, _2769, _2787);
        float _2791 = precise::clamp(_2789, 0.0, 1.0);
        float _2793 = abs(_2541);
        float _2795 = fma(_2759, _2773, _2793);
        float _2797 = precise::clamp(_2795, 0.0, 1.0);
        float _2799 = _2779 * _2567;
        float _2801 = _2785 * _2765;
        float _2803 = _2791 * _2769;
        float _2805 = _2797 * _2773;
        _2319 = _2799;
        _2305 = _2801;
        _2307 = _2803;
        _2309 = _2805;
    }
    float _2807 = _2319;
    float _2809 = _2305;
    float _2811 = _2307;
    float _2813 = _2309;
    float _2815 = precise::min(_2807, 1.0);
    int _2817 = _173 + 8;
    float _2819 = precise::max(_2815, -1.0);
    float _2821 = -_183;
    float _2823 = _2821 + _1103;
    float _2825 = precise::min(_2809, 1.0);
    float _2827 = -_189;
    float _2829 = _2827 + _1107;
    float _2831 = _2819 * 127.0;
    float _2833 = precise::max(_2825, -1.0);
    float _2835 = precise::min(_2811, 1.0);
    float _2837 = precise::min(_2813, 1.0);
    float _2839 = _2833 * 127.0;
    float _2841 = precise::max(_2835, -1.0);
    float _2843 = rint(_2831);
    int _2845 = int(_2843);
    float _2847 = precise::max(_2837, -1.0);
    float _2849 = _2841 * 127.0;
    float _2851 = _2847 * 127.0;
    float _2853 = rint(_2839);
    int _2855 = int(_2853);
    float _2857 = rint(_2849);
    int _2859 = int(_2857);
    uint _2861 = extract_bits(uint(_2845), 0u, 8u);
    int _2863 = int(_2861) & 255;
    float _2865 = rint(_2851);
    int _2867 = int(_2865);
    uint _2869 = extract_bits(uint(_2863), 0u, 8u);
    int _2871 = int(_2869) & 255;
    uint _2873 = extract_bits(uint(_2855), 0u, 8u);
    int _2875 = int(_2873) & 255;
    int _2877 = _2875 << 8;
    int _2879 = _2871 | _2877;
    uint _2881 = extract_bits(uint(_2863), 16u, 8u);
    int _2883 = int(_2881) & 255;
    int _2885 = _2883 << 16;
    int _2887 = _2879 | _2885;
    uint _2889 = extract_bits(uint(_2863), 24u, 8u);
    int _2891 = int(_2889) & 255;
    int _2893 = _2891 << 24;
    int _2895 = _2887 | _2893;
    float _2897 = -_177;
    float _2899 = _2897 + _1105;
    int _2901 = _173 + 4;
    uint _2903 = extract_bits(uint(_2895), 0u, 8u);
    int _2905 = int(_2903) & 255;
    uint _2907 = extract_bits(uint(_2895), 8u, 8u);
    int _2909 = int(_2907) & 255;
    int _2911 = _2909 << 8;
    int _2913 = _2905 | _2911;
    uint _2915 = extract_bits(uint(_2859), 0u, 8u);
    int _2917 = int(_2915) & 255;
    int _2919 = _2917 << 16;
    int _2921 = _2913 | _2919;
    uint _2923 = extract_bits(uint(_2895), 24u, 8u);
    int _2925 = int(_2923) & 255;
    int _2927 = _2925 << 24;
    int _2929 = _2921 | _2927;
    uint _2931 = extract_bits(uint(_2929), 0u, 8u);
    int _2933 = int(_2931) & 255;
    uint _2935 = extract_bits(uint(_2929), 8u, 8u);
    int _2937 = int(_2935) & 255;
    int _2939 = _2937 << 8;
    int _2941 = _2933 | _2939;
    uint _2943 = extract_bits(uint(_2929), 16u, 8u);
    int _2945 = int(_2943) & 255;
    int _2947 = _2945 << 16;
    int _2949 = _2941 | _2947;
    uint _2951 = extract_bits(uint(_2867), 0u, 8u);
    int _2953 = int(_2951) & 255;
    int _2955 = _2953 << 24;
    int _2957 = _2949 | _2955;
    uint _2959 = uint(int(uint(_195) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2959)] = uint(_2957);
    uint _2961 = uint(int(uint(_195) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2961)] = as_type<uint>(_561);
    uint _2963 = uint(int(uint(_173) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2963)] = as_type<uint>(_1105);
    uint _2965 = uint(int(uint(_2901) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2965)] = as_type<uint>(_1103);
    uint _2967 = uint(int(uint(_2817) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2967)] = as_type<uint>(_1107);
    uint _2969 = uint(int(uint(_173) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2969)] = as_type<uint>(_663);
    uint _2971 = uint(int(uint(_2901) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2971)] = as_type<uint>(_665);
    uint _2973 = uint(int(uint(_2817) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2973)] = as_type<uint>(_677);
    uint _2975 = uint(int(uint(_173) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2975)] = as_type<uint>(_2899);
    uint _2977 = uint(int(uint(_2901) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2977)] = as_type<uint>(_2823);
    uint _2979 = uint(int(uint(_2817) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2979)] = as_type<uint>(_2829);
    float _2981 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2983 = _2823 * _2823;
    float _2985 = _665 * _665;
    float _2987 = fma(_2899, _2899, _2983);
    float _2989 = fma(_663, _663, _2985);
    float _2991 = fma(_2829, _2829, _2987);
    float _2993 = fma(_677, _677, _2989);
    float _2995 = sqrt(_2993);
    float _2997 = sqrt(_2991);
    bool _2999 = _2997 >= 9.9999999747524270787835121154785e-07;
    bool _3001 = isnan(_2997);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan(9.9999999747524270787835121154785e-07);
    bool _3007 = _3003 || _3005;
    if (!_3007)
    {
        bool _3009 = _547 != _295;
        bool _3011 = isnan(_547);
        bool _3013 = _3009 || _3011;
        bool _3015 = isnan(_295);
        bool _3017 = _3013 || _3015;
        _3019 = _3017;
        if (!_3019)
        {
            float _3021 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3023 = _3021 > 0.0;
            bool _3025 = !_3023;
            if (!_3025)
            {
                float _3027 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3029 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3031 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3033 = _3029 * _515;
                float _3035 = _3029 * _513;
                float _3037 = _3029 * _517;
                float _3039 = fma(_3027, _521, _3033);
                float _3041 = fma(_3027, _519, _3035);
                float _3043 = fma(_3027, _523, _3037);
                float _3045 = fma(_3031, _527, _3039);
                float _3047 = fma(_3031, _525, _3041);
                float _3049 = fma(_3031, _529, _3043);
                float _3051 = _3045 * _3045;
                float _3053 = fma(_3047, _3047, _3051);
                float _3055 = fma(_3049, _3049, _3053);
                float _3057 = rsqrt(_3055);
                float _3059 = _3057 * 9.9999999747524270787835121154785e-07;
                float _3061 = _3047 * _3059;
                float _3063 = _3045 * _3059;
                float _3065 = _3049 * _3059;
                _333 = as_type<int>(_3061);
                _335 = as_type<int>(_3063);
                _337 = as_type<int>(_3065);
                _3019 = true;
            }
            else
            {
                bool _3067 = _2995 >= 9.9999999747524270787835121154785e-07;
                bool _3069 = isnan(_2995);
                bool _3071 = _3067 || _3069;
                bool _3073 = isnan(9.9999999747524270787835121154785e-07);
                bool _3075 = _3071 || _3073;
                if (!_3075)
                {
                    float _3077 = _1103 * _1103;
                    float _3079 = fma(_1105, _1105, _3077);
                    float _3081 = fma(_1107, _1107, _3079);
                    float _3083 = sqrt(_3081);
                    bool _3085 = _3083 >= 9.9999999747524270787835121154785e-07;
                    bool _3087 = isnan(_3083);
                    bool _3089 = _3085 || _3087;
                    bool _3091 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3093 = _3089 || _3091;
                    float _3095 = _3083;
                    if (_3093)
                    {
                        float _3097 = rsqrt(_3081);
                        _3095 = _3097;
                    }
                    float _3099 = _3095;
                    if (!_3093)
                    {
                        _321 = 0;
                    }
                    int _3101 = _321;
                    int _3103 = _3101;
                    if (!_3093)
                    {
                        _323 = 897988541;
                    }
                    int _3105 = _323;
                    int _3107 = _3105;
                    if (!_3093)
                    {
                        _325 = 0;
                    }
                    int _3109 = _325;
                    float _3111 = _3099;
                    int _3113 = _3109;
                    if (_3093)
                    {
                        float _3115 = _3099 * 9.9999999747524270787835121154785e-07;
                        _3111 = _3115;
                    }
                    float _3117 = _3111;
                    if (_3093)
                    {
                        float _3119 = _1105 * _3117;
                        _3103 = as_type<int>(_3119);
                    }
                    int _3121 = _3103;
                    _333 = _3121;
                    if (_3093)
                    {
                        float _3123 = _1103 * _3117;
                        _3107 = as_type<int>(_3123);
                    }
                    int _3125 = _3107;
                    _335 = _3125;
                    if (_3093)
                    {
                        float _3127 = _1107 * _3117;
                        _3113 = as_type<int>(_3127);
                    }
                    int _3129 = _3113;
                    _337 = _3129;
                    _3019 = true;
                }
                else
                {
                    float _3131 = rsqrt(_2993);
                    float _3133 = _3131 * 9.9999999747524270787835121154785e-07;
                    float _3135 = _663 * _3133;
                    float _3137 = _665 * _3133;
                    float _3139 = _677 * _3133;
                    _333 = as_type<int>(_3135);
                    _335 = as_type<int>(_3137);
                    _337 = as_type<int>(_3139);
                    _3019 = true;
                }
            }
        }
    }
    else
    {
        float _3141 = _2995 * _2981;
        bool _3143 = _3141 >= 0.001000000047497451305389404296875;
        bool _3145 = isnan(_3141);
        bool _3147 = _3143 || _3145;
        bool _3149 = isnan(0.001000000047497451305389404296875);
        bool _3151 = _3147 || _3149;
        bool _3153 = _3141 > 0.0;
        bool _3155 = !_3151;
        bool _3157 = _3153 && _3155;
        bool _3159 = _2997 < 0.001000000047497451305389404296875;
        bool _3161 = _3159 && _3157;
        if (!_3161)
        {
            _327 = as_type<int>(_2899);
        }
        int _3163 = _327;
        int _3165 = _3163;
        if (_3161)
        {
            float _3167 = _663 * _2981;
            _3165 = as_type<int>(_3167);
        }
        int _3169 = _3165;
        _333 = _3169;
        if (!_3161)
        {
            _329 = as_type<int>(_2823);
        }
        int _3171 = _329;
        int _3173 = _3171;
        if (_3161)
        {
            float _3175 = _665 * _2981;
            _3173 = as_type<int>(_3175);
        }
        int _3177 = _3173;
        _335 = _3177;
        if (!_3161)
        {
            _331 = as_type<int>(_2829);
        }
        int _3179 = _331;
        _337 = _3179;
        if (_3161)
        {
            float _3181 = _677 * _2981;
            _337 = as_type<int>(_3181);
        }
    }
    _3019 = false;
    int _3183 = _333;
    int _3185 = _335;
    int _3187 = _337;
    uint _3189 = uint(int(uint(_173) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3189)] = uint(_3183);
    uint _3191 = uint(int(uint(_2901) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3191)] = uint(_3185);
    uint _3193 = uint(int(uint(_2817) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3193)] = uint(_3187);
}

