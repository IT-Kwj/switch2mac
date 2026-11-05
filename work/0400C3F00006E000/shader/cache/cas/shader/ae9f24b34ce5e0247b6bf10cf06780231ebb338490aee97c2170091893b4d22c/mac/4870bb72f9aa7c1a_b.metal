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
    bool _6857 = false;
    bool _4663 = false;
    bool _3769 = false;
    bool _2585 = false;
    bool _1821 = false;
    bool _913 = false;
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
    int _163 = _84 << 4;
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[12]);
    uint _167 = uint(int(uint(_163) >> uint(2)));
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_167)]);
    int _171 = _163 + 4;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_173)]);
    int _177 = _163 + 8;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_179)]);
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[16]);
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[17]);
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    int _193 = _163 + 12;
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[68]);
    uint _197 = uint(int(uint(_193) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_197)]);
    uint _201 = uint(int(uint(_163) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_201)]);
    int _205 = _163 + 4;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_207)]);
    int _211 = _163 + 8;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_213)]);
    int _217 = _163 + 12;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    float _221 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_219)]);
    uint _223 = uint(int(uint(_163) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_223)]);
    int _227 = _163 + 4;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_229)]);
    int _233 = _163 + 8;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    float _237 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_235)]);
    float _239 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[15]);
    float _241 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
    float _243 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
    float _245 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
    float _247 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _249 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[1]);
    float _251 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[2]);
    float _253 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    float _255 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    float _257 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    uint _259 = uint(int(uint(_193) >> uint(2)));
    float _261 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_259)]);
    bool _263 = _165 != 1.0;
    bool _265 = isnan(_165);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    uint _273 = uint(int(uint(_163) >> uint(2)));
    float _275 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_273)]);
    int _277 = _163 + 4;
    uint _279 = uint(int(uint(_277) >> uint(2)));
    float _281 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_279)]);
    int _283 = _163 + 8;
    uint _285 = uint(int(uint(_283) >> uint(2)));
    float _287 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_285)]);
    float _289 = _271 ? _175 : 0.3141500055789947509765625;
    float _291 = _271 ? _169 : 0.0;
    float _293 = _271 ? _181 : 0.92653000354766845703125;
    float _295 = _183 * 0.00999999977648258209228515625;
    float _297 = _187 * _289;
    float _299 = _187 * _291;
    float _301 = _187 * _293;
    float _303 = _187 * _295;
    float _305 = _291;
    float _307 = _181;
    float _309 = _295;
    float _311 = _299;
    float _313 = _293;
    float _315 = _297;
    float _317 = _301;
    float _319 = _221;
    float _321 = _253;
    float _323 = _243;
    float _325 = _239;
    float _327 = _243;
    float _329 = _239;
    float _331 = _215;
    float _333 = _209;
    float _335 = _203;
    float _337 = _215;
    float _339 = _209;
    float _341 = _203;
    float _343 = _261;
    float _345 = _261;
    float _347 = _169;
    float _349 = _257;
    int _351 = as_type<int>(_281);
    int _353 = as_type<int>(_281);
    int _355 = as_type<int>(_287);
    int _357 = as_type<int>(_275);
    int _359 = as_type<int>(_281);
    int _361 = as_type<int>(_287);
    if (!_271)
    {
        float _363 = _185 * 0.00999999977648258209228515625;
        float _365 = _191 * _303;
        float _367 = fma(_175, 2.0, -1.0);
        float _369 = _187 * _363;
        float _371 = fma(_169, 2.0, -1.0);
        float _373 = fma(_181, 2.0, -1.0);
        float _375 = fma(_369, _367, _365);
        float _377 = fma(_369, _371, _365);
        float _379 = fma(_369, _373, _365);
        float _381 = _297 + _375;
        float _383 = _299 + _377;
        float _385 = _301 + _379;
        _305 = _369;
        _307 = _375;
        _309 = _377;
        _311 = _383;
        _313 = _379;
        _315 = _381;
        _317 = _385;
    }
    float _387 = _305;
    float _389 = _307;
    float _391 = _309;
    float _393 = _311;
    float _395 = _313;
    float _397 = _315;
    float _399 = _317;
    float _401 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[13]);
    float _403 = -_189;
    float _405 = _403 + 1.0;
    float _407 = -_195;
    float _409 = _407 + 1.0;
    float _411 = _387;
    float _413 = _391;
    float _415 = _399;
    if (_271)
    {
        _411 = 0.0;
    }
    float _417 = _411;
    float _419 = _417;
    if (!_271)
    {
        float _421 = _189 * _303;
        _419 = _421;
    }
    float _423 = _419;
    float _425 = _241 * _255;
    float _427 = fma(_405, _409, _195);
    float _429 = -_199;
    float _431 = _191 + _429;
    float _433 = abs(_195);
    float _435 = log2(_433);
    bool _437 = _423 != 0.0;
    bool _439 = isnan(_423);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = _245 * _255;
    bool _449 = _427 != 1.0;
    bool _451 = isnan(_427);
    bool _453 = _449 || _451;
    bool _455 = isnan(1.0);
    bool _457 = _453 || _455;
    int _459 = as_type<int>(_257) & 512;
    bool _461 = _459 != 0;
    bool _463 = _239 != 1.0;
    bool _465 = isnan(_239);
    bool _467 = _463 || _465;
    bool _469 = isnan(1.0);
    bool _471 = _467 || _469;
    bool _473 = !_457;
    bool _475 = _471 || _473;
    float _477 = _189 * _435;
    float _479 = _389;
    float _481 = _447;
    float _483 = _447;
    float _485 = _423;
    if (!_475)
    {
        float _487 = abs(_427);
        float _489 = log2(_487);
        _479 = _489;
    }
    float _491 = _479;
    if (!_475)
    {
        float _493 = -_427;
        float _495 = _493 + 1.0;
        _319 = _495;
    }
    float _497 = _319;
    float _499 = _497;
    if (_475)
    {
        _413 = _431;
    }
    float _501 = _413;
    float _503 = _501;
    if (!_475)
    {
        float _505 = 1.0 / _497;
        _499 = _505;
    }
    float _507 = _499;
    float _509 = _189 * _425;
    float _511 = _491;
    if (!_475)
    {
        float _513 = _431 * _491;
        _321 = _513;
    }
    float _515 = _321;
    float _517 = exp2(_477);
    float _519 = _515;
    if (!_475)
    {
        float _521 = exp2(_515);
        _519 = _521;
    }
    float _523 = _519;
    if (!_475)
    {
        float _525 = -_523;
        float _527 = _525 + 1.0;
        _511 = _527;
    }
    float _529 = _511;
    float _531 = _189 * _447;
    if (!_475)
    {
        float _533 = _529 * _507;
        _503 = _533;
    }
    float _535 = _503;
    float _537 = _243 * _255;
    float _539 = _535 + _393;
    float _541 = _189 * _537;
    float _543 = fma(_203, _517, _509);
    float _545 = _189 + _539;
    float _547 = fma(_209, _517, _541);
    float _549 = fma(_215, _517, _531);
    float _551 = _545 + _423;
    bool _553 = _401 != 1.0;
    bool _555 = isnan(_401);
    bool _557 = _553 || _555;
    bool _559 = isnan(1.0);
    bool _561 = _557 || _559;
    float _563 = _401;
    float _565 = _541;
    float _567 = _401;
    float _569 = _541;
    float _571 = _543;
    float _755;
    float _757;
    float _759;
    float _761;
    float _803;
    float _841;
    float _857;
    float _865;
    float _875;
    float _879;
    float _887;
    float _889;
    float _893;
    float _897;
    float _901;
    float _905;
    float _909;
    float _911;
    if (!_445)
    {
        if (_561)
        {
            _563 = 0.1500000059604644775390625;
        }
        float _573 = _563;
        float _575 = _303;
        float _577 = 0.0;
        float _579 = _395;
        float _581 = 0.0;
        if (!_561)
        {
            float _583 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            float _585 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            float _587 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            float _589 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _575 = _583;
            _577 = _585;
            _579 = _587;
            _581 = _589;
        }
        float _591 = _575;
        float _593 = _577;
        float _595 = _579;
        float _597 = _581;
        if (_561)
        {
            _481 = 0.23000000417232513427734375;
        }
        float _599 = _481;
        if (_561)
        {
            _323 = 0.4199999868869781494140625;
        }
        float _601 = _323;
        if (_561)
        {
            _565 = 0.60000002384185791015625;
        }
        float _603 = _565;
        float _605 = _603;
        float _607 = _601;
        float _609 = _599;
        float _611 = _573;
        if (!_561)
        {
            float _613 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            float _615 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            float _617 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            float _619 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _605 = _613;
            _607 = _615;
            _609 = _617;
            _611 = _619;
        }
        float _621 = _605;
        float _623 = _607;
        float _625 = _609;
        float _627 = _611;
        if (_561)
        {
            _325 = 0.1500000059604644775390625;
        }
        float _629 = _325;
        float _631 = 0.0;
        float _633 = _629;
        if (_561)
        {
            _631 = 0.4199999868869781494140625;
        }
        float _635 = _631;
        float _637 = _551 * 6.283184051513671875;
        float _639 = _187 * _621;
        float _641 = _187 * _623;
        float _643 = _187 * _625;
        float _645 = 1.0 / _639;
        float _647 = _635;
        float _649 = _621;
        if (!_561)
        {
            _633 = _627;
        }
        float _651 = _633;
        float _653 = _187 * _627;
        float _655 = _651;
        if (!_561)
        {
            _647 = _623;
        }
        float _657 = _647;
        float _659 = 1.0 / _641;
        float _661 = _187 * _651;
        if (_561)
        {
            _655 = 0.60000002384185791015625;
        }
        float _663 = _655;
        float _665 = _187 * _657;
        float _667 = _663;
        if (!_561)
        {
            _667 = _621;
        }
        float _669 = _667;
        float _671 = 1.0 / _643;
        if (_561)
        {
            _649 = 0.23000000417232513427734375;
        }
        float _673 = _649;
        float _675 = _673;
        if (!_561)
        {
            _675 = _625;
        }
        float _677 = _675;
        float _679 = _187 * _669;
        float _681 = _645 * _637;
        float _683 = 1.0 / _653;
        float _685 = _187 * _677;
        float _687 = _681 * 0.15915493667125701904296875;
        float _689 = _659 * _637;
        float _691 = 1.0 / _665;
        float _693 = _689 * 0.15915493667125701904296875;
        float _695 = _671 * _637;
        float _697 = 1.0 / _679;
        float _699 = 1.0 / _685;
        float _701 = _539 * _691;
        float _703 = 1.0 / _661;
        float _705 = _701 * 6.283184051513671875;
        float _707 = _695 * 0.15915493667125701904296875;
        float _709 = _683 * _637;
        float _711 = _709 * 0.15915493667125701904296875;
        float _713 = _539 * _697;
        float _715 = _693 * 6.283185482025146484375;
        float _717 = sin(_715);
        float _719 = _705 * 0.15915493667125701904296875;
        float _721 = _713 * 6.283184051513671875;
        float _723 = _539 * _699;
        float _725 = _539 * _703;
        float _727 = _721 * 0.15915493667125701904296875;
        float _729 = _687 * 6.283185482025146484375;
        float _731 = sin(_729);
        float _733 = _723 * 6.283184051513671875;
        float _735 = _725 * 6.283184051513671875;
        float _737 = _705;
        float _739 = _723;
        float _741 = _733;
        float _743 = _735;
        float _745 = _691;
        if (_561)
        {
            _737 = 3.0;
        }
        float _747 = _737;
        float _749 = _719 * 6.283185482025146484375;
        float _751 = sin(_749);
        float _753 = _747;
        _755 = _593;
        _757 = _591;
        _759 = _595;
        _761 = _597;
        if (!_561)
        {
            _753 = _593;
        }
        float _763 = _753;
        float _765 = _733 * 0.15915493667125701904296875;
        float _767 = _735 * 0.15915493667125701904296875;
        float _769 = _765;
        if (_561)
        {
            _739 = 4.0;
        }
        float _771 = _739;
        float _773 = _727 * 6.283185482025146484375;
        float _775 = sin(_773);
        float _777 = _771;
        if (!_561)
        {
            _777 = _591;
        }
        float _779 = _777;
        float _781 = _717 * _763;
        float _783 = _779;
        float _785 = _781;
        if (_561)
        {
            _741 = 3.0;
        }
        float _787 = _741;
        float _789 = _787;
        if (!_561)
        {
            _789 = _593;
        }
        float _791 = _789;
        float _793 = _707 * 6.283185482025146484375;
        float _795 = sin(_793);
        float _797 = fma(_731, _779, _781);
        float _799 = _731;
        float _801 = _791;
        _803 = _797;
        if (_561)
        {
            _783 = 4.0;
        }
        float _805 = _783;
        float _807 = _765 * 6.283185482025146484375;
        float _809 = sin(_807);
        float _811 = _805;
        if (!_561)
        {
            _811 = _591;
        }
        float _813 = _811;
        float _815 = _751 * _791;
        float _817 = _711 * 6.283185482025146484375;
        float _819 = sin(_817);
        float _821 = _815;
        if (_561)
        {
            _799 = 2.0;
        }
        float _823 = _799;
        float _825 = _767 * 6.283185482025146484375;
        float _827 = sin(_825);
        float _829 = _823;
        if (_561)
        {
            _801 = 2.0;
        }
        float _831 = _801;
        float _833 = fma(_775, _813, _815);
        float _835 = _831;
        float _837 = _775;
        if (!_561)
        {
            _829 = _595;
        }
        float _839 = _829;
        _841 = _839;
        if (!_561)
        {
            _835 = _595;
        }
        float _843 = _835;
        float _845 = _843;
        if (_561)
        {
            _743 = 1.5;
        }
        float _847 = _743;
        float _849 = _847;
        if (_561)
        {
            _785 = 1.5;
        }
        float _851 = _785;
        float _853 = fma(_795, _839, _797);
        float _855 = _851;
        _857 = _853;
        if (!_561)
        {
            _849 = _597;
        }
        float _859 = _849;
        float _861 = fma(_809, _843, _833);
        float _863 = _809;
        _865 = _859;
        if (!_561)
        {
            _855 = _597;
        }
        float _867 = _855;
        float _869 = fma(_819, _859, _853);
        float _871 = fma(_827, _867, _861);
        float _873 = _869;
        _875 = _827;
        if (_561)
        {
            _845 = 1.5;
        }
        float _877 = _845;
        _879 = _877;
        if (_561)
        {
            _863 = 2.0;
        }
        float _881 = _863;
        float _883 = -_871;
        float _885 = _869 + _883;
        _887 = _881;
        _889 = _885;
        if (_561)
        {
            _821 = 3.0;
        }
        float _891 = _821;
        _893 = _891;
        if (_561)
        {
            _873 = 4.0;
        }
        float _895 = _873;
        _897 = _895;
        if (_561)
        {
            _769 = 0.1500000059604644775390625;
        }
        float _899 = _769;
        _901 = _899;
        if (_561)
        {
            _837 = 0.23000000417232513427734375;
        }
        float _903 = _837;
        _905 = _903;
        if (_561)
        {
            _745 = 0.4199999868869781494140625;
        }
        float _907 = _745;
        _909 = _907;
        _911 = 0.0;
        _913 = true;
    }
    else
    {
        if (_561)
        {
            _567 = 0.1500000059604644775390625;
        }
        float _915 = _567;
        float _917 = _303;
        float _919 = 0.0;
        float _921 = _395;
        float _923 = 0.0;
        if (!_561)
        {
            float _925 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            float _927 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            float _929 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            float _931 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _917 = _925;
            _919 = _927;
            _921 = _929;
            _923 = _931;
        }
        float _933 = _917;
        float _935 = _919;
        float _937 = _921;
        float _939 = _923;
        if (_561)
        {
            _483 = 0.23000000417232513427734375;
        }
        float _941 = _483;
        if (_561)
        {
            _327 = 0.4199999868869781494140625;
        }
        float _943 = _327;
        if (_561)
        {
            _569 = 0.60000002384185791015625;
        }
        float _945 = _569;
        float _947 = _945;
        float _949 = _943;
        float _951 = _941;
        float _953 = _915;
        if (!_561)
        {
            float _955 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            float _957 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            float _959 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            float _961 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _947 = _955;
            _949 = _957;
            _951 = _959;
            _953 = _961;
        }
        float _963 = _947;
        float _965 = _949;
        float _967 = _951;
        float _969 = _953;
        float _971 = 0.0;
        if (_561)
        {
            _971 = 0.4199999868869781494140625;
        }
        float _973 = _971;
        float _975 = _973;
        if (_561)
        {
            _329 = 0.60000002384185791015625;
        }
        float _977 = _329;
        float _979 = 0.0;
        float _981 = _977;
        if (_561)
        {
            _979 = 0.1500000059604644775390625;
        }
        float _983 = _979;
        float _985 = _551 * 6.283184051513671875;
        float _987 = _983;
        float _989 = _967;
        if (!_561)
        {
            _975 = _965;
        }
        float _991 = _975;
        float _993 = _187 * _965;
        float _995 = _187 * _963;
        float _997 = _991;
        if (!_561)
        {
            _981 = _963;
        }
        float _999 = _981;
        float _1001 = _187 * _991;
        float _1003 = _999;
        if (_561)
        {
            _997 = 0.23000000417232513427734375;
        }
        float _1005 = _997;
        float _1007 = _1005;
        if (!_561)
        {
            _1007 = _967;
        }
        float _1009 = _1007;
        float _1011 = 1.0 / _993;
        float _1013 = _187 * _967;
        float _1015 = _187 * _969;
        float _1017 = 1.0 / _995;
        float _1019 = _187 * _1009;
        float _1021 = _1009;
        if (_561)
        {
            _1021 = 0.23000000417232513427734375;
        }
        float _1023 = _1021;
        float _1025 = _1023;
        if (!_561)
        {
            _1025 = _967;
        }
        float _1027 = _1025;
        float _1029 = _187 * _999;
        float _1031 = _1027;
        if (_561)
        {
            _1003 = 0.1500000059604644775390625;
        }
        float _1033 = _1003;
        float _1035 = _1033;
        if (!_561)
        {
            _1035 = _969;
        }
        float _1037 = _1035;
        float _1039 = 1.0 / _1013;
        float _1041 = 1.0 / _1015;
        float _1043 = _187 * _1027;
        float _1045 = _1037;
        if (_561)
        {
            _1031 = 0.60000002384185791015625;
        }
        float _1047 = _1031;
        float _1049 = _1047;
        if (!_561)
        {
            _1049 = _963;
        }
        float _1051 = _1049;
        float _1053 = _187 * _1037;
        float _1055 = _1051;
        if (_561)
        {
            _1045 = 0.4199999868869781494140625;
        }
        float _1057 = _1045;
        float _1059 = _1057;
        if (!_561)
        {
            _1059 = _965;
        }
        float _1061 = _1059;
        float _1063 = 1.0 / _1029;
        float _1065 = _1061;
        if (!_561)
        {
            _987 = _969;
        }
        float _1067 = _987;
        float _1069 = 1.0 / _1019;
        float _1071 = _187 * _1051;
        if (_561)
        {
            _1055 = 0.23000000417232513427734375;
        }
        float _1073 = _1055;
        float _1075 = _1073;
        if (!_561)
        {
            _1075 = _967;
        }
        float _1077 = _1075;
        float _1079 = _187 * _1061;
        if (_561)
        {
            _1065 = 0.1500000059604644775390625;
        }
        float _1081 = _1065;
        float _1083 = _1081;
        if (!_561)
        {
            _1083 = _969;
        }
        float _1085 = _1083;
        float _1087 = 1.0 / _1053;
        float _1089 = _187 * _1067;
        float _1091 = _187 * _1077;
        float _1093 = _1085;
        if (_561)
        {
            _989 = 0.60000002384185791015625;
        }
        float _1095 = _989;
        float _1097 = _187 * _1085;
        float _1099 = _1095;
        if (_561)
        {
            _1093 = 0.4199999868869781494140625;
        }
        float _1101 = _1093;
        float _1103 = _1101;
        if (!_561)
        {
            _1103 = _965;
        }
        float _1105 = _1103;
        float _1107 = 1.0 / _1089;
        if (!_561)
        {
            _1099 = _963;
        }
        float _1109 = _1099;
        float _1111 = _187 * _1105;
        float _1113 = 1.0 / _1071;
        float _1115 = _187 * _1109;
        float _1117 = 1.0 / _1091;
        float _1119 = _1011 * _985;
        float _1121 = _1119 * 0.15915493667125701904296875;
        float _1123 = _1017 * _985;
        float _1125 = 1.0 / _1111;
        float _1127 = _1123 * 0.15915493667125701904296875;
        float _1129 = _1039 * _985;
        float _1131 = _393 * 6.283184051513671875;
        float _1133 = 1.0 / _1079;
        float _1135 = _1129 * 0.15915493667125701904296875;
        float _1137 = _1041 * _985;
        float _1139 = 1.0 / _1043;
        float _1141 = _393 + _423;
        float _1143 = _1117 * _1131;
        float _1145 = 1.0 / _1001;
        float _1147 = _1143 * 0.15915493667125701904296875;
        float _1149 = _1125 * _1131;
        float _1151 = _1137 * 0.15915493667125701904296875;
        float _1153 = 1.0 / _1097;
        float _1155 = _1149 * 0.15915493667125701904296875;
        float _1157 = 1.0 / _1115;
        float _1159 = _1141 * 6.283184051513671875;
        float _1161 = _1121 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1133 * _1159;
        float _1167 = _1113 * _1159;
        float _1169 = _1165 * 0.15915493667125701904296875;
        float _1171 = _1127 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = _1167 * 0.15915493667125701904296875;
        float _1177 = _1139 * _1159;
        float _1179 = _1087 * _1159;
        float _1181 = _539 * _1145;
        float _1183 = _1141;
        float _1185 = _1179;
        _755 = _935;
        _757 = _933;
        _759 = _937;
        _761 = _939;
        if (_561)
        {
            _1183 = 3.0;
        }
        float _1187 = _1183;
        float _1189 = _1177 * 0.15915493667125701904296875;
        float _1191 = _1187;
        float _1193 = _1189;
        if (!_561)
        {
            _1191 = _935;
        }
        float _1195 = _1191;
        float _1197 = _1169 * 6.283185482025146484375;
        float _1199 = sin(_1197);
        float _1201 = _1181 * 6.283184051513671875;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1135 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = _1163 * _1195;
        float _1211 = _539 * _1063;
        float _1213 = _1189 * 6.283185482025146484375;
        float _1215 = sin(_1213);
        float _1217 = _1179 * 0.15915493667125701904296875;
        float _1219 = _1157 * _1131;
        float _1221 = _1209;
        _911 = _1215;
        if (_561)
        {
            _1185 = 3.0;
        }
        float _1223 = _1185;
        float _1225 = _1223;
        if (_561)
        {
            _1193 = 4.0;
        }
        float _1227 = _1193;
        float _1229 = _1227;
        if (!_561)
        {
            _1229 = _933;
        }
        float _1231 = _1229;
        float _1233 = _1155 * 6.283185482025146484375;
        float _1235 = sin(_1233);
        float _1237 = _539 * _1069;
        float _1239 = _1211 * 6.283184051513671875;
        float _1241 = _1231;
        if (!_561)
        {
            _1225 = _935;
        }
        float _1243 = _1225;
        float _1245 = fma(_1173, _1231, _1209);
        float _1247 = _1173;
        float _1249 = _1243;
        if (_561)
        {
            _1247 = 2.0;
        }
        float _1251 = _1247;
        float _1253 = _1203 * 6.283185482025146484375;
        float _1255 = sin(_1253);
        float _1257 = _1251;
        if (!_561)
        {
            _1257 = _937;
        }
        float _1259 = _1257;
        float _1261 = _1219 * 0.15915493667125701904296875;
        float _1263 = _1239 * 0.15915493667125701904296875;
        float _1265 = _1237 * 6.283184051513671875;
        float _1267 = _1175 * 6.283185482025146484375;
        float _1269 = sin(_1267);
        float _1271 = _539 * _1107;
        float _1273 = _1199 * _1243;
        float _1275 = fma(_1207, _1259, _1245);
        float _1277 = _1265 * 0.15915493667125701904296875;
        float _1279 = _1153 * _1131;
        float _1281 = _1261 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1259;
        float _1287 = _1207;
        _857 = _1275;
        if (_561)
        {
            _1249 = 3.0;
        }
        float _1289 = _1249;
        float _1291 = _1271 * 6.283184051513671875;
        float _1293 = _1289;
        if (_561)
        {
            _1221 = 3.0;
        }
        float _1295 = _1221;
        float _1297 = _1295;
        if (_561)
        {
            _1241 = 4.0;
        }
        float _1299 = _1241;
        float _1301 = _1299;
        if (!_561)
        {
            _1293 = _935;
        }
        float _1303 = _1293;
        float _1305 = _1263 * 6.283185482025146484375;
        float _1307 = sin(_1305);
        float _1309 = _1303;
        if (!_561)
        {
            _1297 = _935;
        }
        float _1311 = _1297;
        float _1313 = _1311;
        if (!_561)
        {
            _1301 = _933;
        }
        float _1315 = _1301;
        float _1317 = _1279 * 0.15915493667125701904296875;
        float _1319 = _1291 * 0.15915493667125701904296875;
        float _1321 = _1147 * 6.283185482025146484375;
        float _1323 = sin(_1321);
        float _1325 = _1235 * _1303;
        float _1327 = _1255 * _1311;
        float _1329 = fma(_1269, _1315, _1273);
        float _1331 = _1315;
        float _1333 = _1319;
        float _1335 = _1327;
        if (_561)
        {
            _1309 = 4.0;
        }
        float _1337 = _1309;
        float _1339 = _1277 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1337;
        if (_561)
        {
            _1313 = 2.0;
        }
        float _1345 = _1313;
        float _1347 = _1345;
        if (!_561)
        {
            _1343 = _933;
        }
        float _1349 = _1343;
        if (!_561)
        {
            _1347 = _937;
        }
        float _1351 = _1347;
        float _1353 = _1151 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1351;
        if (_561)
        {
            _1285 = 4.0;
        }
        float _1359 = _1285;
        float _1361 = _1359;
        if (_561)
        {
            _1331 = 2.0;
        }
        float _1363 = _1331;
        float _1365 = _1363;
        if (!_561)
        {
            _1361 = _933;
        }
        float _1367 = _1361;
        float _1369 = _1217 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1367;
        if (!_561)
        {
            _1365 = _937;
        }
        float _1375 = _1365;
        float _1377 = fma(_1283, _1349, _1325);
        float _1379 = fma(_1215, _1351, _1329);
        float _1381 = _1317 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1375;
        float _1387 = _1377;
        _909 = _1379;
        _875 = _1283;
        if (_561)
        {
            _1357 = 2.0;
        }
        float _1389 = _1357;
        float _1391 = _1319 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = _1389;
        if (!_561)
        {
            _1395 = _937;
        }
        float _1397 = _1395;
        float _1399 = fma(_1307, _1367, _1327);
        float _1401 = fma(_1323, _1375, _1377);
        float _1403 = _1399;
        if (_561)
        {
            _1287 = 1.5;
        }
        float _1405 = _1287;
        float _1407 = _1405;
        if (_561)
        {
            _1373 = 1.5;
        }
        float _1409 = _1373;
        float _1411 = _1409;
        if (_561)
        {
            _1385 = 1.5;
        }
        float _1413 = _1385;
        float _1415 = _1413;
        if (_561)
        {
            _1387 = 1.5;
        }
        float _1417 = _1387;
        float _1419 = fma(_1341, _1397, _1399);
        float _1421 = _1417;
        _803 = _1419;
        if (!_561)
        {
            _1407 = _939;
        }
        float _1423 = _1407;
        if (!_561)
        {
            _1415 = _939;
        }
        float _1425 = _1415;
        float _1427 = _1425;
        if (!_561)
        {
            _1421 = _939;
        }
        float _1429 = _1421;
        if (!_561)
        {
            _1411 = _939;
        }
        float _1431 = _1411;
        float _1433 = fma(_1355, _1423, _1275);
        float _1435 = fma(_1371, _1425, _1379);
        float _1437 = fma(_1383, _1429, _1401);
        float _1439 = fma(_1393, _1431, _1419);
        float _1441 = -_1435;
        float _1443 = _1441 + _1437;
        float _1445 = -_1439;
        float _1447 = _1433 + _1445;
        float _1449 = _1393;
        float _1451 = _1355;
        _841 = _1447;
        _865 = _1433;
        if (_561)
        {
            _1427 = 1.5;
        }
        float _1453 = _1427;
        _879 = _1453;
        if (_561)
        {
            _1333 = 2.0;
        }
        float _1455 = _1333;
        float _1457 = _1447 + _1443;
        _887 = _1455;
        _889 = _1457;
        if (_561)
        {
            _1449 = 3.0;
        }
        float _1459 = _1449;
        _893 = _1459;
        if (_561)
        {
            _1451 = 4.0;
        }
        float _1461 = _1451;
        _897 = _1461;
        if (_561)
        {
            _1403 = 0.1500000059604644775390625;
        }
        float _1463 = _1403;
        _901 = _1463;
        if (_561)
        {
            _1335 = 0.23000000417232513427734375;
        }
        float _1465 = _1335;
        _905 = _1465;
        if (_561)
        {
            _909 = 0.4199999868869781494140625;
        }
    }
    _913 = false;
    float _1467 = _901;
    float _1469 = _905;
    float _1471 = _909;
    float _1473 = _841;
    float _1475 = _865;
    float _1477 = _803;
    float _1479 = _857;
    float _1481 = _911;
    float _1483 = _875;
    float _1485 = _893;
    float _1487 = _755;
    float _1489 = _897;
    float _1491 = _757;
    float _1493 = _887;
    float _1495 = _759;
    float _1497 = _879;
    float _1499 = _761;
    float _1501 = _889;
    float _1503 = _535 + _397;
    float _1505 = _189 + _1503;
    float _1507 = _1505 + _423;
    float _1509 = _1479;
    float _1511 = _1477;
    float _1513 = _1475;
    float _1515 = _1473;
    float _1517 = _1481;
    float _1519 = _1483;
    float _1521 = _1479;
    float _1523 = _1477;
    float _1525 = _1475;
    float _1527 = _1473;
    float _1529 = _1483;
    float _1531 = _1481;
    float _1533 = _1469;
    float _1535 = _1471;
    float _1537 = _1467;
    float _1539 = _1493;
    float _1541 = _1485;
    float _1543 = _1489;
    float _1545 = _1497;
    float _1547 = _1471;
    float _1549 = _1469;
    float _1551 = _1467;
    float _1553 = _1489;
    float _1555 = _1491;
    float _1557 = _1485;
    float _1559 = _1493;
    float _1561 = _1497;
    float _1563 = _1501;
    float _1751;
    float _1817;
    float _1819;
    if (!_445)
    {
        if (_561)
        {
            _1509 = _1467;
        }
        float _1565 = _1509;
        if (_561)
        {
            _1511 = _1469;
        }
        float _1567 = _1511;
        if (_561)
        {
            _1513 = _1471;
        }
        float _1569 = _1513;
        if (_561)
        {
            _1515 = 0.60000002384185791015625;
        }
        float _1571 = _1515;
        float _1573 = _1571;
        float _1575 = _1569;
        float _1577 = _1567;
        float _1579 = _1565;
        if (!_561)
        {
            float _1581 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            float _1583 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            float _1585 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            float _1587 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1573 = _1581;
            _1575 = _1583;
            _1577 = _1585;
            _1579 = _1587;
        }
        float _1589 = _1573;
        float _1591 = _1575;
        float _1593 = _1577;
        float _1595 = _1579;
        if (_561)
        {
            _1517 = _1471;
        }
        float _1597 = _1517;
        float _1599 = _1507 * 6.283184051513671875;
        float _1601 = _1597;
        if (_561)
        {
            _1519 = 0.60000002384185791015625;
        }
        float _1603 = _1519;
        float _1605 = _187 * _1591;
        float _1607 = _187 * _1589;
        float _1609 = _187 * _1593;
        float _1611 = _1603;
        float _1613 = _1589;
        float _1615 = _1593;
        if (!_561)
        {
            _1601 = _1591;
        }
        float _1617 = _1601;
        float _1619 = _187 * _1595;
        float _1621 = 1.0 / _1607;
        if (!_561)
        {
            _1611 = _1589;
        }
        float _1623 = _1611;
        float _1625 = _187 * _1617;
        if (_561)
        {
            _1613 = _1469;
        }
        float _1627 = _1613;
        float _1629 = _187 * _1623;
        float _1631 = _1627;
        if (!_561)
        {
            _1631 = _1593;
        }
        float _1633 = _1631;
        float _1635 = 1.0 / _1605;
        if (_561)
        {
            _1615 = _1467;
        }
        float _1637 = _1615;
        float _1639 = _1637;
        if (!_561)
        {
            _1639 = _1595;
        }
        float _1641 = _1639;
        float _1643 = _187 * _1633;
        float _1645 = 1.0 / _1609;
        float _1647 = _187 * _1641;
        float _1649 = 1.0 / _1619;
        float _1651 = _1635 * _1599;
        float _1653 = _1651 * 0.15915493667125701904296875;
        float _1655 = _1621 * _1599;
        float _1657 = 1.0 / _1625;
        float _1659 = _1655 * 0.15915493667125701904296875;
        float _1661 = _1645 * _1599;
        float _1663 = _1661 * 0.15915493667125701904296875;
        float _1665 = 1.0 / _1629;
        float _1667 = _1649 * _1599;
        float _1669 = _1667 * 0.15915493667125701904296875;
        float _1671 = 1.0 / _1643;
        float _1673 = 1.0 / _1647;
        float _1675 = _1503 * _1657;
        float _1677 = _1503 * _1665;
        float _1679 = _1657;
        if (_561)
        {
            _1679 = _1485;
        }
        float _1681 = _1679;
        float _1683 = _1675 * 6.283184051513671875;
        float _1685 = _1681;
        if (!_561)
        {
            _1685 = _1487;
        }
        float _1687 = _1685;
        float _1689 = _1653 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1683 * 0.15915493667125701904296875;
        float _1695 = _1677 * 6.283184051513671875;
        float _1697 = _1503 * _1671;
        float _1699 = _1659 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = _1695 * 0.15915493667125701904296875;
        float _1705 = _1697 * 6.283184051513671875;
        float _1707 = _1503 * _1673;
        float _1709 = _1697;
        float _1711 = _1705;
        if (_561)
        {
            _1709 = _1489;
        }
        float _1713 = _1709;
        float _1715 = _1705 * 0.15915493667125701904296875;
        float _1717 = _1707 * 6.283184051513671875;
        float _1719 = _1693 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1691 * _1687;
        float _1725 = _1713;
        float _1727 = _1723;
        if (!_561)
        {
            _1725 = _1491;
        }
        float _1729 = _1725;
        float _1731 = _1717 * 0.15915493667125701904296875;
        float _1733 = _1729;
        if (_561)
        {
            _1711 = _1485;
        }
        float _1735 = _1711;
        float _1737 = _1735;
        if (!_561)
        {
            _1737 = _1487;
        }
        float _1739 = _1737;
        float _1741 = _1703 * 6.283185482025146484375;
        float _1743 = sin(_1741);
        float _1745 = fma(_1701, _1729, _1723);
        float _1747 = _1701;
        float _1749 = _1739;
        _1751 = _1745;
        if (_561)
        {
            _1733 = _1489;
        }
        float _1753 = _1733;
        float _1755 = _1753;
        if (!_561)
        {
            _1755 = _1491;
        }
        float _1757 = _1755;
        if (_561)
        {
            _1747 = _1493;
        }
        float _1759 = _1747;
        float _1761 = _1663 * 6.283185482025146484375;
        float _1763 = sin(_1761);
        float _1765 = _1721 * _1739;
        float _1767 = _1759;
        float _1769 = _1721;
        if (_561)
        {
            _1749 = _1493;
        }
        float _1771 = _1749;
        float _1773 = _1771;
        if (!_561)
        {
            _1767 = _1495;
        }
        float _1775 = _1767;
        if (!_561)
        {
            _1773 = _1495;
        }
        float _1777 = _1773;
        float _1779 = _1715 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        float _1783 = fma(_1743, _1757, _1765);
        if (_561)
        {
            _1769 = _1497;
        }
        float _1785 = _1769;
        float _1787 = _1785;
        if (_561)
        {
            _1727 = _1497;
        }
        float _1789 = _1727;
        float _1791 = _1789;
        if (!_561)
        {
            _1787 = _1499;
        }
        float _1793 = _1787;
        float _1795 = _1669 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        if (!_561)
        {
            _1791 = _1499;
        }
        float _1799 = _1791;
        float _1801 = fma(_1763, _1775, _1745);
        float _1803 = _1731 * 6.283185482025146484375;
        float _1805 = sin(_1803);
        float _1807 = fma(_1781, _1777, _1783);
        float _1809 = fma(_1797, _1793, _1801);
        float _1811 = fma(_1805, _1799, _1807);
        float _1813 = -_1811;
        float _1815 = _1809 + _1813;
        _1817 = _1811;
        _1819 = _1815;
        _1821 = true;
    }
    else
    {
        if (_561)
        {
            _1521 = _1467;
        }
        float _1823 = _1521;
        if (_561)
        {
            _1523 = _1469;
        }
        float _1825 = _1523;
        if (_561)
        {
            _1525 = _1471;
        }
        float _1827 = _1525;
        if (_561)
        {
            _1527 = 0.60000002384185791015625;
        }
        float _1829 = _1527;
        float _1831 = _1829;
        float _1833 = _1827;
        float _1835 = _1825;
        float _1837 = _1823;
        if (!_561)
        {
            float _1839 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            float _1841 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            float _1843 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            float _1845 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1831 = _1839;
            _1833 = _1841;
            _1835 = _1843;
            _1837 = _1845;
        }
        float _1847 = _1831;
        float _1849 = _1833;
        float _1851 = _1835;
        float _1853 = _1837;
        if (_561)
        {
            _1529 = 0.60000002384185791015625;
        }
        float _1855 = _1529;
        float _1857 = _1507 * 6.283184051513671875;
        float _1859 = _1855;
        if (_561)
        {
            _1531 = _1471;
        }
        float _1861 = _1531;
        float _1863 = _187 * _1847;
        float _1865 = _1861;
        float _1867 = _1847;
        float _1869 = _1851;
        if (!_561)
        {
            _1859 = _1847;
        }
        float _1871 = _1859;
        float _1873 = _187 * _1849;
        float _1875 = _1871;
        if (!_561)
        {
            _1865 = _1849;
        }
        float _1877 = _1865;
        float _1879 = 1.0 / _1863;
        float _1881 = _187 * _1851;
        float _1883 = _187 * _1853;
        float _1885 = _187 * _1877;
        float _1887 = _1877;
        if (_561)
        {
            _1887 = _1471;
        }
        float _1889 = _1887;
        float _1891 = _1889;
        if (!_561)
        {
            _1891 = _1849;
        }
        float _1893 = _1891;
        float _1895 = 1.0 / _1873;
        float _1897 = _187 * _1871;
        float _1899 = _1893;
        if (_561)
        {
            _1875 = 0.60000002384185791015625;
        }
        float _1901 = _1875;
        float _1903 = _1901;
        if (!_561)
        {
            _1903 = _1847;
        }
        float _1905 = _1903;
        float _1907 = 1.0 / _1881;
        float _1909 = _187 * _1905;
        float _1911 = _1905;
        if (_561)
        {
            _1911 = 0.60000002384185791015625;
        }
        float _1913 = _1911;
        float _1915 = _1913;
        if (!_561)
        {
            _1915 = _1847;
        }
        float _1917 = _1915;
        float _1919 = _1917;
        if (_561)
        {
            _1867 = _1469;
        }
        float _1921 = _1867;
        float _1923 = _1921;
        if (!_561)
        {
            _1923 = _1851;
        }
        float _1925 = _1923;
        float _1927 = 1.0 / _1897;
        float _1929 = _187 * _1893;
        float _1931 = _1925;
        if (_561)
        {
            _1899 = _1471;
        }
        float _1933 = _1899;
        float _1935 = _1933;
        if (!_561)
        {
            _1935 = _1849;
        }
        float _1937 = _1935;
        float _1939 = _187 * _1917;
        if (_561)
        {
            _1919 = _1469;
        }
        float _1941 = _1919;
        float _1943 = _1941;
        if (!_561)
        {
            _1943 = _1851;
        }
        float _1945 = _1943;
        float _1947 = _187 * _1925;
        float _1949 = _1945;
        if (_561)
        {
            _1931 = _1469;
        }
        float _1951 = _1931;
        float _1953 = 1.0 / _1929;
        float _1955 = _1951;
        if (!_561)
        {
            _1955 = _1851;
        }
        float _1957 = _1955;
        float _1959 = _187 * _1937;
        float _1961 = _1957;
        if (_561)
        {
            _1869 = _1467;
        }
        float _1963 = _1869;
        float _1965 = _1963;
        if (!_561)
        {
            _1965 = _1853;
        }
        float _1967 = _1965;
        float _1969 = 1.0 / _1885;
        float _1971 = _187 * _1957;
        if (_561)
        {
            _1961 = _1467;
        }
        float _1973 = _1961;
        float _1975 = _187 * _1967;
        float _1977 = _1973;
        if (!_561)
        {
            _1977 = _1853;
        }
        float _1979 = _1977;
        float _1981 = 1.0 / _1947;
        float _1983 = 1.0 / _1909;
        float _1985 = _1895 * _1857;
        float _1987 = 1.0 / _1939;
        float _1989 = _187 * _1945;
        if (_561)
        {
            _1949 = _1467;
        }
        float _1991 = _1949;
        float _1993 = _1991;
        if (!_561)
        {
            _1993 = _1853;
        }
        float _1995 = _1993;
        float _1997 = _1985 * 0.15915493667125701904296875;
        float _1999 = _1879 * _1857;
        float _2001 = _397 * 6.283184051513671875;
        float _2003 = 1.0 / _1989;
        float _2005 = _187 * _1995;
        float _2007 = _1999 * 0.15915493667125701904296875;
        float _2009 = _1907 * _1857;
        float _2011 = 1.0 / _1959;
        float _2013 = _187 * _1979;
        float _2015 = _397 + _423;
        float _2017 = _2015 * 6.283184051513671875;
        float _2019 = 1.0 / _1883;
        float _2021 = _2009 * 0.15915493667125701904296875;
        float _2023 = _1953 * _2017;
        float _2025 = _2023 * 0.15915493667125701904296875;
        float _2027 = _1983 * _2017;
        float _2029 = 1.0 / _1975;
        float _2031 = _2027 * 0.15915493667125701904296875;
        float _2033 = _2011 * _2001;
        float _2035 = _2033 * 0.15915493667125701904296875;
        float _2037 = _1987 * _2001;
        float _2039 = _2019 * _1857;
        float _2041 = 1.0 / _1971;
        float _2043 = _2037 * 0.15915493667125701904296875;
        float _2045 = _2003 * _2017;
        float _2047 = _2039 * 0.15915493667125701904296875;
        float _2049 = _2029 * _2017;
        float _2051 = _2029;
        if (_561)
        {
            _2051 = _1485;
        }
        float _2053 = _2051;
        float _2055 = _2045 * 0.15915493667125701904296875;
        float _2057 = _1503 * _1969;
        float _2059 = 1.0 / _2013;
        float _2061 = _2053;
        float _2063 = _2057;
        if (!_561)
        {
            _2061 = _1487;
        }
        float _2065 = _2061;
        float _2067 = _2057 * 6.283184051513671875;
        float _2069 = _2065;
        if (_561)
        {
            _2063 = _1485;
        }
        float _2071 = _2063;
        float _2073 = _2071;
        if (!_561)
        {
            _2073 = _1487;
        }
        float _2075 = _2073;
        float _2077 = _1997 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _1503 * _1927;
        float _2083 = _2081 * 6.283184051513671875;
        float _2085 = _2043 * 6.283185482025146484375;
        float _2087 = sin(_2085);
        float _2089 = _2083 * 0.15915493667125701904296875;
        float _2091 = _2059 * _2001;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = 1.0 / _2005;
        float _2097 = _2067 * 0.15915493667125701904296875;
        float _2099 = _2079 * _2065;
        float _2101 = _2079;
        float _2103 = _2075;
        if (_561)
        {
            _2101 = _1489;
        }
        float _2105 = _2101;
        float _2107 = _2105;
        if (_561)
        {
            _2069 = _1485;
        }
        float _2109 = _2069;
        float _2111 = _2109;
        if (!_561)
        {
            _2107 = _1491;
        }
        float _2113 = _2107;
        float _2115 = _2007 * 6.283185482025146484375;
        float _2117 = sin(_2115);
        float _2119 = _2041 * _2001;
        float _2121 = _1503 * _1981;
        float _2123 = _2119;
        float _2125 = _2113;
        if (!_561)
        {
            _2111 = _1487;
        }
        float _2127 = _2111;
        float _2129 = _2119 * 0.15915493667125701904296875;
        float _2131 = _2127;
        if (_561)
        {
            _2123 = _1485;
        }
        float _2133 = _2123;
        float _2135 = _2121 * 6.283184051513671875;
        float _2137 = _2025 * 6.283185482025146484375;
        float _2139 = sin(_2137);
        float _2141 = _2133;
        if (!_561)
        {
            _2141 = _1487;
        }
        float _2143 = _2141;
        float _2145 = _1503 * _2095;
        float _2147 = _2135 * 0.15915493667125701904296875;
        float _2149 = _2145 * 6.283184051513671875;
        float _2151 = _2097 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        float _2155 = fma(_2117, _2113, _2099);
        float _2157 = _2143;
        float _2159 = _2149;
        if (_561)
        {
            _2125 = _1493;
        }
        float _2161 = _2125;
        float _2163 = _2161;
        if (!_561)
        {
            _2163 = _1495;
        }
        float _2165 = _2163;
        float _2167 = _2035 * 6.283185482025146484375;
        float _2169 = sin(_2167);
        float _2171 = _2139 * _2143;
        float _2173 = _2165;
        if (_561)
        {
            _2157 = _1489;
        }
        float _2175 = _2157;
        float _2177 = _2049 * 0.15915493667125701904296875;
        float _2179 = _2175;
        if (!_561)
        {
            _2179 = _1491;
        }
        float _2181 = _2179;
        float _2183 = _2149 * 0.15915493667125701904296875;
        float _2185 = _2181;
        if (_561)
        {
            _2159 = _1497;
        }
        float _2187 = _2159;
        float _2189 = _2031 * 6.283185482025146484375;
        float _2191 = sin(_2189);
        float _2193 = _2153 * _2127;
        float _2195 = _2187;
        if (_561)
        {
            _2131 = _1489;
        }
        float _2197 = _2131;
        float _2199 = _2197;
        if (!_561)
        {
            _2199 = _1491;
        }
        float _2201 = _2199;
        float _2203 = _2201;
        if (!_561)
        {
            _2195 = _1499;
        }
        float _2205 = _2195;
        float _2207 = _2089 * 6.283185482025146484375;
        float _2209 = sin(_2207);
        float _2211 = _2169 * _2075;
        _1751 = _2205;
        if (_561)
        {
            _2103 = _1489;
        }
        float _2213 = _2103;
        float _2215 = _2213;
        if (!_561)
        {
            _2215 = _1491;
        }
        float _2217 = _2215;
        float _2219 = _2021 * 6.283185482025146484375;
        float _2221 = sin(_2219);
        float _2223 = fma(_2191, _2181, _2171);
        float _2225 = fma(_2087, _2217, _2211);
        float _2227 = _2217;
        if (_561)
        {
            _2185 = _1493;
        }
        float _2229 = _2185;
        float _2231 = _2229;
        if (_561)
        {
            _2227 = _1493;
        }
        float _2233 = _2227;
        float _2235 = _2233;
        if (!_561)
        {
            _2231 = _1495;
        }
        float _2237 = _2231;
        float _2239 = _2055 * 6.283185482025146484375;
        float _2241 = sin(_2239);
        float _2243 = fma(_2209, _2201, _2193);
        float _2245 = _2237;
        if (!_561)
        {
            _2235 = _1495;
        }
        float _2247 = _2235;
        float _2249 = _2247;
        if (_561)
        {
            _2203 = _1493;
        }
        float _2251 = _2203;
        float _2253 = _2251;
        if (!_561)
        {
            _2253 = _1495;
        }
        float _2255 = _2253;
        float _2257 = _2129 * 6.283185482025146484375;
        float _2259 = sin(_2257);
        float _2261 = fma(_2221, _2165, _2155);
        if (_561)
        {
            _2173 = _1497;
        }
        float _2263 = _2173;
        float _2265 = _2263;
        if (!_561)
        {
            _2265 = _1499;
        }
        float _2267 = _2265;
        float _2269 = _2147 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        float _2273 = fma(_2241, _2237, _2223);
        if (_561)
        {
            _2245 = _1497;
        }
        float _2275 = _2245;
        float _2277 = _2275;
        if (!_561)
        {
            _2277 = _1499;
        }
        float _2279 = _2277;
        float _2281 = _2047 * 6.283185482025146484375;
        float _2283 = sin(_2281);
        float _2285 = fma(_2259, _2247, _2225);
        if (_561)
        {
            _2249 = _1497;
        }
        float _2287 = _2249;
        float _2289 = _2287;
        if (!_561)
        {
            _2289 = _1499;
        }
        float _2291 = _2289;
        float _2293 = _2177 * 6.283185482025146484375;
        float _2295 = sin(_2293);
        float _2297 = fma(_2271, _2255, _2243);
        float _2299 = _2093 * 6.283185482025146484375;
        float _2301 = sin(_2299);
        float _2303 = fma(_2283, _2205, _2261);
        float _2305 = _2183 * 6.283185482025146484375;
        float _2307 = sin(_2305);
        float _2309 = fma(_2295, _2279, _2273);
        float _2311 = fma(_2301, _2291, _2285);
        float _2313 = -_2309;
        float _2315 = _2313 + _2311;
        float _2317 = fma(_2307, _2267, _2297);
        float _2319 = -_2317;
        float _2321 = _2303 + _2319;
        float _2323 = _2321 + _2315;
        _1817 = _2321;
        _1819 = _2323;
    }
    _1821 = false;
    float _2325 = _1817;
    float _2327 = _1751;
    float _2329 = _1819;
    float _2331 = _535 + _399;
    float _2333 = _261 * _189;
    float _2335 = _189 + _2331;
    float _2337 = fma(_203, _2333, _225);
    float _2339 = fma(_209, _2333, _231);
    float _2341 = fma(_215, _2333, _237);
    float _2343 = _2335 + _423;
    float _2345 = _2335;
    float _2347 = _2335;
    float _2349 = _2325;
    float _2351 = _2327;
    float _2353 = _2331;
    float _2355 = _2339;
    float _2461;
    float _2463;
    float _2495;
    float _2539;
    float _2575;
    float _2577;
    float _2579;
    float _2581;
    float _2583;
    if (!_445)
    {
        if (_561)
        {
            _2345 = _1467;
        }
        float _2357 = _2345;
        if (_561)
        {
            _331 = _1469;
        }
        float _2359 = _331;
        if (_561)
        {
            _333 = _1471;
        }
        float _2361 = _333;
        if (_561)
        {
            _335 = 0.60000002384185791015625;
        }
        float _2363 = _335;
        float _2365 = _2363;
        float _2367 = _2361;
        float _2369 = _2359;
        float _2371 = _2357;
        if (!_561)
        {
            float _2373 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            float _2375 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            float _2377 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            float _2379 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2365 = _2373;
            _2367 = _2375;
            _2369 = _2377;
            _2371 = _2379;
        }
        float _2381 = _2365;
        float _2383 = _2367;
        float _2385 = _2369;
        float _2387 = _2371;
        if (_561)
        {
            _485 = 0.60000002384185791015625;
        }
        float _2389 = _485;
        float _2391 = _187 * _2383;
        float _2393 = _187 * _2381;
        float _2395 = _187 * _2385;
        float _2397 = _187 * _2387;
        float _2399 = _2389;
        if (!_561)
        {
            _2399 = _2381;
        }
        float _2401 = _2399;
        float _2403 = 1.0 / _2391;
        if (!_561)
        {
            _1533 = _2385;
        }
        float _2405 = _1533;
        float _2407 = _2343 * 6.283184051513671875;
        float _2409 = _2407;
        if (!_561)
        {
            _1535 = _2383;
        }
        float _2411 = _1535;
        float _2413 = _187 * _2401;
        if (!_561)
        {
            _1537 = _2387;
        }
        float _2415 = _1537;
        float _2417 = _187 * _2405;
        float _2419 = 1.0 / _2393;
        float _2421 = _187 * _2411;
        float _2423 = _187 * _2415;
        float _2425 = 1.0 / _2395;
        float _2427 = _2403 * _2407;
        float _2429 = 1.0 / _2397;
        float _2431 = 1.0 / _2413;
        float _2433 = 1.0 / _2421;
        float _2435 = _2427 * 0.15915493667125701904296875;
        float _2437 = _2419 * _2407;
        float _2439 = _2437 * 0.15915493667125701904296875;
        float _2441 = _2425 * _2407;
        float _2443 = 1.0 / _2417;
        float _2445 = _2441 * 0.15915493667125701904296875;
        float _2447 = _2429 * _2407;
        if (_561)
        {
            _2409 = _1493;
        }
        float _2449 = _2409;
        float _2451 = _2449;
        if (!_561)
        {
            _2451 = _1495;
        }
        float _2453 = _2451;
        float _2455 = 1.0 / _2423;
        float _2457 = _2447 * 0.15915493667125701904296875;
        float _2459 = _2331 * _2431;
        _2461 = _2453;
        _2463 = _2433;
        if (!_561)
        {
            _1539 = _1495;
        }
        float _2465 = _1539;
        float _2467 = _2459 * 6.283184051513671875;
        float _2469 = _2331 * _2433;
        float _2471 = _2435 * 6.283185482025146484375;
        float _2473 = sin(_2471);
        float _2475 = _2467 * 0.15915493667125701904296875;
        float _2477 = _2469 * 6.283184051513671875;
        float _2479 = _2331 * _2443;
        float _2481 = _2477 * 0.15915493667125701904296875;
        float _2483 = _2479 * 6.283184051513671875;
        float _2485 = _2331 * _2455;
        float _2487 = _2439 * 6.283185482025146484375;
        float _2489 = sin(_2487);
        float _2491 = _2477;
        float _2493 = _2483;
        _2495 = _2465;
        if (_561)
        {
            _2491 = _1485;
        }
        float _2497 = _2491;
        float _2499 = _2483 * 0.15915493667125701904296875;
        float _2501 = _2485 * 6.283184051513671875;
        float _2503 = _2497;
        if (!_561)
        {
            _2503 = _1487;
        }
        float _2505 = _2503;
        float _2507 = _2505;
        if (!_561)
        {
            _1541 = _1487;
        }
        float _2509 = _1541;
        float _2511 = _2501 * 0.15915493667125701904296875;
        float _2513 = _2481 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        if (_561)
        {
            _2493 = _1489;
        }
        float _2517 = _2493;
        float _2519 = _2473 * _2505;
        float _2521 = _2517;
        if (!_561)
        {
            _2521 = _1491;
        }
        float _2523 = _2521;
        if (!_561)
        {
            _1543 = _1491;
        }
        float _2525 = _1543;
        if (_561)
        {
            _2507 = _1497;
        }
        float _2527 = _2507;
        float _2529 = _2475 * 6.283185482025146484375;
        float _2531 = sin(_2529);
        float _2533 = fma(_2489, _2523, _2519);
        float _2535 = _2527;
        if (!_561)
        {
            _2535 = _1499;
        }
        float _2537 = _2535;
        _2539 = _2537;
        if (!_561)
        {
            _1545 = _1499;
        }
        float _2541 = _1545;
        float _2543 = _2445 * 6.283185482025146484375;
        float _2545 = sin(_2543);
        float _2547 = _2515 * _2509;
        float _2549 = _2499 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        float _2553 = fma(_2531, _2525, _2547);
        float _2555 = _2457 * 6.283185482025146484375;
        float _2557 = sin(_2555);
        float _2559 = fma(_2545, _2453, _2533);
        float _2561 = _2511 * 6.283185482025146484375;
        float _2563 = sin(_2561);
        float _2565 = fma(_2551, _2465, _2553);
        float _2567 = fma(_2557, _2537, _2559);
        float _2569 = fma(_2563, _2541, _2565);
        float _2571 = -_2569;
        float _2573 = _2567 + _2571;
        _2575 = _2559;
        _2577 = _2573;
        _2579 = _2531;
        _2581 = _2553;
        _2583 = _2565;
        _2585 = true;
    }
    else
    {
        if (_561)
        {
            _2347 = _1467;
        }
        float _2587 = _2347;
        if (_561)
        {
            _337 = _1469;
        }
        float _2589 = _337;
        if (_561)
        {
            _339 = _1471;
        }
        float _2591 = _339;
        if (_561)
        {
            _341 = 0.60000002384185791015625;
        }
        float _2593 = _341;
        float _2595 = _2593;
        float _2597 = _2591;
        float _2599 = _2589;
        float _2601 = _2587;
        if (!_561)
        {
            float _2603 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            float _2605 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            float _2607 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            float _2609 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2595 = _2603;
            _2597 = _2605;
            _2599 = _2607;
            _2601 = _2609;
        }
        float _2611 = _2595;
        float _2613 = _2597;
        float _2615 = _2599;
        float _2617 = _2601;
        if (_561)
        {
            _2349 = _1471;
        }
        float _2619 = _2349;
        float _2621 = _2343 * 6.283184051513671875;
        float _2623 = _2619;
        if (_561)
        {
            _2351 = 0.60000002384185791015625;
        }
        float _2625 = _2351;
        float _2627 = _399 + _423;
        float _2629 = _2627 * 6.283184051513671875;
        float _2631 = _399 * 6.283184051513671875;
        float _2633 = _2625;
        float _2635 = _2631;
        if (_561)
        {
            _415 = _1485;
        }
        float _2637 = _415;
        float _2639 = _2637;
        if (!_561)
        {
            _2639 = _1487;
        }
        float _2641 = _2639;
        if (!_561)
        {
            _2623 = _2613;
        }
        float _2643 = _2623;
        float _2645 = _187 * _2613;
        float _2647 = _2643;
        if (!_561)
        {
            _2633 = _2611;
        }
        float _2649 = _2633;
        float _2651 = _187 * _2611;
        float _2653 = _187 * _2615;
        float _2655 = _187 * _2643;
        float _2657 = _2649;
        if (_561)
        {
            _2647 = _1469;
        }
        float _2659 = _2647;
        float _2661 = _187 * _2649;
        float _2663 = _2659;
        if (_561)
        {
            _2657 = _1467;
        }
        float _2665 = _2657;
        float _2667 = 1.0 / _2645;
        float _2669 = _2665;
        if (!_561)
        {
            _2663 = _2615;
        }
        float _2671 = _2663;
        float _2673 = _187 * _2617;
        float _2675 = _2671;
        float _2677 = _2673;
        if (!_561)
        {
            _2669 = _2617;
        }
        float _2679 = _2669;
        float _2681 = 1.0 / _2651;
        float _2683 = _187 * _2671;
        float _2685 = _2679;
        if (_561)
        {
            _2675 = _1471;
        }
        float _2687 = _2675;
        float _2689 = _2687;
        if (!_561)
        {
            _2689 = _2613;
        }
        float _2691 = _2689;
        float _2693 = _2691;
        if (!_561)
        {
            _1547 = _2613;
        }
        float _2695 = _1547;
        float _2697 = 1.0 / _2653;
        float _2699 = _187 * _2679;
        if (_561)
        {
            _2685 = 0.60000002384185791015625;
        }
        float _2701 = _2685;
        float _2703 = _187 * _2691;
        float _2705 = _2701;
        if (!_561)
        {
            _2705 = _2611;
        }
        float _2707 = _2705;
        float _2709 = _187 * _2695;
        float _2711 = _2707;
        if (_561)
        {
            _2693 = _1469;
        }
        float _2713 = _2693;
        float _2715 = 1.0 / _2661;
        float _2717 = _2713;
        if (!_561)
        {
            _2717 = _2615;
        }
        float _2719 = _2717;
        if (!_561)
        {
            _1549 = _2615;
        }
        float _2721 = _1549;
        float _2723 = _187 * _2719;
        float _2725 = 1.0 / _2673;
        float _2727 = _187 * _2707;
        if (_561)
        {
            _2711 = 0.60000002384185791015625;
        }
        float _2729 = _2711;
        float _2731 = _187 * _2721;
        float _2733 = _2729;
        float _2735 = _2731;
        if (!_561)
        {
            _2733 = _2611;
        }
        float _2737 = _2733;
        float _2739 = _2667 * _2621;
        float _2741 = 1.0 / _2703;
        if (_561)
        {
            _2677 = _1467;
        }
        float _2743 = _2677;
        float _2745 = _187 * _2737;
        float _2747 = _2743;
        if (!_561)
        {
            _2747 = _2617;
        }
        float _2749 = _2747;
        float _2751 = _2331 * _2715;
        if (!_561)
        {
            _1551 = _2617;
        }
        float _2753 = _1551;
        float _2755 = _187 * _2749;
        float _2757 = 1.0 / _2745;
        float _2759 = _187 * _2753;
        float _2761 = _2739 * 0.15915493667125701904296875;
        float _2763 = _2681 * _2621;
        float _2765 = _2751 * 6.283184051513671875;
        float _2767 = 1.0 / _2727;
        float _2769 = _2763 * 0.15915493667125701904296875;
        float _2771 = _2697 * _2621;
        float _2773 = _2771 * 0.15915493667125701904296875;
        float _2775 = _2725 * _2621;
        float _2777 = 1.0 / _2723;
        float _2779 = _2775 * 0.15915493667125701904296875;
        float _2781 = _2741 * _2629;
        float _2783 = 1.0 / _2755;
        float _2785 = 1.0 / _2709;
        float _2787 = _2761 * 6.283185482025146484375;
        float _2789 = sin(_2787);
        float _2791 = 1.0 / _2655;
        float _2793 = _2781 * 0.15915493667125701904296875;
        float _2795 = _2767 * _2629;
        float _2797 = _2795 * 0.15915493667125701904296875;
        float _2799 = _2777 * _2629;
        float _2801 = 1.0 / _2731;
        float _2803 = _2765 * 0.15915493667125701904296875;
        float _2805 = _2799 * 0.15915493667125701904296875;
        float _2807 = _2783 * _2629;
        float _2809 = 1.0 / _2683;
        float _2811 = _2807 * 0.15915493667125701904296875;
        float _2813 = _2757 * _2631;
        float _2815 = _2331 * _2791;
        float _2817 = _2757;
        float _2819 = _2793;
        if (_561)
        {
            _2735 = _1485;
        }
        float _2821 = _2735;
        float _2823 = _2813 * 0.15915493667125701904296875;
        float _2825 = _2785 * _2631;
        float _2827 = 1.0 / _2759;
        float _2829 = _2815 * 6.283184051513671875;
        float _2831 = _2821;
        if (_561)
        {
            _2817 = _1485;
        }
        float _2833 = _2817;
        float _2835 = _2825 * 0.15915493667125701904296875;
        float _2837 = _2801 * _2631;
        float _2839 = _2829 * 0.15915493667125701904296875;
        float _2841 = _2837;
        float _2843 = _2833;
        if (!_561)
        {
            _2831 = _1487;
        }
        float _2845 = _2831;
        float _2847 = 1.0 / _2699;
        float _2849 = _2331 * _2809;
        float _2851 = _2837 * 0.15915493667125701904296875;
        if (_561)
        {
            _2841 = _1489;
        }
        float _2853 = _2841;
        float _2855 = _2789 * _2845;
        float _2857 = _2849 * 6.283184051513671875;
        float _2859 = _2853;
        _2463 = _2855;
        if (!_561)
        {
            _2859 = _1491;
        }
        float _2861 = _2859;
        float _2863 = _2827 * _2631;
        float _2865 = _2793 * 6.283185482025146484375;
        float _2867 = sin(_2865);
        float _2869 = _2827;
        float _2871 = _2863;
        if (_561)
        {
            _2869 = _1489;
        }
        float _2873 = _2869;
        float _2875 = _2863 * 0.15915493667125701904296875;
        float _2877 = _2873;
        if (!_561)
        {
            _2877 = _1491;
        }
        float _2879 = _2877;
        if (_561)
        {
            _2635 = _1493;
        }
        float _2881 = _2635;
        float _2883 = _2331 * _2847;
        float _2885 = _2835 * 6.283185482025146484375;
        float _2887 = sin(_2885);
        float _2889 = _2881;
        float _2891 = _2847;
        float _2893 = _2883;
        if (_561)
        {
            _2819 = _1489;
        }
        float _2895 = _2819;
        float _2897 = _2895;
        if (!_561)
        {
            _2897 = _1491;
        }
        float _2899 = _2897;
        _2575 = _2899;
        if (!_561)
        {
            _1553 = _1491;
        }
        float _2901 = _1553;
        if (_561)
        {
            _1555 = _1493;
        }
        float _2903 = _1555;
        float _2905 = _2839 * 6.283185482025146484375;
        float _2907 = sin(_2905);
        float _2909 = _2903;
        if (_561)
        {
            _2871 = _1493;
        }
        float _2911 = _2871;
        float _2913 = _2911;
        if (!_561)
        {
            _2843 = _1487;
        }
        float _2915 = _2843;
        _2539 = _2915;
        if (!_561)
        {
            _1557 = _1487;
        }
        float _2917 = _1557;
        float _2919 = _2857 * 0.15915493667125701904296875;
        if (!_561)
        {
            _2909 = _1495;
        }
        float _2921 = _2909;
        float _2923 = _2769 * 6.283185482025146484375;
        float _2925 = sin(_2923);
        if (!_561)
        {
            _2889 = _1495;
        }
        float _2927 = _2889;
        float _2929 = _2867 * _2915;
        if (!_561)
        {
            _2913 = _1495;
        }
        float _2931 = _2913;
        float _2933 = _2887 * _2917;
        _2461 = _2931;
        if (!_561)
        {
            _1559 = _1495;
        }
        float _2935 = _1559;
        float _2937 = _2883 * 6.283184051513671875;
        _2495 = _2935;
        if (_561)
        {
            _2353 = _1497;
        }
        float _2939 = _2353;
        float _2941 = _2797 * 6.283185482025146484375;
        float _2943 = sin(_2941);
        float _2945 = _2907 * _2641;
        float _2947 = _2937 * 0.15915493667125701904296875;
        float _2949 = _2939;
        _2579 = _2945;
        if (_561)
        {
            _2891 = _1497;
        }
        float _2951 = _2891;
        float _2953 = _2951;
        if (_561)
        {
            _2893 = _1497;
        }
        float _2955 = _2893;
        float _2957 = _2955;
        if (!_561)
        {
            _2949 = _1499;
        }
        float _2959 = _2949;
        float _2961 = _2823 * 6.283185482025146484375;
        float _2963 = sin(_2961);
        float _2965 = fma(_2925, _2879, _2855);
        if (!_561)
        {
            _2953 = _1499;
        }
        float _2967 = _2953;
        if (!_561)
        {
            _2957 = _1499;
        }
        float _2969 = _2957;
        if (!_561)
        {
            _1561 = _1499;
        }
        float _2971 = _1561;
        float _2973 = _2803 * 6.283185482025146484375;
        float _2975 = sin(_2973);
        float _2977 = fma(_2943, _2861, _2929);
        float _2979 = _2773 * 6.283185482025146484375;
        float _2981 = sin(_2979);
        float _2983 = fma(_2963, _2901, _2933);
        float _2985 = _2805 * 6.283185482025146484375;
        float _2987 = sin(_2985);
        float _2989 = fma(_2975, _2899, _2945);
        float _2991 = _2851 * 6.283185482025146484375;
        float _2993 = sin(_2991);
        float _2995 = fma(_2981, _2921, _2965);
        float _2997 = _2919 * 6.283185482025146484375;
        float _2999 = sin(_2997);
        float _3001 = fma(_2987, _2931, _2977);
        float _3003 = _2779 * 6.283185482025146484375;
        float _3005 = sin(_3003);
        float _3007 = fma(_2993, _2935, _2983);
        float _3009 = _2811 * 6.283185482025146484375;
        float _3011 = sin(_3009);
        float _3013 = fma(_2999, _2927, _2989);
        float _3015 = _2875 * 6.283185482025146484375;
        float _3017 = sin(_3015);
        float _3019 = fma(_3005, _2959, _2995);
        float _3021 = _2947 * 6.283185482025146484375;
        float _3023 = sin(_3021);
        float _3025 = fma(_3011, _2969, _3001);
        float _3027 = fma(_3017, _2971, _3007);
        float _3029 = -_3025;
        float _3031 = _3029 + _3027;
        float _3033 = fma(_3023, _2967, _3013);
        float _3035 = -_3033;
        float _3037 = _3019 + _3035;
        float _3039 = _3037 + _3031;
        _2577 = _3039;
        _2581 = _2983;
        _2583 = _3033;
    }
    _2585 = false;
    float _3041 = _2575;
    float _3043 = _2577;
    float _3045 = _2539;
    float _3047 = _2461;
    float _3049 = _2495;
    float _3051 = _2579;
    float _3053 = _2581;
    float _3055 = _2583;
    float _3057 = _2463;
    float _3059 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[36]);
    bool _3061 = _3059 > 0.0;
    float _3063 = _3041;
    float _3065 = _3049;
    float _3067 = _3047;
    float _3069 = _3043;
    float _3071 = _3051;
    float _3073 = _3053;
    float _3075 = _3055;
    float _3077 = _3057;
    float _3079 = _3043;
    float _3081 = _3051;
    float _3083 = _3053;
    float _3085 = _3055;
    float _3087 = _3045;
    float _3089 = _3057;
    if (_3061)
    {
        float _3091 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _3063 = _3091;
    }
    float _3093 = _3063;
    float _3095 = fma(_247, _1501, _2337);
    float _3097 = fma(_249, _2329, _2339);
    float _3099 = fma(_251, _3043, _2341);
    bool _3101 = _3093 == 0.0;
    bool _3103 = _3093 == 0.0;
    bool _3105 = _3103 && _3061;
    float _3107 = _3093;
    float _3109 = _3093;
    if (_3105)
    {
        _1563 = 0.0;
    }
    float _3111 = _1563;
    float _3113 = _3111;
    float _3115 = _3111;
    if (_3105)
    {
        _3065 = 0.0;
    }
    float _3117 = _3065;
    float _3119 = _3117;
    float _3121 = _3117;
    if (_3105)
    {
        _3067 = 0.0;
    }
    float _3123 = _3067;
    bool _3125 = _3061 && _3101;
    float _3127 = _3123;
    if (!_3125)
    {
        float _3129 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[32]);
        bool _3131 = _3093 > 0.0;
        bool _3133 = _3131 && _3061;
        float _3135 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[28]);
        float _3137 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[29]);
        float _3139 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        float _3141 = trunc(_3129);
        int _3143 = int(_3141);
        bool _3145 = _3143 != 0;
        if (!_3145)
        {
            _3113 = 0.0;
        }
        float _3147 = _3113;
        float _3149 = _3147;
        float _3151 = _3147;
        if (!_3145)
        {
            _3069 = 0.0;
        }
        float _3153 = _3069;
        float _3155 = _3153;
        float _3157 = _3153;
        if (!_3145)
        {
            _3107 = 0.0;
        }
        float _3159 = _3107;
        bool _3161 = !_3145;
        float _3163 = _3159;
        float _3165 = _3159;
        float _3167 = _3135;
        float _3169 = _3137;
        float _3171 = _3139;
        if (!_3161)
        {
            int _3173 = as_type<int>(_257) & 2048;
            bool _3175 = _3173 != 0;
            if (!_3175)
            {
                _3149 = 0.0;
            }
            float _3177 = _3149;
            _3151 = _3177;
            if (!_3175)
            {
                _3155 = 0.0;
            }
            float _3179 = _3155;
            _3157 = _3179;
            if (!_3175)
            {
                _3163 = 0.0;
            }
            float _3181 = _3163;
            bool _3183 = !_3175;
            _3165 = _3181;
            if (!_3183)
            {
                float _3185 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _3187 = uint(int(uint(_163) >> uint(2)));
                float _3189 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3187)]);
                int _3191 = _163 + 4;
                uint _3193 = uint(int(uint(_3191) >> uint(2)));
                float _3195 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3193)]);
                int _3197 = _163 + 8;
                uint _3199 = uint(int(uint(_3197) >> uint(2)));
                float _3201 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3199)]);
                int _3203 = _163 + 12;
                uint _3205 = uint(int(uint(_3203) >> uint(2)));
                float _3207 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3205)]);
                uint _3209 = uint(int(uint(_163) >> uint(2)));
                float _3211 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3209)]);
                int _3213 = _163 + 4;
                uint _3215 = uint(int(uint(_3213) >> uint(2)));
                float _3217 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3215)]);
                int _3219 = _163 + 8;
                uint _3221 = uint(int(uint(_3219) >> uint(2)));
                float _3223 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3221)]);
                int _3225 = _163 + 12;
                uint _3227 = uint(int(uint(_3225) >> uint(2)));
                float _3229 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3227)]);
                uint _3231 = uint(int(uint(_163) >> uint(2)));
                float _3233 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3231)]);
                int _3235 = _163 + 4;
                uint _3237 = uint(int(uint(_3235) >> uint(2)));
                float _3239 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3237)]);
                int _3241 = _163 + 8;
                uint _3243 = uint(int(uint(_3241) >> uint(2)));
                float _3245 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3243)]);
                int _3247 = _163 + 12;
                uint _3249 = uint(int(uint(_3247) >> uint(2)));
                float _3251 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3249)]);
                float _3253 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3255 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3257 = _3201 * _3211;
                float _3259 = _3201 * _3217;
                float _3261 = -_3257;
                float _3263 = fma(_3189, _3223, _3261);
                float _3265 = _3207 * _3223;
                float _3267 = _3207 * _3217;
                float _3269 = _3207 * _3211;
                float _3271 = _3195 * _3211;
                float _3273 = -_3259;
                float _3275 = fma(_3195, _3223, _3273);
                float _3277 = _3239 * _3263;
                float _3279 = -_3271;
                float _3281 = fma(_3189, _3217, _3279);
                float _3283 = -_3277;
                float _3285 = fma(_3233, _3275, _3283);
                float _3287 = fma(_3245, _3281, _3285);
                float _3289 = _3239 * _3223;
                float _3291 = 1.0 / _3287;
                float _3293 = -_3267;
                float _3295 = fma(_3195, _3229, _3293);
                float _3297 = -_3269;
                float _3299 = fma(_3189, _3229, _3297);
                float _3301 = -_3289;
                float _3303 = fma(_3245, _3217, _3301);
                float _3305 = _3233 * _3217;
                float _3307 = _3245 * _3195;
                float _3309 = -_3265;
                float _3311 = fma(_3201, _3229, _3309);
                float _3313 = _3233 * _3201;
                float _3315 = _3245 * _3211;
                float _3317 = _3245 * _3299;
                float _3319 = -_3307;
                float _3321 = fma(_3239, _3201, _3319);
                float _3323 = -_3189;
                float _3325 = fma(_3323, _3223, _3257);
                float _3327 = -_3313;
                float _3329 = fma(_3245, _3189, _3327);
                float _3331 = _3239 * _3189;
                float _3333 = -_3315;
                float _3335 = fma(_3233, _3223, _3333);
                float _3337 = -_3317;
                float _3339 = fma(_3233, _3311, _3337);
                float _3341 = -_3305;
                float _3343 = fma(_3239, _3211, _3341);
                float _3345 = _3245 * _3295;
                float _3347 = _3335 * _3291;
                float _3349 = fma(_3251, _3263, _3339);
                float _3351 = _3303 * _3291;
                float _3353 = _3343 * _3291;
                float _3355 = -_3331;
                float _3357 = fma(_3233, _3195, _3355);
                float _3359 = -_3345;
                float _3361 = fma(_3239, _3311, _3359);
                float _3363 = _3325 * _3291;
                float _3365 = _3185 * _3347;
                float _3367 = _3239 * _3299;
                float _3369 = _3253 * _3291;
                float _3371 = _3185 * _3351;
                float _3373 = _3185 * _3353;
                float _3375 = fma(_3253, _3363, _3365);
                float _3377 = fma(_3251, _3275, _3361);
                float _3379 = -_3367;
                float _3381 = fma(_3233, _3295, _3379);
                float _3383 = fma(_3275, _3369, _3371);
                float _3385 = fma(_3281, _3369, _3373);
                float _3387 = _3321 * _3291;
                float _3389 = _3329 * _3291;
                float _3391 = _3357 * _3291;
                float _3393 = fma(_3251, _3281, _3381);
                float _3395 = fma(_3255, _3387, _3383);
                float _3397 = fma(_3255, _3389, _3375);
                float _3399 = fma(_3255, _3391, _3385);
                float _3401 = -_3377;
                float _3403 = fma(_3401, _3291, _3395);
                float _3405 = fma(_3349, _3291, _3397);
                float _3407 = -_3393;
                float _3409 = fma(_3407, _3291, _3399);
                _2355 = _3389;
                _3119 = _3391;
                _3071 = _3321;
                _3073 = _3369;
                _3075 = _3335;
                _3151 = _3403;
                _3157 = _3405;
                _3165 = _3409;
                _3077 = _3311;
            }
        }
        float _3411 = _2355;
        float _3413 = _3119;
        float _3415 = _3071;
        float _3417 = _3073;
        float _3419 = _3075;
        float _3421 = _3151;
        float _3423 = _3157;
        float _3425 = _3165;
        float _3427 = _3077;
        bool _3429 = !_3133;
        float _3431 = _3411;
        float _3433 = _3413;
        float _3435 = _3415;
        float _3437 = _3417;
        float _3439 = _3419;
        float _3441 = _3427;
        float _3443 = _3421;
        float _3445 = _3425;
        float _3447 = _3423;
        if (!_3429)
        {
            float _3449 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _3451 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _3453 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            bool _3455 = !_461;
            _3167 = _3449;
            _3169 = _3451;
            _3171 = _3453;
            if (!_3455)
            {
                float _3457 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _3459 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _3461 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _3463 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3465 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _3467 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _3469 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _3471 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _3473 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _3475 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _3477 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _3479 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _3481 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _3483 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _3485 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _3487 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3489 = _3463 * _3469;
                float _3491 = _3463 * _3467;
                float _3493 = _3463 * _3465;
                float _3495 = _3479 * _3469;
                float _3497 = _3479 * _3467;
                float _3499 = _3479 * _3465;
                float _3501 = _3479 * _3461;
                float _3503 = -_3489;
                float _3505 = fma(_3461, _3471, _3503);
                float _3507 = -_3491;
                float _3509 = fma(_3459, _3471, _3507);
                float _3511 = -_3493;
                float _3513 = fma(_3457, _3471, _3511);
                float _3515 = -_3495;
                float _3517 = fma(_3477, _3471, _3515);
                float _3519 = -_3497;
                float _3521 = fma(_3475, _3471, _3519);
                float _3523 = -_3499;
                float _3525 = fma(_3473, _3471, _3523);
                float _3527 = -_3501;
                float _3529 = fma(_3477, _3463, _3527);
                float _3531 = _3461 * _3467;
                float _3533 = _3461 * _3465;
                float _3535 = _3477 * _3467;
                float _3537 = _3477 * _3465;
                float _3539 = _3479 * _3459;
                float _3541 = _3479 * _3457;
                float _3543 = -_3531;
                float _3545 = fma(_3459, _3469, _3543);
                float _3547 = -_3533;
                float _3549 = fma(_3457, _3469, _3547);
                float _3551 = -_3535;
                float _3553 = fma(_3475, _3469, _3551);
                float _3555 = -_3537;
                float _3557 = fma(_3473, _3469, _3555);
                float _3559 = _3477 * _3459;
                float _3561 = -_3539;
                float _3563 = fma(_3475, _3463, _3561);
                float _3565 = -_3541;
                float _3567 = fma(_3473, _3463, _3565);
                float _3569 = _3459 * _3465;
                float _3571 = _3475 * _3465;
                float _3573 = -_3559;
                float _3575 = fma(_3475, _3461, _3573);
                float _3577 = _3477 * _3513;
                float _3579 = _3477 * _3457;
                float _3581 = -_3571;
                float _3583 = fma(_3473, _3467, _3581);
                float _3585 = _3477 * _3509;
                float _3587 = -_3577;
                float _3589 = fma(_3473, _3505, _3587);
                float _3591 = -_3569;
                float _3593 = fma(_3457, _3467, _3591);
                float _3595 = _3475 * _3457;
                float _3597 = _3475 * _3513;
                float _3599 = -_3585;
                float _3601 = fma(_3475, _3505, _3599);
                float _3603 = fma(_3479, _3549, _3589);
                float _3605 = -_3579;
                float _3607 = fma(_3473, _3461, _3605);
                float _3609 = -_3595;
                float _3611 = fma(_3473, _3459, _3609);
                float _3613 = _3475 * _3549;
                float _3615 = -_3597;
                float _3617 = fma(_3473, _3509, _3615);
                float _3619 = fma(_3479, _3545, _3601);
                float _3621 = _3483 * _3603;
                float _3623 = -_3613;
                float _3625 = fma(_3473, _3545, _3623);
                float _3627 = _3485 * _3509;
                float _3629 = fma(_3479, _3593, _3617);
                float _3631 = -_3621;
                float _3633 = fma(_3481, _3619, _3631);
                float _3635 = fma(_3477, _3593, _3625);
                float _3637 = -_3627;
                float _3639 = fma(_3483, _3505, _3637);
                float _3641 = _3485 * _3513;
                float _3643 = fma(_3485, _3629, _3633);
                float _3645 = _3483 * _3513;
                float _3647 = _3485 * _3563;
                float _3649 = -_3641;
                float _3651 = fma(_3481, _3505, _3649);
                float _3653 = -_3487;
                float _3655 = fma(_3653, _3635, _3643);
                float _3657 = _3485 * _3525;
                float _3659 = -_3645;
                float _3661 = fma(_3481, _3509, _3659);
                float _3663 = fma(_3487, _3545, _3639);
                float _3665 = 1.0 / _3655;
                float _3667 = -_3657;
                float _3669 = fma(_3481, _3517, _3667);
                float _3671 = _3485 * _3567;
                float _3673 = _3485 * _3521;
                float _3675 = -_3647;
                float _3677 = fma(_3483, _3529, _3675);
                float _3679 = _3483 * _3525;
                float _3681 = _3483 * _3567;
                float _3683 = -_3671;
                float _3685 = fma(_3481, _3529, _3683);
                float _3687 = fma(_3487, _3593, _3661);
                float _3689 = fma(_3487, _3549, _3651);
                float _3691 = -_3673;
                float _3693 = fma(_3483, _3517, _3691);
                float _3695 = -_3679;
                float _3697 = fma(_3481, _3521, _3695);
                float _3699 = -_3681;
                float _3701 = fma(_3481, _3563, _3699);
                float _3703 = fma(_3487, _3557, _3669);
                float _3705 = fma(_3487, _3553, _3693);
                float _3707 = fma(_3487, _3583, _3697);
                float _3709 = _3603 * _3665;
                float _3711 = _3663 * _3665;
                float _3713 = _3687 * _3665;
                float _3715 = _3619 * _3665;
                float _3717 = _3449 * _3709;
                float _3719 = _3689 * _3665;
                float _3721 = _3451 * _3711;
                float _3723 = _3629 * _3665;
                float _3725 = _3451 * _3713;
                float _3727 = -_3717;
                float _3729 = fma(_3451, _3719, _3727);
                float _3731 = -_3721;
                float _3733 = fma(_3449, _3715, _3731);
                float _3735 = _3705 * _3665;
                float _3737 = _3703 * _3665;
                float _3739 = -_3725;
                float _3741 = fma(_3449, _3723, _3739);
                float _3743 = _3707 * _3665;
                float _3745 = fma(_3487, _3575, _3677);
                float _3747 = fma(_3453, _3735, _3733);
                float _3749 = -_3737;
                float _3751 = fma(_3453, _3749, _3729);
                float _3753 = fma(_3487, _3607, _3685);
                float _3755 = fma(_3487, _3611, _3701);
                float _3757 = fma(_3453, _3743, _3741);
                float _3759 = -_3745;
                float _3761 = fma(_3759, _3665, _3747);
                float _3763 = fma(_3753, _3665, _3751);
                float _3765 = -_3755;
                float _3767 = fma(_3765, _3665, _3757);
                _3431 = _3711;
                _3167 = _3761;
                _3169 = _3763;
                _3171 = _3767;
                _3433 = _3717;
                _3435 = _3733;
                _3437 = _3707;
                _3439 = _3487;
                _3441 = _3509;
                _3769 = true;
            }
            else
            {
                int _3771 = as_type<int>(_257) & 1024;
                bool _3773 = _3771 != 0;
                bool _3775 = !_3773;
                if (!_3775)
                {
                    float _3777 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _3779 = uint(int(uint(_163) >> uint(2)));
                    float _3781 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3779)]);
                    int _3783 = _163 + 4;
                    uint _3785 = uint(int(uint(_3783) >> uint(2)));
                    float _3787 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3785)]);
                    int _3789 = _163 + 8;
                    uint _3791 = uint(int(uint(_3789) >> uint(2)));
                    float _3793 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3791)]);
                    uint _3795 = uint(int(uint(_163) >> uint(2)));
                    float _3797 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3795)]);
                    int _3799 = _163 + 4;
                    uint _3801 = uint(int(uint(_3799) >> uint(2)));
                    float _3803 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3801)]);
                    int _3805 = _163 + 8;
                    uint _3807 = uint(int(uint(_3805) >> uint(2)));
                    float _3809 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3807)]);
                    uint _3811 = uint(int(uint(_163) >> uint(2)));
                    float _3813 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3811)]);
                    int _3815 = _163 + 4;
                    uint _3817 = uint(int(uint(_3815) >> uint(2)));
                    float _3819 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3817)]);
                    int _3821 = _163 + 8;
                    uint _3823 = uint(int(uint(_3821) >> uint(2)));
                    float _3825 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3823)]);
                    float _3827 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _3829 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _3831 = _3793 * _3797;
                    float _3833 = _3793 * _3803;
                    float _3835 = -_3831;
                    float _3837 = fma(_3781, _3809, _3835);
                    float _3839 = _3787 * _3797;
                    float _3841 = -_3833;
                    float _3843 = fma(_3787, _3809, _3841);
                    float _3845 = _3819 * _3837;
                    float _3847 = -_3839;
                    float _3849 = fma(_3781, _3803, _3847);
                    float _3851 = -_3845;
                    float _3853 = fma(_3813, _3843, _3851);
                    float _3855 = _3777 * _3809;
                    float _3857 = _3777 * _3803;
                    float _3859 = _3777 * _3797;
                    float _3861 = fma(_3825, _3849, _3853);
                    float _3863 = 1.0 / _3861;
                    float _3865 = _3825 * _3797;
                    float _3867 = _3819 * _3809;
                    float _3869 = -_3857;
                    float _3871 = fma(_3827, _3787, _3869);
                    float _3873 = -_3781;
                    float _3875 = fma(_3873, _3809, _3831);
                    float _3877 = _3813 * _3803;
                    float _3879 = -_3855;
                    float _3881 = fma(_3827, _3793, _3879);
                    float _3883 = -_3859;
                    float _3885 = fma(_3827, _3781, _3883);
                    float _3887 = _3813 * _3793;
                    float _3889 = -_3865;
                    float _3891 = fma(_3813, _3809, _3889);
                    float _3893 = -_3867;
                    float _3895 = fma(_3825, _3803, _3893);
                    float _3897 = _3819 * _3781;
                    float _3899 = -_3877;
                    float _3901 = fma(_3819, _3797, _3899);
                    float _3903 = -_3887;
                    float _3905 = fma(_3825, _3781, _3903);
                    float _3907 = _3825 * _3787;
                    float _3909 = _3825 * _3871;
                    float _3911 = _3895 * _3863;
                    float _3913 = _3891 * _3863;
                    float _3915 = -_3897;
                    float _3917 = fma(_3813, _3787, _3915);
                    float _3919 = _3901 * _3863;
                    float _3921 = _3825 * _3885;
                    float _3923 = -_3907;
                    float _3925 = fma(_3819, _3793, _3923);
                    float _3927 = _3819 * _3885;
                    float _3929 = -_3909;
                    float _3931 = fma(_3819, _3881, _3929);
                    float _3933 = _3911 * _3451;
                    float _3935 = _3913 * _3451;
                    float _3937 = _3919 * _3451;
                    float _3939 = _3875 * _3863;
                    float _3941 = _3843 * _3863;
                    float _3943 = _3849 * _3863;
                    float _3945 = -_3921;
                    float _3947 = fma(_3813, _3881, _3945);
                    float _3949 = fma(_3939, _3449, _3935);
                    float _3951 = fma(_3449, _3941, _3933);
                    float _3953 = fma(_3449, _3943, _3937);
                    float _3955 = _3905 * _3863;
                    float _3957 = _3925 * _3863;
                    float _3959 = _3917 * _3863;
                    float _3961 = -_3927;
                    float _3963 = fma(_3813, _3871, _3961);
                    float _3965 = fma(_3955, _3453, _3949);
                    float _3967 = fma(_3957, _3453, _3951);
                    float _3969 = fma(_3829, _3837, _3947);
                    float _3971 = fma(_3959, _3453, _3953);
                    float _3973 = fma(_3829, _3843, _3931);
                    float _3975 = fma(_3829, _3849, _3963);
                    float _3977 = fma(_3969, _3863, _3965);
                    float _3979 = -_3973;
                    float _3981 = fma(_3979, _3863, _3967);
                    float _3983 = -_3975;
                    float _3985 = fma(_3983, _3863, _3971);
                    _3431 = _3941;
                    _3167 = _3981;
                    _3169 = _3977;
                    _3171 = _3985;
                    _3433 = _3973;
                    _3435 = _3969;
                    _3437 = _3943;
                    _3439 = _3975;
                    _3441 = _3897;
                    _3769 = true;
                }
                else
                {
                    int _3987 = as_type<int>(_257) & 2048;
                    bool _3989 = _3987 != 0;
                    bool _3991 = !_3989;
                    if (!_3991)
                    {
                        uint _3993 = uint(int(uint(_163) >> uint(2)));
                        float _3995 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3993)]);
                        int _3997 = _163 + 4;
                        uint _3999 = uint(int(uint(_3997) >> uint(2)));
                        float _4001 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3999)]);
                        int _4003 = _163 + 8;
                        uint _4005 = uint(int(uint(_4003) >> uint(2)));
                        float _4007 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4005)]);
                        int _4009 = _163 + 12;
                        uint _4011 = uint(int(uint(_4009) >> uint(2)));
                        float _4013 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4011)]);
                        uint _4015 = uint(int(uint(_163) >> uint(2)));
                        float _4017 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4015)]);
                        int _4019 = _163 + 4;
                        uint _4021 = uint(int(uint(_4019) >> uint(2)));
                        float _4023 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4021)]);
                        int _4025 = _163 + 8;
                        uint _4027 = uint(int(uint(_4025) >> uint(2)));
                        float _4029 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4027)]);
                        int _4031 = _163 + 12;
                        uint _4033 = uint(int(uint(_4031) >> uint(2)));
                        float _4035 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4033)]);
                        uint _4037 = uint(int(uint(_163) >> uint(2)));
                        float _4039 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4037)]);
                        int _4041 = _163 + 4;
                        uint _4043 = uint(int(uint(_4041) >> uint(2)));
                        float _4045 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4043)]);
                        int _4047 = _163 + 8;
                        uint _4049 = uint(int(uint(_4047) >> uint(2)));
                        float _4051 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4049)]);
                        int _4053 = _163 + 12;
                        uint _4055 = uint(int(uint(_4053) >> uint(2)));
                        float _4057 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4055)]);
                        float _4059 = _4007 * _4017;
                        float _4061 = _4007 * _4023;
                        float _4063 = _4001 * _4017;
                        float _4065 = _4013 * _4023;
                        float _4067 = -_4059;
                        float _4069 = fma(_3995, _4029, _4067);
                        float _4071 = -_4061;
                        float _4073 = fma(_4001, _4029, _4071);
                        float _4075 = -_4063;
                        float _4077 = fma(_3995, _4023, _4075);
                        float _4079 = _4045 * _4029;
                        float _4081 = _4045 * _4069;
                        float _4083 = _4039 * _4023;
                        float _4085 = _4013 * _4029;
                        float _4087 = -_4079;
                        float _4089 = fma(_4051, _4023, _4087);
                        float _4091 = -_4081;
                        float _4093 = fma(_4039, _4073, _4091);
                        float _4095 = _4051 * _4017;
                        float _4097 = _4013 * _4017;
                        float _4099 = -_4065;
                        float _4101 = fma(_4001, _4035, _4099);
                        float _4103 = fma(_4051, _4077, _4093);
                        float _4105 = -_3995;
                        float _4107 = fma(_4105, _4029, _4059);
                        float _4109 = -_4095;
                        float _4111 = fma(_4039, _4029, _4109);
                        float _4113 = -_4083;
                        float _4115 = fma(_4045, _4017, _4113);
                        float _4117 = -_4085;
                        float _4119 = fma(_4007, _4035, _4117);
                        float _4121 = -_4097;
                        float _4123 = fma(_3995, _4035, _4121);
                        float _4125 = 1.0 / _4103;
                        float _4127 = _4039 * _4007;
                        float _4129 = _4051 * _4001;
                        float _4131 = _4045 * _3995;
                        float _4133 = _4045 * _4123;
                        float _4135 = -_4127;
                        float _4137 = fma(_4051, _3995, _4135);
                        float _4139 = -_4129;
                        float _4141 = fma(_4045, _4007, _4139);
                        float _4143 = _4051 * _4101;
                        float _4145 = -_4131;
                        float _4147 = fma(_4039, _4001, _4145);
                        float _4149 = _4051 * _4123;
                        float _4151 = -_4133;
                        float _4153 = fma(_4039, _4101, _4151);
                        float _4155 = -_4143;
                        float _4157 = fma(_4045, _4119, _4155);
                        float _4159 = -_4149;
                        float _4161 = fma(_4039, _4119, _4159);
                        float _4163 = fma(_4057, _4077, _4153);
                        float _4165 = fma(_4057, _4073, _4157);
                        float _4167 = _4089 * _4125;
                        float _4169 = _4111 * _4125;
                        float _4171 = _4115 * _4125;
                        float _4173 = _4107 * _4125;
                        float _4175 = _4167 * _3451;
                        float _4177 = _4169 * _3451;
                        float _4179 = _4171 * _3451;
                        float _4181 = _4073 * _4125;
                        float _4183 = _4077 * _4125;
                        float _4185 = fma(_4173, _3449, _4177);
                        float _4187 = _4137 * _4125;
                        float _4189 = fma(_3449, _4181, _4175);
                        float _4191 = fma(_3449, _4183, _4179);
                        float _4193 = _4141 * _4125;
                        float _4195 = _4147 * _4125;
                        float _4197 = fma(_4187, _3453, _4185);
                        float _4199 = fma(_4057, _4069, _4161);
                        float _4201 = fma(_4193, _3453, _4189);
                        float _4203 = fma(_4195, _3453, _4191);
                        float _4205 = fma(_4199, _4125, _4197);
                        float _4207 = -_4165;
                        float _4209 = fma(_4207, _4125, _4201);
                        float _4211 = -_4163;
                        float _4213 = fma(_4211, _4125, _4203);
                        _3431 = _4141;
                        _3167 = _4209;
                        _3169 = _4205;
                        _3171 = _4213;
                        _3433 = _4189;
                        _3435 = _4045;
                        _3437 = _4199;
                        _3439 = _4057;
                        _3441 = _4119;
                    }
                }
            }
        }
        _3769 = false;
        float _4215 = _3431;
        float _4217 = _3167;
        float _4219 = _3169;
        float _4221 = _3171;
        float _4223 = _3433;
        float _4225 = _3435;
        float _4227 = _3437;
        float _4229 = _3439;
        float _4231 = _3441;
        float _4233 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[33]);
        float _4235 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[34]);
        float _4237 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[35]);
        bool _4239 = _4233 != 0.0;
        bool _4241 = isnan(_4233);
        bool _4243 = _4239 || _4241;
        bool _4245 = isnan(0.0);
        bool _4247 = _4243 || _4245;
        bool _4249 = _4235 != 0.0;
        bool _4251 = isnan(_4235);
        bool _4253 = _4249 || _4251;
        bool _4255 = isnan(0.0);
        bool _4257 = _4253 || _4255;
        bool _4259 = _4237 != 0.0;
        bool _4261 = isnan(_4237);
        bool _4263 = _4259 || _4261;
        bool _4265 = isnan(0.0);
        bool _4267 = _4263 || _4265;
        float _4269 = _4235;
        float _4271 = _4217;
        float _4273 = _4223;
        float _4275 = _4221;
        float _4277 = _4219;
        _3081 = _4225;
        _3083 = _4227;
        _3085 = _4229;
        _3089 = _4231;
        if (_4247)
        {
            float _4279 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _4269 = _4279;
        }
        float _4281 = _4269;
        float _4283 = _4233;
        if (_4257)
        {
            float _4285 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _4283 = _4285;
        }
        float _4287 = _4283;
        float _4289 = _4215;
        if (_4267)
        {
            float _4291 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _4289 = _4291;
        }
        float _4293 = _4289;
        if (_4247)
        {
            float _4295 = _3421 + _4217;
            _3443 = _4295;
        }
        float _4297 = _3443;
        float _4299 = _4297;
        if (_4257)
        {
            float _4301 = _3423 + _4219;
            _4271 = _4301;
        }
        float _4303 = _4271;
        float _4305 = _4303;
        if (_4267)
        {
            float _4307 = _3425 + _4221;
            _3445 = _4307;
        }
        float _4309 = _3445;
        _3109 = _4309;
        if (!_4257)
        {
            _4273 = 0.0;
        }
        float _4311 = _4273;
        float _4313 = _4311;
        if (_4247)
        {
            float _4315 = -_3095;
            float _4317 = _4315 + _4297;
            _4299 = _4317;
        }
        float _4319 = _4299;
        float _4321 = _4319;
        if (_4257)
        {
            float _4323 = -_3097;
            float _4325 = _4323 + _4303;
            _4305 = _4325;
        }
        float _4327 = _4305;
        float _4329 = _4327;
        if (_4267)
        {
            float _4331 = -_3099;
            float _4333 = _4331 + _4309;
            _4275 = _4333;
        }
        float _4335 = _4275;
        float _4337 = _4335;
        if (_4247)
        {
            float _4339 = -_543;
            float _4341 = _4339 + _4319;
            _4321 = _4341;
        }
        float _4343 = _4321;
        float _4345 = _4343;
        if (_4257)
        {
            float _4347 = -_547;
            float _4349 = _4347 + _4327;
            _4329 = _4349;
        }
        float _4351 = _4329;
        float _4353 = _4351;
        if (_4247)
        {
            float _4355 = _4343 * _4281;
            _3447 = _4355;
        }
        float _4357 = _3447;
        float _4359 = _4357;
        if (!_4247)
        {
            _4345 = 0.0;
        }
        float _4361 = _4345;
        float _4363 = _4361;
        if (_4257)
        {
            float _4365 = _4351 * _4287;
            _4277 = _4365;
        }
        float _4367 = _4277;
        _3087 = _4367;
        if (_4247)
        {
            float _4369 = _261 * _4357;
            _4353 = _4369;
        }
        float _4371 = _4353;
        if (_4267)
        {
            float _4373 = -_549;
            float _4375 = _4373 + _4335;
            _4359 = _4375;
        }
        float _4377 = _4359;
        float _4379 = _4377;
        if (_4257)
        {
            float _4381 = _261 * _4367;
            _4337 = _4381;
        }
        float _4383 = _4337;
        float _4385 = _4383;
        if (_4247)
        {
            float _4387 = _189 * _4371;
            _4363 = _4387;
        }
        float _4389 = _4363;
        _3115 = _4389;
        if (_4267)
        {
            float _4391 = _4377 * _4293;
            _4379 = _4391;
        }
        float _4393 = _4379;
        _3079 = _4393;
        if (_4257)
        {
            float _4395 = _189 * _4383;
            _4313 = _4395;
        }
        float _4397 = _4313;
        _3121 = _4397;
        if (!_4267)
        {
            _4385 = 0.0;
        }
        float _4399 = _4385;
        _3127 = _4399;
        if (_4267)
        {
            float _4401 = _261 * _4393;
            _343 = _4401;
        }
        float _4403 = _343;
        _345 = _4403;
        if (_4267)
        {
            float _4405 = _189 * _4403;
            _3127 = _4405;
        }
    }
    float _4407 = _3115;
    float _4409 = _3121;
    float _4411 = _3127;
    float _4413 = _3079;
    float _4415 = _345;
    float _4417 = _3109;
    float _4419 = _3081;
    float _4421 = _3083;
    float _4423 = _3085;
    float _4425 = _3087;
    float _4427 = _3089;
    float _4429 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    float _4431 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    float _4433 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _4435 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[87]);
    float _4437 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _4439 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _4441 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _4443 = uint(int(uint(_193) >> uint(2)));
    float _4445 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_4443)]);
    float _4447 = _543 + _4407;
    float _4449 = _547 + _4409;
    float _4451 = _549 + _4411;
    bool _4453 = _4433 > 0.0;
    bool _4455 = _4431 > 0.0;
    float _4457 = _4429 * _4431;
    float _4459 = _189 * _4439;
    float _4461 = _4433;
    float _4463 = _4429;
    float _4465 = _4413;
    bool _4467 = _4455;
    float _4469 = _4425;
    float _4471 = _4415;
    float _4473 = _4417;
    float _4475 = _4457;
    float _4477 = _4435;
    float _4479 = _4409;
    float _4481 = _4419;
    float _4483 = _4421;
    float _4485 = _4423;
    float _4487 = _4427;
    if (_4453)
    {
        float _4489 = 1.0 / _4433;
        _4461 = _4489;
    }
    float _4491 = _4461;
    if (_4455)
    {
        float _4493 = -_4457;
        float _4495 = fma(_169, _4493, _4429);
        _4463 = _4495;
    }
    float _4497 = _4463;
    float _4499 = _4497;
    float _4501 = _4491;
    if (_4453)
    {
        float _4503 = _431 * _4491;
        _4465 = _4503;
    }
    float _4505 = _4465;
    float _4507 = _4505;
    if (_4453)
    {
        float _4509 = precise::min(_4505, 1.0);
        _4507 = _4509;
    }
    float _4511 = _4507;
    if (_4453)
    {
        float _4513 = _4511 * _4497;
        _4499 = _4513;
    }
    float _4515 = _4499;
    float _4517 = _189 * _4437;
    float _4519 = _189 * _4441;
    float _4521 = _4459 * _4515;
    float _4523 = _4517 * _4515;
    float _4525 = _4519 * _4515;
    bool _4527 = !_461;
    float _4529 = _4517;
    float _4531 = _4519;
    float _4533 = _4515;
    float _4657;
    float _4659;
    float _4661;
    if (!_4527)
    {
        float _4535 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4537 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4539 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4541 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4543 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4545 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4547 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4549 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4551 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4553 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _4555 = _4539 * _4541;
        float _4557 = _4539 * _4543;
        float _4559 = _4537 * _4541;
        float _4561 = -_4555;
        float _4563 = fma(_4535, _4545, _4561);
        float _4565 = -_4557;
        float _4567 = fma(_4537, _4545, _4565);
        float _4569 = -_4559;
        float _4571 = fma(_4535, _4543, _4569);
        float _4573 = _4549 * _4535;
        float _4575 = _4549 * _4563;
        float _4577 = _4547 * _4543;
        float _4579 = _4551 * _4541;
        float _4581 = -_4573;
        float _4583 = fma(_4547, _4537, _4581);
        float _4585 = -_4575;
        float _4587 = fma(_4547, _4567, _4585);
        float _4589 = _4549 * _4545;
        float _4591 = _4551 * _4537;
        float _4593 = _4547 * _4539;
        float _4595 = fma(_4551, _4571, _4587);
        float _4597 = -_4589;
        float _4599 = fma(_4551, _4543, _4597);
        float _4601 = -_4579;
        float _4603 = fma(_4547, _4545, _4601);
        float _4605 = -_4577;
        float _4607 = fma(_4549, _4541, _4605);
        float _4609 = -_4593;
        float _4611 = fma(_4551, _4535, _4609);
        float _4613 = -_4535;
        float _4615 = fma(_4613, _4545, _4555);
        float _4617 = 1.0 / _4595;
        float _4619 = -_4591;
        float _4621 = fma(_4549, _4539, _4619);
        float _4623 = _4599 * _4617;
        float _4625 = _4603 * _4617;
        float _4627 = _4607 * _4617;
        float _4629 = _4523 * _4617;
        float _4631 = _4521 * _4623;
        float _4633 = _4521 * _4625;
        float _4635 = _4521 * _4627;
        float _4637 = _4615 * _4617;
        float _4639 = _4621 * _4617;
        float _4641 = _4611 * _4617;
        float _4643 = _4583 * _4617;
        float _4645 = fma(_4567, _4629, _4631);
        float _4647 = fma(_4523, _4637, _4633);
        float _4649 = fma(_4571, _4629, _4635);
        float _4651 = fma(_4525, _4639, _4645);
        float _4653 = fma(_4525, _4641, _4647);
        float _4655 = fma(_4525, _4643, _4649);
        _349 = _4541;
        _4531 = _4543;
        _4471 = _4545;
        _4473 = _4571;
        _4533 = _4647;
        _4475 = _4641;
        _4501 = _4629;
        _4477 = _4555;
        _4479 = _4547;
        _4481 = _4549;
        _4483 = _4551;
        _4485 = _4553;
        _4657 = _4653;
        _4659 = _4651;
        _4661 = _4655;
        _571 = _4635;
        _4663 = true;
    }
    else
    {
        int _4665 = as_type<int>(_257) & 1024;
        bool _4667 = _4665 != 0;
        if (_4667)
        {
            _4467 = true;
        }
        bool _4669 = _4467;
        bool _4671 = _4669;
        if (!_4667)
        {
            int _4673 = as_type<int>(_257) & 2048;
            bool _4675 = _4673 != 0;
            _4671 = _4675;
        }
        bool _4677 = _4671;
        if (!_4677)
        {
            _4469 = _4523;
        }
        float _4679 = _4469;
        _4659 = _4679;
        if (!_4677)
        {
            _347 = _4521;
        }
        float _4681 = _347;
        _4657 = _4681;
        if (!_4677)
        {
            _4529 = _4525;
        }
        float _4683 = _4529;
        bool _4685 = !_4677;
        _4661 = _4683;
        if (!_4685)
        {
            uint _4687 = uint(int(uint(_163) >> uint(2)));
            float _4689 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4687)]);
            int _4691 = _163 + 4;
            uint _4693 = uint(int(uint(_4691) >> uint(2)));
            float _4695 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4693)]);
            int _4697 = _163 + 8;
            uint _4699 = uint(int(uint(_4697) >> uint(2)));
            float _4701 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4699)]);
            uint _4703 = uint(int(uint(_163) >> uint(2)));
            float _4705 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4703)]);
            int _4707 = _163 + 4;
            uint _4709 = uint(int(uint(_4707) >> uint(2)));
            float _4711 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4709)]);
            int _4713 = _163 + 8;
            uint _4715 = uint(int(uint(_4713) >> uint(2)));
            float _4717 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4715)]);
            uint _4719 = uint(int(uint(_163) >> uint(2)));
            float _4721 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4719)]);
            int _4723 = _163 + 4;
            uint _4725 = uint(int(uint(_4723) >> uint(2)));
            float _4727 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4725)]);
            int _4729 = _163 + 8;
            uint _4731 = uint(int(uint(_4729) >> uint(2)));
            float _4733 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4731)]);
            float _4735 = _4701 * _4705;
            float _4737 = _4701 * _4711;
            float _4739 = _4695 * _4705;
            float _4741 = -_4735;
            float _4743 = fma(_4689, _4717, _4741);
            float _4745 = -_4737;
            float _4747 = fma(_4695, _4717, _4745);
            float _4749 = -_4739;
            float _4751 = fma(_4689, _4711, _4749);
            float _4753 = _4727 * _4689;
            float _4755 = _4727 * _4743;
            float _4757 = _4733 * _4695;
            float _4759 = _4721 * _4711;
            float _4761 = -_4753;
            float _4763 = fma(_4721, _4695, _4761);
            float _4765 = -_4755;
            float _4767 = fma(_4721, _4747, _4765);
            float _4769 = _4727 * _4717;
            float _4771 = _4733 * _4705;
            float _4773 = -_4757;
            float _4775 = fma(_4727, _4701, _4773);
            float _4777 = fma(_4733, _4751, _4767);
            float _4779 = -_4769;
            float _4781 = fma(_4733, _4711, _4779);
            float _4783 = _4721 * _4701;
            float _4785 = -_4759;
            float _4787 = fma(_4727, _4705, _4785);
            float _4789 = 1.0 / _4777;
            float _4791 = -_4771;
            float _4793 = fma(_4721, _4717, _4791);
            float _4795 = -_4783;
            float _4797 = fma(_4733, _4689, _4795);
            float _4799 = -_4689;
            float _4801 = fma(_4799, _4717, _4735);
            float _4803 = _4781 * _4789;
            float _4805 = _4787 * _4789;
            float _4807 = _4793 * _4789;
            float _4809 = _4797 * _4789;
            float _4811 = _4803 * _4521;
            float _4813 = _4805 * _4521;
            float _4815 = _4523 * _4789;
            float _4817 = _4807 * _4521;
            float _4819 = _4801 * _4789;
            float _4821 = _4775 * _4789;
            float _4823 = fma(_4747, _4815, _4811);
            float _4825 = _4763 * _4789;
            float _4827 = fma(_4819, _4523, _4817);
            float _4829 = fma(_4751, _4815, _4813);
            float _4831 = fma(_4821, _4525, _4823);
            float _4833 = fma(_4809, _4525, _4827);
            float _4835 = fma(_4825, _4525, _4829);
            _349 = _4705;
            _4531 = _4819;
            _4471 = _4717;
            _4473 = _4809;
            _4533 = _4801;
            _4475 = _4821;
            _4501 = _4701;
            _4477 = _4789;
            _4479 = _4793;
            _4481 = _4727;
            _4483 = _4797;
            _4485 = _4783;
            _4657 = _4833;
            _4659 = _4831;
            _4661 = _4835;
            _571 = _4827;
        }
    }
    _4663 = false;
    float _4837 = _349;
    float _4839 = _4531;
    float _4841 = _4471;
    float _4843 = _4473;
    float _4845 = _4533;
    float _4847 = _4475;
    float _4849 = _4501;
    float _4851 = _4477;
    float _4853 = _4479;
    float _4855 = _4481;
    float _4857 = _4483;
    float _4859 = _4485;
    float _4861 = _4657;
    float _4863 = _4659;
    float _4865 = _4661;
    float _4867 = _571;
    uint _4869 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4869)] = as_type<uint>(_4445);
    float _4871 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    int _4873 = as_type<int>(_4871) & 512;
    bool _4875 = _4873 != 0;
    int _4877 = as_type<int>(_4871) & 1024;
    bool _4879 = _4877 != 0;
    float _4881 = _4837;
    float _4883 = _4839;
    float _4885 = _4841;
    float _4887 = _4843;
    float _4889 = _4863;
    float _4891 = _4867;
    if (_4875)
    {
        float _4893 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4895 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4897 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4899 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _4881 = _4893;
        _4883 = _4895;
        _4885 = _4897;
        _4887 = _4899;
    }
    float _4901 = _4881;
    float _4903 = _4883;
    float _4905 = _4885;
    float _4907 = _4887;
    float _4909 = _4845;
    float _4911 = _4847;
    float _4913 = _4849;
    float _4915 = _4851;
    if (_4875)
    {
        float _4917 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4919 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4921 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4923 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _4909 = _4917;
        _4911 = _4919;
        _4913 = _4921;
        _4915 = _4923;
    }
    float _4925 = _4909;
    float _4927 = _4911;
    float _4929 = _4913;
    float _4931 = _4915;
    float _4933 = _4853;
    float _4935 = _4855;
    float _4937 = _4857;
    float _4939 = _4859;
    if (_4875)
    {
        float _4941 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4943 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4945 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4947 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _4933 = _4941;
        _4935 = _4943;
        _4937 = _4945;
        _4939 = _4947;
    }
    float _4949 = _4933;
    float _4951 = _4935;
    float _4953 = _4937;
    float _4955 = _4939;
    float _4957 = _3097 + _4861;
    float _4959 = _3095 + _4863;
    float _4961 = _3099 + _4865;
    if (!_4875)
    {
        _4889 = 0.0;
    }
    float _4963 = _4889;
    float _4965 = _4963;
    if (!_4875)
    {
        _4487 = 0.0;
    }
    float _4967 = _4487;
    int _4969 = as_type<int>(_4871) & 2048;
    bool _4971 = _4969 != 0;
    float _4973 = _4905;
    float _4975 = _4967;
    if (_4875)
    {
        float _4977 = _4957 * _4903;
        _4891 = _4977;
    }
    float _4979 = _4891;
    float _4981 = _4927;
    float _4983 = _4979;
    float _4985 = _4951;
    float _4987 = _4949;
    float _4989 = _4929;
    if (_4875)
    {
        float _4991 = _4957 * _4927;
        _4981 = _4991;
    }
    float _4993 = _4981;
    float _4995 = _4993;
    if (_4875)
    {
        float _4997 = fma(_4959, _4901, _4979);
        _4983 = _4997;
    }
    float _4999 = _4983;
    float _5001 = _4999;
    if (_4875)
    {
        float _5003 = _4957 * _4951;
        _4985 = _5003;
    }
    float _5005 = _4985;
    if (_4875)
    {
        float _5007 = fma(_4959, _4925, _4993);
        _4995 = _5007;
    }
    float _5009 = _4995;
    if (_4875)
    {
        float _5011 = fma(_4961, _4905, _4999);
        _4973 = _5011;
    }
    float _5013 = _4973;
    if (!_4875)
    {
        _5001 = 0.0;
    }
    float _5015 = _5001;
    float _5017 = _5015;
    if (_4875)
    {
        float _5019 = fma(_4959, _4949, _5005);
        _4987 = _5019;
    }
    float _5021 = _4987;
    float _5023 = _5021;
    if (_4875)
    {
        float _5025 = fma(_4961, _4929, _5009);
        _4989 = _5025;
    }
    float _5027 = _4989;
    if (_4875)
    {
        float _5029 = _4907 + _5013;
        _4965 = _5029;
    }
    float _5031 = _4965;
    float _5033 = _5031;
    if (_4875)
    {
        float _5035 = fma(_4961, _4953, _5021);
        _5023 = _5035;
    }
    float _5037 = _5023;
    if (_4875)
    {
        float _5039 = _4931 + _5027;
        _5017 = _5039;
    }
    float _5041 = _5017;
    float _5043 = _5041;
    if (_4875)
    {
        float _5045 = _4955 + _5037;
        _4975 = _5045;
    }
    float _5047 = _4975;
    bool _5049 = !_4879;
    float _5051 = _5047;
    if (!_5049)
    {
        float _5053 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _5055 = uint(int(uint(_163) >> uint(2)));
        float _5057 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5055)]);
        int _5059 = _163 + 4;
        uint _5061 = uint(int(uint(_5059) >> uint(2)));
        float _5063 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5061)]);
        int _5065 = _163 + 8;
        uint _5067 = uint(int(uint(_5065) >> uint(2)));
        float _5069 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5067)]);
        uint _5071 = uint(int(uint(_163) >> uint(2)));
        float _5073 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5071)]);
        int _5075 = _163 + 4;
        uint _5077 = uint(int(uint(_5075) >> uint(2)));
        float _5079 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5077)]);
        int _5081 = _163 + 8;
        uint _5083 = uint(int(uint(_5081) >> uint(2)));
        float _5085 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5083)]);
        uint _5087 = uint(int(uint(_163) >> uint(2)));
        float _5089 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5087)]);
        int _5091 = _163 + 4;
        uint _5093 = uint(int(uint(_5091) >> uint(2)));
        float _5095 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5093)]);
        int _5097 = _163 + 8;
        uint _5099 = uint(int(uint(_5097) >> uint(2)));
        float _5101 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5099)]);
        float _5103 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _5105 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _5107 = _4957 * _5063;
        float _5109 = _4957 * _5079;
        float _5111 = _4957 * _5095;
        float _5113 = fma(_4959, _5057, _5107);
        float _5115 = fma(_4959, _5073, _5109);
        float _5117 = fma(_4959, _5089, _5111);
        float _5119 = fma(_4961, _5069, _5113);
        float _5121 = fma(_4961, _5085, _5115);
        float _5123 = fma(_4961, _5101, _5117);
        float _5125 = _5053 + _5119;
        float _5127 = _5103 + _5121;
        float _5129 = _5105 + _5123;
        _5043 = _5127;
        _5033 = _5125;
        _5051 = _5129;
    }
    float _5131 = _5043;
    float _5133 = _5033;
    float _5135 = _5051;
    bool _5137 = !_4971;
    float _5139 = _5131;
    float _5141 = _5133;
    float _5143 = _5135;
    if (!_5137)
    {
        uint _5145 = uint(int(uint(_163) >> uint(2)));
        float _5147 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5145)]);
        int _5149 = _163 + 4;
        uint _5151 = uint(int(uint(_5149) >> uint(2)));
        float _5153 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5151)]);
        int _5155 = _163 + 8;
        uint _5157 = uint(int(uint(_5155) >> uint(2)));
        float _5159 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5157)]);
        int _5161 = _163 + 12;
        uint _5163 = uint(int(uint(_5161) >> uint(2)));
        float _5165 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5163)]);
        uint _5167 = uint(int(uint(_163) >> uint(2)));
        float _5169 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5167)]);
        int _5171 = _163 + 4;
        uint _5173 = uint(int(uint(_5171) >> uint(2)));
        float _5175 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5173)]);
        int _5177 = _163 + 8;
        uint _5179 = uint(int(uint(_5177) >> uint(2)));
        float _5181 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5179)]);
        int _5183 = _163 + 12;
        uint _5185 = uint(int(uint(_5183) >> uint(2)));
        float _5187 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5185)]);
        uint _5189 = uint(int(uint(_163) >> uint(2)));
        float _5191 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5189)]);
        int _5193 = _163 + 4;
        uint _5195 = uint(int(uint(_5193) >> uint(2)));
        float _5197 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5195)]);
        int _5199 = _163 + 8;
        uint _5201 = uint(int(uint(_5199) >> uint(2)));
        float _5203 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5201)]);
        int _5205 = _163 + 12;
        uint _5207 = uint(int(uint(_5205) >> uint(2)));
        float _5209 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5207)]);
        float _5211 = _4957 * _5153;
        float _5213 = _4957 * _5175;
        float _5215 = fma(_4959, _5147, _5211);
        float _5217 = _4957 * _5197;
        float _5219 = fma(_4959, _5169, _5213);
        float _5221 = fma(_4959, _5191, _5217);
        float _5223 = fma(_4961, _5159, _5215);
        float _5225 = fma(_4961, _5181, _5219);
        float _5227 = fma(_4961, _5203, _5221);
        float _5229 = _5223 + _5165;
        float _5231 = _5225 + _5187;
        float _5233 = _5227 + _5209;
        _5139 = _5231;
        _5141 = _5229;
        _5143 = _5233;
    }
    float _5235 = _5139;
    float _5237 = _5141;
    float _5239 = _5143;
    float _5241 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _5243 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _5245 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _5247 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _5249 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _5251 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _5253 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _5255 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _5257 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _5259 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _5261 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _5263 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _5265 = _5243 * _5235;
    float _5267 = fma(_5241, _5237, _5265);
    float _5269 = fma(_5245, _5239, _5267);
    float _5271 = _5247 + _5269;
    float _5273 = -_5271;
    bool _5275 = _5249 >= _5273;
    bool _5277 = isnan(_5249);
    bool _5279 = _5275 || _5277;
    bool _5281 = isnan(_5273);
    bool _5283 = _5279 || _5281;
    float _5285 = -_5271;
    bool _5287 = _5251 >= _5285;
    bool _5289 = isnan(_5251);
    bool _5291 = _5287 || _5289;
    bool _5293 = isnan(_5285);
    bool _5295 = _5291 || _5293;
    int _5297 = _5283 ? 0 : 1;
    int _5299 = 2;
    float _5301 = _5237;
    if (_5283)
    {
        _5299 = 1;
    }
    int _5303 = _5299;
    int _5305 = _5303;
    if (_5295)
    {
        _5305 = _5297;
    }
    int _5307 = _5305;
    int _5309 = _5307 << 6;
    int _5311 = _5309 + 96;
    uint _5313 = uint(int(uint(_5311) >> uint(2)));
    float _5315 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5313)]);
    int _5317 = _5311 + 4;
    uint _5319 = uint(int(uint(_5317) >> uint(2)));
    float _5321 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5319)]);
    int _5323 = _5311 + 8;
    uint _5325 = uint(int(uint(_5323) >> uint(2)));
    float _5327 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5325)]);
    int _5329 = _5311 + 12;
    uint _5331 = uint(int(uint(_5329) >> uint(2)));
    float _5333 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5331)]);
    int _5335 = _5309 + 48;
    int _5337 = _5309 + 64;
    uint _5339 = uint(int(uint(_5335) >> uint(2)));
    float _5341 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5339)]);
    int _5343 = _5335 + 4;
    uint _5345 = uint(int(uint(_5343) >> uint(2)));
    float _5347 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5345)]);
    int _5349 = _5335 + 8;
    uint _5351 = uint(int(uint(_5349) >> uint(2)));
    float _5353 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5351)]);
    int _5355 = _5335 + 12;
    uint _5357 = uint(int(uint(_5355) >> uint(2)));
    float _5359 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5357)]);
    uint _5361 = uint(int(uint(_5337) >> uint(2)));
    float _5363 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5361)]);
    int _5365 = _5337 + 4;
    uint _5367 = uint(int(uint(_5365) >> uint(2)));
    float _5369 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5367)]);
    int _5371 = _5337 + 8;
    uint _5373 = uint(int(uint(_5371) >> uint(2)));
    float _5375 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5373)]);
    int _5377 = _5337 + 12;
    uint _5379 = uint(int(uint(_5377) >> uint(2)));
    float _5381 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5379)]);
    int _5383 = _5309 + 80;
    float _5385 = _5253 + 1.0;
    float _5387 = _5385 + _5235;
    uint _5389 = uint(int(uint(_5383) >> uint(2)));
    float _5391 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5389)]);
    int _5393 = _5383 + 4;
    uint _5395 = uint(int(uint(_5393) >> uint(2)));
    float _5397 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5395)]);
    int _5399 = _5383 + 8;
    uint _5401 = uint(int(uint(_5399) >> uint(2)));
    float _5403 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5401)]);
    int _5405 = _5383 + 12;
    uint _5407 = uint(int(uint(_5405) >> uint(2)));
    float _5409 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5407)]);
    float _5411 = _5387 * _5257;
    float _5413 = fma(_5255, _5237, _5411);
    float _5415 = fma(_5259, _5239, _5413);
    float _5417 = _5261 + _5415;
    float _5419 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _5421 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _5423 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _5425 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _5427 = trunc(_5417);
    int _5429 = int(_5427);
    int _5431 = ~as_type<int>(_5263);
    int _5433 = _5429 + _5431;
    int _5435 = _5433 + 1;
    float _5437 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _5439 = _5435 >= 0;
    int _5441 = as_type<int>(_5253);
    float _5443 = as_type<float>(_5307);
    if (_5439)
    {
        float _5445 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _5441 = as_type<int>(_5445);
    }
    int _5447 = _5441;
    float _5449 = _5387 * _5321;
    float _5451 = fma(_5315, _5237, _5449);
    float _5453 = fma(_5327, _5239, _5451);
    float _5455 = _5333 + _5453;
    float _5457 = _5387 * _5347;
    float _5459 = 1.0 / _5455;
    float _5461 = fma(_5341, _5237, _5457);
    float _5463 = _5387 * _5369;
    float _5465 = fma(_5353, _5239, _5461);
    float _5467 = fma(_5363, _5237, _5463);
    float _5469 = _5359 + _5465;
    float _5471 = fma(_5375, _5239, _5467);
    float _5473 = _5469 * _5459;
    float _5475 = _5381 + _5471;
    bool _5477 = _5473 >= 0.0;
    float _5479 = _5475 * _5459;
    bool _5481 = _5473 <= 1.0;
    bool _5483 = _5481 && _5477;
    bool _5485 = _5479 >= 0.0;
    bool _5487 = _5485 && _5483;
    bool _5489 = _5479 <= 1.0;
    bool _5491 = _5489 && _5487;
    float _5493 = _5387 * _5397;
    float _5495 = fma(_5391, _5237, _5493);
    float _5497 = _5471;
    float _5499 = _5381;
    if (_5491)
    {
        float _5501 = float(_5307);
        _5443 = _5501;
    }
    float _5503 = _5443;
    float _5505 = _5363;
    float _5507 = _5503;
    if (_5491)
    {
        float _5509 = rint(_5503);
        float _5511 = precise::max(_5509, 0.0);
        uint _5513 = uint(_5511);
        uint _5515 = clamp(_5513, 0u, 65535u);
        _5505 = as_type<float>(_5515);
    }
    float _5517 = _5505;
    float _5519 = fma(_5403, _5239, _5495);
    float _5521 = _5409 + _5519;
    float _5523 = _5521 * _5459;
    float _5525 = _5517;
    float _5527 = _5523;
    if (_5491)
    {
        float3 _14909 = float3(_5473, _5479, float(as_type<int>(_5517)));
        float3 _14913 = select(_14909, float3(0.0), isnan(_14909));
        float _5529 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _14913.xy, uint(rint(_14913.z)), _5523, level(0.0));
        _5525 = _5529;
    }
    float _5531 = _5525;
    float _5533 = _5387 * _5421;
    float _5535 = fma(_5419, _5237, _5533);
    float _5537 = fma(_5423, _5239, _5535);
    float _5539 = _5425 + _5537;
    float _5541 = trunc(_5539);
    int _5543 = int(_5541);
    bool _5545 = _5447 <= _5435;
    bool _5547 = !_5439;
    bool _5549 = _5545 || _5547;
    int _5551 = ~as_type<int>(_5437);
    int _5553 = _5543 + _5551;
    int _5555 = _5553 + 1;
    bool _5557 = _5555 < 0;
    bool _5559 = _5557 || _5549;
    int _5561 = as_type<int>(_5535);
    float _5563 = as_type<float>(_5543);
    if (!_5559)
    {
        float _5565 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _5561 = as_type<int>(_5565);
    }
    int _5567 = _5561;
    bool _5569 = _5567 <= _5555;
    bool _5571 = _5569 || _5559;
    if (_5571)
    {
        _5563 = 1.0;
    }
    float _5573 = _5563;
    float _5575 = _5573;
    if (!_5571)
    {
        float _5577 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _5579 = _5555 * as_type<int>(_5577);
        int _5581 = _5579 + _5435;
        int _5583 = _5581 << 2;
        uint _5585 = uint(int(uint(_5581) >> uint(2)));
        int _5587 = 12 & _5583;
        int _5589 = int(_5585) << 4;
        int _5591 = _5589 + _5587;
        int _5593 = _5591 + 400;
        uint _5595 = uint(int(uint(_5593) >> uint(2)));
        float _5597 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5595)]);
        float _5599 = floor(_5417);
        float _5601 = floor(_5539);
        float _5603 = -_5599;
        float _5605 = _5417 + _5603;
        float _5607 = -_5601;
        float _5609 = _5539 + _5607;
        float _5611 = rint(_5597);
        float _5613 = precise::max(_5611, 0.0);
        uint _5615 = uint(_5613);
        uint _5617 = clamp(_5615, 0u, 65535u);
        float3 _15048 = float3(_5605, _5609, float(int(_5617)));
        float3 _15050 = select(_15048, float3(0.0), isnan(_15048));
        float _5619 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _15050.xy, uint(rint(_15050.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _15050.xy, uint(rint(_15050.z)), level(0.0)).x;
        int _5621 = _5581 << 4;
        int _5623 = _5621 + 2048;
        uint _5625 = uint(int(uint(_5623) >> uint(2)));
        float _5627 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5625)]);
        int _5629 = _5623 + 4;
        uint _5631 = uint(int(uint(_5629) >> uint(2)));
        float _5633 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5631)]);
        int _5635 = _5623 + 8;
        uint _5637 = uint(int(uint(_5635) >> uint(2)));
        float _5639 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5637)]);
        int _5641 = _5623 + 12;
        uint _5643 = uint(int(uint(_5641) >> uint(2)));
        float _5645 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_5643)]);
        float _5647 = _5387 * _5633;
        float _5649 = fma(_5627, _5237, _5647);
        float _5651 = fma(_5639, _5239, _5649);
        float _5653 = _5645 + _5651;
        float _5655 = precise::clamp(_5653, 0.0, 1.0);
        float _5657 = -_5655;
        float _5659 = _5657 + _5619;
        float _5661 = fma(_5659, 500.0, 1.5);
        float _5663 = exp2(_5661);
        float _5665 = 0.0 + _5663;
        float _5667 = precise::clamp(_5665, 0.0, 1.0);
        _5301 = 500.0;
        _5575 = _5667;
        _5497 = as_type<float>(_5617);
        _5499 = _5619;
        _5507 = as_type<float>(_5623);
    }
    float _5669 = _5301;
    float _5671 = _5575;
    float _5673 = _5497;
    float _5675 = _5499;
    float _5677 = _5507;
    uint _5679 = uint(int(uint(_163) >> uint(2)));
    float _5681 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_5679)]);
    float _5683 = _5669;
    float _5685 = _5677;
    if (!_5491)
    {
        _5683 = 1.0;
    }
    float _5687 = _5683;
    bool _5689 = _431 > 0.001000000047497451305389404296875;
    bool _5691 = isnan(_431);
    bool _5693 = _5689 || _5691;
    bool _5695 = isnan(0.001000000047497451305389404296875);
    bool _5697 = _5693 || _5695;
    float _5699 = _5687;
    if (_5491)
    {
        bool _5701 = _5531 >= _5523;
        bool _5703 = isnan(_5531);
        bool _5705 = _5701 || _5703;
        bool _5707 = isnan(_5523);
        bool _5709 = _5705 || _5707;
        float _5711 = float(_5709);
        _5699 = _5711;
    }
    float _5713 = _5699;
    float _5715 = -_5713;
    float _5717 = fma(_5715, _5671, 1.0);
    float _5719 = -_5681;
    float _5721 = _5717 + _5719;
    float _5723 = _5717;
    if (_5697)
    {
        float _5725 = fma(_5721, 0.0500000007450580596923828125, _5681);
        _5723 = _5725;
    }
    float _5727 = _5723;
    float _5729 = precise::max(0.0, _5727);
    float _5731 = precise::min(_5729, 0.999000012874603271484375);
    uint _5733 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_5733)] = as_type<uint>(_5731);
    float _5735 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    float _5737 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[16]);
    float _5739 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[17]);
    float _5741 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[18]);
    float _5743 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[13]);
    int _5745 = as_type<int>(_5735) & 512;
    bool _5747 = _5745 != 0;
    int _5749 = as_type<int>(_5735) & 1024;
    bool _5751 = _5749 != 0;
    float _5753 = _5531;
    float _5755 = _5473;
    float _5757 = _5673;
    float _5759 = _5675;
    float _5761 = _5731;
    float _5763 = _5729;
    bool _5765 = _5751;
    bool _5767 = false;
    if (_5747)
    {
        float _5769 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _5771 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _5773 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _5775 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _5753 = _5769;
        _5755 = _5771;
        _5757 = _5773;
        _5759 = _5775;
    }
    float _5777 = _5753;
    float _5779 = _5755;
    float _5781 = _5757;
    float _5783 = _5759;
    float _5785 = _5341;
    float _5787 = _5539;
    float _5789 = _5469;
    float _5791 = _5359;
    if (_5747)
    {
        float _5793 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _5795 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _5797 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _5799 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _5785 = _5793;
        _5787 = _5795;
        _5789 = _5797;
        _5791 = _5799;
    }
    float _5801 = _5785;
    float _5803 = _5787;
    float _5805 = _5789;
    float _5807 = _5791;
    float _5809 = _5391;
    float _5811 = _5495;
    float _5813 = _5519;
    float _5815 = _5409;
    if (_5747)
    {
        float _5817 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _5819 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _5821 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _5823 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _5809 = _5817;
        _5811 = _5819;
        _5813 = _5821;
        _5815 = _5823;
    }
    float _5825 = _5809;
    float _5827 = _5811;
    float _5829 = _5813;
    float _5831 = _5815;
    if (!_5747)
    {
        _5527 = 0.0;
    }
    float _5833 = _5527;
    float _5835 = _5833;
    if (!_5747)
    {
        _5761 = 0.0;
    }
    float _5837 = _5761;
    int _5839 = as_type<int>(_5735) & 2048;
    bool _5841 = _5839 != 0;
    float _5843 = _5781;
    float _5845 = _5837;
    if (_5747)
    {
        float _5847 = _4957 * _5779;
        _5763 = _5847;
    }
    float _5849 = _5763;
    float _5851 = _5803;
    float _5853 = _5849;
    float _5855 = _5805;
    float _5857 = _5827;
    if (_5747)
    {
        float _5859 = _4957 * _5803;
        _5851 = _5859;
    }
    float _5861 = _5851;
    float _5863 = _5861;
    if (_5747)
    {
        float _5865 = _4957 * _5827;
        _5685 = _5865;
    }
    float _5867 = _5685;
    float _5869 = _5867;
    if (_5747)
    {
        float _5871 = fma(_4959, _5777, _5849);
        _5853 = _5871;
    }
    float _5873 = _5853;
    float _5875 = _5873;
    if (_5747)
    {
        float _5877 = fma(_4959, _5801, _5861);
        _5863 = _5877;
    }
    float _5879 = _5863;
    if (_5747)
    {
        float _5881 = fma(_4959, _5825, _5867);
        _5869 = _5881;
    }
    float _5883 = _5869;
    float _5885 = _5883;
    if (_5747)
    {
        float _5887 = fma(_4961, _5781, _5873);
        _5843 = _5887;
    }
    float _5889 = _5843;
    if (_5747)
    {
        float _5891 = fma(_4961, _5805, _5879);
        _5855 = _5891;
    }
    float _5893 = _5855;
    if (_5747)
    {
        float _5895 = fma(_4961, _5829, _5883);
        _5885 = _5895;
    }
    float _5897 = _5885;
    float _5899 = _5897;
    if (!_5747)
    {
        _5875 = 0.0;
    }
    float _5901 = _5875;
    float _5903 = _5901;
    if (_5747)
    {
        float _5905 = _5783 + _5889;
        _5835 = _5905;
    }
    float _5907 = _5835;
    float _5909 = _5907;
    if (_5747)
    {
        float _5911 = _5807 + _5893;
        _5903 = _5911;
    }
    float _5913 = _5903;
    float _5915 = _5913;
    if (_5747)
    {
        float _5917 = _5831 + _5897;
        _5845 = _5917;
    }
    float _5919 = _5845;
    bool _5921 = !_5751;
    float _5923 = _5919;
    if (!_5921)
    {
        float _5925 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _5927 = uint(int(uint(_163) >> uint(2)));
        float _5929 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5927)]);
        int _5931 = _163 + 4;
        uint _5933 = uint(int(uint(_5931) >> uint(2)));
        float _5935 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5933)]);
        int _5937 = _163 + 8;
        uint _5939 = uint(int(uint(_5937) >> uint(2)));
        float _5941 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5939)]);
        uint _5943 = uint(int(uint(_163) >> uint(2)));
        float _5945 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5943)]);
        int _5947 = _163 + 4;
        uint _5949 = uint(int(uint(_5947) >> uint(2)));
        float _5951 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5949)]);
        int _5953 = _163 + 8;
        uint _5955 = uint(int(uint(_5953) >> uint(2)));
        float _5957 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5955)]);
        uint _5959 = uint(int(uint(_163) >> uint(2)));
        float _5961 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5959)]);
        int _5963 = _163 + 4;
        uint _5965 = uint(int(uint(_5963) >> uint(2)));
        float _5967 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5965)]);
        int _5969 = _163 + 8;
        uint _5971 = uint(int(uint(_5969) >> uint(2)));
        float _5973 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5971)]);
        float _5975 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _5977 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _5979 = _4957 * _5935;
        float _5981 = _4957 * _5951;
        float _5983 = _4957 * _5967;
        float _5985 = fma(_4959, _5929, _5979);
        float _5987 = fma(_4959, _5945, _5981);
        float _5989 = fma(_4959, _5961, _5983);
        float _5991 = fma(_4961, _5941, _5985);
        float _5993 = fma(_4961, _5957, _5987);
        float _5995 = fma(_4961, _5973, _5989);
        float _5997 = _5925 + _5991;
        float _5999 = _5975 + _5993;
        float _6001 = _5977 + _5995;
        _5857 = _5989;
        _5915 = _5999;
        _5909 = _5997;
        _5923 = _6001;
    }
    float _6003 = _5857;
    float _6005 = _5915;
    float _6007 = _5909;
    float _6009 = _5923;
    bool _6011 = !_5841;
    float _6013 = _6005;
    float _6015 = _6007;
    float _6017 = _6009;
    float _6019 = _6003;
    if (!_6011)
    {
        uint _6021 = uint(int(uint(_163) >> uint(2)));
        float _6023 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6021)]);
        int _6025 = _163 + 4;
        uint _6027 = uint(int(uint(_6025) >> uint(2)));
        float _6029 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6027)]);
        int _6031 = _163 + 8;
        uint _6033 = uint(int(uint(_6031) >> uint(2)));
        float _6035 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6033)]);
        int _6037 = _163 + 12;
        uint _6039 = uint(int(uint(_6037) >> uint(2)));
        float _6041 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_6039)]);
        uint _6043 = uint(int(uint(_163) >> uint(2)));
        float _6045 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_6043)]);
        int _6047 = _163 + 4;
        uint _6049 = uint(int(uint(_6047) >> uint(2)));
        float _6051 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_6049)]);
        int _6053 = _163 + 8;
        uint _6055 = uint(int(uint(_6053) >> uint(2)));
        float _6057 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_6055)]);
        int _6059 = _163 + 12;
        uint _6061 = uint(int(uint(_6059) >> uint(2)));
        float _6063 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_6061)]);
        uint _6065 = uint(int(uint(_163) >> uint(2)));
        float _6067 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6065)]);
        int _6069 = _163 + 4;
        uint _6071 = uint(int(uint(_6069) >> uint(2)));
        float _6073 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6071)]);
        int _6075 = _163 + 8;
        uint _6077 = uint(int(uint(_6075) >> uint(2)));
        float _6079 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6077)]);
        int _6081 = _163 + 12;
        uint _6083 = uint(int(uint(_6081) >> uint(2)));
        float _6085 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_6083)]);
        float _6087 = _4957 * _6029;
        float _6089 = _4957 * _6051;
        float _6091 = fma(_4959, _6023, _6087);
        float _6093 = _4957 * _6073;
        float _6095 = fma(_4959, _6045, _6089);
        float _6097 = fma(_4959, _6067, _6093);
        float _6099 = fma(_4961, _6035, _6091);
        float _6101 = fma(_4961, _6057, _6095);
        float _6103 = fma(_4961, _6079, _6097);
        float _6105 = _6099 + _6041;
        float _6107 = _6101 + _6063;
        float _6109 = _6103 + _6085;
        _6013 = _6107;
        _6015 = _6105;
        _6017 = _6109;
        _6019 = _6097;
    }
    float _6111 = _6013;
    float _6113 = _6015;
    float _6115 = _6017;
    float _6117 = _6019;
    float _6119 = -_6111;
    float _6121 = _5739 + _6119;
    float _6123 = -_6113;
    float _6125 = _5737 + _6123;
    float _6127 = -_6115;
    float _6129 = _5741 + _6127;
    float _6131 = _6121 * _6121;
    float _6133 = fma(_6125, _6125, _6131);
    float _6135 = fma(_6129, _6129, _6133);
    float _6137 = sqrt(_6135);
    float _6139 = 0.0;
    float _6141 = 0.0;
    float _6143 = 0.0;
    if (!_5697)
    {
        bool _6145 = _6137 > _5743;
        float _6147 = float(_6145);
        _5899 = _6147;
    }
    float _6149 = _5899;
    bool _6151 = !_5697;
    float _6153 = _6149;
    if (!_6151)
    {
        float _6155 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[20]);
        float _6157 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[21]);
        float _6159 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[22]);
        float _6161 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[23]);
        float _6163 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[24]);
        float _6165 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[25]);
        float _6167 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[26]);
        float _6169 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[27]);
        float _6171 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[28]);
        float _6173 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[29]);
        float _6175 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[30]);
        uint _6177 = uint(int(uint(_193) >> uint(2)));
        float _6179 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_6177)]);
        bool _6181 = _6137 > _5743;
        float _6183 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _6185 = -_6111;
        float _6187 = _6157 + _6185;
        float _6189 = -_6113;
        float _6191 = _6155 + _6189;
        float _6193 = -_6115;
        float _6195 = _6159 + _6193;
        float _6197 = -_6111;
        float _6199 = _6165 + _6197;
        float _6201 = _6187 * _6187;
        float _6203 = -_6113;
        float _6205 = _6163 + _6203;
        float _6207 = -_6115;
        float _6209 = _6167 + _6207;
        float _6211 = -_6111;
        float _6213 = _6173 + _6211;
        float _6215 = _6199 * _6199;
        float _6217 = -_6113;
        float _6219 = _6171 + _6217;
        float _6221 = fma(_6191, _6191, _6201);
        float _6223 = _6213 * _6213;
        float _6225 = fma(_6205, _6205, _6215);
        float _6227 = -_6115;
        float _6229 = _6175 + _6227;
        float _6231 = fma(_6195, _6195, _6221);
        float _6233 = fma(_6219, _6219, _6223);
        float _6235 = fma(_6209, _6209, _6225);
        float _6237 = _6111;
        int _6239 = as_type<int>(_6229);
        int _6241 = as_type<int>(_6231);
        if (!_6181)
        {
            float _6243 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _6237 = _6243;
        }
        float _6245 = _6237;
        float _6247 = sqrt(_6231);
        float _6249 = fma(_6229, _6229, _6233);
        float _6251 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[14]);
        float _6253 = sqrt(_6235);
        float _6255 = sqrt(_6249);
        bool _6257 = _6247 > _5743;
        bool _6259 = _6253 > _5743;
        float _6261 = _6161;
        int _6263 = as_type<int>(_6249);
        if (!_6257)
        {
            float _6265 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _6261 = _6265;
        }
        float _6267 = _6261;
        bool _6269 = _6255 > _5743;
        float _6271 = _6169;
        if (!_6259)
        {
            float _6273 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _6271 = _6273;
        }
        float _6275 = _6271;
        float _6277 = _6117;
        if (!_6269)
        {
            float _6279 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _6277 = _6279;
        }
        float _6281 = _6277;
        int _6283 = as_type<int>(_6179) << 24;
        int _6285 = _6283 >> 24;
        float _6287 = float(_6285);
        float _6289 = _6287 * 0.0078740157186985015869140625;
        float _6291 = precise::min(_6289, 1.0);
        float _6293 = precise::max(_6291, -1.0);
        int _6295 = as_type<int>(_6179) << 16;
        bool _6297 = _6293 > 0.0;
        bool _6299 = _6297 || _6181;
        int _6301 = as_type<int>(_6179) << 8;
        int _6303 = _6295 >> 24;
        int _6305 = as_type<int>(_6179) >> 24;
        int _6307 = _6303;
        if (!_6181)
        {
            bool _6309 = _6293 >= 0.0;
            bool _6311 = isnan(_6293);
            bool _6313 = _6309 || _6311;
            bool _6315 = isnan(0.0);
            bool _6317 = _6313 || _6315;
            _5765 = _6317;
        }
        bool _6319 = _5765;
        int _6321 = _6301 >> 24;
        float _6323 = float(_6303);
        bool _6325 = _6319;
        if (!_6181)
        {
            int _6327 = _6319 ? 0 : 1;
            _6263 = _6327;
        }
        int _6329 = _6263;
        float _6331 = float(_6321);
        float _6333 = _6323 * 0.0078740157186985015869140625;
        float _6335 = float(_6305);
        float _6337 = _6331;
        if (!_6181)
        {
            int _6339 = ~_6329;
            int _6341 = _6339 + 1;
            int _6343 = _6341 + 1;
            _6307 = _6343;
        }
        int _6345 = _6307;
        int _6347 = _6345;
        if (!_6299)
        {
            int _6349 = ~_6329;
            int _6351 = _6349 + 1;
            _6347 = _6351;
        }
        int _6353 = _6347;
        float _6355 = _6335 * 0.0078740157186985015869140625;
        float _6357 = precise::min(_6333, 1.0);
        int _6359 = _6353;
        int _6361 = as_type<int>(_6357);
        if (!_6181)
        {
            float _6363 = float(_6353);
            _6359 = as_type<int>(_6363);
        }
        int _6365 = _6359;
        float _6367 = precise::max(_6357, -1.0);
        float _6369 = precise::min(_6355, 1.0);
        float _6371 = precise::max(_6369, -1.0);
        bool _6373 = _6367 > 0.0;
        bool _6375 = _6373 || _6257;
        int _6377 = _6365;
        int _6379 = as_type<int>(_6369);
        bool _6381 = _6375;
        if (!_6181)
        {
            bool _6383 = _6137 >= _6245;
            bool _6385 = isnan(_6137);
            bool _6387 = _6383 || _6385;
            bool _6389 = isnan(_6245);
            bool _6391 = _6387 || _6389;
            _6325 = _6391;
        }
        bool _6393 = _6325;
        float _6395 = _6331 * 0.0078740157186985015869140625;
        bool _6397 = _6393;
        if (_6181)
        {
            _6337 = 1.0;
        }
        float _6399 = _6337;
        float _6401 = precise::min(_6395, 1.0);
        float _6403 = _6399;
        int _6405 = as_type<int>(_6401);
        if (!_6181)
        {
            float _6407 = _6393 ? as_type<float>(_6365) : (-1.0);
            _6403 = _6407;
        }
        float _6409 = _6403;
        float _6411 = precise::max(_6401, -1.0);
        if (!_6257)
        {
            bool _6413 = _6367 >= 0.0;
            bool _6415 = isnan(_6367);
            bool _6417 = _6413 || _6415;
            bool _6419 = isnan(0.0);
            bool _6421 = _6417 || _6419;
            _6397 = _6421;
        }
        bool _6423 = _6397;
        if (!_6259)
        {
            bool _6425 = _6411 >= 0.0;
            bool _6427 = isnan(_6411);
            bool _6429 = _6425 || _6427;
            bool _6431 = isnan(0.0);
            bool _6433 = _6429 || _6431;
            _5767 = _6433;
        }
        bool _6435 = _5767;
        bool _6437 = _6411 > 0.0;
        bool _6439 = _6437 || _6259;
        bool _6441 = _6435;
        bool _6443 = _6439;
        if (!_6257)
        {
            int _6445 = _6423 ? 0 : 1;
            _6405 = _6445;
        }
        int _6447 = _6405;
        bool _6449 = _6371 > 0.0;
        bool _6451 = _6449 || _6269;
        bool _6453 = _6451;
        float _6455 = as_type<float>(_6447);
        if (!_6259)
        {
            int _6457 = _6435 ? 0 : 1;
            _6361 = _6457;
        }
        int _6459 = _6361;
        float _6461 = 1.0 / _6251;
        float _6463 = as_type<float>(_6459);
        if (!_6269)
        {
            bool _6465 = _6371 >= 0.0;
            bool _6467 = isnan(_6371);
            bool _6469 = _6465 || _6467;
            bool _6471 = isnan(0.0);
            bool _6473 = _6469 || _6471;
            _6441 = _6473;
        }
        bool _6475 = _6441;
        if (!_6269)
        {
            int _6477 = _6475 ? 0 : 1;
            _6377 = _6477;
        }
        int _6479 = _6377;
        float _6481 = as_type<float>(_6479);
        if (!_6257)
        {
            int _6483 = ~_6447;
            int _6485 = _6483 + 1;
            int _6487 = _6485 + 1;
            _6379 = _6487;
        }
        int _6489 = _6379;
        int _6491 = _6489;
        if (!_6259)
        {
            int _6493 = ~_6459;
            int _6495 = _6493 + 1;
            int _6497 = _6495 + 1;
            _6239 = _6497;
        }
        int _6499 = _6239;
        int _6501 = _6499;
        if (!_6375)
        {
            int _6503 = ~_6447;
            int _6505 = _6503 + 1;
            _6491 = _6505;
        }
        int _6507 = _6491;
        int _6509 = _6507;
        if (!_6269)
        {
            int _6511 = ~_6479;
            int _6513 = _6511 + 1;
            int _6515 = _6513 + 1;
            _6241 = _6515;
        }
        int _6517 = _6241;
        int _6519 = _6517;
        if (!_6439)
        {
            int _6521 = ~_6459;
            int _6523 = _6521 + 1;
            _6501 = _6523;
        }
        int _6525 = _6501;
        int _6527 = _6525;
        if (!_6451)
        {
            int _6529 = ~_6479;
            int _6531 = _6529 + 1;
            _6519 = _6531;
        }
        int _6533 = _6519;
        int _6535 = _6533;
        if (!_6257)
        {
            bool _6537 = _6247 >= _6267;
            bool _6539 = isnan(_6247);
            bool _6541 = _6537 || _6539;
            bool _6543 = isnan(_6267);
            bool _6545 = _6541 || _6543;
            _6381 = _6545;
        }
        bool _6547 = _6381;
        if (!_6259)
        {
            bool _6549 = _6253 >= _6275;
            bool _6551 = isnan(_6253);
            bool _6553 = _6549 || _6551;
            bool _6555 = isnan(_6275);
            bool _6557 = _6553 || _6555;
            _6443 = _6557;
        }
        bool _6559 = _6443;
        if (!_6257)
        {
            float _6561 = float(_6507);
            _6509 = as_type<int>(_6561);
        }
        int _6563 = _6509;
        if (!_6259)
        {
            float _6565 = float(_6525);
            _6527 = as_type<int>(_6565);
        }
        int _6567 = _6527;
        if (!_6269)
        {
            bool _6569 = _6255 >= _6281;
            bool _6571 = isnan(_6255);
            bool _6573 = _6569 || _6571;
            bool _6575 = isnan(_6281);
            bool _6577 = _6573 || _6575;
            _6453 = _6577;
        }
        bool _6579 = _6453;
        if (!_6269)
        {
            float _6581 = float(_6533);
            _6535 = as_type<int>(_6581);
        }
        int _6583 = _6535;
        if (_6257)
        {
            _6463 = 1.0;
        }
        float _6585 = _6463;
        float _6587 = _6585;
        if (_6259)
        {
            _6455 = 1.0;
        }
        float _6589 = _6455;
        float _6591 = _6183 * _6461;
        float _6593 = _6589;
        if (_6269)
        {
            _6481 = 1.0;
        }
        float _6595 = _6481;
        float _6597 = _6595;
        if (!_6257)
        {
            float _6599 = _6547 ? as_type<float>(_6563) : (-1.0);
            _6587 = _6599;
        }
        float _6601 = _6587;
        if (!_6259)
        {
            float _6603 = _6559 ? as_type<float>(_6567) : (-1.0);
            _6593 = _6603;
        }
        float _6605 = _6593;
        if (!_6269)
        {
            float _6607 = _6579 ? as_type<float>(_6583) : (-1.0);
            _6597 = _6607;
        }
        float _6609 = _6597;
        float _6611 = abs(_6293);
        float _6613 = fma(_6591, _6409, _6611);
        float _6615 = precise::clamp(_6613, 0.0, 1.0);
        float _6617 = abs(_6367);
        float _6619 = fma(_6591, _6601, _6617);
        float _6621 = precise::clamp(_6619, 0.0, 1.0);
        float _6623 = abs(_6411);
        float _6625 = fma(_6591, _6605, _6623);
        float _6627 = precise::clamp(_6625, 0.0, 1.0);
        float _6629 = abs(_6371);
        float _6631 = fma(_6591, _6609, _6629);
        float _6633 = precise::clamp(_6631, 0.0, 1.0);
        float _6635 = _6615 * _6409;
        float _6637 = _6621 * _6601;
        float _6639 = _6627 * _6605;
        float _6641 = _6633 * _6609;
        _6153 = _6635;
        _6139 = _6637;
        _6141 = _6639;
        _6143 = _6641;
    }
    float _6643 = _6153;
    float _6645 = _6139;
    float _6647 = _6141;
    float _6649 = _6143;
    float _6651 = precise::min(_6643, 1.0);
    float _6653 = -_237;
    float _6655 = _6653 + _4961;
    int _6657 = _163 + 8;
    float _6659 = precise::max(_6651, -1.0);
    float _6661 = -_231;
    float _6663 = _6661 + _4957;
    float _6665 = precise::min(_6645, 1.0);
    float _6667 = _6659 * 127.0;
    float _6669 = precise::max(_6665, -1.0);
    float _6671 = precise::min(_6647, 1.0);
    float _6673 = precise::min(_6649, 1.0);
    float _6675 = _6669 * 127.0;
    float _6677 = precise::max(_6671, -1.0);
    float _6679 = rint(_6667);
    int _6681 = int(_6679);
    float _6683 = precise::max(_6673, -1.0);
    float _6685 = -_225;
    float _6687 = _6685 + _4959;
    int _6689 = _163 + 4;
    float _6691 = _6677 * 127.0;
    float _6693 = _6683 * 127.0;
    float _6695 = rint(_6675);
    int _6697 = int(_6695);
    float _6699 = rint(_6691);
    int _6701 = int(_6699);
    uint _6703 = extract_bits(uint(_6681), 0u, 8u);
    int _6705 = int(_6703) & 255;
    float _6707 = rint(_6693);
    int _6709 = int(_6707);
    uint _6711 = extract_bits(uint(_6705), 0u, 8u);
    int _6713 = int(_6711) & 255;
    uint _6715 = extract_bits(uint(_6697), 0u, 8u);
    int _6717 = int(_6715) & 255;
    int _6719 = _6717 << 8;
    int _6721 = _6713 | _6719;
    uint _6723 = extract_bits(uint(_6705), 16u, 8u);
    int _6725 = int(_6723) & 255;
    int _6727 = _6725 << 16;
    int _6729 = _6721 | _6727;
    uint _6731 = extract_bits(uint(_6705), 24u, 8u);
    int _6733 = int(_6731) & 255;
    int _6735 = _6733 << 24;
    int _6737 = _6729 | _6735;
    uint _6739 = extract_bits(uint(_6737), 0u, 8u);
    int _6741 = int(_6739) & 255;
    uint _6743 = extract_bits(uint(_6737), 8u, 8u);
    int _6745 = int(_6743) & 255;
    int _6747 = _6745 << 8;
    int _6749 = _6741 | _6747;
    uint _6751 = extract_bits(uint(_6701), 0u, 8u);
    int _6753 = int(_6751) & 255;
    int _6755 = _6753 << 16;
    int _6757 = _6749 | _6755;
    uint _6759 = extract_bits(uint(_6737), 24u, 8u);
    int _6761 = int(_6759) & 255;
    int _6763 = _6761 << 24;
    int _6765 = _6757 | _6763;
    uint _6767 = extract_bits(uint(_6765), 0u, 8u);
    int _6769 = int(_6767) & 255;
    uint _6771 = extract_bits(uint(_6765), 8u, 8u);
    int _6773 = int(_6771) & 255;
    int _6775 = _6773 << 8;
    int _6777 = _6769 | _6775;
    uint _6779 = extract_bits(uint(_6765), 16u, 8u);
    int _6781 = int(_6779) & 255;
    int _6783 = _6781 << 16;
    int _6785 = _6777 | _6783;
    uint _6787 = extract_bits(uint(_6709), 0u, 8u);
    int _6789 = int(_6787) & 255;
    int _6791 = _6789 << 24;
    int _6793 = _6785 | _6791;
    uint _6795 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_6795)] = uint(_6793);
    uint _6797 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_6797)] = as_type<uint>(_4445);
    uint _6799 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_6799)] = as_type<uint>(_4959);
    uint _6801 = uint(int(uint(_6689) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_6801)] = as_type<uint>(_4957);
    uint _6803 = uint(int(uint(_6657) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_6803)] = as_type<uint>(_4961);
    uint _6805 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_6805)] = as_type<uint>(_4447);
    uint _6807 = uint(int(uint(_6689) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_6807)] = as_type<uint>(_4449);
    uint _6809 = uint(int(uint(_6657) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_6809)] = as_type<uint>(_4451);
    uint _6811 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_6811)] = as_type<uint>(_6687);
    uint _6813 = uint(int(uint(_6689) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_6813)] = as_type<uint>(_6663);
    uint _6815 = uint(int(uint(_6657) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_6815)] = as_type<uint>(_6655);
    float _6817 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _6819 = _6663 * _6663;
    float _6821 = _4449 * _4449;
    float _6823 = fma(_6687, _6687, _6819);
    float _6825 = fma(_4447, _4447, _6821);
    float _6827 = fma(_6655, _6655, _6823);
    float _6829 = fma(_4451, _4451, _6825);
    float _6831 = sqrt(_6829);
    float _6833 = sqrt(_6827);
    bool _6835 = _6833 >= 9.9999999747524270787835121154785e-07;
    bool _6837 = isnan(_6833);
    bool _6839 = _6835 || _6837;
    bool _6841 = isnan(9.9999999747524270787835121154785e-07);
    bool _6843 = _6839 || _6841;
    float _6845 = _6829;
    if (!_6843)
    {
        bool _6847 = _191 != _199;
        bool _6849 = isnan(_191);
        bool _6851 = _6847 || _6849;
        bool _6853 = isnan(_199);
        bool _6855 = _6851 || _6853;
        _6857 = _6855;
        if (!_6857)
        {
            float _6859 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
            bool _6861 = _6859 > 0.0;
            bool _6863 = !_6861;
            if (!_6863)
            {
                float _6865 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
                float _6867 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
                float _6869 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
                float _6871 = _6867 * _6867;
                float _6873 = fma(_6865, _6865, _6871);
                float _6875 = fma(_6869, _6869, _6873);
                float _6877 = rsqrt(_6875);
                float _6879 = _6877 * 9.9999999747524270787835121154785e-07;
                float _6881 = _6865 * _6879;
                float _6883 = _6867 * _6879;
                float _6885 = _6869 * _6879;
                _357 = as_type<int>(_6881);
                _359 = as_type<int>(_6883);
                _361 = as_type<int>(_6885);
                _6857 = true;
            }
            else
            {
                bool _6887 = _6831 >= 9.9999999747524270787835121154785e-07;
                bool _6889 = isnan(_6831);
                bool _6891 = _6887 || _6889;
                bool _6893 = isnan(9.9999999747524270787835121154785e-07);
                bool _6895 = _6891 || _6893;
                if (!_6895)
                {
                    float _6897 = _4957 * _4957;
                    float _6899 = fma(_4959, _4959, _6897);
                    float _6901 = fma(_4961, _4961, _6899);
                    float _6903 = sqrt(_6901);
                    bool _6905 = _6903 >= 9.9999999747524270787835121154785e-07;
                    bool _6907 = isnan(_6903);
                    bool _6909 = _6905 || _6907;
                    bool _6911 = isnan(9.9999999747524270787835121154785e-07);
                    bool _6913 = _6909 || _6911;
                    int _6915 = as_type<int>(_287);
                    int _6917 = as_type<int>(_6903);
                    if (_6913)
                    {
                        float _6919 = rsqrt(_6901);
                        _6915 = as_type<int>(_6919);
                    }
                    int _6921 = _6915;
                    if (!_6913)
                    {
                        _6917 = 0;
                    }
                    int _6923 = _6917;
                    int _6925 = _6923;
                    if (!_6913)
                    {
                        _351 = 897988541;
                    }
                    int _6927 = _351;
                    int _6929 = _6921;
                    int _6931 = _6927;
                    if (_6913)
                    {
                        float _6933 = as_type<float>(_6921) * 9.9999999747524270787835121154785e-07;
                        _6845 = _6933;
                    }
                    float _6935 = _6845;
                    if (!_6913)
                    {
                        _6929 = 0;
                    }
                    int _6937 = _6929;
                    int _6939 = _6937;
                    if (_6913)
                    {
                        float _6941 = _4959 * _6935;
                        _6925 = as_type<int>(_6941);
                    }
                    int _6943 = _6925;
                    _357 = _6943;
                    if (_6913)
                    {
                        float _6945 = _4957 * _6935;
                        _6931 = as_type<int>(_6945);
                    }
                    int _6947 = _6931;
                    _359 = _6947;
                    if (_6913)
                    {
                        float _6949 = _4961 * _6935;
                        _6939 = as_type<int>(_6949);
                    }
                    int _6951 = _6939;
                    _361 = _6951;
                    _6857 = true;
                }
                else
                {
                    float _6953 = rsqrt(_6829);
                    float _6955 = _6953 * 9.9999999747524270787835121154785e-07;
                    float _6957 = _4447 * _6955;
                    float _6959 = _4449 * _6955;
                    float _6961 = _4451 * _6955;
                    _357 = as_type<int>(_6957);
                    _359 = as_type<int>(_6959);
                    _361 = as_type<int>(_6961);
                    _6857 = true;
                }
            }
        }
    }
    else
    {
        float _6963 = _6831 * _6817;
        bool _6965 = _6963 >= 0.001000000047497451305389404296875;
        bool _6967 = isnan(_6963);
        bool _6969 = _6965 || _6967;
        bool _6971 = isnan(0.001000000047497451305389404296875);
        bool _6973 = _6969 || _6971;
        bool _6975 = _6963 > 0.0;
        bool _6977 = !_6973;
        bool _6979 = _6975 && _6977;
        bool _6981 = _6833 < 0.001000000047497451305389404296875;
        bool _6983 = _6981 && _6979;
        int _6985 = as_type<int>(_6963);
        if (!_6983)
        {
            _6985 = as_type<int>(_6687);
        }
        int _6987 = _6985;
        int _6989 = _6987;
        if (_6983)
        {
            float _6991 = _4447 * _6817;
            _6989 = as_type<int>(_6991);
        }
        int _6993 = _6989;
        _357 = _6993;
        if (!_6983)
        {
            _353 = as_type<int>(_6663);
        }
        int _6995 = _353;
        int _6997 = _6995;
        if (_6983)
        {
            float _6999 = _4449 * _6817;
            _6997 = as_type<int>(_6999);
        }
        int _7001 = _6997;
        _359 = _7001;
        if (!_6983)
        {
            _355 = as_type<int>(_6655);
        }
        int _7003 = _355;
        _361 = _7003;
        if (_6983)
        {
            float _7005 = _4451 * _6817;
            _361 = as_type<int>(_7005);
        }
    }
    _6857 = false;
    int _7007 = _357;
    int _7009 = _359;
    int _7011 = _361;
    uint _7013 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_7013)] = uint(_7007);
    uint _7015 = uint(int(uint(_6689) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_7015)] = uint(_7009);
    uint _7017 = uint(int(uint(_6657) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_7017)] = uint(_7011);
}

