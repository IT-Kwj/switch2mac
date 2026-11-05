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
    texture2d_array<float> cp_t_tcb_16 [[id(13)]];
    sampler cp_t_tcb_16Smplr [[id(14)]];
    texture2d_array<float> cp_t_tcb_14 [[id(15)]];
    sampler cp_t_tcb_14Smplr [[id(16)]];
    sampler cp_t_tcb_14Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1523 = false;
    float _71 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _73 = as_type<float>(gl_LocalInvocationID.x);
    float _75 = as_type<float>(gl_WorkGroupID.x);
    int _78 = as_type<int>(_75) << 5;
    int _80 = _78 + as_type<int>(_73);
    float _82 = trunc(_71);
    int _84 = int(_82);
    bool _88 = _80 >= _84;
    int _90 = 0;
    if (_88)
    {
        _90 = 0;
    }
    int _92 = _90;
    int _94 = _92;
    int _96 = _92;
    if (!_88)
    {
        int _98 = _80 << 4;
        int _100 = _98 + 12;
        uint _103 = uint(int(uint(_100) >> uint(2)));
        float _105 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_103)]);
        float _107 = trunc(_105);
        int _109 = int(_107);
        bool _111 = _109 >= 1;
        int _113 = _111 ? (-1) : 0;
        if (!_111)
        {
            _94 = 0;
        }
        int _115 = _94;
        bool _117 = !_111;
        _96 = _115;
        if (!_117)
        {
            float _119 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _121 = uint(int(uint(_100) >> uint(2)));
            float _123 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_121)]);
            float _125 = float(_109);
            float _127 = -_123;
            float _129 = _119 + _127;
            bool _131 = _129 > _125;
            int _133 = as_type<int>(_119);
            if (!_131)
            {
                bool _135 = _119 >= _123;
                bool _137 = isnan(_119);
                bool _139 = _135 || _137;
                bool _141 = isnan(_123);
                bool _143 = _139 || _141;
                _113 = _143 ? (-1) : 0;
            }
            int _145 = _113;
            if (_131)
            {
                _133 = 0;
            }
            int _147 = _133;
            _96 = _147;
            if (!_131)
            {
                int _149 = ~_145;
                int _151 = (_149 != 0) ? 0 : 1;
                _96 = _151;
            }
        }
    }
    int _153 = _96;
    int _155 = _153 & 1;
    bool _157 = _155 != 0;
    if (!_157)
    {
        return;
    }
    int _159 = _80 << 4;
    float _161 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _163 = _159 + 12;
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _167 = uint(int(uint(_163) >> uint(2)));
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_167)]);
    uint _171 = uint(int(uint(_159) >> uint(2)));
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_171)]);
    int _175 = _159 + 4;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_177)]);
    int _181 = _159 + 8;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_183)]);
    uint _187 = uint(int(uint(_159) >> uint(2)));
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_187)]);
    int _191 = _159 + 4;
    uint _193 = uint(int(uint(_191) >> uint(2)));
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_193)]);
    int _197 = _159 + 8;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    float _201 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_199)]);
    int _203 = _159 + 12;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    float _207 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_205)]);
    uint _209 = uint(int(uint(_163) >> uint(2)));
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_209)]);
    int _213 = as_type<int>(_161) & 512;
    bool _215 = _213 != 0;
    float _217 = 0.0;
    float _219 = 0.0;
    float _221 = 0.0;
    float _223 = 0.0;
    if (_215)
    {
        float _225 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _227 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _229 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _231 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _217 = _225;
        _219 = _227;
        _221 = _229;
        _223 = _231;
    }
    float _233 = _217;
    float _235 = _219;
    float _237 = _221;
    float _239 = _223;
    float _241 = 0.0;
    float _243 = 0.0;
    float _245 = 0.0;
    float _247 = 0.0;
    if (_215)
    {
        float _249 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _253 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _255 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _241 = _249;
        _243 = _251;
        _245 = _253;
        _247 = _255;
    }
    float _257 = _241;
    float _259 = _243;
    float _261 = _245;
    float _263 = _247;
    float _265 = 0.0;
    float _267 = 0.0;
    float _269 = 0.0;
    float _271 = 0.0;
    if (_215)
    {
        float _273 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _275 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _277 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _279 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _265 = _273;
        _267 = _275;
        _269 = _277;
        _271 = _279;
    }
    float _281 = _265;
    float _283 = _267;
    float _285 = _269;
    float _287 = _271;
    float _289 = _169 * _165;
    float _291 = _179 * _289;
    float _293 = _173 * _289;
    float _295 = _185 * _289;
    float _297 = _195 + _291;
    float _299 = _189 + _293;
    float _301 = _201 + _295;
    float _303 = 0.0;
    float _305 = 0.0;
    float _307 = _189;
    float _309 = _201;
    float _311 = _169;
    int _313 = as_type<int>(_293);
    int _315 = as_type<int>(_293);
    if (!_215)
    {
        _303 = 0.0;
        _305 = 0.0;
    }
    float _317 = _303;
    float _319 = _305;
    float _321 = 0.0;
    float _323 = _319;
    float _325 = _317;
    if (!_215)
    {
        _321 = 0.0;
    }
    float _327 = _321;
    int _329 = as_type<int>(_161) & 1024;
    bool _331 = _329 != 0;
    int _333 = as_type<int>(_161) & 2048;
    bool _335 = _333 != 0;
    float _337 = _327;
    if (_215)
    {
        float _339 = _297 * _235;
        _307 = _339;
    }
    float _341 = _307;
    float _343 = _341;
    if (_215)
    {
        float _345 = _297 * _259;
        _309 = _345;
    }
    float _347 = _309;
    float _349 = _347;
    if (_215)
    {
        float _351 = _297 * _283;
        _311 = _351;
    }
    float _353 = _311;
    float _355 = _353;
    if (_215)
    {
        float _357 = fma(_299, _233, _341);
        _343 = _357;
    }
    float _359 = _343;
    float _361 = _359;
    if (_215)
    {
        float _363 = fma(_299, _257, _347);
        _349 = _363;
    }
    float _365 = _349;
    float _367 = _365;
    if (_215)
    {
        float _369 = fma(_299, _281, _353);
        _355 = _369;
    }
    float _371 = _355;
    float _373 = _371;
    if (_215)
    {
        float _375 = fma(_301, _237, _359);
        _361 = _375;
    }
    float _377 = _361;
    if (_215)
    {
        float _379 = fma(_301, _261, _365);
        _367 = _379;
    }
    float _381 = _367;
    if (_215)
    {
        float _383 = fma(_301, _285, _371);
        _373 = _383;
    }
    float _385 = _373;
    if (_215)
    {
        float _387 = _239 + _377;
        _337 = _387;
    }
    float _389 = _337;
    if (_215)
    {
        float _391 = _263 + _381;
        _323 = _391;
    }
    float _393 = _323;
    float _395 = _233;
    float _397 = _235;
    float _399 = _237;
    float _401 = _393;
    if (_215)
    {
        float _403 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _405 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _407 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _395 = _403;
        _397 = _405;
        _399 = _407;
    }
    float _409 = _395;
    float _411 = _397;
    float _413 = _399;
    if (_215)
    {
        float _415 = _287 + _385;
        _325 = _415;
    }
    float _417 = _325;
    float _419 = _385;
    float _421 = _289;
    float _423 = _161;
    float _425 = 0.0;
    if (_215)
    {
        float _427 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _429 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _431 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        float _433 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[39]);
        _419 = _427;
        _421 = _429;
        _423 = _431;
        _425 = _433;
    }
    float _435 = _419;
    float _437 = _421;
    float _439 = _423;
    float _441 = _425;
    float _443 = _377;
    float _445 = _195;
    float _447 = _381;
    float _449 = _207;
    if (_215)
    {
        float _451 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _453 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _455 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        float _457 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[43]);
        _443 = _451;
        _445 = _453;
        _447 = _455;
        _449 = _457;
    }
    float _459 = _443;
    float _461 = _445;
    float _463 = _447;
    float _465 = _449;
    uint _467 = uint(int(uint(_159) >> uint(2)));
    float _469 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_467)]);
    int _471 = _159 + 4;
    uint _473 = uint(int(uint(_471) >> uint(2)));
    float _475 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_473)]);
    int _477 = _159 + 8;
    uint _479 = uint(int(uint(_477) >> uint(2)));
    float _481 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_479)]);
    float _483 = _465;
    float _485 = _441;
    float _487 = _435;
    float _489 = _437;
    float _491 = _439;
    float _493 = _409;
    float _495 = _411;
    float _497 = _413;
    float _499 = _459;
    float _501 = _461;
    float _503 = _463;
    int _505 = as_type<int>(_475);
    int _507 = as_type<int>(_481);
    int _509 = as_type<int>(_475);
    int _511 = as_type<int>(_481);
    int _513 = as_type<int>(_475);
    int _515 = as_type<int>(_481);
    if (!_215)
    {
        int _517 = _159 + 4;
        uint _519 = uint(int(uint(_159) >> uint(2)));
        float _521 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_519)]);
        int _523 = _159 + 8;
        uint _525 = uint(int(uint(_159) >> uint(2)));
        float _527 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_525)]);
        uint _529 = uint(int(uint(_517) >> uint(2)));
        float _531 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_529)]);
        uint _533 = uint(int(uint(_517) >> uint(2)));
        float _535 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_533)]);
        uint _537 = uint(int(uint(_523) >> uint(2)));
        float _539 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_537)]);
        uint _541 = uint(int(uint(_517) >> uint(2)));
        float _543 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_541)]);
        uint _545 = uint(int(uint(_159) >> uint(2)));
        float _547 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_545)]);
        uint _549 = uint(int(uint(_523) >> uint(2)));
        float _551 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_549)]);
        uint _553 = uint(int(uint(_523) >> uint(2)));
        float _555 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_553)]);
        float _557 = _521 * _521;
        float _559 = fma(_527, _527, _557);
        float _561 = _531 * _531;
        float _563 = fma(_535, _535, _561);
        float _565 = _539 * _539;
        float _567 = fma(_543, _543, _563);
        float _569 = fma(_547, _547, _559);
        float _571 = fma(_551, _551, _565);
        float _573 = sqrt(_569);
        float _575 = fma(_555, _555, _571);
        float _577 = sqrt(_567);
        float _579 = sqrt(_575);
        bool _581 = _573 > 0.0;
        bool _583 = _577 > 0.0;
        bool _585 = _579 > 0.0;
        float _587 = _577;
        float _589 = _579;
        float _591 = _565;
        float _593 = _521;
        float _595 = _573;
        float _597 = _527;
        float _599 = _571;
        float _601 = _531;
        float _603 = _543;
        float _605 = _547;
        _485 = _535;
        if (_581)
        {
            float _607 = rsqrt(_569);
            _587 = _607;
        }
        float _609 = _587;
        float _611 = 0.0;
        if (_583)
        {
            float _613 = rsqrt(_567);
            _611 = _613;
        }
        float _615 = _611;
        float _617 = _281;
        if (_585)
        {
            float _619 = rsqrt(_575);
            _617 = _619;
        }
        float _621 = _617;
        if (!_581)
        {
            _589 = 0.0;
        }
        float _623 = _589;
        float _625 = _623;
        _483 = _609;
        if (_581)
        {
            float _627 = _521 * _609;
            _625 = _627;
        }
        float _629 = _625;
        _487 = _629;
        if (!_581)
        {
            _591 = 0.0;
        }
        float _631 = _591;
        float _633 = _631;
        if (_581)
        {
            float _635 = _527 * _609;
            _633 = _635;
        }
        float _637 = _633;
        _493 = _637;
        if (!_581)
        {
            _593 = 0.0;
        }
        float _639 = _593;
        float _641 = _639;
        if (_581)
        {
            float _643 = _547 * _609;
            _641 = _643;
        }
        float _645 = _641;
        _499 = _645;
        if (!_583)
        {
            _595 = 0.0;
        }
        float _647 = _595;
        float _649 = _647;
        if (_583)
        {
            float _651 = _531 * _615;
            _649 = _651;
        }
        float _653 = _649;
        _489 = _653;
        if (!_583)
        {
            _597 = 0.0;
        }
        float _655 = _597;
        float _657 = _655;
        if (_583)
        {
            float _659 = _543 * _615;
            _657 = _659;
        }
        float _661 = _657;
        _501 = _661;
        if (!_583)
        {
            _599 = 0.0;
        }
        float _663 = _599;
        float _665 = _663;
        if (_583)
        {
            float _667 = _535 * _615;
            _665 = _667;
        }
        float _669 = _665;
        _495 = _669;
        if (!_585)
        {
            _601 = 0.0;
        }
        float _671 = _601;
        float _673 = _671;
        if (!_585)
        {
            _603 = 0.0;
        }
        float _675 = _603;
        float _677 = _675;
        if (_585)
        {
            float _679 = _539 * _621;
            _673 = _679;
        }
        float _681 = _673;
        _491 = _681;
        if (!_585)
        {
            _605 = 0.0;
        }
        float _683 = _605;
        _503 = _683;
        if (_585)
        {
            float _685 = _551 * _621;
            _677 = _685;
        }
        float _687 = _677;
        _497 = _687;
        if (_585)
        {
            float _689 = _555 * _621;
            _503 = _689;
        }
    }
    float _691 = _483;
    float _693 = _485;
    float _695 = _487;
    float _697 = _489;
    float _699 = _491;
    float _701 = _493;
    float _703 = _495;
    float _705 = _497;
    float _707 = _499;
    float _709 = _501;
    float _711 = _503;
    uint _713 = uint(int(uint(_163) >> uint(2)));
    float _715 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_713)]);
    float _717 = _691;
    float _719 = _693;
    float _721 = _711;
    if (!_331)
    {
        _717 = _389;
    }
    float _723 = _717;
    float _725 = _723;
    if (!_331)
    {
        _719 = _417;
    }
    float _727 = _719;
    bool _729 = !_331;
    float _731 = _727;
    if (!_729)
    {
        float _733 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _735 = uint(int(uint(_159) >> uint(2)));
        float _737 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_735)]);
        int _739 = _159 + 4;
        uint _741 = uint(int(uint(_739) >> uint(2)));
        float _743 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_741)]);
        int _745 = _159 + 8;
        uint _747 = uint(int(uint(_745) >> uint(2)));
        float _749 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_747)]);
        uint _751 = uint(int(uint(_159) >> uint(2)));
        float _753 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_751)]);
        int _755 = _159 + 4;
        uint _757 = uint(int(uint(_755) >> uint(2)));
        float _759 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_757)]);
        int _761 = _159 + 8;
        uint _763 = uint(int(uint(_761) >> uint(2)));
        float _765 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_763)]);
        uint _767 = uint(int(uint(_159) >> uint(2)));
        float _769 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_767)]);
        int _771 = _159 + 4;
        uint _773 = uint(int(uint(_771) >> uint(2)));
        float _775 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_773)]);
        int _777 = _159 + 8;
        uint _779 = uint(int(uint(_777) >> uint(2)));
        float _781 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_779)]);
        float _783 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _785 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _787 = _297 * _743;
        float _789 = _297 * _759;
        float _791 = _297 * _775;
        float _793 = fma(_299, _737, _787);
        float _795 = fma(_299, _753, _789);
        float _797 = fma(_299, _769, _791);
        float _799 = fma(_301, _749, _793);
        float _801 = fma(_301, _765, _795);
        float _803 = fma(_301, _781, _797);
        float _805 = _733 + _799;
        float _807 = _783 + _801;
        float _809 = _785 + _803;
        _401 = _807;
        _725 = _805;
        _731 = _809;
    }
    float _811 = _401;
    float _813 = _725;
    float _815 = _731;
    bool _817 = !_335;
    float _819 = _811;
    float _821 = _813;
    float _823 = _815;
    if (!_817)
    {
        uint _825 = uint(int(uint(_159) >> uint(2)));
        float _827 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_825)]);
        int _829 = _159 + 4;
        uint _831 = uint(int(uint(_829) >> uint(2)));
        float _833 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_831)]);
        int _835 = _159 + 8;
        uint _837 = uint(int(uint(_835) >> uint(2)));
        float _839 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_837)]);
        int _841 = _159 + 12;
        uint _843 = uint(int(uint(_841) >> uint(2)));
        float _845 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_843)]);
        uint _847 = uint(int(uint(_159) >> uint(2)));
        float _849 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_847)]);
        int _851 = _159 + 4;
        uint _853 = uint(int(uint(_851) >> uint(2)));
        float _855 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_853)]);
        int _857 = _159 + 8;
        uint _859 = uint(int(uint(_857) >> uint(2)));
        float _861 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_859)]);
        int _863 = _159 + 12;
        uint _865 = uint(int(uint(_863) >> uint(2)));
        float _867 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_865)]);
        uint _869 = uint(int(uint(_159) >> uint(2)));
        float _871 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_869)]);
        int _873 = _159 + 4;
        uint _875 = uint(int(uint(_873) >> uint(2)));
        float _877 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_875)]);
        int _879 = _159 + 8;
        uint _881 = uint(int(uint(_879) >> uint(2)));
        float _883 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_881)]);
        int _885 = _159 + 12;
        uint _887 = uint(int(uint(_885) >> uint(2)));
        float _889 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_887)]);
        float _891 = _297 * _833;
        float _893 = _297 * _855;
        float _895 = fma(_299, _827, _891);
        float _897 = _297 * _877;
        float _899 = fma(_299, _849, _893);
        float _901 = fma(_299, _871, _897);
        float _903 = fma(_301, _839, _895);
        float _905 = fma(_301, _861, _899);
        float _907 = fma(_301, _883, _901);
        float _909 = _903 + _845;
        float _911 = _905 + _867;
        float _913 = _907 + _889;
        _819 = _911;
        _821 = _909;
        _823 = _913;
    }
    float _915 = _819;
    float _917 = _821;
    float _919 = _823;
    float _921 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[8]);
    float _923 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[9]);
    float _925 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[10]);
    float _927 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[11]);
    float _929 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _931 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _933 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[70]);
    float _935 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _937 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _939 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _941 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _943 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _945 = _923 * _915;
    float _947 = fma(_921, _917, _945);
    float _949 = fma(_925, _919, _947);
    float _951 = _927 + _949;
    float _953 = -_951;
    bool _955 = _929 >= _953;
    bool _957 = isnan(_929);
    bool _959 = _955 || _957;
    bool _961 = isnan(_953);
    bool _963 = _959 || _961;
    float _965 = -_951;
    bool _967 = _931 >= _965;
    bool _969 = isnan(_931);
    bool _971 = _967 || _969;
    bool _973 = isnan(_965);
    bool _975 = _971 || _973;
    int _977 = _963 ? 0 : 1;
    int _979 = 2;
    if (_963)
    {
        _979 = 1;
    }
    int _981 = _979;
    int _983 = _981;
    if (_975)
    {
        _983 = _977;
    }
    int _985 = _983;
    int _987 = _985 << 6;
    int _989 = _987 + 96;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    float _993 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_991)]);
    int _995 = _989 + 4;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    float _999 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_997)]);
    int _1001 = _989 + 8;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    float _1005 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1003)]);
    int _1007 = _989 + 12;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    float _1011 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1009)]);
    int _1013 = _987 + 48;
    int _1015 = _987 + 64;
    uint _1017 = uint(int(uint(_1013) >> uint(2)));
    float _1019 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1017)]);
    int _1021 = _1013 + 4;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    float _1025 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1023)]);
    int _1027 = _1013 + 8;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    float _1031 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1029)]);
    int _1033 = _1013 + 12;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    float _1037 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1035)]);
    uint _1039 = uint(int(uint(_1015) >> uint(2)));
    float _1041 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1039)]);
    int _1043 = _1015 + 4;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    float _1047 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1045)]);
    int _1049 = _1015 + 8;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    float _1053 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1051)]);
    int _1055 = _1015 + 12;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    float _1059 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1057)]);
    int _1061 = _987 + 80;
    float _1063 = _933 + 1.0;
    float _1065 = _1063 + _915;
    uint _1067 = uint(int(uint(_1061) >> uint(2)));
    float _1069 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1067)]);
    int _1071 = _1061 + 4;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    float _1075 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1073)]);
    int _1077 = _1061 + 8;
    uint _1079 = uint(int(uint(_1077) >> uint(2)));
    float _1081 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1079)]);
    int _1083 = _1061 + 12;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    float _1087 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1085)]);
    float _1089 = _1065 * _937;
    float _1091 = fma(_935, _917, _1089);
    float _1093 = fma(_939, _919, _1091);
    float _1095 = _941 + _1093;
    float _1097 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _1099 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _1101 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _1103 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _1105 = trunc(_1095);
    int _1107 = int(_1105);
    int _1109 = ~as_type<int>(_943);
    int _1111 = _1107 + _1109;
    int _1113 = _1111 + 1;
    float _1115 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    bool _1117 = _1113 >= 0;
    int _1119 = 0;
    float _1121 = as_type<float>(_985);
    if (_1117)
    {
        float _1123 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _1119 = as_type<int>(_1123);
    }
    int _1125 = _1119;
    float _1127 = _1065 * _999;
    float _1129 = fma(_993, _917, _1127);
    float _1131 = fma(_1005, _919, _1129);
    float _1133 = _1011 + _1131;
    float _1135 = _1065 * _1025;
    float _1137 = 1.0 / _1133;
    float _1139 = fma(_1019, _917, _1135);
    float _1141 = _1065 * _1047;
    float _1143 = fma(_1031, _919, _1139);
    float _1145 = fma(_1041, _917, _1141);
    float _1147 = _1037 + _1143;
    float _1149 = fma(_1053, _919, _1145);
    float _1151 = _1147 * _1137;
    float _1153 = _1059 + _1149;
    bool _1155 = _1151 >= 0.0;
    float _1157 = _1153 * _1137;
    bool _1159 = _1151 <= 1.0;
    bool _1161 = _1159 && _1155;
    bool _1163 = _1157 >= 0.0;
    bool _1165 = _1163 && _1161;
    bool _1167 = _1157 <= 1.0;
    bool _1169 = _1167 && _1165;
    float _1171 = _1065 * _1075;
    float _1173 = fma(_1069, _917, _1171);
    if (_1169)
    {
        float _1175 = float(_985);
        _1121 = _1175;
    }
    float _1177 = _1121;
    float _1179 = _1019;
    if (_1169)
    {
        float _1181 = rint(_1177);
        float _1183 = precise::max(_1181, 0.0);
        uint _1185 = uint(_1183);
        uint _1187 = clamp(_1185, 0u, 65535u);
        _1179 = as_type<float>(_1187);
    }
    float _1189 = _1179;
    float _1191 = fma(_1081, _919, _1173);
    float _1193 = _1087 + _1191;
    float _1195 = _1193 * _1137;
    float _1197 = _1147;
    if (_1169)
    {
        float3 _3416 = float3(_1151, _1157, float(as_type<int>(_1189)));
        float3 _3420 = select(_3416, float3(0.0), isnan(_3416));
        float _1199 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3420.xy, uint(rint(_3420.z)), _1195, level(0.0));
        _1197 = _1199;
    }
    float _1201 = _1197;
    float _1203 = _1065 * _1099;
    bool _1205 = _1125 <= _1113;
    bool _1207 = !_1117;
    bool _1209 = _1205 || _1207;
    float _1211 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _1213 = fma(_1097, _917, _1203);
    float _1215 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _1217 = fma(_1101, _919, _1213);
    float _1219 = _1103 + _1217;
    float _1221 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _1223 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _1225 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _1227 = trunc(_1219);
    int _1229 = int(_1227);
    int _1231 = ~as_type<int>(_1115);
    int _1233 = _1229 + _1231;
    int _1235 = _1233 + 1;
    bool _1237 = _1235 < 0;
    bool _1239 = _1237 || _1209;
    int _1241 = as_type<int>(_1041);
    float _1243 = as_type<float>(_1229);
    if (!_1239)
    {
        float _1245 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _1241 = as_type<int>(_1245);
    }
    int _1247 = _1241;
    float _1249 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    bool _1251 = _1247 <= _1235;
    bool _1253 = _1251 || _1239;
    if (_1253)
    {
        _1243 = 1.0;
    }
    float _1255 = _1243;
    float _1257 = _1255;
    if (!_1253)
    {
        float _1259 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _1261 = _1235 * as_type<int>(_1259);
        int _1263 = _1261 + _1113;
        int _1265 = _1263 << 2;
        uint _1267 = uint(int(uint(_1263) >> uint(2)));
        int _1269 = 12 & _1265;
        int _1271 = int(_1267) << 4;
        int _1273 = _1271 + _1269;
        int _1275 = _1273 + 400;
        uint _1277 = uint(int(uint(_1275) >> uint(2)));
        float _1279 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1277)]);
        float _1281 = floor(_1095);
        float _1283 = floor(_1219);
        float _1285 = -_1281;
        float _1287 = _1095 + _1285;
        float _1289 = -_1283;
        float _1291 = _1219 + _1289;
        float _1293 = rint(_1279);
        float _1295 = precise::max(_1293, 0.0);
        uint _1297 = uint(_1295);
        uint _1299 = clamp(_1297, 0u, 65535u);
        float3 _3577 = float3(_1287, _1291, float(int(_1299)));
        float3 _3579 = select(_3577, float3(0.0), isnan(_3577));
        float _1301 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _3579.xy, uint(rint(_3579.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _3579.xy, uint(rint(_3579.z)), level(0.0)).x;
        int _1303 = _1263 << 4;
        int _1305 = _1303 + 2048;
        uint _1307 = uint(int(uint(_1305) >> uint(2)));
        float _1309 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1307)]);
        int _1311 = _1305 + 4;
        uint _1313 = uint(int(uint(_1311) >> uint(2)));
        float _1315 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1313)]);
        int _1317 = _1305 + 8;
        uint _1319 = uint(int(uint(_1317) >> uint(2)));
        float _1321 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1319)]);
        int _1323 = _1305 + 12;
        uint _1325 = uint(int(uint(_1323) >> uint(2)));
        float _1327 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1325)]);
        float _1329 = _1065 * _1315;
        float _1331 = fma(_1309, _917, _1329);
        float _1333 = fma(_1321, _919, _1331);
        float _1335 = _1327 + _1333;
        float _1337 = precise::clamp(_1335, 0.0, 1.0);
        float _1339 = -_1337;
        float _1341 = _1339 + _1301;
        float _1343 = fma(_1341, 500.0, 1.5);
        float _1345 = exp2(_1343);
        float _1347 = 0.0 + _1345;
        float _1349 = precise::clamp(_1347, 0.0, 1.0);
        _1257 = _1349;
    }
    float _1351 = _1257;
    uint _1353 = uint(int(uint(_159) >> uint(2)));
    float _1355 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1353)]);
    float _1357 = abs(_1215);
    float _1359 = log2(_1357);
    float _1361 = _1223 * _1249;
    float _1363 = _1221 * _1249;
    float _1365 = _1225 * _1249;
    float _1367 = _1361 * _695;
    float _1369 = _1361 * _697;
    float _1371 = _1361 * _699;
    float _1373 = fma(_1363, _701, _1367);
    float _1375 = fma(_1363, _703, _1369);
    float _1377 = fma(_1363, _705, _1371);
    float _1379 = -_211;
    float _1381 = _1211 + _1379;
    float _1383 = fma(_1365, _707, _1373);
    float _1385 = fma(_1365, _709, _1375);
    float _1387 = fma(_1365, _711, _1377);
    float _1389 = _165 * _1359;
    bool _1391 = _1381 > 0.001000000047497451305389404296875;
    bool _1393 = isnan(_1381);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan(0.001000000047497451305389404296875);
    bool _1399 = _1395 || _1397;
    float _1401 = _165 * _1383;
    float _1403 = _165 * _1385;
    float _1405 = exp2(_1389);
    float _1407 = _165 * _1387;
    float _1409 = _1389;
    if (!_1169)
    {
        _1409 = 1.0;
    }
    float _1411 = _1409;
    float _1413 = _1411;
    if (_1169)
    {
        bool _1415 = _1201 >= _1195;
        bool _1417 = isnan(_1201);
        bool _1419 = _1415 || _1417;
        bool _1421 = isnan(_1195);
        bool _1423 = _1419 || _1421;
        float _1425 = float(_1423);
        _1413 = _1425;
    }
    float _1427 = _1413;
    float _1429 = -_1427;
    float _1431 = fma(_1429, _1351, 1.0);
    float _1433 = fma(_173, _1405, _1401);
    float _1435 = fma(_179, _1405, _1403);
    float _1437 = fma(_185, _1405, _1407);
    int _1439 = _159 + 4;
    int _1441 = _159 + 8;
    float _1443 = -_1355;
    float _1445 = _1431 + _1443;
    float _1447 = _1431;
    if (_1399)
    {
        float _1449 = fma(_1445, 0.0500000007450580596923828125, _1355);
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = precise::max(0.0, _1451);
    float _1455 = precise::min(_1453, 0.999000012874603271484375);
    uint _1457 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1457)] = as_type<uint>(_1455);
    uint _1459 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1459)] = as_type<uint>(_715);
    uint _1461 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1461)] = as_type<uint>(_299);
    uint _1463 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1463)] = as_type<uint>(_297);
    uint _1465 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1465)] = as_type<uint>(_301);
    uint _1467 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1467)] = as_type<uint>(_1433);
    uint _1469 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1469)] = as_type<uint>(_1435);
    uint _1471 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1471)] = as_type<uint>(_1437);
    uint _1473 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1473)] = as_type<uint>(_293);
    uint _1475 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1475)] = as_type<uint>(_291);
    uint _1477 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1477)] = as_type<uint>(_295);
    float _1479 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1481 = _291 * _291;
    float _1483 = _1435 * _1435;
    float _1485 = fma(_293, _293, _1481);
    float _1487 = fma(_1433, _1433, _1483);
    float _1489 = fma(_295, _295, _1485);
    float _1491 = fma(_1437, _1437, _1487);
    float _1493 = sqrt(_1491);
    float _1495 = sqrt(_1489);
    bool _1497 = _1495 >= 9.9999999747524270787835121154785e-07;
    bool _1499 = isnan(_1495);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan(9.9999999747524270787835121154785e-07);
    bool _1505 = _1501 || _1503;
    int _1521;
    if (!_1505)
    {
        bool _1507 = _1211 != _211;
        bool _1509 = isnan(_1211);
        bool _1511 = _1507 || _1509;
        bool _1513 = isnan(_211);
        bool _1515 = _1511 || _1513;
        if (_1515)
        {
            _313 = as_type<int>(_469);
        }
        int _1517 = _313;
        int _1519 = _1517;
        _1521 = _1517;
        _1523 = _1515;
        if (!_1523)
        {
            float _1525 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1527 = _1525 > 0.0;
            bool _1529 = !_1527;
            if (!_1529)
            {
                float _1531 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1533 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1535 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1537 = _1533 * _697;
                float _1539 = _1533 * _695;
                float _1541 = _1533 * _699;
                float _1543 = fma(_1531, _703, _1537);
                float _1545 = fma(_1531, _701, _1539);
                float _1547 = fma(_1531, _705, _1541);
                float _1549 = fma(_1535, _709, _1543);
                float _1551 = fma(_1535, _707, _1545);
                float _1553 = fma(_1535, _711, _1547);
                float _1555 = _1549 * _1549;
                float _1557 = fma(_1551, _1551, _1555);
                float _1559 = fma(_1553, _1553, _1557);
                float _1561 = rsqrt(_1559);
                float _1563 = _1561 * 9.9999999747524270787835121154785e-07;
                float _1565 = _1551 * _1563;
                float _1567 = _1549 * _1563;
                float _1569 = _1553 * _1563;
                _1521 = as_type<int>(_1565);
                _513 = as_type<int>(_1567);
                _515 = as_type<int>(_1569);
                _1523 = true;
            }
            else
            {
                bool _1571 = _1493 >= 9.9999999747524270787835121154785e-07;
                bool _1573 = isnan(_1493);
                bool _1575 = _1571 || _1573;
                bool _1577 = isnan(9.9999999747524270787835121154785e-07);
                bool _1579 = _1575 || _1577;
                if (!_1579)
                {
                    float _1581 = _297 * _297;
                    float _1583 = fma(_299, _299, _1581);
                    float _1585 = fma(_301, _301, _1583);
                    float _1587 = sqrt(_1585);
                    bool _1589 = _1587 >= 9.9999999747524270787835121154785e-07;
                    bool _1591 = isnan(_1587);
                    bool _1593 = _1589 || _1591;
                    bool _1595 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1597 = _1593 || _1595;
                    float _1599 = _1587;
                    if (_1597)
                    {
                        float _1601 = rsqrt(_1585);
                        _1599 = _1601;
                    }
                    float _1603 = _1599;
                    if (!_1597)
                    {
                        _1519 = 0;
                    }
                    int _1605 = _1519;
                    int _1607 = _1605;
                    if (!_1597)
                    {
                        _505 = 897988541;
                    }
                    int _1609 = _505;
                    int _1611 = _1609;
                    if (!_1597)
                    {
                        _507 = 0;
                    }
                    int _1613 = _507;
                    int _1615 = _1613;
                    if (_1597)
                    {
                        float _1617 = _1603 * 9.9999999747524270787835121154785e-07;
                        _721 = _1617;
                    }
                    float _1619 = _721;
                    if (_1597)
                    {
                        float _1621 = _299 * _1619;
                        _1607 = as_type<int>(_1621);
                    }
                    int _1623 = _1607;
                    _1521 = _1623;
                    if (_1597)
                    {
                        float _1625 = _297 * _1619;
                        _1611 = as_type<int>(_1625);
                    }
                    int _1627 = _1611;
                    _513 = _1627;
                    if (_1597)
                    {
                        float _1629 = _301 * _1619;
                        _1615 = as_type<int>(_1629);
                    }
                    int _1631 = _1615;
                    _515 = _1631;
                    _1523 = true;
                }
                else
                {
                    float _1633 = rsqrt(_1491);
                    float _1635 = _1633 * 9.9999999747524270787835121154785e-07;
                    float _1637 = _1433 * _1635;
                    float _1639 = _1435 * _1635;
                    float _1641 = _1437 * _1635;
                    _1521 = as_type<int>(_1637);
                    _513 = as_type<int>(_1639);
                    _515 = as_type<int>(_1641);
                    _1523 = true;
                }
            }
        }
    }
    else
    {
        float _1643 = _1493 * _1479;
        bool _1645 = _1643 >= 0.001000000047497451305389404296875;
        bool _1647 = isnan(_1643);
        bool _1649 = _1645 || _1647;
        bool _1651 = isnan(0.001000000047497451305389404296875);
        bool _1653 = _1649 || _1651;
        bool _1655 = _1643 > 0.0;
        bool _1657 = !_1653;
        bool _1659 = _1655 && _1657;
        bool _1661 = _1495 < 0.001000000047497451305389404296875;
        bool _1663 = _1661 && _1659;
        if (!_1663)
        {
            _509 = as_type<int>(_291);
        }
        int _1665 = _509;
        int _1667 = _1665;
        if (_1663)
        {
            float _1669 = _1433 * _1479;
            _315 = as_type<int>(_1669);
        }
        int _1671 = _315;
        _1521 = _1671;
        if (!_1663)
        {
            _511 = as_type<int>(_295);
        }
        int _1673 = _511;
        _515 = _1673;
        if (_1663)
        {
            float _1675 = _1435 * _1479;
            _1667 = as_type<int>(_1675);
        }
        int _1677 = _1667;
        _513 = _1677;
        if (_1663)
        {
            float _1679 = _1437 * _1479;
            _515 = as_type<int>(_1679);
        }
    }
    _1523 = false;
    int _1681 = _1521;
    int _1683 = _513;
    int _1685 = _515;
    uint _1687 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1687)] = uint(_1681);
    uint _1689 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1689)] = uint(_1683);
    uint _1691 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1691)] = uint(_1685);
}

