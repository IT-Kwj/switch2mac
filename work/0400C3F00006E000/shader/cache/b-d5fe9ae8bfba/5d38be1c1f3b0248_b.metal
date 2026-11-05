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
    bool _1215 = false;
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
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _207 = uint(int(uint(_163) >> uint(2)));
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_207)]);
    int _211 = as_type<int>(_161) & 512;
    bool _213 = _211 != 0;
    uint _215 = uint(int(uint(_163) >> uint(2)));
    float _217 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_215)]);
    float _219 = 0.0;
    float _221 = 0.0;
    float _223 = 0.0;
    float _225 = 0.0;
    if (_213)
    {
        float _227 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _229 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _231 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _233 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _219 = _227;
        _221 = _229;
        _223 = _231;
        _225 = _233;
    }
    float _235 = _219;
    float _237 = _221;
    float _239 = _223;
    float _241 = _225;
    float _243 = 0.0;
    float _245 = 0.0;
    float _247 = 0.0;
    float _249 = 0.0;
    if (_213)
    {
        float _251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _253 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _255 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _257 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _243 = _251;
        _245 = _253;
        _247 = _255;
        _249 = _257;
    }
    float _259 = _243;
    float _261 = _245;
    float _263 = _247;
    float _265 = _249;
    float _267 = _169 * _165;
    float _269 = 0.0;
    float _271 = 0.0;
    float _273 = 0.0;
    float _275 = 0.0;
    float _277 = _189;
    float _279 = _201;
    if (_213)
    {
        float _281 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _283 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _285 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _287 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _269 = _281;
        _271 = _283;
        _273 = _285;
        _275 = _287;
    }
    float _289 = _269;
    float _291 = _271;
    float _293 = _273;
    float _295 = _275;
    float _297 = _179 * _267;
    float _299 = _173 * _267;
    float _301 = _185 * _267;
    float _303 = _195 + _297;
    float _305 = _189 + _299;
    float _307 = _201 + _301;
    int _309 = as_type<int>(_161) & 1024;
    bool _311 = _309 != 0;
    int _313 = as_type<int>(_161) & 2048;
    bool _315 = _313 != 0;
    float _317 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _319 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _321 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _323 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _325 = _235;
    float _327 = _237;
    int _329 = as_type<int>(_299);
    int _331 = as_type<int>(_299);
    if (_213)
    {
        float _333 = _303 * _237;
        _277 = _333;
    }
    float _335 = _277;
    float _337 = _335;
    if (_213)
    {
        float _339 = _303 * _261;
        _279 = _339;
    }
    float _341 = _279;
    float _343 = _341;
    if (_213)
    {
        float _345 = fma(_305, _235, _335);
        _337 = _345;
    }
    float _347 = _337;
    float _349 = _347;
    if (_213)
    {
        float _351 = fma(_305, _259, _341);
        _343 = _351;
    }
    float _353 = _343;
    float _355 = _353;
    if (_213)
    {
        float _357 = fma(_307, _239, _347);
        _349 = _357;
    }
    float _359 = _349;
    if (_213)
    {
        float _361 = fma(_307, _263, _353);
        _355 = _361;
    }
    float _363 = _355;
    if (!_213)
    {
        _325 = 0.0;
        _327 = 0.0;
    }
    float _365 = _325;
    float _367 = _327;
    float _369 = _367;
    float _371 = _365;
    if (_213)
    {
        float _373 = _241 + _359;
        _369 = _373;
    }
    float _375 = _369;
    if (_213)
    {
        float _377 = _265 + _363;
        _371 = _377;
    }
    float _379 = _371;
    uint _381 = uint(int(uint(_159) >> uint(2)));
    float _383 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_381)]);
    int _385 = _159 + 4;
    uint _387 = uint(int(uint(_385) >> uint(2)));
    float _389 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_387)]);
    int _391 = _159 + 8;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    float _395 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_393)]);
    int _397 = _159 + 12;
    uint _399 = uint(int(uint(_397) >> uint(2)));
    float _401 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_399)]);
    float _403 = _291;
    float _405 = _293;
    float _407 = _323;
    if (_213)
    {
        float _409 = _303 * _291;
        _403 = _409;
    }
    float _411 = _403;
    float _413 = _411;
    if (_213)
    {
        float _415 = fma(_305, _289, _411);
        _413 = _415;
    }
    float _417 = _413;
    if (_213)
    {
        float _419 = fma(_307, _293, _417);
        _405 = _419;
    }
    float _421 = _405;
    float _423 = 0.0;
    if (!_213)
    {
        _423 = 0.0;
    }
    float _425 = _423;
    float _427 = _425;
    if (!_311)
    {
        _407 = _379;
    }
    float _429 = _407;
    float _431 = _429;
    if (_213)
    {
        float _433 = _295 + _421;
        _427 = _433;
    }
    float _435 = _427;
    float _437 = _401;
    float _439 = _435;
    int _441 = as_type<int>(_389);
    int _443 = as_type<int>(_395);
    int _445 = as_type<int>(_389);
    int _447 = as_type<int>(_395);
    if (!_311)
    {
        _437 = _375;
    }
    float _449 = _437;
    bool _451 = !_311;
    float _453 = _449;
    if (!_451)
    {
        float _455 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _457 = uint(int(uint(_159) >> uint(2)));
        float _459 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_457)]);
        int _461 = _159 + 4;
        uint _463 = uint(int(uint(_461) >> uint(2)));
        float _465 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_463)]);
        int _467 = _159 + 8;
        uint _469 = uint(int(uint(_467) >> uint(2)));
        float _471 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_469)]);
        uint _473 = uint(int(uint(_159) >> uint(2)));
        float _475 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_473)]);
        int _477 = _159 + 4;
        uint _479 = uint(int(uint(_477) >> uint(2)));
        float _481 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_479)]);
        int _483 = _159 + 8;
        uint _485 = uint(int(uint(_483) >> uint(2)));
        float _487 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_485)]);
        uint _489 = uint(int(uint(_159) >> uint(2)));
        float _491 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_489)]);
        int _493 = _159 + 4;
        uint _495 = uint(int(uint(_493) >> uint(2)));
        float _497 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_495)]);
        int _499 = _159 + 8;
        uint _501 = uint(int(uint(_499) >> uint(2)));
        float _503 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_501)]);
        float _505 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _507 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _509 = _303 * _465;
        float _511 = _303 * _481;
        float _513 = _303 * _497;
        float _515 = fma(_305, _459, _509);
        float _517 = fma(_305, _475, _511);
        float _519 = fma(_305, _491, _513);
        float _521 = fma(_307, _471, _515);
        float _523 = fma(_307, _487, _517);
        float _525 = fma(_307, _503, _519);
        float _527 = _455 + _521;
        float _529 = _505 + _523;
        float _531 = _507 + _525;
        _439 = _529;
        _453 = _527;
        _431 = _531;
    }
    float _533 = _439;
    float _535 = _453;
    float _537 = _431;
    bool _539 = !_315;
    float _541 = _533;
    float _543 = _535;
    float _545 = _537;
    if (!_539)
    {
        uint _547 = uint(int(uint(_159) >> uint(2)));
        float _549 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_547)]);
        int _551 = _159 + 4;
        uint _553 = uint(int(uint(_551) >> uint(2)));
        float _555 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_553)]);
        int _557 = _159 + 8;
        uint _559 = uint(int(uint(_557) >> uint(2)));
        float _561 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_559)]);
        int _563 = _159 + 12;
        uint _565 = uint(int(uint(_563) >> uint(2)));
        float _567 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_565)]);
        uint _569 = uint(int(uint(_159) >> uint(2)));
        float _571 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_569)]);
        int _573 = _159 + 4;
        uint _575 = uint(int(uint(_573) >> uint(2)));
        float _577 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_575)]);
        int _579 = _159 + 8;
        uint _581 = uint(int(uint(_579) >> uint(2)));
        float _583 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_581)]);
        int _585 = _159 + 12;
        uint _587 = uint(int(uint(_585) >> uint(2)));
        float _589 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_587)]);
        uint _591 = uint(int(uint(_159) >> uint(2)));
        float _593 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_591)]);
        int _595 = _159 + 4;
        uint _597 = uint(int(uint(_595) >> uint(2)));
        float _599 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_597)]);
        int _601 = _159 + 8;
        uint _603 = uint(int(uint(_601) >> uint(2)));
        float _605 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_603)]);
        int _607 = _159 + 12;
        uint _609 = uint(int(uint(_607) >> uint(2)));
        float _611 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_609)]);
        float _613 = _303 * _555;
        float _615 = _303 * _577;
        float _617 = _303 * _599;
        float _619 = fma(_305, _549, _613);
        float _621 = fma(_305, _571, _615);
        float _623 = fma(_305, _593, _617);
        float _625 = fma(_307, _561, _619);
        float _627 = fma(_307, _583, _621);
        float _629 = fma(_307, _605, _623);
        float _631 = _625 + _567;
        float _633 = _627 + _589;
        float _635 = _629 + _611;
        _541 = _633;
        _543 = _631;
        _545 = _635;
    }
    float _637 = _541;
    float _639 = _543;
    float _641 = _545;
    float _643 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[8]);
    float _645 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[9]);
    float _647 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[10]);
    float _649 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[11]);
    float _651 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _653 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _655 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[70]);
    float _657 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _659 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _661 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _663 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _665 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _667 = _645 * _637;
    float _669 = fma(_643, _639, _667);
    float _671 = fma(_647, _641, _669);
    float _673 = _649 + _671;
    float _675 = -_673;
    bool _677 = _651 >= _675;
    bool _679 = isnan(_651);
    bool _681 = _677 || _679;
    bool _683 = isnan(_675);
    bool _685 = _681 || _683;
    float _687 = -_673;
    bool _689 = _653 >= _687;
    bool _691 = isnan(_653);
    bool _693 = _689 || _691;
    bool _695 = isnan(_687);
    bool _697 = _693 || _695;
    int _699 = _685 ? 0 : 1;
    int _701 = 2;
    if (_685)
    {
        _701 = 1;
    }
    int _703 = _701;
    int _705 = _703;
    if (_697)
    {
        _705 = _699;
    }
    int _707 = _705;
    int _709 = _707 << 6;
    int _711 = _709 + 96;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    float _715 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_713)]);
    int _717 = _711 + 4;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    float _721 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_719)]);
    int _723 = _711 + 8;
    uint _725 = uint(int(uint(_723) >> uint(2)));
    float _727 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_725)]);
    int _729 = _711 + 12;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    float _733 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_731)]);
    int _735 = _709 + 48;
    int _737 = _709 + 64;
    uint _739 = uint(int(uint(_735) >> uint(2)));
    float _741 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_739)]);
    int _743 = _735 + 4;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    float _747 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_745)]);
    int _749 = _735 + 8;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    float _753 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_751)]);
    int _755 = _735 + 12;
    uint _757 = uint(int(uint(_755) >> uint(2)));
    float _759 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_757)]);
    uint _761 = uint(int(uint(_737) >> uint(2)));
    float _763 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_761)]);
    int _765 = _737 + 4;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    float _769 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_767)]);
    int _771 = _737 + 8;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    float _775 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_773)]);
    int _777 = _737 + 12;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    float _781 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_779)]);
    int _783 = _709 + 80;
    float _785 = _655 + 1.0;
    float _787 = _785 + _637;
    uint _789 = uint(int(uint(_783) >> uint(2)));
    float _791 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_789)]);
    int _793 = _783 + 4;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    float _797 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_795)]);
    int _799 = _783 + 8;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    float _803 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_801)]);
    int _805 = _783 + 12;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    float _809 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_807)]);
    float _811 = _787 * _659;
    float _813 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    float _815 = fma(_657, _639, _811);
    float _817 = fma(_661, _641, _815);
    float _819 = _663 + _817;
    float _821 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _823 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _825 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _827 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _829 = trunc(_819);
    int _831 = int(_829);
    int _833 = ~as_type<int>(_665);
    int _835 = _831 + _833;
    int _837 = _835 + 1;
    bool _839 = _837 >= 0;
    int _841 = _831;
    float _843 = as_type<float>(_707);
    if (_839)
    {
        float _845 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _841 = as_type<int>(_845);
    }
    int _847 = _841;
    float _849 = _787 * _721;
    float _851 = fma(_715, _639, _849);
    float _853 = fma(_727, _641, _851);
    float _855 = _733 + _853;
    float _857 = _787 * _747;
    float _859 = 1.0 / _855;
    float _861 = fma(_741, _639, _857);
    float _863 = _787 * _769;
    float _865 = fma(_753, _641, _861);
    float _867 = fma(_763, _639, _863);
    float _869 = _759 + _865;
    float _871 = fma(_775, _641, _867);
    float _873 = _869 * _859;
    float _875 = _781 + _871;
    bool _877 = _873 >= 0.0;
    float _879 = _875 * _859;
    bool _881 = _873 <= 1.0;
    bool _883 = _881 && _877;
    bool _885 = _879 >= 0.0;
    bool _887 = _885 && _883;
    bool _889 = _879 <= 1.0;
    bool _891 = _889 && _887;
    float _893 = _787 * _797;
    float _895 = fma(_791, _639, _893);
    if (_891)
    {
        float _897 = float(_707);
        _843 = _897;
    }
    float _899 = _843;
    float _901 = fma(_803, _641, _895);
    float _903 = _899;
    if (_891)
    {
        float _905 = rint(_899);
        float _907 = precise::max(_905, 0.0);
        uint _909 = uint(_907);
        uint _911 = clamp(_909, 0u, 65535u);
        _903 = as_type<float>(_911);
    }
    float _913 = _903;
    float _915 = _809 + _901;
    float _917 = _915 * _859;
    float _919 = _879;
    if (_891)
    {
        float3 _2715 = float3(_873, _879, float(as_type<int>(_913)));
        float3 _2719 = select(_2715, float3(0.0), isnan(_2715));
        float _921 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _2719.xy, uint(rint(_2719.z)), _917, level(0.0));
        _919 = _921;
    }
    float _923 = _919;
    float _925 = _787 * _823;
    bool _927 = _847 <= _837;
    bool _929 = !_839;
    bool _931 = _927 || _929;
    float _933 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _935 = fma(_821, _639, _925);
    float _937 = fma(_825, _641, _935);
    float _939 = _827 + _937;
    float _941 = trunc(_939);
    int _943 = int(_941);
    int _945 = ~as_type<int>(_813);
    int _947 = _943 + _945;
    int _949 = _947 + 1;
    bool _951 = _949 < 0;
    bool _953 = _951 || _931;
    int _955 = as_type<int>(_935);
    float _957 = as_type<float>(_943);
    if (!_953)
    {
        float _959 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _955 = as_type<int>(_959);
    }
    int _961 = _955;
    bool _963 = _961 <= _949;
    bool _965 = _963 || _953;
    if (_965)
    {
        _957 = 1.0;
    }
    float _967 = _957;
    float _969 = _967;
    if (!_965)
    {
        float _971 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _973 = _949 * as_type<int>(_971);
        int _975 = _973 + _837;
        int _977 = _975 << 2;
        uint _979 = uint(int(uint(_975) >> uint(2)));
        int _981 = 12 & _977;
        int _983 = int(_979) << 4;
        int _985 = _983 + _981;
        int _987 = _985 + 400;
        uint _989 = uint(int(uint(_987) >> uint(2)));
        float _991 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_989)]);
        float _993 = floor(_939);
        float _995 = floor(_819);
        float _997 = -_993;
        float _999 = _939 + _997;
        float _1001 = -_995;
        float _1003 = _819 + _1001;
        float _1005 = rint(_991);
        float _1007 = precise::max(_1005, 0.0);
        uint _1009 = uint(_1007);
        uint _1011 = clamp(_1009, 0u, 65535u);
        float3 _2857 = float3(_1003, _999, float(int(_1011)));
        float3 _2859 = select(_2857, float3(0.0), isnan(_2857));
        float _1013 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _2859.xy, uint(rint(_2859.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _2859.xy, uint(rint(_2859.z)), level(0.0)).x;
        int _1015 = _975 << 4;
        int _1017 = _1015 + 2048;
        uint _1019 = uint(int(uint(_1017) >> uint(2)));
        float _1021 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1019)]);
        int _1023 = _1017 + 4;
        uint _1025 = uint(int(uint(_1023) >> uint(2)));
        float _1027 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1025)]);
        int _1029 = _1017 + 8;
        uint _1031 = uint(int(uint(_1029) >> uint(2)));
        float _1033 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1031)]);
        int _1035 = _1017 + 12;
        uint _1037 = uint(int(uint(_1035) >> uint(2)));
        float _1039 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1037)]);
        float _1041 = _787 * _1027;
        float _1043 = fma(_1021, _639, _1041);
        float _1045 = fma(_1033, _641, _1043);
        float _1047 = _1039 + _1045;
        float _1049 = precise::clamp(_1047, 0.0, 1.0);
        float _1051 = -_1049;
        float _1053 = _1051 + _1013;
        float _1055 = fma(_1053, 500.0, 1.5);
        float _1057 = exp2(_1055);
        float _1059 = 0.0 + _1057;
        float _1061 = precise::clamp(_1059, 0.0, 1.0);
        _969 = _1061;
    }
    float _1063 = _969;
    uint _1065 = uint(int(uint(_159) >> uint(2)));
    float _1067 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1065)]);
    float _1069 = abs(_203);
    float _1071 = log2(_1069);
    float _1073 = _165 * _205;
    float _1075 = _317 * _1073;
    float _1077 = -_209;
    float _1079 = _933 + _1077;
    bool _1081 = _1079 > 0.001000000047497451305389404296875;
    bool _1083 = isnan(_1079);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan(0.001000000047497451305389404296875);
    bool _1089 = _1085 || _1087;
    float _1091 = _165 * _1071;
    float _1093 = _319 * _1073;
    float _1095 = _321 * _1073;
    float _1097 = exp2(_1091);
    float _1099 = fma(_173, _1097, _1075);
    float _1101 = _1075;
    if (!_891)
    {
        _1101 = 1.0;
    }
    float _1103 = _1101;
    float _1105 = fma(_179, _1097, _1093);
    float _1107 = _1103;
    if (_891)
    {
        bool _1109 = _923 >= _917;
        bool _1111 = isnan(_923);
        bool _1113 = _1109 || _1111;
        bool _1115 = isnan(_917);
        bool _1117 = _1113 || _1115;
        float _1119 = float(_1117);
        _1107 = _1119;
    }
    float _1121 = _1107;
    float _1123 = fma(_185, _1097, _1095);
    int _1125 = _159 + 8;
    float _1127 = -_1121;
    float _1129 = fma(_1127, _1063, 1.0);
    float _1131 = -_1067;
    float _1133 = _1129 + _1131;
    float _1135 = _1129;
    if (_1089)
    {
        float _1137 = fma(_1133, 0.0500000007450580596923828125, _1067);
        _1135 = _1137;
    }
    float _1139 = _1135;
    int _1141 = _159 + 4;
    float _1143 = precise::max(0.0, _1139);
    float _1145 = precise::min(_1143, 0.999000012874603271484375);
    uint _1147 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1147)] = as_type<uint>(_1145);
    uint _1149 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1149)] = as_type<uint>(_217);
    uint _1151 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1151)] = as_type<uint>(_305);
    uint _1153 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1153)] = as_type<uint>(_303);
    uint _1155 = uint(int(uint(_1125) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1155)] = as_type<uint>(_307);
    uint _1157 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1157)] = as_type<uint>(_1099);
    uint _1159 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1159)] = as_type<uint>(_1105);
    uint _1161 = uint(int(uint(_1125) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1161)] = as_type<uint>(_1123);
    uint _1163 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1163)] = as_type<uint>(_299);
    uint _1165 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1165)] = as_type<uint>(_297);
    uint _1167 = uint(int(uint(_1125) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1167)] = as_type<uint>(_301);
    float _1169 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1171 = _297 * _297;
    float _1173 = _1105 * _1105;
    float _1175 = fma(_299, _299, _1171);
    float _1177 = fma(_1099, _1099, _1173);
    float _1179 = fma(_301, _301, _1175);
    float _1181 = fma(_1123, _1123, _1177);
    float _1183 = sqrt(_1181);
    float _1185 = sqrt(_1179);
    bool _1187 = _1185 >= 9.9999999747524270787835121154785e-07;
    bool _1189 = isnan(_1185);
    bool _1191 = _1187 || _1189;
    bool _1193 = isnan(9.9999999747524270787835121154785e-07);
    bool _1195 = _1191 || _1193;
    float _1197 = _1185;
    int _1213;
    if (!_1195)
    {
        bool _1199 = _933 != _209;
        bool _1201 = isnan(_933);
        bool _1203 = _1199 || _1201;
        bool _1205 = isnan(_209);
        bool _1207 = _1203 || _1205;
        if (_1207)
        {
            _329 = as_type<int>(_383);
        }
        int _1209 = _329;
        int _1211 = _1209;
        _1213 = _1209;
        _1215 = _1207;
        if (!_1215)
        {
            float _1217 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1219 = _1217 > 0.0;
            bool _1221 = !_1219;
            if (!_1221)
            {
                float _1223 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1225 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1227 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1229 = _1225 * _1225;
                float _1231 = fma(_1223, _1223, _1229);
                float _1233 = fma(_1227, _1227, _1231);
                float _1235 = rsqrt(_1233);
                float _1237 = _1235 * 9.9999999747524270787835121154785e-07;
                float _1239 = _1223 * _1237;
                float _1241 = _1225 * _1237;
                float _1243 = _1227 * _1237;
                _1213 = as_type<int>(_1239);
                _445 = as_type<int>(_1241);
                _447 = as_type<int>(_1243);
                _1215 = true;
            }
            else
            {
                bool _1245 = _1183 >= 9.9999999747524270787835121154785e-07;
                bool _1247 = isnan(_1183);
                bool _1249 = _1245 || _1247;
                bool _1251 = isnan(9.9999999747524270787835121154785e-07);
                bool _1253 = _1249 || _1251;
                if (!_1253)
                {
                    float _1255 = _303 * _303;
                    float _1257 = fma(_305, _305, _1255);
                    float _1259 = fma(_307, _307, _1257);
                    float _1261 = sqrt(_1259);
                    bool _1263 = _1261 >= 9.9999999747524270787835121154785e-07;
                    bool _1265 = isnan(_1261);
                    bool _1267 = _1263 || _1265;
                    bool _1269 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1271 = _1267 || _1269;
                    int _1273 = as_type<int>(_395);
                    int _1275 = as_type<int>(_1261);
                    if (_1271)
                    {
                        float _1277 = rsqrt(_1259);
                        _1273 = as_type<int>(_1277);
                    }
                    int _1279 = _1273;
                    if (!_1271)
                    {
                        _1211 = 0;
                    }
                    int _1281 = _1211;
                    int _1283 = _1281;
                    if (!_1271)
                    {
                        _1275 = 897988541;
                    }
                    int _1285 = _1275;
                    int _1287 = _1279;
                    int _1289 = _1285;
                    if (_1271)
                    {
                        float _1291 = as_type<float>(_1279) * 9.9999999747524270787835121154785e-07;
                        _1197 = _1291;
                    }
                    float _1293 = _1197;
                    if (!_1271)
                    {
                        _1287 = 0;
                    }
                    int _1295 = _1287;
                    int _1297 = _1295;
                    if (_1271)
                    {
                        float _1299 = _305 * _1293;
                        _1283 = as_type<int>(_1299);
                    }
                    int _1301 = _1283;
                    _1213 = _1301;
                    if (_1271)
                    {
                        float _1303 = _303 * _1293;
                        _1289 = as_type<int>(_1303);
                    }
                    int _1305 = _1289;
                    _445 = _1305;
                    if (_1271)
                    {
                        float _1307 = _307 * _1293;
                        _1297 = as_type<int>(_1307);
                    }
                    int _1309 = _1297;
                    _447 = _1309;
                    _1215 = true;
                }
                else
                {
                    float _1311 = rsqrt(_1181);
                    float _1313 = _1311 * 9.9999999747524270787835121154785e-07;
                    float _1315 = _1099 * _1313;
                    float _1317 = _1105 * _1313;
                    float _1319 = _1123 * _1313;
                    _1213 = as_type<int>(_1315);
                    _445 = as_type<int>(_1317);
                    _447 = as_type<int>(_1319);
                    _1215 = true;
                }
            }
        }
    }
    else
    {
        float _1321 = _1183 * _1169;
        bool _1323 = _1321 >= 0.001000000047497451305389404296875;
        bool _1325 = isnan(_1321);
        bool _1327 = _1323 || _1325;
        bool _1329 = isnan(0.001000000047497451305389404296875);
        bool _1331 = _1327 || _1329;
        bool _1333 = _1321 > 0.0;
        bool _1335 = !_1331;
        bool _1337 = _1333 && _1335;
        bool _1339 = _1185 < 0.001000000047497451305389404296875;
        bool _1341 = _1339 && _1337;
        if (!_1341)
        {
            _441 = as_type<int>(_297);
        }
        int _1343 = _441;
        int _1345 = _1343;
        if (_1341)
        {
            float _1347 = _1099 * _1169;
            _331 = as_type<int>(_1347);
        }
        int _1349 = _331;
        _1213 = _1349;
        if (!_1341)
        {
            _443 = as_type<int>(_301);
        }
        int _1351 = _443;
        _447 = _1351;
        if (_1341)
        {
            float _1353 = _1105 * _1169;
            _1345 = as_type<int>(_1353);
        }
        int _1355 = _1345;
        _445 = _1355;
        if (_1341)
        {
            float _1357 = _1123 * _1169;
            _447 = as_type<int>(_1357);
        }
    }
    _1215 = false;
    int _1359 = _1213;
    int _1361 = _445;
    int _1363 = _447;
    uint _1365 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1365)] = uint(_1359);
    uint _1367 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1367)] = uint(_1361);
    uint _1369 = uint(int(uint(_1125) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1369)] = uint(_1363);
}

