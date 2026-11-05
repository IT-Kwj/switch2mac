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
    bool _2271 = false;
    float _73 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _75 = as_type<float>(gl_LocalInvocationID.x);
    float _77 = as_type<float>(gl_WorkGroupID.x);
    int _80 = as_type<int>(_77) << 5;
    int _82 = _80 + as_type<int>(_75);
    float _84 = trunc(_73);
    int _86 = int(_84);
    bool _90 = _82 >= _86;
    int _92 = 0;
    if (_90)
    {
        _92 = 0;
    }
    int _94 = _92;
    int _96 = _94;
    int _98 = _94;
    if (!_90)
    {
        int _100 = _82 << 4;
        int _102 = _100 + 12;
        uint _105 = uint(int(uint(_102) >> uint(2)));
        float _107 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_105)]);
        float _109 = trunc(_107);
        int _111 = int(_109);
        bool _113 = _111 >= 1;
        int _115 = _113 ? (-1) : 0;
        if (!_113)
        {
            _96 = 0;
        }
        int _117 = _96;
        bool _119 = !_113;
        _98 = _117;
        if (!_119)
        {
            float _121 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _123 = uint(int(uint(_102) >> uint(2)));
            float _125 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_123)]);
            float _127 = float(_111);
            float _129 = -_125;
            float _131 = _121 + _129;
            bool _133 = _131 > _127;
            int _135 = as_type<int>(_121);
            if (!_133)
            {
                bool _137 = _121 >= _125;
                bool _139 = isnan(_121);
                bool _141 = _137 || _139;
                bool _143 = isnan(_125);
                bool _145 = _141 || _143;
                _115 = _145 ? (-1) : 0;
            }
            int _147 = _115;
            if (_133)
            {
                _135 = 0;
            }
            int _149 = _135;
            _98 = _149;
            if (!_133)
            {
                int _151 = ~_147;
                int _153 = (_151 != 0) ? 0 : 1;
                _98 = _153;
            }
        }
    }
    int _155 = _98;
    int _157 = _155 & 1;
    bool _159 = _157 != 0;
    if (!_159)
    {
        return;
    }
    int _161 = _82 << 4;
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _165 = _161 + 12;
    float _167 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _169 = uint(int(uint(_165) >> uint(2)));
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_169)]);
    uint _173 = uint(int(uint(_161) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_173)]);
    int _177 = _161 + 4;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_179)]);
    int _183 = _161 + 8;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_185)]);
    uint _189 = uint(int(uint(_161) >> uint(2)));
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_189)]);
    int _193 = _161 + 4;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    float _197 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_195)]);
    int _199 = _161 + 8;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_201)]);
    uint _205 = uint(int(uint(_165) >> uint(2)));
    float _207 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_205)]);
    int _209 = as_type<int>(_163) & 512;
    bool _211 = _209 != 0;
    float _213 = 0.0;
    float _215 = 0.0;
    float _217 = 0.0;
    float _219 = 0.0;
    if (_211)
    {
        float _221 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _223 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _225 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _227 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _213 = _221;
        _215 = _223;
        _217 = _225;
        _219 = _227;
    }
    float _229 = _213;
    float _231 = _215;
    float _233 = _217;
    float _235 = _219;
    float _237 = 0.0;
    float _239 = 0.0;
    float _241 = 0.0;
    float _243 = 0.0;
    if (_211)
    {
        float _245 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _249 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _237 = _245;
        _239 = _247;
        _241 = _249;
        _243 = _251;
    }
    float _253 = _237;
    float _255 = _239;
    float _257 = _241;
    float _259 = _243;
    float _261 = 0.0;
    float _263 = 0.0;
    float _265 = 0.0;
    float _267 = 0.0;
    if (_211)
    {
        float _269 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _271 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _273 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _275 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _261 = _269;
        _263 = _271;
        _265 = _273;
        _267 = _275;
    }
    float _277 = _261;
    float _279 = _263;
    float _281 = _265;
    float _283 = _267;
    float _285 = _171 * _167;
    float _287 = _181 * _285;
    float _289 = _175 * _285;
    float _291 = _187 * _285;
    float _293 = _197 + _287;
    float _295 = _191 + _289;
    float _297 = _203 + _291;
    int _299 = as_type<int>(_163) & 1024;
    bool _301 = _299 != 0;
    float _303 = 0.0;
    float _305 = _191;
    float _307 = _203;
    int _309 = as_type<int>(_289);
    int _311 = as_type<int>(_289);
    if (!_211)
    {
        _303 = 0.0;
    }
    float _313 = _303;
    float _315 = 0.0;
    float _317 = _313;
    if (!_211)
    {
        _315 = 0.0;
    }
    float _319 = _315;
    int _321 = as_type<int>(_163) & 2048;
    bool _323 = _321 != 0;
    uint _325 = uint(int(uint(_165) >> uint(2)));
    float _327 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_325)]);
    float _329 = 0.0;
    float _331 = _319;
    if (!_211)
    {
        _329 = 0.0;
    }
    float _333 = _329;
    float _335 = _279;
    float _337 = _281;
    float _339 = _333;
    if (_211)
    {
        float _341 = _293 * _231;
        _305 = _341;
    }
    float _343 = _305;
    float _345 = _343;
    if (_211)
    {
        float _347 = _293 * _255;
        _307 = _347;
    }
    float _349 = _307;
    float _351 = _349;
    if (_211)
    {
        float _353 = fma(_295, _229, _343);
        _345 = _353;
    }
    float _355 = _345;
    float _357 = _355;
    if (_211)
    {
        float _359 = fma(_295, _253, _349);
        _351 = _359;
    }
    float _361 = _351;
    float _363 = _361;
    if (_211)
    {
        float _365 = _293 * _279;
        _335 = _365;
    }
    float _367 = _335;
    float _369 = _367;
    if (_211)
    {
        float _371 = fma(_297, _233, _355);
        _357 = _371;
    }
    float _373 = _357;
    if (_211)
    {
        float _375 = fma(_297, _257, _361);
        _363 = _375;
    }
    float _377 = _363;
    if (_211)
    {
        float _379 = fma(_295, _277, _367);
        _369 = _379;
    }
    float _381 = _369;
    if (_211)
    {
        float _383 = _235 + _373;
        _317 = _383;
    }
    float _385 = _317;
    float _387 = _385;
    if (_211)
    {
        float _389 = _259 + _377;
        _331 = _389;
    }
    float _391 = _331;
    float _393 = _391;
    if (_211)
    {
        float _395 = fma(_297, _281, _381);
        _337 = _395;
    }
    float _397 = _337;
    uint _399 = uint(int(uint(_161) >> uint(2)));
    float _401 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_399)]);
    int _403 = _161 + 4;
    uint _405 = uint(int(uint(_403) >> uint(2)));
    float _407 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_405)]);
    int _409 = _161 + 8;
    uint _411 = uint(int(uint(_409) >> uint(2)));
    float _413 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_411)]);
    if (_211)
    {
        float _415 = _283 + _397;
        _339 = _415;
    }
    float _417 = _339;
    bool _419 = !_301;
    float _421 = _417;
    int _423 = as_type<int>(_407);
    int _425 = as_type<int>(_413);
    int _427 = as_type<int>(_407);
    int _429 = as_type<int>(_413);
    if (!_419)
    {
        float _431 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _433 = uint(int(uint(_161) >> uint(2)));
        float _435 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_433)]);
        int _437 = _161 + 4;
        uint _439 = uint(int(uint(_437) >> uint(2)));
        float _441 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_439)]);
        int _443 = _161 + 8;
        uint _445 = uint(int(uint(_443) >> uint(2)));
        float _447 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_445)]);
        uint _449 = uint(int(uint(_161) >> uint(2)));
        float _451 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_449)]);
        int _453 = _161 + 4;
        uint _455 = uint(int(uint(_453) >> uint(2)));
        float _457 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_455)]);
        int _459 = _161 + 8;
        uint _461 = uint(int(uint(_459) >> uint(2)));
        float _463 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_461)]);
        uint _465 = uint(int(uint(_161) >> uint(2)));
        float _467 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_465)]);
        int _469 = _161 + 4;
        uint _471 = uint(int(uint(_469) >> uint(2)));
        float _473 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_471)]);
        int _475 = _161 + 8;
        uint _477 = uint(int(uint(_475) >> uint(2)));
        float _479 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_477)]);
        float _481 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _483 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _485 = _293 * _441;
        float _487 = _293 * _457;
        float _489 = _293 * _473;
        float _491 = fma(_295, _435, _485);
        float _493 = fma(_295, _451, _487);
        float _495 = fma(_295, _467, _489);
        float _497 = fma(_297, _447, _491);
        float _499 = fma(_297, _463, _493);
        float _501 = fma(_297, _479, _495);
        float _503 = _431 + _497;
        float _505 = _481 + _499;
        float _507 = _483 + _501;
        _387 = _503;
        _421 = _507;
        _393 = _505;
    }
    float _509 = _387;
    float _511 = _421;
    float _513 = _393;
    bool _515 = !_323;
    float _517 = _513;
    float _519 = _509;
    float _521 = _511;
    if (!_515)
    {
        uint _523 = uint(int(uint(_161) >> uint(2)));
        float _525 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_523)]);
        int _527 = _161 + 4;
        uint _529 = uint(int(uint(_527) >> uint(2)));
        float _531 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_529)]);
        int _533 = _161 + 8;
        uint _535 = uint(int(uint(_533) >> uint(2)));
        float _537 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_535)]);
        int _539 = _161 + 12;
        uint _541 = uint(int(uint(_539) >> uint(2)));
        float _543 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_541)]);
        uint _545 = uint(int(uint(_161) >> uint(2)));
        float _547 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_545)]);
        int _549 = _161 + 4;
        uint _551 = uint(int(uint(_549) >> uint(2)));
        float _553 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_551)]);
        int _555 = _161 + 8;
        uint _557 = uint(int(uint(_555) >> uint(2)));
        float _559 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_557)]);
        int _561 = _161 + 12;
        uint _563 = uint(int(uint(_561) >> uint(2)));
        float _565 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_563)]);
        uint _567 = uint(int(uint(_161) >> uint(2)));
        float _569 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_567)]);
        int _571 = _161 + 4;
        uint _573 = uint(int(uint(_571) >> uint(2)));
        float _575 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_573)]);
        int _577 = _161 + 8;
        uint _579 = uint(int(uint(_577) >> uint(2)));
        float _581 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_579)]);
        int _583 = _161 + 12;
        uint _585 = uint(int(uint(_583) >> uint(2)));
        float _587 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_585)]);
        float _589 = _293 * _531;
        float _591 = _293 * _553;
        float _593 = fma(_295, _525, _589);
        float _595 = _293 * _575;
        float _597 = fma(_295, _547, _591);
        float _599 = fma(_295, _569, _595);
        float _601 = fma(_297, _537, _593);
        float _603 = fma(_297, _559, _597);
        float _605 = fma(_297, _581, _599);
        float _607 = _601 + _543;
        float _609 = _603 + _565;
        float _611 = _605 + _587;
        _517 = _609;
        _519 = _607;
        _521 = _611;
    }
    float _613 = _517;
    float _615 = _519;
    float _617 = _521;
    float _619 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[8]);
    float _621 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[9]);
    float _623 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[10]);
    float _625 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[11]);
    float _627 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _629 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _631 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[70]);
    float _633 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _635 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _637 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _639 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _641 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _643 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    float _645 = _621 * _613;
    float _647 = fma(_619, _615, _645);
    float _649 = fma(_623, _617, _647);
    float _651 = _625 + _649;
    float _653 = -_651;
    bool _655 = _627 >= _653;
    bool _657 = isnan(_627);
    bool _659 = _655 || _657;
    bool _661 = isnan(_653);
    bool _663 = _659 || _661;
    float _665 = -_651;
    bool _667 = _629 >= _665;
    bool _669 = isnan(_629);
    bool _671 = _667 || _669;
    bool _673 = isnan(_665);
    bool _675 = _671 || _673;
    int _677 = _663 ? 0 : 1;
    int _679 = 2;
    if (_663)
    {
        _679 = 1;
    }
    int _681 = _679;
    int _683 = _681;
    if (_675)
    {
        _683 = _677;
    }
    int _685 = _683;
    int _687 = _685 << 6;
    int _689 = _687 + 96;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    float _693 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_691)]);
    int _695 = _689 + 4;
    uint _697 = uint(int(uint(_695) >> uint(2)));
    float _699 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_697)]);
    int _701 = _689 + 8;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    float _705 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_703)]);
    int _707 = _689 + 12;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    float _711 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_709)]);
    int _713 = _687 + 48;
    int _715 = _687 + 64;
    uint _717 = uint(int(uint(_713) >> uint(2)));
    float _719 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_717)]);
    int _721 = _713 + 4;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    float _725 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_723)]);
    int _727 = _713 + 8;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    float _731 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_729)]);
    int _733 = _713 + 12;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    float _737 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_735)]);
    uint _739 = uint(int(uint(_715) >> uint(2)));
    float _741 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_739)]);
    int _743 = _715 + 4;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    float _747 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_745)]);
    int _749 = _715 + 8;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    float _753 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_751)]);
    int _755 = _715 + 12;
    uint _757 = uint(int(uint(_755) >> uint(2)));
    float _759 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_757)]);
    int _761 = _687 + 80;
    float _763 = _631 + 1.0;
    float _765 = _763 + _613;
    uint _767 = uint(int(uint(_761) >> uint(2)));
    float _769 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_767)]);
    int _771 = _761 + 4;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    float _775 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_773)]);
    int _777 = _761 + 8;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    float _781 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_779)]);
    int _783 = _761 + 12;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    float _787 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_785)]);
    float _789 = _765 * _635;
    float _791 = fma(_633, _615, _789);
    float _793 = fma(_637, _617, _791);
    float _795 = _639 + _793;
    float _797 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _799 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _801 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _803 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _805 = trunc(_795);
    int _807 = int(_805);
    int _809 = ~as_type<int>(_641);
    int _811 = _807 + _809;
    int _813 = _811 + 1;
    bool _815 = _813 >= 0;
    int _817 = as_type<int>(_641);
    float _819 = as_type<float>(_807);
    if (_815)
    {
        float _821 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _817 = as_type<int>(_821);
    }
    int _823 = _817;
    float _825 = _765 * _699;
    float _827 = fma(_693, _615, _825);
    float _829 = fma(_705, _617, _827);
    float _831 = _711 + _829;
    float _833 = _765 * _725;
    float _835 = 1.0 / _831;
    float _837 = fma(_719, _615, _833);
    float _839 = _765 * _747;
    float _841 = fma(_731, _617, _837);
    float _843 = fma(_741, _615, _839);
    float _845 = _737 + _841;
    float _847 = fma(_753, _617, _843);
    float _849 = _845 * _835;
    float _851 = _759 + _847;
    bool _853 = _849 >= 0.0;
    float _855 = _851 * _835;
    bool _857 = _849 <= 1.0;
    bool _859 = _857 && _853;
    bool _861 = _855 >= 0.0;
    bool _863 = _861 && _859;
    bool _865 = _855 <= 1.0;
    bool _867 = _865 && _863;
    float _869 = _765 * _775;
    float _871 = fma(_769, _615, _869);
    float _873 = _855;
    float _875 = _837;
    float _877 = _737;
    float _879 = _769;
    float _881 = _871;
    float _883 = _787;
    if (_867)
    {
        float _885 = float(_685);
        _819 = _885;
    }
    float _887 = _819;
    float _889 = _741;
    if (_867)
    {
        float _891 = rint(_887);
        float _893 = precise::max(_891, 0.0);
        uint _895 = uint(_893);
        uint _897 = clamp(_895, 0u, 65535u);
        _889 = as_type<float>(_897);
    }
    float _899 = _889;
    float _901 = fma(_781, _617, _871);
    float _903 = _787 + _901;
    float _905 = _903 * _835;
    float _907 = _719;
    float _909 = _901;
    if (_867)
    {
        float3 _3735 = float3(_849, _855, float(as_type<int>(_899)));
        float3 _3739 = select(_3735, float3(0.0), isnan(_3735));
        float _911 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3739.xy, uint(rint(_3739.z)), _905, level(0.0));
        _907 = _911;
    }
    float _913 = _907;
    float _915 = _765 * _799;
    bool _917 = _823 <= _813;
    bool _919 = !_815;
    bool _921 = _917 || _919;
    float _923 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _925 = fma(_797, _615, _915);
    float _927 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _929 = fma(_801, _617, _925);
    float _931 = _803 + _929;
    float _933 = trunc(_931);
    int _935 = int(_933);
    int _937 = ~as_type<int>(_643);
    int _939 = _935 + _937;
    int _941 = _939 + 1;
    float _943 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    bool _945 = _941 < 0;
    bool _947 = _945 || _921;
    float _949 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _951 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _953 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    int _955 = as_type<int>(_759);
    float _957 = as_type<float>(_941);
    if (!_947)
    {
        float _959 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _955 = as_type<int>(_959);
    }
    int _961 = _955;
    bool _963 = _961 <= _941;
    bool _965 = _963 || _947;
    if (_965)
    {
        _873 = 1.0;
    }
    float _967 = _873;
    float _969 = _967;
    float _971 = _951;
    if (!_965)
    {
        float _973 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _975 = _941 * as_type<int>(_973);
        int _977 = _975 + _813;
        int _979 = _977 << 2;
        uint _981 = uint(int(uint(_977) >> uint(2)));
        int _983 = 12 & _979;
        int _985 = int(_981) << 4;
        int _987 = _985 + _983;
        int _989 = _987 + 400;
        uint _991 = uint(int(uint(_989) >> uint(2)));
        float _993 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_991)]);
        float _995 = floor(_931);
        float _997 = floor(_795);
        float _999 = -_995;
        float _1001 = _931 + _999;
        float _1003 = -_997;
        float _1005 = _795 + _1003;
        float _1007 = rint(_993);
        float _1009 = precise::max(_1007, 0.0);
        uint _1011 = uint(_1009);
        uint _1013 = clamp(_1011, 0u, 65535u);
        float3 _3897 = float3(_1005, _1001, float(int(_1013)));
        float3 _3899 = select(_3897, float3(0.0), isnan(_3897));
        float _1015 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _3899.xy, uint(rint(_3899.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _3899.xy, uint(rint(_3899.z)), level(0.0)).x;
        int _1017 = _977 << 4;
        int _1019 = _1017 + 2048;
        uint _1021 = uint(int(uint(_1019) >> uint(2)));
        float _1023 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1021)]);
        int _1025 = _1019 + 4;
        uint _1027 = uint(int(uint(_1025) >> uint(2)));
        float _1029 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1027)]);
        int _1031 = _1019 + 8;
        uint _1033 = uint(int(uint(_1031) >> uint(2)));
        float _1035 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1033)]);
        int _1037 = _1019 + 12;
        uint _1039 = uint(int(uint(_1037) >> uint(2)));
        float _1041 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1039)]);
        float _1043 = _765 * _1029;
        float _1045 = fma(_1023, _615, _1043);
        float _1047 = fma(_1035, _617, _1045);
        float _1049 = _1041 + _1047;
        float _1051 = precise::clamp(_1049, 0.0, 1.0);
        float _1053 = -_1051;
        float _1055 = _1053 + _1015;
        float _1057 = fma(_1055, 500.0, 1.5);
        float _1059 = exp2(_1057);
        float _1061 = 0.0 + _1059;
        float _1063 = precise::clamp(_1061, 0.0, 1.0);
        _969 = _1063;
        _875 = 500.0;
        _957 = as_type<float>(_1013);
        _877 = _1005;
        _879 = _1023;
        _881 = _1045;
        _909 = _1059;
        _883 = _1041;
    }
    float _1065 = _969;
    float _1067 = _875;
    float _1069 = _957;
    float _1071 = _877;
    float _1073 = _879;
    float _1075 = _881;
    float _1077 = _909;
    float _1079 = _883;
    uint _1081 = uint(int(uint(_161) >> uint(2)));
    float _1083 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1081)]);
    float _1085 = abs(_943);
    float _1087 = log2(_1085);
    float _1089 = _167 * _927;
    float _1091 = _951 * _1089;
    if (!_867)
    {
        _971 = 1.0;
    }
    float _1093 = _971;
    float _1095 = _1093;
    if (_867)
    {
        bool _1097 = _913 >= _905;
        bool _1099 = isnan(_913);
        bool _1101 = _1097 || _1099;
        bool _1103 = isnan(_905);
        bool _1105 = _1101 || _1103;
        float _1107 = float(_1105);
        _1095 = _1107;
    }
    float _1109 = _1095;
    float _1111 = -_1109;
    float _1113 = fma(_1111, _1065, 1.0);
    float _1115 = _167 * _1087;
    float _1117 = _949 * _1089;
    float _1119 = -_327;
    float _1121 = _923 + _1119;
    float _1123 = _953 * _1089;
    float _1125 = exp2(_1115);
    bool _1127 = _1121 > 0.001000000047497451305389404296875;
    bool _1129 = isnan(_1121);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan(0.001000000047497451305389404296875);
    bool _1135 = _1131 || _1133;
    float _1137 = fma(_175, _1125, _1117);
    float _1139 = fma(_181, _1125, _1091);
    float _1141 = fma(_187, _1125, _1123);
    float _1143 = -_1083;
    float _1145 = _1113 + _1143;
    float _1147 = _1113;
    float _1149 = _1141;
    if (_1135)
    {
        float _1151 = fma(_1145, 0.0500000007450580596923828125, _1083);
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = precise::max(0.0, _1153);
    float _1157 = precise::min(_1155, 0.999000012874603271484375);
    uint _1159 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1159)] = as_type<uint>(_1157);
    float _1161 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _1163 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[16]);
    float _1165 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[17]);
    float _1167 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[18]);
    float _1169 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[13]);
    int _1171 = as_type<int>(_1161) & 512;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>(_1161) & 1024;
    bool _1177 = _1175 != 0;
    float _1179 = _913;
    float _1181 = _1067;
    float _1183 = _1069;
    float _1185 = _1071;
    float _1187 = _1155;
    float _1189 = _1157;
    bool _1191 = _1177;
    bool _1193 = false;
    if (_1173)
    {
        float _1195 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1197 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1199 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1201 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1179 = _1195;
        _1181 = _1197;
        _1183 = _1199;
        _1185 = _1201;
    }
    float _1203 = _1179;
    float _1205 = _1181;
    float _1207 = _1183;
    float _1209 = _1185;
    float _1211 = _1073;
    float _1213 = _1075;
    float _1215 = _1077;
    float _1217 = _1079;
    if (_1173)
    {
        float _1219 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1221 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1223 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1225 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1211 = _1219;
        _1213 = _1221;
        _1215 = _1223;
        _1217 = _1225;
    }
    float _1227 = _1211;
    float _1229 = _1213;
    float _1231 = _1215;
    float _1233 = _1217;
    float _1235 = _1087;
    float _1237 = _1123;
    float _1239 = _1091;
    float _1241 = _1083;
    if (_1173)
    {
        float _1243 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1245 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1249 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1235 = _1243;
        _1237 = _1245;
        _1239 = _1247;
        _1241 = _1249;
    }
    float _1251 = _1235;
    float _1253 = _1237;
    float _1255 = _1239;
    float _1257 = _1241;
    int _1259 = as_type<int>(_1161) & 2048;
    bool _1261 = _1259 != 0;
    float _1263 = _1205;
    float _1265 = _1203;
    float _1267 = _1207;
    if (_1173)
    {
        float _1269 = _293 * _1205;
        _1263 = _1269;
    }
    float _1271 = _1263;
    float _1273 = _1271;
    if (_1173)
    {
        float _1275 = fma(_295, _1203, _1271);
        _1273 = _1275;
    }
    float _1277 = _1273;
    float _1279 = _1251;
    float _1281 = _1231;
    float _1283 = _1277;
    if (_1173)
    {
        float _1285 = _293 * _1229;
        _1187 = _1285;
    }
    float _1287 = _1187;
    float _1289 = _1287;
    if (_1173)
    {
        float _1291 = _293 * _1253;
        _1265 = _1291;
    }
    float _1293 = _1265;
    if (_1173)
    {
        float _1295 = fma(_295, _1227, _1287);
        _1289 = _1295;
    }
    float _1297 = _1289;
    float _1299 = _1297;
    if (_1173)
    {
        float _1301 = fma(_295, _1251, _1293);
        _1279 = _1301;
    }
    float _1303 = _1279;
    float _1305 = _1303;
    if (_1173)
    {
        float _1307 = fma(_297, _1231, _1297);
        _1281 = _1307;
    }
    float _1309 = _1281;
    if (_1173)
    {
        float _1311 = fma(_297, _1207, _1277);
        _1267 = _1311;
    }
    float _1313 = _1267;
    float _1315 = _1313;
    if (_1173)
    {
        float _1317 = fma(_297, _1255, _1303);
        _1305 = _1317;
    }
    float _1319 = _1305;
    if (!_1173)
    {
        _1299 = 0.0;
        _1189 = 0.0;
    }
    float _1321 = _1299;
    float _1323 = _1189;
    float _1325 = _1321;
    float _1327 = _1323;
    if (!_1173)
    {
        _1283 = 0.0;
    }
    float _1329 = _1283;
    float _1331 = _1329;
    if (_1173)
    {
        float _1333 = _1233 + _1309;
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = _1335;
    if (_1173)
    {
        float _1339 = _1209 + _1313;
        _1325 = _1339;
    }
    float _1341 = _1325;
    float _1343 = _1341;
    if (_1173)
    {
        float _1345 = _1257 + _1319;
        _1327 = _1345;
    }
    float _1347 = _1327;
    bool _1349 = !_1177;
    float _1351 = _1347;
    if (!_1349)
    {
        float _1353 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1355 = uint(int(uint(_161) >> uint(2)));
        float _1357 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1355)]);
        int _1359 = _161 + 4;
        uint _1361 = uint(int(uint(_1359) >> uint(2)));
        float _1363 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1361)]);
        int _1365 = _161 + 8;
        uint _1367 = uint(int(uint(_1365) >> uint(2)));
        float _1369 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1367)]);
        uint _1371 = uint(int(uint(_161) >> uint(2)));
        float _1373 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1371)]);
        int _1375 = _161 + 4;
        uint _1377 = uint(int(uint(_1375) >> uint(2)));
        float _1379 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1377)]);
        int _1381 = _161 + 8;
        uint _1383 = uint(int(uint(_1381) >> uint(2)));
        float _1385 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1383)]);
        uint _1387 = uint(int(uint(_161) >> uint(2)));
        float _1389 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1387)]);
        int _1391 = _161 + 4;
        uint _1393 = uint(int(uint(_1391) >> uint(2)));
        float _1395 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1393)]);
        int _1397 = _161 + 8;
        uint _1399 = uint(int(uint(_1397) >> uint(2)));
        float _1401 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1399)]);
        float _1403 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1405 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1407 = _293 * _1363;
        float _1409 = _293 * _1379;
        float _1411 = _293 * _1395;
        float _1413 = fma(_295, _1357, _1407);
        float _1415 = fma(_295, _1373, _1409);
        float _1417 = fma(_295, _1389, _1411);
        float _1419 = fma(_297, _1369, _1413);
        float _1421 = fma(_297, _1385, _1415);
        float _1423 = fma(_297, _1401, _1417);
        float _1425 = _1353 + _1419;
        float _1427 = _1403 + _1421;
        float _1429 = _1405 + _1423;
        _1337 = _1425;
        _1343 = _1427;
        _1351 = _1429;
    }
    float _1431 = _1337;
    float _1433 = _1343;
    float _1435 = _1351;
    bool _1437 = !_1261;
    float _1439 = _1433;
    float _1441 = _1431;
    float _1443 = _1435;
    if (!_1437)
    {
        uint _1445 = uint(int(uint(_161) >> uint(2)));
        float _1447 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1445)]);
        int _1449 = _161 + 4;
        uint _1451 = uint(int(uint(_1449) >> uint(2)));
        float _1453 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1451)]);
        int _1455 = _161 + 8;
        uint _1457 = uint(int(uint(_1455) >> uint(2)));
        float _1459 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1457)]);
        int _1461 = _161 + 12;
        uint _1463 = uint(int(uint(_1461) >> uint(2)));
        float _1465 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1463)]);
        uint _1467 = uint(int(uint(_161) >> uint(2)));
        float _1469 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1467)]);
        int _1471 = _161 + 4;
        uint _1473 = uint(int(uint(_1471) >> uint(2)));
        float _1475 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1473)]);
        int _1477 = _161 + 8;
        uint _1479 = uint(int(uint(_1477) >> uint(2)));
        float _1481 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1479)]);
        int _1483 = _161 + 12;
        uint _1485 = uint(int(uint(_1483) >> uint(2)));
        float _1487 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1485)]);
        uint _1489 = uint(int(uint(_161) >> uint(2)));
        float _1491 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1489)]);
        int _1493 = _161 + 4;
        uint _1495 = uint(int(uint(_1493) >> uint(2)));
        float _1497 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1495)]);
        int _1499 = _161 + 8;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        float _1503 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1501)]);
        int _1505 = _161 + 12;
        uint _1507 = uint(int(uint(_1505) >> uint(2)));
        float _1509 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1507)]);
        float _1511 = _293 * _1453;
        float _1513 = _293 * _1475;
        float _1515 = fma(_295, _1447, _1511);
        float _1517 = _293 * _1497;
        float _1519 = fma(_295, _1469, _1513);
        float _1521 = fma(_295, _1491, _1517);
        float _1523 = fma(_297, _1459, _1515);
        float _1525 = fma(_297, _1481, _1519);
        float _1527 = fma(_297, _1503, _1521);
        float _1529 = _1523 + _1465;
        float _1531 = _1525 + _1487;
        float _1533 = _1527 + _1509;
        _1439 = _1531;
        _1441 = _1529;
        _1443 = _1533;
        _1315 = _1525;
    }
    float _1535 = _1439;
    float _1537 = _1441;
    float _1539 = _1443;
    float _1541 = _1315;
    float _1543 = -_1535;
    float _1545 = _1165 + _1543;
    float _1547 = -_1537;
    float _1549 = _1163 + _1547;
    float _1551 = -_1539;
    float _1553 = _1167 + _1551;
    float _1555 = _1545 * _1545;
    float _1557 = fma(_1549, _1549, _1555);
    float _1559 = fma(_1553, _1553, _1557);
    float _1561 = sqrt(_1559);
    float _1563 = _1549;
    int _1565 = as_type<int>(_1561);
    float _1567 = 0.0;
    float _1569 = 0.0;
    float _1571 = 0.0;
    if (!_1135)
    {
        bool _1573 = _1561 > _1169;
        float _1575 = float(_1573);
        _1563 = _1575;
    }
    float _1577 = _1563;
    bool _1579 = !_1135;
    float _1581 = _1577;
    if (!_1579)
    {
        float _1583 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[20]);
        float _1585 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[21]);
        float _1587 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[22]);
        float _1589 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[24]);
        float _1591 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[25]);
        float _1593 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[26]);
        float _1595 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[28]);
        float _1597 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[29]);
        float _1599 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[30]);
        uint _1601 = uint(int(uint(_165) >> uint(2)));
        float _1603 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1601)]);
        bool _1605 = _1561 > _1169;
        float _1607 = -_1535;
        float _1609 = _1585 + _1607;
        float _1611 = -_1537;
        float _1613 = _1583 + _1611;
        float _1615 = -_1539;
        float _1617 = _1587 + _1615;
        float _1619 = -_1535;
        float _1621 = _1591 + _1619;
        float _1623 = _1609 * _1609;
        float _1625 = -_1537;
        float _1627 = _1589 + _1625;
        float _1629 = -_1539;
        float _1631 = _1593 + _1629;
        float _1633 = -_1535;
        float _1635 = _1597 + _1633;
        float _1637 = _1621 * _1621;
        float _1639 = -_1537;
        float _1641 = _1595 + _1639;
        float _1643 = fma(_1613, _1613, _1623);
        float _1645 = _1635 * _1635;
        float _1647 = fma(_1627, _1627, _1637);
        float _1649 = -_1539;
        float _1651 = _1599 + _1649;
        float _1653 = fma(_1617, _1617, _1643);
        float _1655 = fma(_1641, _1641, _1645);
        float _1657 = fma(_1631, _1631, _1647);
        float _1659 = _1535;
        int _1661 = as_type<int>(_1657);
        int _1663 = as_type<int>(_1631);
        if (!_1605)
        {
            float _1665 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[12]);
            _1659 = _1665;
        }
        float _1667 = _1659;
        float _1669 = fma(_1651, _1651, _1655);
        float _1671 = sqrt(_1653);
        float _1673 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[14]);
        float _1675 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _1677 = sqrt(_1657);
        float _1679 = sqrt(_1669);
        bool _1681 = _1671 > _1169;
        bool _1683 = _1677 > _1169;
        float _1685 = _1541;
        if (!_1681)
        {
            float _1687 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[12]);
            _1685 = _1687;
        }
        float _1689 = _1685;
        bool _1691 = _1679 > _1169;
        float _1693 = _1613;
        if (!_1683)
        {
            float _1695 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[12]);
            _1693 = _1695;
        }
        float _1697 = _1693;
        float _1699 = _1617;
        if (!_1691)
        {
            float _1701 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[12]);
            _1699 = _1701;
        }
        float _1703 = _1699;
        int _1705 = as_type<int>(_1603) << 24;
        int _1707 = _1705 >> 24;
        float _1709 = float(_1707);
        float _1711 = _1709 * 0.0078740157186985015869140625;
        float _1713 = precise::min(_1711, 1.0);
        float _1715 = precise::max(_1713, -1.0);
        int _1717 = as_type<int>(_1603) << 16;
        int _1719 = as_type<int>(_1603) << 8;
        bool _1721 = _1715 > 0.0;
        bool _1723 = _1721 || _1605;
        int _1725 = _1717 >> 24;
        int _1727 = _1719 >> 24;
        int _1729 = _1725;
        if (!_1605)
        {
            bool _1731 = _1715 >= 0.0;
            bool _1733 = isnan(_1715);
            bool _1735 = _1731 || _1733;
            bool _1737 = isnan(0.0);
            bool _1739 = _1735 || _1737;
            _1191 = _1739;
        }
        bool _1741 = _1191;
        float _1743 = float(_1725);
        int _1745 = as_type<int>(_1603) >> 24;
        float _1747 = float(_1727);
        float _1749 = _1743 * 0.0078740157186985015869140625;
        float _1751 = _1743;
        bool _1753 = _1741;
        if (!_1605)
        {
            int _1755 = _1741 ? 0 : 1;
            _1661 = _1755;
        }
        int _1757 = _1661;
        float _1759 = float(_1745);
        float _1761 = _1747 * 0.0078740157186985015869140625;
        if (!_1605)
        {
            int _1763 = ~_1757;
            int _1765 = _1763 + 1;
            int _1767 = _1765 + 1;
            _1729 = _1767;
        }
        int _1769 = _1729;
        int _1771 = _1769;
        if (!_1723)
        {
            int _1773 = ~_1757;
            int _1775 = _1773 + 1;
            _1771 = _1775;
        }
        int _1777 = _1771;
        float _1779 = _1759 * 0.0078740157186985015869140625;
        float _1781 = precise::min(_1749, 1.0);
        int _1783 = _1777;
        int _1785 = as_type<int>(_1781);
        if (!_1605)
        {
            float _1787 = float(_1777);
            _1783 = as_type<int>(_1787);
        }
        int _1789 = _1783;
        float _1791 = precise::min(_1779, 1.0);
        int _1793 = _1789;
        int _1795 = as_type<int>(_1791);
        if (_1605)
        {
            _1751 = 1.0;
        }
        float _1797 = _1751;
        float _1799 = precise::max(_1791, -1.0);
        float _1801 = _1797;
        if (!_1605)
        {
            bool _1803 = _1561 >= _1667;
            bool _1805 = isnan(_1561);
            bool _1807 = _1803 || _1805;
            bool _1809 = isnan(_1667);
            bool _1811 = _1807 || _1809;
            _1753 = _1811;
        }
        bool _1813 = _1753;
        float _1815 = precise::min(_1761, 1.0);
        float _1817 = precise::max(_1781, -1.0);
        bool _1819 = _1813;
        int _1821 = as_type<int>(_1815);
        if (!_1605)
        {
            float _1823 = _1813 ? as_type<float>(_1789) : (-1.0);
            _1801 = _1823;
        }
        float _1825 = _1801;
        float _1827 = precise::max(_1815, -1.0);
        if (!_1681)
        {
            bool _1829 = _1817 >= 0.0;
            bool _1831 = isnan(_1817);
            bool _1833 = _1829 || _1831;
            bool _1835 = isnan(0.0);
            bool _1837 = _1833 || _1835;
            _1819 = _1837;
        }
        bool _1839 = _1819;
        if (!_1683)
        {
            bool _1841 = _1827 >= 0.0;
            bool _1843 = isnan(_1827);
            bool _1845 = _1841 || _1843;
            bool _1847 = isnan(0.0);
            bool _1849 = _1845 || _1847;
            _1193 = _1849;
        }
        bool _1851 = _1193;
        bool _1853 = _1851;
        if (!_1681)
        {
            int _1855 = _1839 ? 0 : 1;
            _1821 = _1855;
        }
        int _1857 = _1821;
        bool _1859 = _1817 > 0.0;
        bool _1861 = _1859 || _1681;
        bool _1863 = _1827 > 0.0;
        bool _1865 = _1863 || _1683;
        bool _1867 = _1799 > 0.0;
        bool _1869 = _1867 || _1691;
        bool _1871 = _1861;
        bool _1873 = _1865;
        bool _1875 = _1869;
        float _1877 = as_type<float>(_1857);
        if (!_1683)
        {
            int _1879 = _1851 ? 0 : 1;
            _1565 = _1879;
        }
        int _1881 = _1565;
        if (!_1691)
        {
            bool _1883 = _1799 >= 0.0;
            bool _1885 = isnan(_1799);
            bool _1887 = _1883 || _1885;
            bool _1889 = isnan(0.0);
            bool _1891 = _1887 || _1889;
            _1853 = _1891;
        }
        bool _1893 = _1853;
        float _1895 = 1.0 / _1673;
        float _1897 = _1673;
        if (!_1691)
        {
            int _1899 = _1893 ? 0 : 1;
            _1793 = _1899;
        }
        int _1901 = _1793;
        float _1903 = as_type<float>(_1901);
        if (!_1681)
        {
            int _1905 = ~_1857;
            int _1907 = _1905 + 1;
            int _1909 = _1907 + 1;
            _1785 = _1909;
        }
        int _1911 = _1785;
        int _1913 = _1911;
        if (!_1683)
        {
            int _1915 = ~_1881;
            int _1917 = _1915 + 1;
            int _1919 = _1917 + 1;
            _1663 = _1919;
        }
        int _1921 = _1663;
        int _1923 = _1921;
        if (!_1691)
        {
            int _1925 = ~_1901;
            int _1927 = _1925 + 1;
            int _1929 = _1927 + 1;
            _1795 = _1929;
        }
        int _1931 = _1795;
        int _1933 = _1931;
        if (!_1861)
        {
            int _1935 = ~_1857;
            int _1937 = _1935 + 1;
            _1913 = _1937;
        }
        int _1939 = _1913;
        int _1941 = _1939;
        if (!_1865)
        {
            int _1943 = ~_1881;
            int _1945 = _1943 + 1;
            _1923 = _1945;
        }
        int _1947 = _1923;
        int _1949 = _1947;
        if (!_1869)
        {
            int _1951 = ~_1901;
            int _1953 = _1951 + 1;
            _1933 = _1953;
        }
        int _1955 = _1933;
        int _1957 = _1955;
        if (!_1681)
        {
            bool _1959 = _1671 >= _1689;
            bool _1961 = isnan(_1671);
            bool _1963 = _1959 || _1961;
            bool _1965 = isnan(_1689);
            bool _1967 = _1963 || _1965;
            _1871 = _1967;
        }
        bool _1969 = _1871;
        if (!_1683)
        {
            bool _1971 = _1677 >= _1697;
            bool _1973 = isnan(_1677);
            bool _1975 = _1971 || _1973;
            bool _1977 = isnan(_1697);
            bool _1979 = _1975 || _1977;
            _1873 = _1979;
        }
        bool _1981 = _1873;
        if (!_1681)
        {
            float _1983 = float(_1939);
            _1941 = as_type<int>(_1983);
        }
        int _1985 = _1941;
        if (!_1691)
        {
            bool _1987 = _1679 >= _1703;
            bool _1989 = isnan(_1679);
            bool _1991 = _1987 || _1989;
            bool _1993 = isnan(_1703);
            bool _1995 = _1991 || _1993;
            _1875 = _1995;
        }
        bool _1997 = _1875;
        if (!_1683)
        {
            float _1999 = float(_1947);
            _1949 = as_type<int>(_1999);
        }
        int _2001 = _1949;
        if (!_1691)
        {
            float _2003 = float(_1955);
            _1957 = as_type<int>(_2003);
        }
        int _2005 = _1957;
        if (_1681)
        {
            _1897 = 1.0;
        }
        float _2007 = _1897;
        float _2009 = _2007;
        if (_1683)
        {
            _1877 = 1.0;
        }
        float _2011 = _1877;
        float _2013 = _2011;
        if (_1691)
        {
            _1903 = 1.0;
        }
        float _2015 = _1903;
        float _2017 = _1675 * _1895;
        float _2019 = _2015;
        if (!_1681)
        {
            float _2021 = _1969 ? as_type<float>(_1985) : (-1.0);
            _2009 = _2021;
        }
        float _2023 = _2009;
        if (!_1683)
        {
            float _2025 = _1981 ? as_type<float>(_2001) : (-1.0);
            _2013 = _2025;
        }
        float _2027 = _2013;
        if (!_1691)
        {
            float _2029 = _1997 ? as_type<float>(_2005) : (-1.0);
            _2019 = _2029;
        }
        float _2031 = _2019;
        float _2033 = abs(_1715);
        float _2035 = fma(_2017, _1825, _2033);
        float _2037 = precise::clamp(_2035, 0.0, 1.0);
        float _2039 = abs(_1817);
        float _2041 = fma(_2017, _2023, _2039);
        float _2043 = precise::clamp(_2041, 0.0, 1.0);
        float _2045 = abs(_1827);
        float _2047 = fma(_2017, _2027, _2045);
        float _2049 = precise::clamp(_2047, 0.0, 1.0);
        float _2051 = abs(_1799);
        float _2053 = fma(_2017, _2031, _2051);
        float _2055 = precise::clamp(_2053, 0.0, 1.0);
        float _2057 = _2037 * _1825;
        float _2059 = _2043 * _2023;
        float _2061 = _2049 * _2027;
        float _2063 = _2055 * _2031;
        _1581 = _2057;
        _1567 = _2059;
        _1569 = _2061;
        _1571 = _2063;
    }
    float _2065 = _1581;
    float _2067 = _1567;
    float _2069 = _1569;
    float _2071 = _1571;
    float _2073 = precise::min(_2065, 1.0);
    float _2075 = precise::max(_2073, -1.0);
    float _2077 = precise::min(_2067, 1.0);
    float _2079 = _2075 * 127.0;
    float _2081 = precise::max(_2077, -1.0);
    float _2083 = precise::min(_2069, 1.0);
    float _2085 = precise::min(_2071, 1.0);
    float _2087 = _2081 * 127.0;
    float _2089 = precise::max(_2083, -1.0);
    float _2091 = rint(_2079);
    int _2093 = int(_2091);
    float _2095 = precise::max(_2085, -1.0);
    float _2097 = _2089 * 127.0;
    float _2099 = _2095 * 127.0;
    float _2101 = rint(_2087);
    int _2103 = int(_2101);
    float _2105 = rint(_2097);
    int _2107 = int(_2105);
    uint _2109 = extract_bits(uint(_2093), 0u, 8u);
    int _2111 = int(_2109) & 255;
    float _2113 = rint(_2099);
    int _2115 = int(_2113);
    uint _2117 = extract_bits(uint(_2111), 0u, 8u);
    int _2119 = int(_2117) & 255;
    uint _2121 = extract_bits(uint(_2103), 0u, 8u);
    int _2123 = int(_2121) & 255;
    int _2125 = _2123 << 8;
    int _2127 = _2119 | _2125;
    uint _2129 = extract_bits(uint(_2111), 16u, 8u);
    int _2131 = int(_2129) & 255;
    int _2133 = _2131 << 16;
    int _2135 = _2127 | _2133;
    uint _2137 = extract_bits(uint(_2111), 24u, 8u);
    int _2139 = int(_2137) & 255;
    int _2141 = _2139 << 24;
    int _2143 = _2135 | _2141;
    int _2145 = _161 + 4;
    uint _2147 = extract_bits(uint(_2143), 0u, 8u);
    int _2149 = int(_2147) & 255;
    uint _2151 = extract_bits(uint(_2143), 8u, 8u);
    int _2153 = int(_2151) & 255;
    int _2155 = _2153 << 8;
    int _2157 = _2149 | _2155;
    uint _2159 = extract_bits(uint(_2107), 0u, 8u);
    int _2161 = int(_2159) & 255;
    int _2163 = _2161 << 16;
    int _2165 = _2157 | _2163;
    uint _2167 = extract_bits(uint(_2143), 24u, 8u);
    int _2169 = int(_2167) & 255;
    int _2171 = _2169 << 24;
    int _2173 = _2165 | _2171;
    int _2175 = _161 + 8;
    uint _2177 = extract_bits(uint(_2173), 0u, 8u);
    int _2179 = int(_2177) & 255;
    uint _2181 = extract_bits(uint(_2173), 8u, 8u);
    int _2183 = int(_2181) & 255;
    int _2185 = _2183 << 8;
    int _2187 = _2179 | _2185;
    uint _2189 = extract_bits(uint(_2173), 16u, 8u);
    int _2191 = int(_2189) & 255;
    int _2193 = _2191 << 16;
    int _2195 = _2187 | _2193;
    uint _2197 = extract_bits(uint(_2115), 0u, 8u);
    int _2199 = int(_2197) & 255;
    int _2201 = _2199 << 24;
    int _2203 = _2195 | _2201;
    uint _2205 = uint(int(uint(_165) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_2205)] = uint(_2203);
    uint _2207 = uint(int(uint(_165) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2207)] = as_type<uint>(_207);
    uint _2209 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2209)] = as_type<uint>(_295);
    uint _2211 = uint(int(uint(_2145) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2211)] = as_type<uint>(_293);
    uint _2213 = uint(int(uint(_2175) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2213)] = as_type<uint>(_297);
    uint _2215 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2215)] = as_type<uint>(_1137);
    uint _2217 = uint(int(uint(_2145) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2217)] = as_type<uint>(_1139);
    uint _2219 = uint(int(uint(_2175) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2219)] = as_type<uint>(_1141);
    uint _2221 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2221)] = as_type<uint>(_289);
    uint _2223 = uint(int(uint(_2145) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2223)] = as_type<uint>(_287);
    uint _2225 = uint(int(uint(_2175) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2225)] = as_type<uint>(_291);
    float _2227 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2229 = _287 * _287;
    float _2231 = _1139 * _1139;
    float _2233 = fma(_289, _289, _2229);
    float _2235 = fma(_1137, _1137, _2231);
    float _2237 = fma(_291, _291, _2233);
    float _2239 = fma(_1141, _1141, _2235);
    float _2241 = sqrt(_2239);
    float _2243 = sqrt(_2237);
    bool _2245 = _2243 >= 9.9999999747524270787835121154785e-07;
    bool _2247 = isnan(_2243);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan(9.9999999747524270787835121154785e-07);
    bool _2253 = _2249 || _2251;
    int _2269;
    if (!_2253)
    {
        bool _2255 = _923 != _327;
        bool _2257 = isnan(_923);
        bool _2259 = _2255 || _2257;
        bool _2261 = isnan(_327);
        bool _2263 = _2259 || _2261;
        if (_2263)
        {
            _309 = as_type<int>(_401);
        }
        int _2265 = _309;
        int _2267 = _2265;
        _2269 = _2265;
        _2271 = _2263;
        if (!_2271)
        {
            float _2273 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2275 = _2273 > 0.0;
            bool _2277 = !_2275;
            if (!_2277)
            {
                float _2279 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2281 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2283 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2285 = _2281 * _2281;
                float _2287 = fma(_2279, _2279, _2285);
                float _2289 = fma(_2283, _2283, _2287);
                float _2291 = rsqrt(_2289);
                float _2293 = _2291 * 9.9999999747524270787835121154785e-07;
                float _2295 = _2279 * _2293;
                float _2297 = _2281 * _2293;
                float _2299 = _2283 * _2293;
                _2269 = as_type<int>(_2295);
                _427 = as_type<int>(_2297);
                _429 = as_type<int>(_2299);
                _2271 = true;
            }
            else
            {
                bool _2301 = _2241 >= 9.9999999747524270787835121154785e-07;
                bool _2303 = isnan(_2241);
                bool _2305 = _2301 || _2303;
                bool _2307 = isnan(9.9999999747524270787835121154785e-07);
                bool _2309 = _2305 || _2307;
                if (!_2309)
                {
                    float _2311 = _293 * _293;
                    float _2313 = fma(_295, _295, _2311);
                    float _2315 = fma(_297, _297, _2313);
                    float _2317 = sqrt(_2315);
                    bool _2319 = _2317 >= 9.9999999747524270787835121154785e-07;
                    bool _2321 = isnan(_2317);
                    bool _2323 = _2319 || _2321;
                    bool _2325 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2327 = _2323 || _2325;
                    int _2329 = as_type<int>(_413);
                    int _2331 = as_type<int>(_2317);
                    if (_2327)
                    {
                        float _2333 = rsqrt(_2315);
                        _2329 = as_type<int>(_2333);
                    }
                    int _2335 = _2329;
                    if (!_2327)
                    {
                        _2267 = 0;
                    }
                    int _2337 = _2267;
                    int _2339 = _2337;
                    if (!_2327)
                    {
                        _2331 = 897988541;
                    }
                    int _2341 = _2331;
                    int _2343 = _2335;
                    int _2345 = _2341;
                    if (_2327)
                    {
                        float _2347 = as_type<float>(_2335) * 9.9999999747524270787835121154785e-07;
                        _1149 = _2347;
                    }
                    float _2349 = _1149;
                    if (!_2327)
                    {
                        _2343 = 0;
                    }
                    int _2351 = _2343;
                    int _2353 = _2351;
                    if (_2327)
                    {
                        float _2355 = _295 * _2349;
                        _2339 = as_type<int>(_2355);
                    }
                    int _2357 = _2339;
                    _2269 = _2357;
                    if (_2327)
                    {
                        float _2359 = _293 * _2349;
                        _2345 = as_type<int>(_2359);
                    }
                    int _2361 = _2345;
                    _427 = _2361;
                    if (_2327)
                    {
                        float _2363 = _297 * _2349;
                        _2353 = as_type<int>(_2363);
                    }
                    int _2365 = _2353;
                    _429 = _2365;
                    _2271 = true;
                }
                else
                {
                    float _2367 = rsqrt(_2239);
                    float _2369 = _2367 * 9.9999999747524270787835121154785e-07;
                    float _2371 = _1137 * _2369;
                    float _2373 = _1139 * _2369;
                    float _2375 = _1141 * _2369;
                    _2269 = as_type<int>(_2371);
                    _427 = as_type<int>(_2373);
                    _429 = as_type<int>(_2375);
                    _2271 = true;
                }
            }
        }
    }
    else
    {
        float _2377 = _2241 * _2227;
        bool _2379 = _2377 >= 0.001000000047497451305389404296875;
        bool _2381 = isnan(_2377);
        bool _2383 = _2379 || _2381;
        bool _2385 = isnan(0.001000000047497451305389404296875);
        bool _2387 = _2383 || _2385;
        bool _2389 = _2377 > 0.0;
        bool _2391 = !_2387;
        bool _2393 = _2389 && _2391;
        bool _2395 = _2243 < 0.001000000047497451305389404296875;
        bool _2397 = _2395 && _2393;
        if (!_2397)
        {
            _423 = as_type<int>(_287);
        }
        int _2399 = _423;
        int _2401 = _2399;
        if (_2397)
        {
            float _2403 = _1137 * _2227;
            _311 = as_type<int>(_2403);
        }
        int _2405 = _311;
        _2269 = _2405;
        if (!_2397)
        {
            _425 = as_type<int>(_291);
        }
        int _2407 = _425;
        _429 = _2407;
        if (_2397)
        {
            float _2409 = _1139 * _2227;
            _2401 = as_type<int>(_2409);
        }
        int _2411 = _2401;
        _427 = _2411;
        if (_2397)
        {
            float _2413 = _1141 * _2227;
            _429 = as_type<int>(_2413);
        }
    }
    _2271 = false;
    int _2415 = _2269;
    int _2417 = _427;
    int _2419 = _429;
    uint _2421 = uint(int(uint(_161) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2421)] = uint(_2415);
    uint _2423 = uint(int(uint(_2145) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2423)] = uint(_2417);
    uint _2425 = uint(int(uint(_2175) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2425)] = uint(_2419);
}

