#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>(in.m_36.y);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_39.x;
    float _63 = in.m_39.y;
    float _65 = in.m_39.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    int _76 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _78 = _76 + as_type<int>(_55);
    int _80 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _82 = _80 + as_type<int>(_57);
    int _84 = _78 * 48;
    int _86 = _82 * 48;
    int _88 = _84 + 16;
    int _90 = _86 + 16;
    int _92 = _86 + 32;
    int _94 = _86 + 48;
    uint _97 = uint(int(uint(_88) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_97)];
    float _99 = as_type<float>(_dmw0.x);
    int _101 = _88 + 4;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw0.y);
    int _107 = _88 + 8;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.z);
    int _113 = _88 + 12;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw0.w);
    int _119 = _84 + 32;
    int _121 = _84 + 48;
    uint _123 = uint(int(uint(_90) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw3.x);
    int _127 = _90 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw3.y);
    int _133 = _90 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw3.z);
    int _139 = _90 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw3.w);
    uint _145 = uint(int(uint(_92) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_145)];
    float _147 = as_type<float>(_dmw4.x);
    int _149 = _92 + 4;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>(_dmw4.y);
    int _155 = _92 + 8;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    float _159 = as_type<float>(_dmw4.z);
    int _161 = _92 + 12;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    float _165 = as_type<float>(_dmw4.w);
    uint _167 = uint(int(uint(_94) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_167)];
    float _169 = as_type<float>(_dmw5.x);
    int _171 = _94 + 4;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>(_dmw5.y);
    int _177 = _94 + 8;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>(_dmw5.z);
    int _183 = _94 + 12;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>(_dmw5.w);
    uint _189 = uint(int(uint(_119) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_189)];
    float _191 = as_type<float>(_dmw1.x);
    int _193 = _119 + 4;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    float _197 = as_type<float>(_dmw1.y);
    int _199 = _119 + 8;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>(_dmw1.z);
    int _205 = _119 + 12;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>(_dmw1.w);
    uint _211 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_211)];
    float _213 = as_type<float>(_dmw2.x);
    int _215 = _121 + 4;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    float _219 = as_type<float>(_dmw2.y);
    int _221 = _121 + 8;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>(_dmw2.z);
    int _227 = _121 + 12;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>(_dmw2.w);
    float _233 = _69 * _69;
    float _235 = fma(_73, _73, _233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _237;
    float _241 = fma(_239, _239, _235);
    float _243 = in.m_41.x;
    float _245 = in.m_41.y;
    float _247 = sqrt(_241);
    bool _251 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _259 = _255 || _257;
    float _261 = _105 * _63;
    float _263 = _131 * _63;
    float _265 = _153 * _63;
    float _267 = fma(_125, _61, _263);
    float _269 = _175 * _63;
    float _271 = fma(_147, _61, _265);
    float _273 = _197 * _63;
    float _275 = fma(_169, _61, _269);
    float _277 = _219 * _63;
    float _279 = fma(_99, _61, _261);
    float _281 = fma(_191, _61, _273);
    float _283 = fma(_137, _65, _267);
    float _285 = fma(_159, _65, _271);
    float _287 = fma(_213, _61, _277);
    float _289 = fma(_181, _65, _275);
    float _291 = fma(_111, _65, _279);
    float _293 = fma(_203, _65, _281);
    float _295 = _143 + _283;
    float _297 = _165 + _285;
    float _299 = fma(_225, _65, _287);
    float _301 = _187 + _289;
    float _303 = _117 + _291;
    float _305 = _209 + _293;
    float _307 = _295 * _245;
    float _309 = _297 * _245;
    float _311 = _231 + _299;
    float _313 = _301 * _245;
    float _315 = fma(_303, _243, _307);
    float _317 = fma(_305, _243, _309);
    float _319 = _279;
    if (!_259)
    {
        _319 = 1.0;
    }
    float _321 = _319;
    float _323 = fma(_311, _243, _313);
    bool _325 = !_259;
    float _327 = _321;
    if (!_325)
    {
        bool _329 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _331 = isnan(_247);
        bool _333 = _329 || _331;
        bool _335 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _337 = _333 || _335;
        if (!_337)
        {
            float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _341 = _247 + _339;
            float _343 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _345 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _343;
            float _347 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _349 = _347 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _351 = 1.0 / _345;
            float _353 = _341 * _351;
            float _355 = fma(_353, _349, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _327 = _355;
            _357 = true;
        }
        else
        {
            bool _359 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _361 = isnan(_247);
            bool _363 = _359 || _361;
            bool _365 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _367 = _363 || _365;
            if (!_367)
            {
                float _369 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _371 = _247 + _369;
                float _373 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _375 = _373 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _377 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _379 = _377 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _381 = 1.0 / _375;
                float _383 = _371 * _381;
                float _385 = fma(_383, _379, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _327 = _385;
                _357 = true;
            }
            else
            {
                _327 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _357 = false;
    float _387 = _327;
    float _389 = -(*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[26].z + _389;
    float _393 = -(*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[26].y + _393;
    float _397 = -(*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[26].x + _397;
    float _401 = _391 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _403 = _395 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _405 = _399 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _407 = -_401;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[2].y, _407);
    float _411 = -_403;
    float _413 = fma(_391, (*spvDescriptorSet0.vp_c7)._m0[1].y, _411);
    float _415 = -_405;
    float _417 = fma(_395, (*spvDescriptorSet0.vp_c7)._m0[0].y, _415);
    float _419 = _409 * _409;
    float _421 = _413 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _423 = _409 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _425 = _417 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _427 = fma(_413, _413, _419);
    float _429 = -_421;
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c7)._m0[0].y, _429);
    float _433 = -_423;
    float _435 = fma(_413, (*spvDescriptorSet0.vp_c7)._m0[1].y, _433);
    float _437 = -_425;
    float _439 = fma(_409, (*spvDescriptorSet0.vp_c7)._m0[2].y, _437);
    float _441 = fma(_417, _417, _427);
    float _443 = _431 * _431;
    float _445 = 1.0 / _441;
    float _447 = fma(_439, _439, _443);
    float _449 = fma(_435, _435, _447);
    float _451 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _453 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _451);
    float _455 = 1.0 / _449;
    float _457 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _459 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _453);
    float _461 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _457);
    float _463 = _459 * _445;
    float _465 = _387 + (-1.0);
    float _467 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _469 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _461);
    float _471 = sqrt(_463);
    float _473 = _469 * _455;
    float _475 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _477 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _479 = fma(_317, _387, _475);
    float _481 = sqrt(_473);
    float _483 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _485 = fma(_315, _387, _477);
    float _487 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _489 = _479 * _467;
    float _491 = fma(_417, _471, 9.9999997473787516355514526367188e-06);
    float _493 = fma(_323, _387, _483);
    float _495 = fma(_413, _471, 9.9999997473787516355514526367188e-06);
    float _497 = _479 * _487;
    float _499 = fma(_485, _491, _489);
    float _501 = fma(_409, _471, 9.9999997473787516355514526367188e-06);
    float _503 = fma(_485, _495, _497);
    float _505 = fma(_435, _481, 9.9999997473787516355514526367188e-06);
    float _507 = fma(_439, _481, 9.9999997473787516355514526367188e-06);
    float _509 = fma(_431, _481, 9.9999997473787516355514526367188e-06);
    float _511 = fma(_493, _505, _499);
    float _513 = fma(_493, _507, _503);
    float _515 = _511 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _517 = _513 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _519 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _523 = _515 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _527 = _517 + _525;
    float _529 = _479 * _519;
    float _531 = _523 * _523;
    float _533 = fma(_485, _501, _529);
    float _535 = fma(_527, _527, _531);
    float _537 = fma(_493, _509, _533);
    float _539 = sqrt(_535);
    float _541 = _537 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _543 = _541 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _545 = fma(_517, (*spvDescriptorSet0.vp_c4)._m0[2].x, _543);
    float _547 = fma(_515, (*spvDescriptorSet0.vp_c4)._m0[2].z, _545);
    bool _549 = _539 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _551 = _547 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _553 = _409;
    float _555 = _547;
    float _557 = _493;
    float _559 = _551;
    if (!_549)
    {
        _553 = _517;
    }
    float _561 = _553;
    float _563 = _561;
    if (!_549)
    {
        _555 = _515;
    }
    float _565 = _555;
    float _567 = _565;
    if (!_549)
    {
        _557 = _541;
    }
    float _569 = _557;
    bool _571 = !_549;
    float _573 = _569;
    if (!_571)
    {
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _577 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _579 = _539 + _577;
        float _581 = _541 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _583 = rsqrt(_535);
        float _585 = _579 * _575;
        float _587 = _585 * 0.15915493667125701904296875;
        float _589 = _587 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _587 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _591 + (-1.0);
        float _599 = _597 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _601 = fma(_595, _581, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _603 = fma(_541, _591, _599);
        float _605 = _583 * _601;
        float _607 = _603 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _609 = fma(_527, _605, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _611 = fma(_523, _605, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _613 = fma(_609, (*spvDescriptorSet0.vp_c4)._m0[2].x, _607);
        float _615 = fma(_611, (*spvDescriptorSet0.vp_c4)._m0[2].z, _613);
        float _617 = _615 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _573 = _603;
        _563 = _609;
        _567 = _611;
        _559 = _617;
    }
    float _619 = _573;
    float _621 = _563;
    float _623 = _567;
    float _625 = _559;
    float _627 = _619 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _629 = _619 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[1].x, _627);
    float _633 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[0].x, _629);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[1].z, _631);
    float _637 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[0].z, _633);
    float _639 = _635 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _641 = _637 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _643 = _639 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _645 = _639 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _647 = _639 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _649 = _639 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[8].x, _643);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[7].x, _645);
    float _655 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[9].x, _647);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[10].x, _649);
    float _659 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[8].z, _651);
    float _661 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[7].z, _653);
    float _663 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[9].z, _655);
    float _665 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[10].z, _657);
    float _667 = _659 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _669 = _661 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _671 = _663 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _673 = _665 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _669;
    out.gl_Position.y = _667;
    out.gl_Position.z = _671;
    out.gl_Position.w = _673;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>(in.m_36.y);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_39.x;
    float _63 = in.m_39.y;
    float _65 = in.m_39.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    int _76 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _78 = _76 + as_type<int>(_55);
    int _80 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _82 = _80 + as_type<int>(_57);
    int _84 = _78 * 48;
    int _86 = _82 * 48;
    int _88 = _84 + 16;
    int _90 = _86 + 16;
    int _92 = _86 + 32;
    int _94 = _86 + 48;
    uint _97 = uint(int(uint(_88) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_97)];
    float _99 = as_type<float>(_dmw0.x);
    int _101 = _88 + 4;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw0.y);
    int _107 = _88 + 8;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.z);
    int _113 = _88 + 12;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw0.w);
    int _119 = _84 + 32;
    int _121 = _84 + 48;
    uint _123 = uint(int(uint(_90) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw3.x);
    int _127 = _90 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw3.y);
    int _133 = _90 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw3.z);
    int _139 = _90 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw3.w);
    uint _145 = uint(int(uint(_92) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_145)];
    float _147 = as_type<float>(_dmw4.x);
    int _149 = _92 + 4;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>(_dmw4.y);
    int _155 = _92 + 8;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    float _159 = as_type<float>(_dmw4.z);
    int _161 = _92 + 12;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    float _165 = as_type<float>(_dmw4.w);
    uint _167 = uint(int(uint(_94) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_167)];
    float _169 = as_type<float>(_dmw5.x);
    int _171 = _94 + 4;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>(_dmw5.y);
    int _177 = _94 + 8;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>(_dmw5.z);
    int _183 = _94 + 12;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>(_dmw5.w);
    uint _189 = uint(int(uint(_119) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_189)];
    float _191 = as_type<float>(_dmw1.x);
    int _193 = _119 + 4;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    float _197 = as_type<float>(_dmw1.y);
    int _199 = _119 + 8;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>(_dmw1.z);
    int _205 = _119 + 12;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>(_dmw1.w);
    uint _211 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_211)];
    float _213 = as_type<float>(_dmw2.x);
    int _215 = _121 + 4;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    float _219 = as_type<float>(_dmw2.y);
    int _221 = _121 + 8;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>(_dmw2.z);
    int _227 = _121 + 12;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>(_dmw2.w);
    float _233 = _69 * _69;
    float _235 = fma(_73, _73, _233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _237;
    float _241 = fma(_239, _239, _235);
    float _243 = in.m_41.x;
    float _245 = in.m_41.y;
    float _247 = sqrt(_241);
    bool _251 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _259 = _255 || _257;
    float _261 = _105 * _63;
    float _263 = _131 * _63;
    float _265 = _153 * _63;
    float _267 = fma(_125, _61, _263);
    float _269 = _175 * _63;
    float _271 = fma(_147, _61, _265);
    float _273 = _197 * _63;
    float _275 = fma(_169, _61, _269);
    float _277 = _219 * _63;
    float _279 = fma(_99, _61, _261);
    float _281 = fma(_191, _61, _273);
    float _283 = fma(_137, _65, _267);
    float _285 = fma(_159, _65, _271);
    float _287 = fma(_213, _61, _277);
    float _289 = fma(_181, _65, _275);
    float _291 = fma(_111, _65, _279);
    float _293 = fma(_203, _65, _281);
    float _295 = _143 + _283;
    float _297 = _165 + _285;
    float _299 = fma(_225, _65, _287);
    float _301 = _187 + _289;
    float _303 = _117 + _291;
    float _305 = _209 + _293;
    float _307 = _295 * _245;
    float _309 = _297 * _245;
    float _311 = _231 + _299;
    float _313 = _301 * _245;
    float _315 = fma(_303, _243, _307);
    float _317 = fma(_305, _243, _309);
    float _319 = _279;
    if (!_259)
    {
        _319 = 1.0;
    }
    float _321 = _319;
    float _323 = fma(_311, _243, _313);
    bool _325 = !_259;
    float _327 = _321;
    if (!_325)
    {
        bool _329 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _331 = isnan(_247);
        bool _333 = _329 || _331;
        bool _335 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _337 = _333 || _335;
        if (!_337)
        {
            float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _341 = _247 + _339;
            float _343 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _345 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _343;
            float _347 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _349 = _347 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _351 = 1.0 / _345;
            float _353 = _341 * _351;
            float _355 = fma(_353, _349, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _327 = _355;
            _357 = true;
        }
        else
        {
            bool _359 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _361 = isnan(_247);
            bool _363 = _359 || _361;
            bool _365 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _367 = _363 || _365;
            if (!_367)
            {
                float _369 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _371 = _247 + _369;
                float _373 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _375 = _373 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _377 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _379 = _377 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _381 = 1.0 / _375;
                float _383 = _371 * _381;
                float _385 = fma(_383, _379, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _327 = _385;
                _357 = true;
            }
            else
            {
                _327 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _357 = false;
    float _387 = _327;
    float _389 = -(*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[26].z + _389;
    float _393 = -(*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[26].y + _393;
    float _397 = -(*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[26].x + _397;
    float _401 = _391 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _403 = _395 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _405 = _399 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _407 = -_401;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[2].y, _407);
    float _411 = -_403;
    float _413 = fma(_391, (*spvDescriptorSet0.vp_c7)._m0[1].y, _411);
    float _415 = -_405;
    float _417 = fma(_395, (*spvDescriptorSet0.vp_c7)._m0[0].y, _415);
    float _419 = _409 * _409;
    float _421 = _413 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _423 = _409 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _425 = _417 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _427 = fma(_413, _413, _419);
    float _429 = -_421;
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c7)._m0[0].y, _429);
    float _433 = -_423;
    float _435 = fma(_413, (*spvDescriptorSet0.vp_c7)._m0[1].y, _433);
    float _437 = -_425;
    float _439 = fma(_409, (*spvDescriptorSet0.vp_c7)._m0[2].y, _437);
    float _441 = fma(_417, _417, _427);
    float _443 = _431 * _431;
    float _445 = 1.0 / _441;
    float _447 = fma(_439, _439, _443);
    float _449 = fma(_435, _435, _447);
    float _451 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _453 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _451);
    float _455 = 1.0 / _449;
    float _457 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _459 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _453);
    float _461 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _457);
    float _463 = _459 * _445;
    float _465 = _387 + (-1.0);
    float _467 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _469 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _461);
    float _471 = sqrt(_463);
    float _473 = _469 * _455;
    float _475 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _477 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _479 = fma(_317, _387, _475);
    float _481 = sqrt(_473);
    float _483 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _485 = fma(_315, _387, _477);
    float _487 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _489 = _479 * _467;
    float _491 = fma(_417, _471, 9.9999997473787516355514526367188e-06);
    float _493 = fma(_323, _387, _483);
    float _495 = fma(_413, _471, 9.9999997473787516355514526367188e-06);
    float _497 = _479 * _487;
    float _499 = fma(_485, _491, _489);
    float _501 = fma(_409, _471, 9.9999997473787516355514526367188e-06);
    float _503 = fma(_485, _495, _497);
    float _505 = fma(_435, _481, 9.9999997473787516355514526367188e-06);
    float _507 = fma(_439, _481, 9.9999997473787516355514526367188e-06);
    float _509 = fma(_431, _481, 9.9999997473787516355514526367188e-06);
    float _511 = fma(_493, _505, _499);
    float _513 = fma(_493, _507, _503);
    float _515 = _511 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _517 = _513 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _519 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _523 = _515 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _527 = _517 + _525;
    float _529 = _479 * _519;
    float _531 = _523 * _523;
    float _533 = fma(_485, _501, _529);
    float _535 = fma(_527, _527, _531);
    float _537 = fma(_493, _509, _533);
    float _539 = sqrt(_535);
    float _541 = _537 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _543 = _541 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _545 = fma(_517, (*spvDescriptorSet0.vp_c4)._m0[2].x, _543);
    float _547 = fma(_515, (*spvDescriptorSet0.vp_c4)._m0[2].z, _545);
    bool _549 = _539 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _551 = _547 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _553 = _409;
    float _555 = _547;
    float _557 = _493;
    float _559 = _551;
    if (!_549)
    {
        _553 = _517;
    }
    float _561 = _553;
    float _563 = _561;
    if (!_549)
    {
        _555 = _515;
    }
    float _565 = _555;
    float _567 = _565;
    if (!_549)
    {
        _557 = _541;
    }
    float _569 = _557;
    bool _571 = !_549;
    float _573 = _569;
    if (!_571)
    {
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _577 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _579 = _539 + _577;
        float _581 = _541 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _583 = rsqrt(_535);
        float _585 = _579 * _575;
        float _587 = _585 * 0.15915493667125701904296875;
        float _589 = _587 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _587 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _591 + (-1.0);
        float _599 = _597 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _601 = fma(_595, _581, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _603 = fma(_541, _591, _599);
        float _605 = _583 * _601;
        float _607 = _603 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _609 = fma(_527, _605, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _611 = fma(_523, _605, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _613 = fma(_609, (*spvDescriptorSet0.vp_c4)._m0[2].x, _607);
        float _615 = fma(_611, (*spvDescriptorSet0.vp_c4)._m0[2].z, _613);
        float _617 = _615 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _573 = _603;
        _563 = _609;
        _567 = _611;
        _559 = _617;
    }
    float _619 = _573;
    float _621 = _563;
    float _623 = _567;
    float _625 = _559;
    float _627 = _619 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _629 = _619 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[1].x, _627);
    float _633 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[0].x, _629);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[1].z, _631);
    float _637 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[0].z, _633);
    float _639 = _635 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _641 = _637 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _643 = _639 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _645 = _639 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _647 = _639 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _649 = _639 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[8].x, _643);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[7].x, _645);
    float _655 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[9].x, _647);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[10].x, _649);
    float _659 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[8].z, _651);
    float _661 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[7].z, _653);
    float _663 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[9].z, _655);
    float _665 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[10].z, _657);
    float _667 = _659 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _669 = _661 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _671 = _663 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _673 = _665 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _669;
    out.gl_Position.y = _667;
    out.gl_Position.z = _671;
    out.gl_Position.w = _673;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>(in.m_36.y);
    float _59 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _61 = in.m_39.x;
    float _63 = in.m_39.y;
    float _65 = in.m_39.z;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    int _76 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _78 = _76 + as_type<int>(_55);
    int _80 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _82 = _80 + as_type<int>(_57);
    int _84 = _78 * 48;
    int _86 = _82 * 48;
    int _88 = _84 + 16;
    int _90 = _86 + 16;
    int _92 = _86 + 32;
    int _94 = _86 + 48;
    uint _97 = uint(int(uint(_88) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_97)];
    float _99 = as_type<float>(_dmw0.x);
    int _101 = _88 + 4;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw0.y);
    int _107 = _88 + 8;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.z);
    int _113 = _88 + 12;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw0.w);
    int _119 = _84 + 32;
    int _121 = _84 + 48;
    uint _123 = uint(int(uint(_90) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw3.x);
    int _127 = _90 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw3.y);
    int _133 = _90 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw3.z);
    int _139 = _90 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw3.w);
    uint _145 = uint(int(uint(_92) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_145)];
    float _147 = as_type<float>(_dmw4.x);
    int _149 = _92 + 4;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>(_dmw4.y);
    int _155 = _92 + 8;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    float _159 = as_type<float>(_dmw4.z);
    int _161 = _92 + 12;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    float _165 = as_type<float>(_dmw4.w);
    uint _167 = uint(int(uint(_94) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_167)];
    float _169 = as_type<float>(_dmw5.x);
    int _171 = _94 + 4;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>(_dmw5.y);
    int _177 = _94 + 8;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>(_dmw5.z);
    int _183 = _94 + 12;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>(_dmw5.w);
    uint _189 = uint(int(uint(_119) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_189)];
    float _191 = as_type<float>(_dmw1.x);
    int _193 = _119 + 4;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    float _197 = as_type<float>(_dmw1.y);
    int _199 = _119 + 8;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>(_dmw1.z);
    int _205 = _119 + 12;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>(_dmw1.w);
    uint _211 = uint(int(uint(_121) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_211)];
    float _213 = as_type<float>(_dmw2.x);
    int _215 = _121 + 4;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    float _219 = as_type<float>(_dmw2.y);
    int _221 = _121 + 8;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>(_dmw2.z);
    int _227 = _121 + 12;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>(_dmw2.w);
    float _233 = _69 * _69;
    float _235 = fma(_73, _73, _233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _237;
    float _241 = fma(_239, _239, _235);
    float _243 = in.m_41.x;
    float _245 = in.m_41.y;
    float _247 = sqrt(_241);
    bool _251 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _259 = _255 || _257;
    float _261 = _105 * _63;
    float _263 = _131 * _63;
    float _265 = _153 * _63;
    float _267 = fma(_125, _61, _263);
    float _269 = _175 * _63;
    float _271 = fma(_147, _61, _265);
    float _273 = _197 * _63;
    float _275 = fma(_169, _61, _269);
    float _277 = _219 * _63;
    float _279 = fma(_99, _61, _261);
    float _281 = fma(_191, _61, _273);
    float _283 = fma(_137, _65, _267);
    float _285 = fma(_159, _65, _271);
    float _287 = fma(_213, _61, _277);
    float _289 = fma(_181, _65, _275);
    float _291 = fma(_111, _65, _279);
    float _293 = fma(_203, _65, _281);
    float _295 = _143 + _283;
    float _297 = _165 + _285;
    float _299 = fma(_225, _65, _287);
    float _301 = _187 + _289;
    float _303 = _117 + _291;
    float _305 = _209 + _293;
    float _307 = _295 * _245;
    float _309 = _297 * _245;
    float _311 = _231 + _299;
    float _313 = _301 * _245;
    float _315 = fma(_303, _243, _307);
    float _317 = fma(_305, _243, _309);
    float _319 = _279;
    if (!_259)
    {
        _319 = 1.0;
    }
    float _321 = _319;
    float _323 = fma(_311, _243, _313);
    bool _325 = !_259;
    float _327 = _321;
    if (!_325)
    {
        bool _329 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _331 = isnan(_247);
        bool _333 = _329 || _331;
        bool _335 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _337 = _333 || _335;
        if (!_337)
        {
            float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _341 = _247 + _339;
            float _343 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _345 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _343;
            float _347 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _349 = _347 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _351 = 1.0 / _345;
            float _353 = _341 * _351;
            float _355 = fma(_353, _349, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _327 = _355;
            _357 = true;
        }
        else
        {
            bool _359 = _247 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _361 = isnan(_247);
            bool _363 = _359 || _361;
            bool _365 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _367 = _363 || _365;
            if (!_367)
            {
                float _369 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _371 = _247 + _369;
                float _373 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _375 = _373 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _377 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _379 = _377 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _381 = 1.0 / _375;
                float _383 = _371 * _381;
                float _385 = fma(_383, _379, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _327 = _385;
                _357 = true;
            }
            else
            {
                _327 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _357 = false;
    float _387 = _327;
    float _389 = -(*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[26].z + _389;
    float _393 = -(*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[26].y + _393;
    float _397 = -(*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[26].x + _397;
    float _401 = _391 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _403 = _395 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _405 = _399 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _407 = -_401;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c7)._m0[2].y, _407);
    float _411 = -_403;
    float _413 = fma(_391, (*spvDescriptorSet0.vp_c7)._m0[1].y, _411);
    float _415 = -_405;
    float _417 = fma(_395, (*spvDescriptorSet0.vp_c7)._m0[0].y, _415);
    float _419 = _409 * _409;
    float _421 = _413 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _423 = _409 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _425 = _417 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _427 = fma(_413, _413, _419);
    float _429 = -_421;
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c7)._m0[0].y, _429);
    float _433 = -_423;
    float _435 = fma(_413, (*spvDescriptorSet0.vp_c7)._m0[1].y, _433);
    float _437 = -_425;
    float _439 = fma(_409, (*spvDescriptorSet0.vp_c7)._m0[2].y, _437);
    float _441 = fma(_417, _417, _427);
    float _443 = _431 * _431;
    float _445 = 1.0 / _441;
    float _447 = fma(_439, _439, _443);
    float _449 = fma(_435, _435, _447);
    float _451 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _453 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _451);
    float _455 = 1.0 / _449;
    float _457 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _459 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _453);
    float _461 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _457);
    float _463 = _459 * _445;
    float _465 = _387 + (-1.0);
    float _467 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _469 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _461);
    float _471 = sqrt(_463);
    float _473 = _469 * _455;
    float _475 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _477 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _479 = fma(_317, _387, _475);
    float _481 = sqrt(_473);
    float _483 = _465 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _485 = fma(_315, _387, _477);
    float _487 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _489 = _479 * _467;
    float _491 = fma(_417, _471, 9.9999997473787516355514526367188e-06);
    float _493 = fma(_323, _387, _483);
    float _495 = fma(_413, _471, 9.9999997473787516355514526367188e-06);
    float _497 = _479 * _487;
    float _499 = fma(_485, _491, _489);
    float _501 = fma(_409, _471, 9.9999997473787516355514526367188e-06);
    float _503 = fma(_485, _495, _497);
    float _505 = fma(_435, _481, 9.9999997473787516355514526367188e-06);
    float _507 = fma(_439, _481, 9.9999997473787516355514526367188e-06);
    float _509 = fma(_431, _481, 9.9999997473787516355514526367188e-06);
    float _511 = fma(_493, _505, _499);
    float _513 = fma(_493, _507, _503);
    float _515 = _511 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _517 = _513 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _519 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _523 = _515 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _527 = _517 + _525;
    float _529 = _479 * _519;
    float _531 = _523 * _523;
    float _533 = fma(_485, _501, _529);
    float _535 = fma(_527, _527, _531);
    float _537 = fma(_493, _509, _533);
    float _539 = sqrt(_535);
    float _541 = _537 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _543 = _541 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _545 = fma(_517, (*spvDescriptorSet0.vp_c4)._m0[2].x, _543);
    float _547 = fma(_515, (*spvDescriptorSet0.vp_c4)._m0[2].z, _545);
    bool _549 = _539 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _551 = _547 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _553 = _409;
    float _555 = _547;
    float _557 = _493;
    float _559 = _551;
    if (!_549)
    {
        _553 = _517;
    }
    float _561 = _553;
    float _563 = _561;
    if (!_549)
    {
        _555 = _515;
    }
    float _565 = _555;
    float _567 = _565;
    if (!_549)
    {
        _557 = _541;
    }
    float _569 = _557;
    bool _571 = !_549;
    float _573 = _569;
    if (!_571)
    {
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _577 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _579 = _539 + _577;
        float _581 = _541 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _583 = rsqrt(_535);
        float _585 = _579 * _575;
        float _587 = _585 * 0.15915493667125701904296875;
        float _589 = _587 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _587 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _591 + (-1.0);
        float _599 = _597 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _601 = fma(_595, _581, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _603 = fma(_541, _591, _599);
        float _605 = _583 * _601;
        float _607 = _603 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _609 = fma(_527, _605, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _611 = fma(_523, _605, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _613 = fma(_609, (*spvDescriptorSet0.vp_c4)._m0[2].x, _607);
        float _615 = fma(_611, (*spvDescriptorSet0.vp_c4)._m0[2].z, _613);
        float _617 = _615 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _573 = _603;
        _563 = _609;
        _567 = _611;
        _559 = _617;
    }
    float _619 = _573;
    float _621 = _563;
    float _623 = _567;
    float _625 = _559;
    float _627 = _619 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _629 = _619 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[1].x, _627);
    float _633 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[0].x, _629);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[1].z, _631);
    float _637 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[0].z, _633);
    float _639 = _635 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _641 = _637 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _643 = _639 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _645 = _639 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _647 = _639 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _649 = _639 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[8].x, _643);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[7].x, _645);
    float _655 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[9].x, _647);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[10].x, _649);
    float _659 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[8].z, _651);
    float _661 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[7].z, _653);
    float _663 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[9].z, _655);
    float _665 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[10].z, _657);
    float _667 = _659 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _669 = _661 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _671 = _663 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _673 = _665 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _669;
    out.gl_Position.y = _667;
    out.gl_Position.z = _671;
    out.gl_Position.w = _673;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

