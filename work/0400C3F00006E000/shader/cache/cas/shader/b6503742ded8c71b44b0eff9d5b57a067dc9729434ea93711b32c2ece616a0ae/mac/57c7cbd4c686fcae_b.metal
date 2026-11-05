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

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_81 [[user(locn13)]];
    float4 m_73 [[user(locn14)]];
    float4 m_89 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_77 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2806 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3122 = as_type<float>(_140);
        out.gl_Position.z = _3122;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_166);
        out.gl_Position.z = _3177;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _178 = _122 * _174;
    float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _186 = !_176;
    float _188 = _178;
    if (!_186)
    {
        float _190 = in.m_57.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _188 = _204;
    }
    float _206 = _188;
    float _208 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _210 = int(_208);
    float _212 = in.m_59.y;
    float _214 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _216 = int(_214);
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _220 = float(_210);
    float _222 = 1.0 / _220;
    float _224 = float(uint(_216));
    int _226 = ~_216;
    int _228 = _226 + 1;
    int _230 = ~_216;
    int _232 = _230 + 1;
    float _234 = 1.0 / _224;
    int _236 = ~_216;
    int _238 = _236 + 1;
    float _240 = _222 * _122;
    float _242 = trunc(_240);
    int _244 = int(_242);
    int _246 = as_type<int>(_234) + (-2);
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _250 = _248 != 0;
    bool _252 = !_250;
    float _254 = _252 ? 7.345489978790283203125 : 1.0;
    float _256 = float(uint(_244));
    float _258 = as_type<float>(_246) * _256;
    float _260 = in.m_57.x;
    float _262 = in.m_57.y;
    float _264 = in.m_57.z;
    float _266 = trunc(_258);
    float _268 = precise::max(_266, 0.0);
    uint _271 = uint(_268);
    int _273 = _228 * int(_271);
    int _275 = _273 + _244;
    float _277 = float(uint(_275));
    float _279 = _254 * _260;
    float _281 = as_type<float>(_246) * _277;
    float _283 = float(_216);
    float _285 = floor(_279);
    float _287 = trunc(_281);
    float _289 = precise::max(_287, 0.0);
    uint _291 = uint(_289);
    float _293 = -_285;
    float _295 = _279 + _293;
    int _297 = int(_271) + int(_291);
    float _299 = float(_244);
    int _301 = _232 * _297;
    int _303 = _301 + _244;
    bool _305 = _299 >= _283;
    bool _307 = isnan(_299);
    bool _309 = _305 || _307;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    bool _317 = uint(_303) >= uint(_216);
    float _319 = trunc(_315);
    int _321 = int(_319);
    bool _323 = !_317;
    int _325 = _323 ? 0 : (-1);
    bool _327 = _216 == 0;
    int _329 = ~_297;
    int _331 = _329 + _325;
    int _333 = _331 + 1;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _341 = _339 != 0;
    int _343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _345 = _343 != 0;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _349 = _347 != 0;
    int _351 = _216 * _333;
    int _353 = _351 + _244;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _357 = _355 != 0;
    bool _359 = _262 > 0.5;
    int _361 = ~_321;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    bool _367 = !_327;
    int _369 = _367 ? _353 : (-1);
    float _371 = _295 * _283;
    int _373 = _369 * _365;
    float _375 = _283 * _122;
    float _377 = trunc(_371);
    int _379 = int(_377);
    int _381 = _216 + (-1);
    float _383 = 0.0;
    float _385 = _212;
    if (_357)
    {
        float _387 = in.m_57.x;
        _383 = _387;
    }
    float _389 = _383;
    float _391 = _375 * _174;
    bool _393 = !_341;
    int _395 = _393 ? 0 : 1;
    int _397 = _321 * _381;
    int _399 = _397 + _373;
    bool _401 = !_349;
    int _403 = _401 ? 0 : 1;
    float _405 = in.m_61.w;
    float _407 = trunc(_391);
    int _409 = int(_407);
    bool _411 = !_337;
    int _413 = _411 ? 0 : 1;
    int _415 = abs(_395);
    int _417 = abs(_403);
    int _419 = abs(_413);
    int _421 = _399 * _415;
    bool _423 = !_345;
    int _425 = _423 ? 0 : 1;
    int _427 = _379 * _417;
    int _429 = _427 + _244;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _433 = _431 != 0;
    int _435 = abs(_425);
    bool _437 = !_433;
    int _439 = _437 ? 0 : 1;
    int _441 = _409 * _419;
    int _443 = _441 + _421;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    float _449 = in.m_46.x;
    float _451 = in.m_46.y;
    float _453 = in.m_46.z;
    int _455 = abs(_439);
    int _457 = _429 * _435;
    int _459 = _457 + _443;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _463 = _461 != 0;
    float _465 = _260 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _467 = _379 * _455;
    int _469 = _467 + _459;
    float _471 = -_212;
    float _473 = _471 + 1.0;
    out.m_63.w = _405;
    float _475 = _262 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _479 = float(uint(_469));
    if (_447)
    {
        float _481 = _359 ? _473 : _212;
        _385 = _481;
    }
    float _483 = _385;
    float _485 = -_477;
    float _487 = fma(_465, 2.0, _485);
    float _489 = as_type<float>(_246) * _479;
    int _491 = ~_216;
    int _493 = _491 + 1;
    float _495 = fma(_475, -2.0, _218);
    float _497 = trunc(_489);
    float _499 = precise::max(_497, 0.0);
    uint _501 = uint(_499);
    bool _503 = _389 > 0.5;
    bool _505 = _503 && _357;
    float _507 = _451 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _509 = _451 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _451 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
    float _527 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _529 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _511);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
    bool _537 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _539 = isnan(_206);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = 1.0 / _533;
    int _551 = ~_216;
    int _553 = _551 + 1;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _559 = _493 * int(_501);
    int _561 = _559 + _469;
    float _563 = float(uint(_561));
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _571 = 1.0 / _557;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _575 = as_type<float>(_246) * _563;
    float _577 = in.m_59.x;
    float _579 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _589 = trunc(_575);
    float _591 = precise::max(_589, 0.0);
    uint _593 = uint(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    out.m_65.x = _579;
    out.m_65.y = _581;
    out.m_65.z = _583;
    out.m_65.w = _573;
    float _599 = _597 * _549;
    bool _601 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _603 = isnan(_206);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _587 * _571;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _206 + _615;
    float _619 = fma(_599, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _623 = int(_501) + int(_593);
    float _625 = -_611;
    float _627 = _625 + 1.0;
    bool _629 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_206);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -_547;
    float _643 = _641 + 1.0;
    float _645 = 0.0;
    float _647 = _577;
    if (_357)
    {
        _645 = _577;
    }
    float _649 = _645;
    float _651 = _547 * _627;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = _206 + _653;
    float _657 = _639 * _643;
    float _659 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
    int _661 = _553 * _623;
    int _663 = _661 + _469;
    float _665 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].z, _529);
    float _667 = _619 * _657;
    float _669 = _659 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _671 = fma(_613, _655, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _673 = _649;
    if (_505)
    {
        float _675 = -_649;
        float _677 = _675 + 1.0;
        _673 = _677;
    }
    float _679 = _673;
    float _681 = _535 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _685 = _669 + _683;
    bool _687 = uint(_663) >= uint(_216);
    float _689 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[79].z, _621);
    float _691 = float(uint(_429));
    float _693 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _681 + _695;
    float _699 = _685 * _685;
    bool _701 = !_687;
    int _703 = _701 ? 0 : (-1);
    float _705 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _689);
    float _707 = as_type<float>(_246) * _691;
    float _709 = fma(_697, _697, _699);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _693 + _711;
    int _715 = ~_623;
    int _717 = _715 + _703;
    int _719 = _717 + 1;
    float _721 = _705 * (-0.15915493667125701904296875);
    float _723 = trunc(_707);
    float _725 = precise::max(_723, 0.0);
    uint _727 = uint(_725);
    float _729 = fma(_713, _713, _709);
    float _731 = -_639;
    float _733 = _731 + 1.0;
    int _735 = _216 * _719;
    int _737 = _735 + _469;
    float _739 = _681;
    if (_357)
    {
        _647 = _679;
    }
    float _741 = _647;
    float _743 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _745 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _747 = _721 * 6.283185482025146484375;
    float _749 = sin(_747);
    bool _751 = !_327;
    int _753 = _751 ? _737 : (-1);
    float _755 = fma(_671, _651, _745);
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _759 = _753 >> 31;
    int _761 = _753 & 3;
    bool _763 = _761 != 0;
    float _765 = _721 * 6.283185482025146484375;
    float _767 = cos(_765);
    int _769 = _759 & 3;
    float _771 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _773 = _753 + _769;
    float _775 = _771 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _777 = rsqrt(_729);
    int _779 = ~_216;
    int _781 = _779 + 1;
    float _783 = _749 * _743;
    int _785 = _773 >> 2;
    int _787 = _781 * int(_727);
    int _789 = _787 + _429;
    int _791 = _785 << 4;
    int _793 = _791 + 368;
    float _795 = sqrt(_729);
    float _797 = _767 * _743;
    float _799 = -_783;
    float _801 = fma(_767, _757, _799);
    float _803 = float(uint(_789));
    float _805 = fma(_749, _757, _797);
    float _807 = as_type<float>(_246) * _803;
    float _809 = _685 * _777;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _813 = trunc(_807);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    uint _819 = uint(int(uint(_793) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    float _835 = -_809;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _685);
    float _839 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    float _841 = _795 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _843 = _697 * _777;
    float _845 = _685 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _847 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _839);
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _853 = _837 * _837;
    float _855 = precise::min(_775, _841);
    float _857 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _845);
    float _859 = fma(_851, _851, _853);
    int _861 = _753 & 3;
    bool _863 = _861 != 0;
    float _865 = _809 * _855;
    int _867 = int(_727) + int(_817);
    float _869 = -_122;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[76].x, _487);
    int _873 = _763 ? 0 : 1;
    float _875 = -_865;
    float _877 = _685 + _875;
    bool _879 = uint(_861) > 1u;
    int _881 = _793 + 8;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[int(_893)][_895];
    float _899 = _843 * _855;
    float _901 = _713 * _777;
    float _903 = _877 * _877;
    float _905 = fma(_847, _801, _871);
    float _907 = -_899;
    float _909 = _697 + _907;
    float _911 = -_901;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    int _915 = ~_873;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    float _921 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _857);
    bool _923 = !_863;
    int _925 = _923 ? 0 : 1;
    float _927 = fma(_909, _909, _903);
    bool _929 = uint(_861) >= 2u;
    int _931 = _238 * _867;
    int _933 = _931 + _429;
    int _935 = _919;
    if (!_879)
    {
        int _937 = ~_873;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = fma(_913, _913, _859);
    float _945 = _901 * _855;
    int _947 = abs(_925);
    out.m_67.w = _855;
    int _949 = abs(_941);
    int _951 = _929 ? 0 : 1;
    bool _953 = _861 != 3;
    bool _955 = uint(_933) >= uint(_216);
    float _957 = -_945;
    float _959 = _713 + _957;
    int _961 = ~_947;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_959, _959, _927);
    int _969 = ~_949;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    bool _975 = !_955;
    int _977 = _975 ? 0 : (-1);
    bool _979 = _861 != 3;
    int _981 = _973 * as_type<int>(_833);
    int _983 = ~_867;
    int _985 = _983 + _977;
    int _987 = _985 + 1;
    float _989 = sqrt(_967);
    int _991 = ~_951;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    int _997 = _965 * as_type<int>(_825);
    int _999 = _997 + _981;
    int _1001 = _995;
    if (_953)
    {
        int _1003 = ~_951;
        int _1005 = _1003 + 1;
        _1001 = _1005;
    }
    int _1007 = _1001;
    int _1009 = _216 * _987;
    int _1011 = _1009 + _429;
    bool _1013 = !_979;
    int _1015 = _1013 ? 0 : (-1);
    int _1017 = abs(_1007);
    float _1019 = sqrt(_943);
    bool _1021 = !_463;
    int _1023 = _1021 ? 0 : 1;
    int _1025 = abs(_1015);
    int _1027 = abs(_1023);
    float _1029 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _495);
    int _1031 = ~_1017;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    float _1037 = _777 * _989;
    int _1039 = ~_1025;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    int _1045 = _1035 * as_type<int>(_889);
    int _1047 = _1045 + _999;
    int _1049 = ~_1027;
    int _1051 = _1049 + 1;
    int _1053 = _1051 + 1;
    float _1055 = _777 * _1019;
    bool _1057 = _921 >= 0.0;
    int _1059 = _1043 * as_type<int>(_897);
    int _1061 = _1059 + _1047;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1065 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[117].x, _755);
    int _1067 = _1061 * _1053;
    bool _1069 = !_327;
    int _1071 = _1069 ? _1011 : (-1);
    float _1073 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1063);
    float _1075 = _1037 * _1055;
    int _1077 = _1071 * _1027;
    int _1079 = _1077 + _1067;
    float _1081 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1073);
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1057)
    {
        _1089 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1091 = _1089;
    float _1093 = -_1029;
    float _1095 = fma(_1081, _805, _1093);
    float _1097 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1105 = _905 + 0.5;
    float _1107 = _1095 + 0.5;
    int _1109 = as_type<int>(_1091);
    if (_1057)
    {
        float _1111 = _1091 * 5.0;
        _1109 = as_type<int>(_1111);
    }
    int _1113 = _1109;
    float _1115 = float(_1079);
    float _1117 = _771 * _1075;
    out.m_69.x = _1097;
    out.m_69.y = _1099;
    out.m_69.z = _1101;
    out.m_69.w = _1103;
    bool _1119 = !_519;
    int _1121 = _1119 ? 0 : 1;
    bool _1123 = !_523;
    int _1125 = _1123 ? 0 : 1;
    out.m_71.x = _1105;
    out.m_71.y = _1107;
    bool _1127 = !_515;
    int _1129 = _1127 ? 0 : 1;
    if (_1057)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4647 = as_type<float>(_1113);
        out.gl_Position.z = _4647;
    }
    out.m_73.x = _1115;
    if (_1057)
    {
        out.m_53.x = 0.0;
    }
    out.m_75.x = _1117;
    if (_1057)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1131 = -_809;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    float _1135 = -_843;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _681);
    float _1139 = -_901;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1145 = _1133 + _1143;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1149 = _1137 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1153 = _1141 + _1151;
    float _1155 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1155);
    float _1159 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1157);
    bool _1161 = _1159 >= 0.0;
    float _1163 = _1153;
    if (_1161)
    {
        _1163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1165 = _1163;
    int _1167 = as_type<int>(_1165);
    if (_1161)
    {
        out.m_53.x = 0.0;
    }
    if (_1161)
    {
        float _1169 = _1165 * 5.0;
        _1167 = as_type<int>(_1169);
    }
    int _1171 = _1167;
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4742 = as_type<float>(_1171);
        out.gl_Position.z = _4742;
    }
    if (_1161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1173 = -_669;
    float _1175 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1177 = -_681;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1181 = -_693;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1185 = _1175 * _1175;
    float _1187 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1189 = fma(_1179, _1179, _1185);
    float _1191 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1193 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1195 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1197 = fma(_1183, _1183, _1189);
    float _1199 = -_1191;
    float _1201 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1199);
    float _1203 = -_1195;
    float _1205 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1207 = rsqrt(_1197);
    float _1209 = -_1193;
    float _1211 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1209);
    float _1213 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1215 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1221 = -_1213;
    float _1223 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1221);
    float _1225 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1227 = log2(_1225);
    float _1229 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1231 = -_1215;
    float _1233 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1231);
    float _1235 = -_1217;
    float _1237 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1235);
    float _1239 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1241 = -_1229;
    float _1243 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1241);
    float _1245 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1247 = _1179 * _1207;
    float _1249 = _1183 * _1207;
    float _1251 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1243);
    float _1253 = _1175 * _1207;
    float _1255 = _1247 * _1247;
    float _1257 = -_1239;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1257);
    float _1261 = -_1245;
    float _1263 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1261);
    bool _1265 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1267 = isnan(0.0);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1273 = _1269 || _1271;
    float _1275 = fma(_1249, _1249, _1255);
    float _1277 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1279 = _1227 * _122;
    float _1281 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1263);
    float _1283 = _1187 * _1075;
    float _1285 = -_1277;
    float _1287 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1285);
    float _1289 = rsqrt(_1275);
    float _1291 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1293 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1287);
    float _1295 = -_1291;
    float _1297 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1295);
    float _1299 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1301 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1297);
    float _1303 = -_1299;
    float _1305 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1303);
    float _1307 = _260 * 2.0;
    float _1309 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1305);
    float _1311 = _1249 * _1289;
    float _1313 = _1247 * _1289;
    float _1315 = exp2(_1279);
    float _1317 = -_1311;
    float _1319 = _1249 * _1317;
    float _1321 = -_1311;
    float _1323 = _1253 * _1321;
    float _1325 = -_1319;
    float _1327 = fma(_1247, _1313, _1325);
    float _1329 = _1253 * _1313;
    float _1331 = _1327 * _1327;
    float _1333 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1259);
    float _1335 = fma(_1329, _1329, _1331);
    float _1337 = -_1333;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1309);
    float _1341 = floor(_1307);
    float _1343 = _264 + _260;
    float _1345 = fma(_1323, _1323, _1335);
    float _1347 = _262 + _260;
    float _1349 = _260 + (-0.5);
    float _1351 = _262 + _264;
    float _1353 = _262 + (-0.5);
    float _1355 = rsqrt(_1345);
    float _1357 = _1347 + (-1.0);
    float _1359 = _1351 + (-1.0);
    float _1361 = _264 + (-0.5);
    float _1363 = _262 * 2.0;
    float _1365 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1367 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1369 = _264 * 2.0;
    float _1371 = 1.0 / _1339;
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = -_1367;
    float _1377 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1375);
    float _1379 = -_1219;
    float _1381 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1379);
    float _1383 = -_1315;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1377);
    float _1389 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1381);
    float _1391 = _1327 * _1355;
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    bool _1395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(1.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = floor(_1363);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1409 = 1.0 + _1407;
    float _1411 = -_1393;
    float _1413 = _1411 + 1.0;
    bool _1415 = _1341 > 0.0;
    float _1417 = _1343 + (-1.0);
    bool _1419 = _1341 >= 0.0;
    bool _1421 = isnan(_1341);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan(0.0);
    bool _1427 = _1423 || _1425;
    float _1429 = fma(_1389, _1371, -1.0);
    float _1431 = _1413 * _1371;
    float _1433 = floor(_1369);
    float _1435 = _1273 ? _1385 : 0.0;
    float _1437 = fma(_1413, _1429, 1.0);
    float _1439 = _1387 * _1431;
    float _1441 = _1281 * _1431;
    float _1443 = _1437 * _1437;
    float _1445 = 1.0 / _1409;
    bool _1447 = _1405 > 0.0;
    float _1449 = fma(_1439, _1439, _1443);
    bool _1451 = _1405 >= 0.0;
    bool _1453 = isnan(_1405);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan(0.0);
    bool _1459 = _1455 || _1457;
    int _1461 = _1427 ? 0 : 1;
    float _1463 = fma(_1441, _1441, _1449);
    int _1465 = _1459 ? 0 : 1;
    bool _1467 = _1433 > 0.0;
    bool _1469 = _1433 >= 0.0;
    bool _1471 = isnan(_1433);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(0.0);
    bool _1477 = _1473 || _1475;
    float _1479 = rsqrt(_1463);
    int _1481 = ~_1461;
    int _1483 = _1481 + 1;
    int _1485 = _1483 + 1;
    int _1487 = _1485;
    if (!_1415)
    {
        int _1489 = ~_1461;
        int _1491 = _1489 + 1;
        _1487 = _1491;
    }
    int _1493 = _1487;
    if (_1403)
    {
        float _1495 = _1435 * _1445;
        _132 = _1495;
    }
    float _1497 = _132;
    int _1499 = _1477 ? 0 : 1;
    float _1501 = in.m_77.x;
    float _1503 = in.m_77.y;
    float _1505 = in.m_77.z;
    int _1507 = abs(_1121);
    int _1509 = abs(_1129);
    int _1511 = ~_1499;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    int _1517 = _1515;
    if (!_1467)
    {
        int _1519 = ~_1499;
        int _1521 = _1519 + 1;
        _1517 = _1521;
    }
    int _1523 = _1517;
    float _1525 = float(_1507);
    float _1527 = _1437 * _1479;
    int _1529 = ~_1465;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = _1441 * _1479;
    int _1537 = _1533;
    if (!_1447)
    {
        int _1539 = ~_1465;
        int _1541 = _1539 + 1;
        _1537 = _1541;
    }
    int _1543 = _1537;
    float _1545 = _1439 * _1479;
    float _1547 = float(_1493);
    float _1549 = _1249 * _1527;
    float _1551 = float(_1509);
    float _1553 = float(_1523);
    float _1555 = -_1535;
    float _1557 = _1247 * _1555;
    float _1559 = _1525 * _1547;
    float _1561 = float(_1543);
    float _1563 = _1551 * _1553;
    float _1565 = -_1545;
    float _1567 = -_1557;
    float _1569 = fma(_1249, _1565, _1567);
    float _1571 = -_1535;
    float _1573 = -_1549;
    float _1575 = fma(_1253, _1571, _1573);
    float _1577 = _1559 * (-2.0);
    float _1579 = -_1545;
    float _1581 = _1253 * _1579;
    float _1583 = _1569 * _1569;
    int _1585 = abs(_1125);
    float _1587 = fma(_1373, _1577, _1373);
    float _1589 = fma(_1577, _1503, _1503);
    float _1591 = -_1581;
    float _1593 = fma(_1247, _1527, _1591);
    float _1595 = fma(_1575, _1575, _1583);
    float _1597 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1589);
    float _1599 = fma(_1593, _1593, _1595);
    float _1601 = float(_1585);
    float _1603 = fma(_1587, _1497, _1597);
    float _1605 = _1563 * (-2.0);
    float _1607 = rsqrt(_1599);
    float _1609 = _1601 * _1561;
    float _1611 = fma(_1605, _1501, _1501);
    float _1613 = fma(_1365, _1605, _1365);
    float _1615 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = _1609 * (-2.0);
    float _1619 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1611);
    float _1621 = _1603 * 0.15915493667125701904296875;
    float _1623 = fma(_1617, _1505, _1505);
    float _1625 = fma(_1615, _1617, _1615);
    float _1627 = fma(_1613, _1497, _1619);
    float _1629 = _1621 * 6.283185482025146484375;
    float _1631 = sin(_1629);
    float _1633 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1623);
    float _1635 = _1627 * 0.15915493667125701904296875;
    float _1637 = _1575 * _1607;
    float _1639 = _1593 * _1607;
    float _1641 = _1569 * _1607;
    float _1643 = fma(_1625, _1497, _1633);
    float _1645 = _1249 * _1637;
    float _1647 = _1253 * _1639;
    float _1649 = _1621 * 6.283185482025146484375;
    float _1651 = cos(_1649);
    float _1653 = -_1645;
    float _1655 = fma(_1247, _1639, _1653);
    float _1657 = -_1647;
    float _1659 = fma(_1249, _1641, _1657);
    float _1661 = _1247 * _1641;
    float _1663 = -_1661;
    float _1665 = fma(_1253, _1637, _1663);
    float _1667 = _1643 * 0.15915493667125701904296875;
    float _1669 = _1655 * _1655;
    float _1671 = _1635 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = fma(_1659, _1659, _1669);
    float _1677 = fma(_1665, _1665, _1675);
    float _1679 = _1635 * 6.283185482025146484375;
    float _1681 = cos(_1679);
    float _1683 = in.m_79.x;
    float _1685 = in.m_79.y;
    float _1687 = in.m_79.z;
    float _1689 = rsqrt(_1677);
    float _1691 = _1673 * _1631;
    float _1693 = _1673 * _1651;
    float _1695 = _1667 * 6.283185482025146484375;
    float _1697 = cos(_1695);
    float _1699 = _1681 * _1651;
    float _1701 = _1681 * _1631;
    float _1703 = _1665 * _1689;
    float _1705 = _1659 * _1689;
    float _1707 = _1655 * _1689;
    float _1709 = _1667 * 6.283185482025146484375;
    float _1711 = sin(_1709);
    float _1713 = _1247 * _1703;
    float _1715 = _1253 * _1705;
    float _1717 = _1249 * _1707;
    float _1719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1685);
    float _1721 = -_1713;
    float _1723 = fma(_1249, _1705, _1721);
    float _1725 = _1673 * _1697;
    float _1727 = _1651 * _1697;
    float _1729 = _1681 * _1697;
    float _1731 = -_1717;
    float _1733 = fma(_1253, _1703, _1731);
    float _1735 = _1723 * _1723;
    float _1737 = _1631 * _1697;
    float _1739 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1741 = -_1715;
    float _1743 = fma(_1247, _1707, _1741);
    float _1745 = fma(_1733, _1733, _1735);
    float _1747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1683);
    float _1749 = _1739 * _1075;
    float _1751 = fma(_1711, _1699, _1691);
    float _1753 = fma(_1743, _1743, _1745);
    float _1755 = _1117 * _1747;
    float _1757 = _1749 * _1719;
    float _1759 = -_1693;
    float _1761 = fma(_1711, _1701, _1759);
    float _1763 = rsqrt(_1753);
    float _1765 = _1283 * _1687;
    float _1767 = _1729 * _1757;
    float _1769 = -_1757;
    float _1771 = _1711 * _1769;
    float _1773 = -_1701;
    float _1775 = fma(_1711, _1693, _1773);
    float _1777 = _1725 * _1757;
    float _1779 = fma(_1751, _1755, _1767);
    float _1781 = fma(_1727, _1755, _1771);
    float _1783 = fma(_1711, _1691, _1699);
    float _1785 = fma(_1775, _1755, _1777);
    float _1787 = fma(_1761, _1765, _1779);
    float _1789 = fma(_1737, _1765, _1781);
    float _1791 = fma(_1783, _1765, _1785);
    float _1793 = _1703 * _1787;
    float _1795 = _1705 * _1787;
    float _1797 = _1743 * _1763;
    float _1799 = _1733 * _1763;
    float _1801 = _1723 * _1763;
    float _1803 = fma(_1797, _1789, _1793);
    float _1805 = fma(_1799, _1789, _1795);
    float _1807 = fma(_1249, _1791, _1803);
    float _1809 = fma(_1247, _1791, _1805);
    float _1811 = _693 + _1807;
    float _1813 = _681 + _1809;
    float _1815 = _1707 * _1787;
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1819 = _1811 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1823 = _1813 + _1821;
    float _1825 = fma(_1801, _1789, _1815);
    float _1827 = _1819 * _1819;
    float _1829 = fma(_1253, _1791, _1825);
    float _1831 = fma(_1823, _1823, _1827);
    float _1833 = _669 + _1829;
    float _1835 = sqrt(_1831);
    bool _1837 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = _1829;
    float _1841 = _1791;
    float _1843 = _1825;
    float _1845 = _1639;
    if (!_1837)
    {
        _1839 = _1813;
    }
    float _1847 = _1839;
    float _1849 = _1847;
    if (!_1837)
    {
        _1841 = _1811;
    }
    float _1851 = _1841;
    float _1853 = _1851;
    if (!_1837)
    {
        _1843 = _1833;
    }
    float _1855 = _1843;
    bool _1857 = !_1837;
    float _1859 = _1855;
    if (!_1857)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1865 = _1835 + _1863;
        float _1867 = rsqrt(_1831);
        float _1869 = _1865 * _1861;
        float _1871 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1873 = _1869 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = _1873 * 6.283185482025146484375;
        float _1881 = sin(_1879);
        float _1883 = _1877 + (-1.0);
        float _1885 = fma(_1881, _1871, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = _1867 * _1885;
        float _1891 = fma(_1833, _1877, _1887);
        float _1893 = fma(_1823, _1889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1895 = fma(_1819, _1889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1859 = _1891;
        _1849 = _1893;
        _1853 = _1895;
    }
    float _1897 = _1859;
    float _1899 = _1849;
    float _1901 = _1853;
    float _1903 = -_865;
    float _1905 = _1903 + _1897;
    float _1907 = -_899;
    float _1909 = _1907 + _1899;
    float _1911 = -_945;
    float _1913 = _1911 + _1901;
    float _1915 = -_899;
    float _1917 = _681 + _1915;
    float _1919 = -_809;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1905);
    float _1923 = -_843;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1909);
    float _1927 = -_901;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1913);
    float _1931 = -_945;
    float _1933 = _693 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1921 + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1941 = _1925 + _1939;
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1945 = _1929 + _1943;
    float _1947 = _1937 * _1937;
    float _1949 = -_843;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1917);
    float _1953 = -_901;
    float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1933);
    float _1957 = fma(_1941, _1941, _1947);
    float _1959 = fma(_1945, _1945, _1957);
    float _1961 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1963 = rsqrt(_1959);
    float _1965 = sqrt(_1959);
    float _1967 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1941 * _1967;
    float _1971 = _1945 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1819;
    float _1989 = _1985;
    float _1991 = _1937;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1995 = _1971;
    float _1997 = _1973;
    float _1999 = _1975;
    float _2001 = _1951;
    if (_1981)
    {
        float _2003 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _2003;
    }
    float _2005 = _1987;
    if (_1981)
    {
        float _2007 = _1985 * _2005;
        _1989 = _2007;
    }
    float _2009 = _1989;
    if (_1981)
    {
        float _2011 = _2009 * 0.15915493667125701904296875;
        _1845 = _2011;
    }
    float _2013 = _1845;
    float _2015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2017 = _1831;
    if (_1981)
    {
        float _2019 = _2013 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        _2017 = _2021;
    }
    float _2023 = _2017;
    float _2025 = precise::max(0.0, _2015);
    float _2027 = _2009;
    float _2029 = _2025;
    if (_1981)
    {
        float _2031 = _2013 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        _2027 = _2033;
    }
    float _2035 = _2027;
    float _2037 = -_1967;
    float _2039 = -_2025;
    float _2041 = fma(_1937, _2037, _2039);
    if (_1981)
    {
        float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2043;
    }
    float _2045 = _2029;
    float _2047 = _2045;
    if (!_1981)
    {
        _739 = _2041;
    }
    float _2049 = _739;
    float _2051 = _2015;
    float _2053 = _2049;
    if (_1981)
    {
        float _2055 = rsqrt(_1977);
        _2051 = _2055;
    }
    float _2057 = _2051;
    if (_1981)
    {
        float _2059 = fma(_2023, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2047 = _2059;
    }
    float _2061 = _2047;
    float _2063 = _2061;
    if (_1981)
    {
        float _2065 = _2035 + (-1.0);
        _1991 = _2065;
    }
    float _2067 = _1991;
    float _2069 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2071 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2069);
    float _2073 = _2057;
    if (_1981)
    {
        float _2075 = _2057 * _2061;
        _2063 = _2075;
    }
    float _2077 = _2063;
    if (_1981)
    {
        float _2079 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2073 = _2079;
    }
    float _2081 = _2073;
    float _2083 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1981)
    {
        _1993 = _1969;
    }
    float _2085 = _1993;
    float _2087 = _2085;
    if (_1981)
    {
        float _2089 = _1969 * _2077;
        _2087 = _2089;
    }
    float _2091 = _2087;
    if (_1981)
    {
        float _2093 = fma(_2041, _2035, _2081);
        _2053 = _2093;
    }
    float _2095 = _2053;
    if (_1981)
    {
        float _2097 = _1971 * _2077;
        _1995 = _2097;
    }
    float _2099 = _1995;
    float _2101 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1981)
    {
        float _2103 = _2091 * _2091;
        _1997 = _2103;
    }
    float _2105 = _1997;
    float _2107 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1981)
    {
        float _2109 = _2099 * _2099;
        _1999 = _2109;
    }
    float _2111 = _1999;
    float _2113 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2101);
    float _2115 = fma(_2095, _2095, _2105);
    float _2117 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2121 = _2115 + _2111;
    float _2123 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2113);
    float _2125 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2129 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2127);
    float _2131 = precise::clamp(_2129, 0.0, 1.0);
    float _2133 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2137 = rsqrt(_2121);
    float _2139 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2125);
    float _2141 = -_2131;
    float _2143 = _2141 + 1.0;
    float _2145 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2151 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2071);
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2155 = abs(_2143);
    float _2157 = log2(_2155);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2163 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2153);
    float _2165 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2167 = _2137 * _2091;
    float _2169 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2163);
    float _2171 = floor(_2083);
    float _2173 = _2137 * _2095;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2177 = _2137 * _2099;
    float _2179 = -_2161;
    float _2181 = fma(_2179, _2165, 1.0);
    float _2183 = -_2175;
    float _2185 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2183);
    float _2187 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2189 = floor(_1961);
    float _2191 = -_2177;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2185);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = fma(_2193, -0.5, 0.5);
    float _2199 = fma(_2193, 0.5, 0.5);
    float _2201 = exp2(_2187);
    float _2203 = -_2171;
    float _2205 = _2083 + _2203;
    float _2207 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2209 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2211 = _2173 + 1.0;
    float _2213 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2207);
    float _2215 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2209);
    float _2217 = log2(_2181);
    float _2219 = -_2189;
    float _2221 = _1961 + _2219;
    float _2223 = fma(_2199, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2225 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2213);
    float _2227 = fma(_2199, _2223, -0.212114393711090087890625);
    float _2229 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2225);
    float _2231 = 1.0 / _2169;
    float _2233 = -_2173;
    float _2235 = fma(_2201, _2211, _2233);
    float _2237 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2239 = fma(_2199, _2227, 1.570728778839111328125);
    float _2241 = fma(_2235, 0.5, 0.5);
    float _2243 = sqrt(_2197);
    float _2245 = _2217 * 0.693147182464599609375;
    float2 _6428 = float2(_2205, _2221);
    float _2247 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6428, float2(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6428, float2(0.0), isnan(_6428)), level(0.0)).x;
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2251 = _2229 * _2231;
    float _2253 = _2237 * _2231;
    float _2255 = fma(_2251, 0.5, 0.5);
    float _2257 = fma(_2253, -0.5, 0.5);
    float _2259 = _2243 * 0.636619746685028076171875;
    float _2261 = -_2239;
    float _2263 = fma(_2259, _2261, 1.0);
    float3 _6461 = float3(_2255, _2257, _2249);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6461, float3(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6461, float3(0.0), isnan(_6461)), level(0.0)).x;
    float3 _6472 = float3(_2255, _2257, _2249);
    float4 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6472, float3(0.0), isnan(_6472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6472, float3(0.0), isnan(_6472)), level(0.0)).xyzw;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _2268.w;
    float2 _6488 = float2(_2263, _2241);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6488, float2(0.0), isnan(_6488)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6488, float2(0.0), isnan(_6488)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = -_865;
    float _2290 = _669 + _2288;
    float _2292 = _1761 * _1705;
    bool _2294 = _1685 != 0.0;
    bool _2296 = isnan(_1685);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan(0.0);
    bool _2302 = _2298 || _2300;
    float _2304 = -_809;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2290);
    bool _2308 = _1683 == 0.0;
    bool _2310 = !_2302;
    bool _2312 = _2308 && _2310;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_81.x = _1951;
    out.m_81.y = _2306;
    out.m_81.z = _1955;
    bool _2316 = _1687 == 0.0;
    bool _2318 = _2316 && _2312;
    float _2320 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2314);
    float _2322 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2320);
    float _2324 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2328 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2324);
    float _2330 = 1.0 / _2326;
    float _2332 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2328);
    float _2334 = _2169 * 0.5;
    float _2336 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2338 = _2336 + _2326;
    float _2340 = _2338 * _2330;
    float _2342 = _2340 * 0.5;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2346 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2344);
    float _2348 = 1.0 / _2346;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2348 * _2350;
    float _2354 = abs(_2352);
    float _2356 = log2(_2354);
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2360 = in.m_83.x;
    float _2362 = in.m_83.y;
    float _2364 = in.m_83.z;
    float _2366 = exp2(_2358);
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = fma(_2370, -2.0, 3.0);
    float _2374 = _2370 * _2370;
    bool _2376 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.5);
    bool _2384 = _2380 || _2382;
    float _2386 = _2362;
    float _2388 = _2364;
    float _2390 = _2360;
    float _2392 = _2306;
    float _2394 = _2229;
    if (!_2318)
    {
        float _2396 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2362);
        _2386 = _2396;
    }
    float _2398 = _2386;
    bool _2400 = _2352 <= 8000.0;
    bool _2402 = isnan(_2352);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan(8000.0);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = _2374 * _2372;
    if (!_2318)
    {
        float _2414 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2364);
        _2388 = _2414;
    }
    float _2416 = _2388;
    float _2418 = _1729 * _1707;
    float _2420 = _1751 * _1707;
    float _2422 = -_2412;
    float _2424 = _2422 + 1.0;
    float _2426 = _1761 * _1707;
    if (!_2318)
    {
        float _2428 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2360);
        _2390 = _2428;
    }
    float _2430 = _2390;
    float _2432 = _1729 * _1703;
    float _2434 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2412);
    float _2436 = _1751 * _1705;
    float _2438 = fma(_1727, _1801, _2420);
    float _2440 = fma(_1737, _1801, _2426);
    float _2442 = _2410 * _2434;
    float _2444 = _1729 * _1705;
    float _2446 = -_1711;
    float _2448 = fma(_2446, _1801, _2418);
    float _2450 = -_1711;
    float _2452 = fma(_2450, _1797, _2432);
    float _2454 = fma(_1727, _1799, _2436);
    float _2456 = -_1711;
    float _2458 = fma(_2456, _1799, _2444);
    float _2460 = fma(_1737, _1799, _2292);
    float _2462 = fma(_1725, _1253, _2448);
    float _2464 = fma(_1783, _1253, _2440);
    float _2466 = fma(_1725, _1247, _2458);
    float _2468 = fma(_1775, _1253, _2438);
    float _2470 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2472 = in.m_85.x;
    float _2474 = fma(_1775, _1247, _2454);
    float _2476 = fma(_1783, _1247, _2460);
    float _2478 = _1751 * _1703;
    float _2480 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2482 = _1761 * _1703;
    float _2484 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2470);
    float _2486 = fma(_1727, _1797, _2478);
    float _2488 = fma(_1725, _1249, _2452);
    float _2490 = fma(_1737, _1797, _2482);
    float _2492 = _2466 * _2398;
    float _2494 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2484);
    float _2496 = exp2(_2480);
    float _2498 = fma(_1775, _1249, _2486);
    float _2500 = _2462 * _2398;
    float _2502 = _2488 * _2398;
    float _2504 = fma(_1783, _1249, _2490);
    float _2506 = fma(_2474, _2430, _2492);
    float _2508 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2494);
    float _2510 = fma(_2468, _2430, _2500);
    float _2512 = fma(_2498, _2430, _2502);
    float _2514 = fma(_2476, _2416, _2506);
    float _2516 = _2508 + _2169;
    float _2518 = _2229 + _2169;
    float _2520 = fma(_2464, _2416, _2510);
    float _2522 = fma(_2504, _2416, _2512);
    if (_2384)
    {
        _2001 = 1.0;
    }
    float _2524 = _2001;
    float _2526 = _2516 * 0.5;
    float _2528 = _2518 * 0.5;
    float _2530 = fma(_2237, -0.5, _2334);
    float _2532 = _2524;
    float _2534 = _2169;
    float _2536 = _2526;
    if (_2384)
    {
        _2392 = 1.0;
    }
    float _2538 = _2392;
    float _2540 = _2538;
    if (!_2384)
    {
        float _2542 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2544 = _2542 * 0.15915493667125701904296875;
        float _2546 = _2544 * 6.283185482025146484375;
        float _2548 = cos(_2546);
        float _2550 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2552 = _2550 * 0.15915493667125701904296875;
        float _2554 = _2544 * 6.283185482025146484375;
        float _2556 = sin(_2554);
        float _2558 = 1.0 / _2548;
        float _2560 = _2552 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        float _2564 = _2556 * _2558;
        float _2566 = _2552 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = _2562 * _2564;
        float _2572 = 1.0 / _2570;
        float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2574;
        float _2578 = 1.0 / _2576;
        float _2580 = _2568 * _2572;
        float _2582 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2584 = fma(_2352, _2580, _2582);
        float _2586 = _2584 * _2578;
        float _2588 = precise::clamp(_2586, 0.0, 1.0);
        _2540 = _2588;
    }
    float _2590 = _2540;
    if (!_2384)
    {
        float _2592 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2594 = _2592 * 0.15915493667125701904296875;
        float _2596 = _2594 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2602 = _2600 * 0.15915493667125701904296875;
        float _2604 = _2594 * 6.283185482025146484375;
        float _2606 = sin(_2604);
        float _2608 = 1.0 / _2598;
        float _2610 = _2602 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = _2606 * _2608;
        float _2616 = _2602 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = _2612 * _2614;
        float _2622 = 1.0 / _2620;
        float _2624 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2626 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2624;
        float _2628 = 1.0 / _2626;
        float _2630 = _2618 * _2622;
        float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2634 = fma(_2352, _2630, _2632);
        float _2636 = _2634 * _2628;
        float _2638 = precise::clamp(_2636, 0.0, 1.0);
        float _2640 = -_2638;
        float _2642 = _2640 + 1.0;
        _2532 = _2642;
    }
    float _2644 = _2532;
    float _2646 = -_2496;
    float _2648 = _2646 + 1.0;
    out.m_87.x = _2528;
    out.m_87.y = _2530;
    out.m_87.z = _2526;
    out.m_87.w = _2169;
    float _2650 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2652 = -_2247;
    float _2654 = _2652 + 1.0;
    float _2656 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.x = _2514;
    out.m_89.y = _2520;
    out.m_89.z = _2522;
    float _2658 = _2654 * _2650;
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = _2656 * _2265;
    out.m_91.x = _1925;
    out.m_91.y = _1921;
    out.m_91.z = _1929;
    bool _2664 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2666 = isnan(_1965);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2672 = _2668 || _2670;
    float _2674 = -_2660;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2678 = _2276 * _2662;
    float _2680 = _2286 * _2662;
    float _2682 = -_2656;
    float _2684 = _2682 + 1.0;
    float _2686 = fma(_2282, _2678, _2270);
    float _2688 = fma(_2284, _2678, _2272);
    float _2690 = fma(_2276, _2680, _2274);
    float _2692 = _2276 * _2684;
    float _2694 = _2676 * _2472;
    float _2696 = _2590 * _2644;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2508;
    out.gl_Position.w = _2169;
    float _2698 = _2694;
    float _2700 = _2696;
    if (!_2672)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2702 = _2534;
    float _2704 = _2694 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2706 = _2704;
    float _2708 = _2702;
    float _2710 = _2702;
    if (!_2672)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2712 = _2698;
    out.m_93.x = _2686;
    out.m_93.y = _2688;
    out.m_93.z = _2690;
    out.m_93.w = _2692;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2672)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2536;
    out.m_95.x = _2704;
    float _2720 = _2696 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2722 = _2718;
    float _2724 = _2718;
    if (!_2672)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2726 = _2394;
    float _2728 = _2726;
    float _2730 = _2726;
    if (!_2672)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2732 = _2706;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2672)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2738 = _2700;
    bool _2740 = !_2672;
    float _2742 = _2738;
    float _2744 = _2738;
    if (!_2740)
    {
        bool _2746 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2748 = isnan(_1965);
        bool _2750 = _2746 || _2748;
        bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2754 = _2750 || _2752;
        if (!_2754)
        {
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2758 = _1965 + _2756;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2762 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2760;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2768 = 1.0 / _2762;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2786 = _2758 * _2768;
            float _2788 = precise::clamp(_2786, 0.0, 1.0);
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2794 = fma(_2788, _2766, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2796 = fma(_2788, _2792, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2798 = fma(_2788, _2772, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2800 = fma(_2788, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2802 = fma(_2788, _2780, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2804 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2730 = _2798;
            _2736 = _2802;
            _2716 = _2794;
            _2724 = _2800;
            _2710 = _2796;
            _2744 = _2804;
            _2806 = true;
        }
        else
        {
            bool _2808 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2810 = isnan(_1965);
            bool _2812 = _2808 || _2810;
            bool _2814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2816 = _2812 || _2814;
            if (!_2816)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2818 = _2714;
            _2716 = _2818;
            if (!_2816)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2820 = _2728;
            _2730 = _2820;
            if (!_2816)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2822 = _2708;
            _2710 = _2822;
            if (!_2816)
            {
                _2722 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2824 = _2722;
            _2724 = _2824;
            if (!_2816)
            {
                _2734 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2826 = _2734;
            _2736 = _2826;
            if (!_2816)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2828 = _2742;
            bool _2830 = !_2816;
            _2744 = _2828;
            if (!_2830)
            {
                bool _2832 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2834 = isnan(_1965);
                bool _2836 = _2832 || _2834;
                bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2840 = _2836 || _2838;
                if (!_2840)
                {
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2844 = _1965 + _2842;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2846;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2854 = 1.0 / _2848;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2872 = _2844 * _2854;
                    float _2874 = precise::clamp(_2872, 0.0, 1.0);
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2880 = fma(_2874, _2852, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2730 = _2884;
                    _2736 = _2888;
                    _2716 = _2880;
                    _2724 = _2886;
                    _2710 = _2882;
                    _2744 = _2890;
                    _2806 = true;
                }
                else
                {
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2736 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2724 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2806 = false;
    float _2892 = _2730;
    float _2894 = _2736;
    float _2896 = _2716;
    float _2898 = _2724;
    float _2900 = _2710;
    float _2902 = _2744;
    float _2904 = fma(_2520, -0.5, 0.5);
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = -_2892;
    float _2910 = _2908 + _2894;
    float _2912 = _2720 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2914 = -_2896;
    float _2916 = _2914 + _2898;
    float _2918 = fma(_2906, _2910, _2892);
    out.m_97.x = 0.0;
    float _2920 = -_2900;
    float _2922 = _2920 + _2902;
    float _2924 = fma(_2906, _2916, _2896);
    float _2926 = _2918 * 0.586610972881317138671875;
    out.m_53.x = _2912;
    bool _2928 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2930 = fma(_2906, _2922, _2900);
    float _2932 = fma(_2924, 0.298911988735198974609375, _2926);
    bool _2934 = _2590 > 0.0;
    bool _2936 = isnan(_2590);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.0);
    bool _2942 = _2938 || _2940;
    float _2944 = fma(_2930, 0.114477999508380889892578125, _2932);
    bool _2946 = _2644 <= 0.0;
    bool _2948 = !_2942;
    bool _2950 = _2946 || _2948;
    float _2952 = -_2944;
    float _2954 = _2924 + _2952;
    float _2956 = -_2944;
    float _2958 = _2918 + _2956;
    float _2960 = -_2944;
    float _2962 = _2930 + _2960;
    float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    float _2966 = fma(_2958, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    float _2968 = fma(_2962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    bool _2970 = !_2928;
    if (!_2970)
    {
        float _2972 = -_1921;
        float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2976 = -_1925;
        float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2980 = -_1929;
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2984 = _2974 * _2974;
        float _2986 = fma(_2978, _2978, _2984);
        float _2988 = fma(_2982, _2982, _2986);
        float _2990 = sqrt(_2988);
        float _2992 = rsqrt(_2988);
        float _2994 = -_2990;
        float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = _2978 * _2992;
        float _3004 = _2974 * _2992;
        float _3006 = abs(_3000);
        float _3008 = log2(_3006);
        float _3010 = _2982 * _2992;
        float _3012 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3014 = _2520 * _3004;
        float _3016 = -_3004;
        float _3018 = -_3012;
        float _3020 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3018);
        float _3022 = fma(_2514, _3002, _3014);
        float _3024 = -_3010;
        float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3020);
        float _3028 = fma(_2522, _3010, _3022);
        float _3030 = precise::clamp(_3028, 0.0, 1.0);
        float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3034 = _3026 + _3032;
        float _3036 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3038 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = exp2(_3036);
        float _3044 = _3042 * _3040;
        float _3046 = _3030 * _3044;
        float _3048 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3050 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3052 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3048;
        out.m_97.y = _3050;
        out.m_97.z = _3052;
    }
    out.m_67.x = _2964;
    out.m_67.y = _2966;
    out.m_67.z = _2968;
    if (!_2950)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3054 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3054;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2806 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3122 = as_type<float>(_140);
        out.gl_Position.z = _3122;
    }
    if (!_126)
    {
        return out;
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_166);
        out.gl_Position.z = _3177;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _178 = _122 * _174;
    float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _186 = !_176;
    float _188 = _178;
    if (!_186)
    {
        float _190 = in.m_57.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _188 = _204;
    }
    float _206 = _188;
    float _208 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _210 = int(_208);
    float _212 = in.m_59.y;
    float _214 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _216 = int(_214);
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _220 = float(_210);
    float _222 = 1.0 / _220;
    float _224 = float(uint(_216));
    int _226 = ~_216;
    int _228 = _226 + 1;
    int _230 = ~_216;
    int _232 = _230 + 1;
    float _234 = 1.0 / _224;
    int _236 = ~_216;
    int _238 = _236 + 1;
    float _240 = _222 * _122;
    float _242 = trunc(_240);
    int _244 = int(_242);
    int _246 = as_type<int>(_234) + (-2);
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _250 = _248 != 0;
    bool _252 = !_250;
    float _254 = _252 ? 7.345489978790283203125 : 1.0;
    float _256 = float(uint(_244));
    float _258 = as_type<float>(_246) * _256;
    float _260 = in.m_57.x;
    float _262 = in.m_57.y;
    float _264 = in.m_57.z;
    float _266 = trunc(_258);
    float _268 = precise::max(_266, 0.0);
    uint _271 = uint(_268);
    int _273 = _228 * int(_271);
    int _275 = _273 + _244;
    float _277 = float(uint(_275));
    float _279 = _254 * _260;
    float _281 = as_type<float>(_246) * _277;
    float _283 = float(_216);
    float _285 = floor(_279);
    float _287 = trunc(_281);
    float _289 = precise::max(_287, 0.0);
    uint _291 = uint(_289);
    float _293 = -_285;
    float _295 = _279 + _293;
    int _297 = int(_271) + int(_291);
    float _299 = float(_244);
    int _301 = _232 * _297;
    int _303 = _301 + _244;
    bool _305 = _299 >= _283;
    bool _307 = isnan(_299);
    bool _309 = _305 || _307;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    bool _317 = uint(_303) >= uint(_216);
    float _319 = trunc(_315);
    int _321 = int(_319);
    bool _323 = !_317;
    int _325 = _323 ? 0 : (-1);
    bool _327 = _216 == 0;
    int _329 = ~_297;
    int _331 = _329 + _325;
    int _333 = _331 + 1;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _341 = _339 != 0;
    int _343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _345 = _343 != 0;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _349 = _347 != 0;
    int _351 = _216 * _333;
    int _353 = _351 + _244;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _357 = _355 != 0;
    bool _359 = _262 > 0.5;
    int _361 = ~_321;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    bool _367 = !_327;
    int _369 = _367 ? _353 : (-1);
    float _371 = _295 * _283;
    int _373 = _369 * _365;
    float _375 = _283 * _122;
    float _377 = trunc(_371);
    int _379 = int(_377);
    int _381 = _216 + (-1);
    float _383 = 0.0;
    float _385 = _212;
    if (_357)
    {
        float _387 = in.m_57.x;
        _383 = _387;
    }
    float _389 = _383;
    float _391 = _375 * _174;
    bool _393 = !_341;
    int _395 = _393 ? 0 : 1;
    int _397 = _321 * _381;
    int _399 = _397 + _373;
    bool _401 = !_349;
    int _403 = _401 ? 0 : 1;
    float _405 = in.m_61.w;
    float _407 = trunc(_391);
    int _409 = int(_407);
    bool _411 = !_337;
    int _413 = _411 ? 0 : 1;
    int _415 = abs(_395);
    int _417 = abs(_403);
    int _419 = abs(_413);
    int _421 = _399 * _415;
    bool _423 = !_345;
    int _425 = _423 ? 0 : 1;
    int _427 = _379 * _417;
    int _429 = _427 + _244;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _433 = _431 != 0;
    int _435 = abs(_425);
    bool _437 = !_433;
    int _439 = _437 ? 0 : 1;
    int _441 = _409 * _419;
    int _443 = _441 + _421;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    float _449 = in.m_46.x;
    float _451 = in.m_46.y;
    float _453 = in.m_46.z;
    int _455 = abs(_439);
    int _457 = _429 * _435;
    int _459 = _457 + _443;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _463 = _461 != 0;
    float _465 = _260 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _467 = _379 * _455;
    int _469 = _467 + _459;
    float _471 = -_212;
    float _473 = _471 + 1.0;
    out.m_63.w = _405;
    float _475 = _262 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _479 = float(uint(_469));
    if (_447)
    {
        float _481 = _359 ? _473 : _212;
        _385 = _481;
    }
    float _483 = _385;
    float _485 = -_477;
    float _487 = fma(_465, 2.0, _485);
    float _489 = as_type<float>(_246) * _479;
    int _491 = ~_216;
    int _493 = _491 + 1;
    float _495 = fma(_475, -2.0, _218);
    float _497 = trunc(_489);
    float _499 = precise::max(_497, 0.0);
    uint _501 = uint(_499);
    bool _503 = _389 > 0.5;
    bool _505 = _503 && _357;
    float _507 = _451 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _509 = _451 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _451 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
    float _527 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _529 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _511);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
    bool _537 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _539 = isnan(_206);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = 1.0 / _533;
    int _551 = ~_216;
    int _553 = _551 + 1;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _559 = _493 * int(_501);
    int _561 = _559 + _469;
    float _563 = float(uint(_561));
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _571 = 1.0 / _557;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _575 = as_type<float>(_246) * _563;
    float _577 = in.m_59.x;
    float _579 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _589 = trunc(_575);
    float _591 = precise::max(_589, 0.0);
    uint _593 = uint(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    out.m_65.x = _579;
    out.m_65.y = _581;
    out.m_65.z = _583;
    out.m_65.w = _573;
    float _599 = _597 * _549;
    bool _601 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _603 = isnan(_206);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _587 * _571;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _206 + _615;
    float _619 = fma(_599, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _623 = int(_501) + int(_593);
    float _625 = -_611;
    float _627 = _625 + 1.0;
    bool _629 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_206);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -_547;
    float _643 = _641 + 1.0;
    float _645 = 0.0;
    float _647 = _577;
    if (_357)
    {
        _645 = _577;
    }
    float _649 = _645;
    float _651 = _547 * _627;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = _206 + _653;
    float _657 = _639 * _643;
    float _659 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
    int _661 = _553 * _623;
    int _663 = _661 + _469;
    float _665 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].z, _529);
    float _667 = _619 * _657;
    float _669 = _659 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _671 = fma(_613, _655, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _673 = _649;
    if (_505)
    {
        float _675 = -_649;
        float _677 = _675 + 1.0;
        _673 = _677;
    }
    float _679 = _673;
    float _681 = _535 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _685 = _669 + _683;
    bool _687 = uint(_663) >= uint(_216);
    float _689 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[79].z, _621);
    float _691 = float(uint(_429));
    float _693 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _681 + _695;
    float _699 = _685 * _685;
    bool _701 = !_687;
    int _703 = _701 ? 0 : (-1);
    float _705 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _689);
    float _707 = as_type<float>(_246) * _691;
    float _709 = fma(_697, _697, _699);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _693 + _711;
    int _715 = ~_623;
    int _717 = _715 + _703;
    int _719 = _717 + 1;
    float _721 = _705 * (-0.15915493667125701904296875);
    float _723 = trunc(_707);
    float _725 = precise::max(_723, 0.0);
    uint _727 = uint(_725);
    float _729 = fma(_713, _713, _709);
    float _731 = -_639;
    float _733 = _731 + 1.0;
    int _735 = _216 * _719;
    int _737 = _735 + _469;
    float _739 = _681;
    if (_357)
    {
        _647 = _679;
    }
    float _741 = _647;
    float _743 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _745 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _747 = _721 * 6.283185482025146484375;
    float _749 = sin(_747);
    bool _751 = !_327;
    int _753 = _751 ? _737 : (-1);
    float _755 = fma(_671, _651, _745);
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _759 = _753 >> 31;
    int _761 = _753 & 3;
    bool _763 = _761 != 0;
    float _765 = _721 * 6.283185482025146484375;
    float _767 = cos(_765);
    int _769 = _759 & 3;
    float _771 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _773 = _753 + _769;
    float _775 = _771 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _777 = rsqrt(_729);
    int _779 = ~_216;
    int _781 = _779 + 1;
    float _783 = _749 * _743;
    int _785 = _773 >> 2;
    int _787 = _781 * int(_727);
    int _789 = _787 + _429;
    int _791 = _785 << 4;
    int _793 = _791 + 368;
    float _795 = sqrt(_729);
    float _797 = _767 * _743;
    float _799 = -_783;
    float _801 = fma(_767, _757, _799);
    float _803 = float(uint(_789));
    float _805 = fma(_749, _757, _797);
    float _807 = as_type<float>(_246) * _803;
    float _809 = _685 * _777;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _813 = trunc(_807);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    uint _819 = uint(int(uint(_793) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    float _835 = -_809;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _685);
    float _839 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    float _841 = _795 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _843 = _697 * _777;
    float _845 = _685 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _847 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _839);
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _853 = _837 * _837;
    float _855 = precise::min(_775, _841);
    float _857 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _845);
    float _859 = fma(_851, _851, _853);
    int _861 = _753 & 3;
    bool _863 = _861 != 0;
    float _865 = _809 * _855;
    int _867 = int(_727) + int(_817);
    float _869 = -_122;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[76].x, _487);
    int _873 = _763 ? 0 : 1;
    float _875 = -_865;
    float _877 = _685 + _875;
    bool _879 = uint(_861) > 1u;
    int _881 = _793 + 8;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[int(_893)][_895];
    float _899 = _843 * _855;
    float _901 = _713 * _777;
    float _903 = _877 * _877;
    float _905 = fma(_847, _801, _871);
    float _907 = -_899;
    float _909 = _697 + _907;
    float _911 = -_901;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    int _915 = ~_873;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    float _921 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _857);
    bool _923 = !_863;
    int _925 = _923 ? 0 : 1;
    float _927 = fma(_909, _909, _903);
    bool _929 = uint(_861) >= 2u;
    int _931 = _238 * _867;
    int _933 = _931 + _429;
    int _935 = _919;
    if (!_879)
    {
        int _937 = ~_873;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = fma(_913, _913, _859);
    float _945 = _901 * _855;
    int _947 = abs(_925);
    out.m_67.w = _855;
    int _949 = abs(_941);
    int _951 = _929 ? 0 : 1;
    bool _953 = _861 != 3;
    bool _955 = uint(_933) >= uint(_216);
    float _957 = -_945;
    float _959 = _713 + _957;
    int _961 = ~_947;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_959, _959, _927);
    int _969 = ~_949;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    bool _975 = !_955;
    int _977 = _975 ? 0 : (-1);
    bool _979 = _861 != 3;
    int _981 = _973 * as_type<int>(_833);
    int _983 = ~_867;
    int _985 = _983 + _977;
    int _987 = _985 + 1;
    float _989 = sqrt(_967);
    int _991 = ~_951;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    int _997 = _965 * as_type<int>(_825);
    int _999 = _997 + _981;
    int _1001 = _995;
    if (_953)
    {
        int _1003 = ~_951;
        int _1005 = _1003 + 1;
        _1001 = _1005;
    }
    int _1007 = _1001;
    int _1009 = _216 * _987;
    int _1011 = _1009 + _429;
    bool _1013 = !_979;
    int _1015 = _1013 ? 0 : (-1);
    int _1017 = abs(_1007);
    float _1019 = sqrt(_943);
    bool _1021 = !_463;
    int _1023 = _1021 ? 0 : 1;
    int _1025 = abs(_1015);
    int _1027 = abs(_1023);
    float _1029 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _495);
    int _1031 = ~_1017;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    float _1037 = _777 * _989;
    int _1039 = ~_1025;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    int _1045 = _1035 * as_type<int>(_889);
    int _1047 = _1045 + _999;
    int _1049 = ~_1027;
    int _1051 = _1049 + 1;
    int _1053 = _1051 + 1;
    float _1055 = _777 * _1019;
    bool _1057 = _921 >= 0.0;
    int _1059 = _1043 * as_type<int>(_897);
    int _1061 = _1059 + _1047;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1065 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[117].x, _755);
    int _1067 = _1061 * _1053;
    bool _1069 = !_327;
    int _1071 = _1069 ? _1011 : (-1);
    float _1073 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1063);
    float _1075 = _1037 * _1055;
    int _1077 = _1071 * _1027;
    int _1079 = _1077 + _1067;
    float _1081 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1073);
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1057)
    {
        _1089 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1091 = _1089;
    float _1093 = -_1029;
    float _1095 = fma(_1081, _805, _1093);
    float _1097 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1105 = _905 + 0.5;
    float _1107 = _1095 + 0.5;
    int _1109 = as_type<int>(_1091);
    if (_1057)
    {
        float _1111 = _1091 * 5.0;
        _1109 = as_type<int>(_1111);
    }
    int _1113 = _1109;
    float _1115 = float(_1079);
    float _1117 = _771 * _1075;
    out.m_69.x = _1097;
    out.m_69.y = _1099;
    out.m_69.z = _1101;
    out.m_69.w = _1103;
    bool _1119 = !_519;
    int _1121 = _1119 ? 0 : 1;
    bool _1123 = !_523;
    int _1125 = _1123 ? 0 : 1;
    out.m_71.x = _1105;
    out.m_71.y = _1107;
    bool _1127 = !_515;
    int _1129 = _1127 ? 0 : 1;
    if (_1057)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4647 = as_type<float>(_1113);
        out.gl_Position.z = _4647;
    }
    out.m_73.x = _1115;
    if (_1057)
    {
        out.m_53.x = 0.0;
    }
    out.m_75.x = _1117;
    if (_1057)
    {
        return out;
    }
    float _1131 = -_809;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    float _1135 = -_843;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _681);
    float _1139 = -_901;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1145 = _1133 + _1143;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1149 = _1137 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1153 = _1141 + _1151;
    float _1155 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1155);
    float _1159 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1157);
    bool _1161 = _1159 >= 0.0;
    float _1163 = _1153;
    if (_1161)
    {
        _1163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1165 = _1163;
    int _1167 = as_type<int>(_1165);
    if (_1161)
    {
        out.m_53.x = 0.0;
    }
    if (_1161)
    {
        float _1169 = _1165 * 5.0;
        _1167 = as_type<int>(_1169);
    }
    int _1171 = _1167;
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4742 = as_type<float>(_1171);
        out.gl_Position.z = _4742;
    }
    if (_1161)
    {
        return out;
    }
    float _1173 = -_669;
    float _1175 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1177 = -_681;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1181 = -_693;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1185 = _1175 * _1175;
    float _1187 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1189 = fma(_1179, _1179, _1185);
    float _1191 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1193 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1195 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1197 = fma(_1183, _1183, _1189);
    float _1199 = -_1191;
    float _1201 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1199);
    float _1203 = -_1195;
    float _1205 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1207 = rsqrt(_1197);
    float _1209 = -_1193;
    float _1211 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1209);
    float _1213 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1215 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1221 = -_1213;
    float _1223 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1221);
    float _1225 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1227 = log2(_1225);
    float _1229 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1231 = -_1215;
    float _1233 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1231);
    float _1235 = -_1217;
    float _1237 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1235);
    float _1239 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1241 = -_1229;
    float _1243 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1241);
    float _1245 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1247 = _1179 * _1207;
    float _1249 = _1183 * _1207;
    float _1251 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1243);
    float _1253 = _1175 * _1207;
    float _1255 = _1247 * _1247;
    float _1257 = -_1239;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1257);
    float _1261 = -_1245;
    float _1263 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1261);
    bool _1265 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1267 = isnan(0.0);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1273 = _1269 || _1271;
    float _1275 = fma(_1249, _1249, _1255);
    float _1277 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1279 = _1227 * _122;
    float _1281 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1263);
    float _1283 = _1187 * _1075;
    float _1285 = -_1277;
    float _1287 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1285);
    float _1289 = rsqrt(_1275);
    float _1291 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1293 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1287);
    float _1295 = -_1291;
    float _1297 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1295);
    float _1299 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1301 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1297);
    float _1303 = -_1299;
    float _1305 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1303);
    float _1307 = _260 * 2.0;
    float _1309 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1305);
    float _1311 = _1249 * _1289;
    float _1313 = _1247 * _1289;
    float _1315 = exp2(_1279);
    float _1317 = -_1311;
    float _1319 = _1249 * _1317;
    float _1321 = -_1311;
    float _1323 = _1253 * _1321;
    float _1325 = -_1319;
    float _1327 = fma(_1247, _1313, _1325);
    float _1329 = _1253 * _1313;
    float _1331 = _1327 * _1327;
    float _1333 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1259);
    float _1335 = fma(_1329, _1329, _1331);
    float _1337 = -_1333;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1309);
    float _1341 = floor(_1307);
    float _1343 = _264 + _260;
    float _1345 = fma(_1323, _1323, _1335);
    float _1347 = _262 + _260;
    float _1349 = _260 + (-0.5);
    float _1351 = _262 + _264;
    float _1353 = _262 + (-0.5);
    float _1355 = rsqrt(_1345);
    float _1357 = _1347 + (-1.0);
    float _1359 = _1351 + (-1.0);
    float _1361 = _264 + (-0.5);
    float _1363 = _262 * 2.0;
    float _1365 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1367 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1369 = _264 * 2.0;
    float _1371 = 1.0 / _1339;
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = -_1367;
    float _1377 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1375);
    float _1379 = -_1219;
    float _1381 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1379);
    float _1383 = -_1315;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1377);
    float _1389 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1381);
    float _1391 = _1327 * _1355;
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    bool _1395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(1.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = floor(_1363);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1409 = 1.0 + _1407;
    float _1411 = -_1393;
    float _1413 = _1411 + 1.0;
    bool _1415 = _1341 > 0.0;
    float _1417 = _1343 + (-1.0);
    bool _1419 = _1341 >= 0.0;
    bool _1421 = isnan(_1341);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan(0.0);
    bool _1427 = _1423 || _1425;
    float _1429 = fma(_1389, _1371, -1.0);
    float _1431 = _1413 * _1371;
    float _1433 = floor(_1369);
    float _1435 = _1273 ? _1385 : 0.0;
    float _1437 = fma(_1413, _1429, 1.0);
    float _1439 = _1387 * _1431;
    float _1441 = _1281 * _1431;
    float _1443 = _1437 * _1437;
    float _1445 = 1.0 / _1409;
    bool _1447 = _1405 > 0.0;
    float _1449 = fma(_1439, _1439, _1443);
    bool _1451 = _1405 >= 0.0;
    bool _1453 = isnan(_1405);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan(0.0);
    bool _1459 = _1455 || _1457;
    int _1461 = _1427 ? 0 : 1;
    float _1463 = fma(_1441, _1441, _1449);
    int _1465 = _1459 ? 0 : 1;
    bool _1467 = _1433 > 0.0;
    bool _1469 = _1433 >= 0.0;
    bool _1471 = isnan(_1433);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(0.0);
    bool _1477 = _1473 || _1475;
    float _1479 = rsqrt(_1463);
    int _1481 = ~_1461;
    int _1483 = _1481 + 1;
    int _1485 = _1483 + 1;
    int _1487 = _1485;
    if (!_1415)
    {
        int _1489 = ~_1461;
        int _1491 = _1489 + 1;
        _1487 = _1491;
    }
    int _1493 = _1487;
    if (_1403)
    {
        float _1495 = _1435 * _1445;
        _132 = _1495;
    }
    float _1497 = _132;
    int _1499 = _1477 ? 0 : 1;
    float _1501 = in.m_77.x;
    float _1503 = in.m_77.y;
    float _1505 = in.m_77.z;
    int _1507 = abs(_1121);
    int _1509 = abs(_1129);
    int _1511 = ~_1499;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    int _1517 = _1515;
    if (!_1467)
    {
        int _1519 = ~_1499;
        int _1521 = _1519 + 1;
        _1517 = _1521;
    }
    int _1523 = _1517;
    float _1525 = float(_1507);
    float _1527 = _1437 * _1479;
    int _1529 = ~_1465;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = _1441 * _1479;
    int _1537 = _1533;
    if (!_1447)
    {
        int _1539 = ~_1465;
        int _1541 = _1539 + 1;
        _1537 = _1541;
    }
    int _1543 = _1537;
    float _1545 = _1439 * _1479;
    float _1547 = float(_1493);
    float _1549 = _1249 * _1527;
    float _1551 = float(_1509);
    float _1553 = float(_1523);
    float _1555 = -_1535;
    float _1557 = _1247 * _1555;
    float _1559 = _1525 * _1547;
    float _1561 = float(_1543);
    float _1563 = _1551 * _1553;
    float _1565 = -_1545;
    float _1567 = -_1557;
    float _1569 = fma(_1249, _1565, _1567);
    float _1571 = -_1535;
    float _1573 = -_1549;
    float _1575 = fma(_1253, _1571, _1573);
    float _1577 = _1559 * (-2.0);
    float _1579 = -_1545;
    float _1581 = _1253 * _1579;
    float _1583 = _1569 * _1569;
    int _1585 = abs(_1125);
    float _1587 = fma(_1373, _1577, _1373);
    float _1589 = fma(_1577, _1503, _1503);
    float _1591 = -_1581;
    float _1593 = fma(_1247, _1527, _1591);
    float _1595 = fma(_1575, _1575, _1583);
    float _1597 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1589);
    float _1599 = fma(_1593, _1593, _1595);
    float _1601 = float(_1585);
    float _1603 = fma(_1587, _1497, _1597);
    float _1605 = _1563 * (-2.0);
    float _1607 = rsqrt(_1599);
    float _1609 = _1601 * _1561;
    float _1611 = fma(_1605, _1501, _1501);
    float _1613 = fma(_1365, _1605, _1365);
    float _1615 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = _1609 * (-2.0);
    float _1619 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1611);
    float _1621 = _1603 * 0.15915493667125701904296875;
    float _1623 = fma(_1617, _1505, _1505);
    float _1625 = fma(_1615, _1617, _1615);
    float _1627 = fma(_1613, _1497, _1619);
    float _1629 = _1621 * 6.283185482025146484375;
    float _1631 = sin(_1629);
    float _1633 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1623);
    float _1635 = _1627 * 0.15915493667125701904296875;
    float _1637 = _1575 * _1607;
    float _1639 = _1593 * _1607;
    float _1641 = _1569 * _1607;
    float _1643 = fma(_1625, _1497, _1633);
    float _1645 = _1249 * _1637;
    float _1647 = _1253 * _1639;
    float _1649 = _1621 * 6.283185482025146484375;
    float _1651 = cos(_1649);
    float _1653 = -_1645;
    float _1655 = fma(_1247, _1639, _1653);
    float _1657 = -_1647;
    float _1659 = fma(_1249, _1641, _1657);
    float _1661 = _1247 * _1641;
    float _1663 = -_1661;
    float _1665 = fma(_1253, _1637, _1663);
    float _1667 = _1643 * 0.15915493667125701904296875;
    float _1669 = _1655 * _1655;
    float _1671 = _1635 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = fma(_1659, _1659, _1669);
    float _1677 = fma(_1665, _1665, _1675);
    float _1679 = _1635 * 6.283185482025146484375;
    float _1681 = cos(_1679);
    float _1683 = in.m_79.x;
    float _1685 = in.m_79.y;
    float _1687 = in.m_79.z;
    float _1689 = rsqrt(_1677);
    float _1691 = _1673 * _1631;
    float _1693 = _1673 * _1651;
    float _1695 = _1667 * 6.283185482025146484375;
    float _1697 = cos(_1695);
    float _1699 = _1681 * _1651;
    float _1701 = _1681 * _1631;
    float _1703 = _1665 * _1689;
    float _1705 = _1659 * _1689;
    float _1707 = _1655 * _1689;
    float _1709 = _1667 * 6.283185482025146484375;
    float _1711 = sin(_1709);
    float _1713 = _1247 * _1703;
    float _1715 = _1253 * _1705;
    float _1717 = _1249 * _1707;
    float _1719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1685);
    float _1721 = -_1713;
    float _1723 = fma(_1249, _1705, _1721);
    float _1725 = _1673 * _1697;
    float _1727 = _1651 * _1697;
    float _1729 = _1681 * _1697;
    float _1731 = -_1717;
    float _1733 = fma(_1253, _1703, _1731);
    float _1735 = _1723 * _1723;
    float _1737 = _1631 * _1697;
    float _1739 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1741 = -_1715;
    float _1743 = fma(_1247, _1707, _1741);
    float _1745 = fma(_1733, _1733, _1735);
    float _1747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1683);
    float _1749 = _1739 * _1075;
    float _1751 = fma(_1711, _1699, _1691);
    float _1753 = fma(_1743, _1743, _1745);
    float _1755 = _1117 * _1747;
    float _1757 = _1749 * _1719;
    float _1759 = -_1693;
    float _1761 = fma(_1711, _1701, _1759);
    float _1763 = rsqrt(_1753);
    float _1765 = _1283 * _1687;
    float _1767 = _1729 * _1757;
    float _1769 = -_1757;
    float _1771 = _1711 * _1769;
    float _1773 = -_1701;
    float _1775 = fma(_1711, _1693, _1773);
    float _1777 = _1725 * _1757;
    float _1779 = fma(_1751, _1755, _1767);
    float _1781 = fma(_1727, _1755, _1771);
    float _1783 = fma(_1711, _1691, _1699);
    float _1785 = fma(_1775, _1755, _1777);
    float _1787 = fma(_1761, _1765, _1779);
    float _1789 = fma(_1737, _1765, _1781);
    float _1791 = fma(_1783, _1765, _1785);
    float _1793 = _1703 * _1787;
    float _1795 = _1705 * _1787;
    float _1797 = _1743 * _1763;
    float _1799 = _1733 * _1763;
    float _1801 = _1723 * _1763;
    float _1803 = fma(_1797, _1789, _1793);
    float _1805 = fma(_1799, _1789, _1795);
    float _1807 = fma(_1249, _1791, _1803);
    float _1809 = fma(_1247, _1791, _1805);
    float _1811 = _693 + _1807;
    float _1813 = _681 + _1809;
    float _1815 = _1707 * _1787;
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1819 = _1811 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1823 = _1813 + _1821;
    float _1825 = fma(_1801, _1789, _1815);
    float _1827 = _1819 * _1819;
    float _1829 = fma(_1253, _1791, _1825);
    float _1831 = fma(_1823, _1823, _1827);
    float _1833 = _669 + _1829;
    float _1835 = sqrt(_1831);
    bool _1837 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = _1829;
    float _1841 = _1791;
    float _1843 = _1825;
    float _1845 = _1639;
    if (!_1837)
    {
        _1839 = _1813;
    }
    float _1847 = _1839;
    float _1849 = _1847;
    if (!_1837)
    {
        _1841 = _1811;
    }
    float _1851 = _1841;
    float _1853 = _1851;
    if (!_1837)
    {
        _1843 = _1833;
    }
    float _1855 = _1843;
    bool _1857 = !_1837;
    float _1859 = _1855;
    if (!_1857)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1865 = _1835 + _1863;
        float _1867 = rsqrt(_1831);
        float _1869 = _1865 * _1861;
        float _1871 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1873 = _1869 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = _1873 * 6.283185482025146484375;
        float _1881 = sin(_1879);
        float _1883 = _1877 + (-1.0);
        float _1885 = fma(_1881, _1871, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = _1867 * _1885;
        float _1891 = fma(_1833, _1877, _1887);
        float _1893 = fma(_1823, _1889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1895 = fma(_1819, _1889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1859 = _1891;
        _1849 = _1893;
        _1853 = _1895;
    }
    float _1897 = _1859;
    float _1899 = _1849;
    float _1901 = _1853;
    float _1903 = -_865;
    float _1905 = _1903 + _1897;
    float _1907 = -_899;
    float _1909 = _1907 + _1899;
    float _1911 = -_945;
    float _1913 = _1911 + _1901;
    float _1915 = -_899;
    float _1917 = _681 + _1915;
    float _1919 = -_809;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1905);
    float _1923 = -_843;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1909);
    float _1927 = -_901;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1913);
    float _1931 = -_945;
    float _1933 = _693 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1921 + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1941 = _1925 + _1939;
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1945 = _1929 + _1943;
    float _1947 = _1937 * _1937;
    float _1949 = -_843;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1917);
    float _1953 = -_901;
    float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1933);
    float _1957 = fma(_1941, _1941, _1947);
    float _1959 = fma(_1945, _1945, _1957);
    float _1961 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1963 = rsqrt(_1959);
    float _1965 = sqrt(_1959);
    float _1967 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1941 * _1967;
    float _1971 = _1945 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1819;
    float _1989 = _1985;
    float _1991 = _1937;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1995 = _1971;
    float _1997 = _1973;
    float _1999 = _1975;
    float _2001 = _1951;
    if (_1981)
    {
        float _2003 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _2003;
    }
    float _2005 = _1987;
    if (_1981)
    {
        float _2007 = _1985 * _2005;
        _1989 = _2007;
    }
    float _2009 = _1989;
    if (_1981)
    {
        float _2011 = _2009 * 0.15915493667125701904296875;
        _1845 = _2011;
    }
    float _2013 = _1845;
    float _2015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2017 = _1831;
    if (_1981)
    {
        float _2019 = _2013 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        _2017 = _2021;
    }
    float _2023 = _2017;
    float _2025 = precise::max(0.0, _2015);
    float _2027 = _2009;
    float _2029 = _2025;
    if (_1981)
    {
        float _2031 = _2013 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        _2027 = _2033;
    }
    float _2035 = _2027;
    float _2037 = -_1967;
    float _2039 = -_2025;
    float _2041 = fma(_1937, _2037, _2039);
    if (_1981)
    {
        float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2043;
    }
    float _2045 = _2029;
    float _2047 = _2045;
    if (!_1981)
    {
        _739 = _2041;
    }
    float _2049 = _739;
    float _2051 = _2015;
    float _2053 = _2049;
    if (_1981)
    {
        float _2055 = rsqrt(_1977);
        _2051 = _2055;
    }
    float _2057 = _2051;
    if (_1981)
    {
        float _2059 = fma(_2023, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2047 = _2059;
    }
    float _2061 = _2047;
    float _2063 = _2061;
    if (_1981)
    {
        float _2065 = _2035 + (-1.0);
        _1991 = _2065;
    }
    float _2067 = _1991;
    float _2069 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2071 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2069);
    float _2073 = _2057;
    if (_1981)
    {
        float _2075 = _2057 * _2061;
        _2063 = _2075;
    }
    float _2077 = _2063;
    if (_1981)
    {
        float _2079 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2073 = _2079;
    }
    float _2081 = _2073;
    float _2083 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1981)
    {
        _1993 = _1969;
    }
    float _2085 = _1993;
    float _2087 = _2085;
    if (_1981)
    {
        float _2089 = _1969 * _2077;
        _2087 = _2089;
    }
    float _2091 = _2087;
    if (_1981)
    {
        float _2093 = fma(_2041, _2035, _2081);
        _2053 = _2093;
    }
    float _2095 = _2053;
    if (_1981)
    {
        float _2097 = _1971 * _2077;
        _1995 = _2097;
    }
    float _2099 = _1995;
    float _2101 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1981)
    {
        float _2103 = _2091 * _2091;
        _1997 = _2103;
    }
    float _2105 = _1997;
    float _2107 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1981)
    {
        float _2109 = _2099 * _2099;
        _1999 = _2109;
    }
    float _2111 = _1999;
    float _2113 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2101);
    float _2115 = fma(_2095, _2095, _2105);
    float _2117 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2121 = _2115 + _2111;
    float _2123 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2113);
    float _2125 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2129 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2127);
    float _2131 = precise::clamp(_2129, 0.0, 1.0);
    float _2133 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2137 = rsqrt(_2121);
    float _2139 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2125);
    float _2141 = -_2131;
    float _2143 = _2141 + 1.0;
    float _2145 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2151 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2071);
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2155 = abs(_2143);
    float _2157 = log2(_2155);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2163 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2153);
    float _2165 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2167 = _2137 * _2091;
    float _2169 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2163);
    float _2171 = floor(_2083);
    float _2173 = _2137 * _2095;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2177 = _2137 * _2099;
    float _2179 = -_2161;
    float _2181 = fma(_2179, _2165, 1.0);
    float _2183 = -_2175;
    float _2185 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2183);
    float _2187 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2189 = floor(_1961);
    float _2191 = -_2177;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2185);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = fma(_2193, -0.5, 0.5);
    float _2199 = fma(_2193, 0.5, 0.5);
    float _2201 = exp2(_2187);
    float _2203 = -_2171;
    float _2205 = _2083 + _2203;
    float _2207 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2209 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2211 = _2173 + 1.0;
    float _2213 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2207);
    float _2215 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2209);
    float _2217 = log2(_2181);
    float _2219 = -_2189;
    float _2221 = _1961 + _2219;
    float _2223 = fma(_2199, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2225 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2213);
    float _2227 = fma(_2199, _2223, -0.212114393711090087890625);
    float _2229 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2225);
    float _2231 = 1.0 / _2169;
    float _2233 = -_2173;
    float _2235 = fma(_2201, _2211, _2233);
    float _2237 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2239 = fma(_2199, _2227, 1.570728778839111328125);
    float _2241 = fma(_2235, 0.5, 0.5);
    float _2243 = sqrt(_2197);
    float _2245 = _2217 * 0.693147182464599609375;
    float2 _6428 = float2(_2205, _2221);
    float _2247 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6428, float2(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6428, float2(0.0), isnan(_6428)), level(0.0)).x;
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2251 = _2229 * _2231;
    float _2253 = _2237 * _2231;
    float _2255 = fma(_2251, 0.5, 0.5);
    float _2257 = fma(_2253, -0.5, 0.5);
    float _2259 = _2243 * 0.636619746685028076171875;
    float _2261 = -_2239;
    float _2263 = fma(_2259, _2261, 1.0);
    float3 _6461 = float3(_2255, _2257, _2249);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6461, float3(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6461, float3(0.0), isnan(_6461)), level(0.0)).x;
    float3 _6472 = float3(_2255, _2257, _2249);
    float4 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6472, float3(0.0), isnan(_6472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6472, float3(0.0), isnan(_6472)), level(0.0)).xyzw;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _2268.w;
    float2 _6488 = float2(_2263, _2241);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6488, float2(0.0), isnan(_6488)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6488, float2(0.0), isnan(_6488)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = -_865;
    float _2290 = _669 + _2288;
    float _2292 = _1761 * _1705;
    bool _2294 = _1685 != 0.0;
    bool _2296 = isnan(_1685);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan(0.0);
    bool _2302 = _2298 || _2300;
    float _2304 = -_809;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2290);
    bool _2308 = _1683 == 0.0;
    bool _2310 = !_2302;
    bool _2312 = _2308 && _2310;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_81.x = _1951;
    out.m_81.y = _2306;
    out.m_81.z = _1955;
    bool _2316 = _1687 == 0.0;
    bool _2318 = _2316 && _2312;
    float _2320 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2314);
    float _2322 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2320);
    float _2324 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2328 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2324);
    float _2330 = 1.0 / _2326;
    float _2332 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2328);
    float _2334 = _2169 * 0.5;
    float _2336 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2338 = _2336 + _2326;
    float _2340 = _2338 * _2330;
    float _2342 = _2340 * 0.5;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2346 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2344);
    float _2348 = 1.0 / _2346;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2348 * _2350;
    float _2354 = abs(_2352);
    float _2356 = log2(_2354);
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2360 = in.m_83.x;
    float _2362 = in.m_83.y;
    float _2364 = in.m_83.z;
    float _2366 = exp2(_2358);
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = fma(_2370, -2.0, 3.0);
    float _2374 = _2370 * _2370;
    bool _2376 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.5);
    bool _2384 = _2380 || _2382;
    float _2386 = _2362;
    float _2388 = _2364;
    float _2390 = _2360;
    float _2392 = _2306;
    float _2394 = _2229;
    if (!_2318)
    {
        float _2396 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2362);
        _2386 = _2396;
    }
    float _2398 = _2386;
    bool _2400 = _2352 <= 8000.0;
    bool _2402 = isnan(_2352);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan(8000.0);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = _2374 * _2372;
    if (!_2318)
    {
        float _2414 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2364);
        _2388 = _2414;
    }
    float _2416 = _2388;
    float _2418 = _1729 * _1707;
    float _2420 = _1751 * _1707;
    float _2422 = -_2412;
    float _2424 = _2422 + 1.0;
    float _2426 = _1761 * _1707;
    if (!_2318)
    {
        float _2428 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2360);
        _2390 = _2428;
    }
    float _2430 = _2390;
    float _2432 = _1729 * _1703;
    float _2434 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2412);
    float _2436 = _1751 * _1705;
    float _2438 = fma(_1727, _1801, _2420);
    float _2440 = fma(_1737, _1801, _2426);
    float _2442 = _2410 * _2434;
    float _2444 = _1729 * _1705;
    float _2446 = -_1711;
    float _2448 = fma(_2446, _1801, _2418);
    float _2450 = -_1711;
    float _2452 = fma(_2450, _1797, _2432);
    float _2454 = fma(_1727, _1799, _2436);
    float _2456 = -_1711;
    float _2458 = fma(_2456, _1799, _2444);
    float _2460 = fma(_1737, _1799, _2292);
    float _2462 = fma(_1725, _1253, _2448);
    float _2464 = fma(_1783, _1253, _2440);
    float _2466 = fma(_1725, _1247, _2458);
    float _2468 = fma(_1775, _1253, _2438);
    float _2470 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2472 = in.m_85.x;
    float _2474 = fma(_1775, _1247, _2454);
    float _2476 = fma(_1783, _1247, _2460);
    float _2478 = _1751 * _1703;
    float _2480 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2482 = _1761 * _1703;
    float _2484 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2470);
    float _2486 = fma(_1727, _1797, _2478);
    float _2488 = fma(_1725, _1249, _2452);
    float _2490 = fma(_1737, _1797, _2482);
    float _2492 = _2466 * _2398;
    float _2494 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2484);
    float _2496 = exp2(_2480);
    float _2498 = fma(_1775, _1249, _2486);
    float _2500 = _2462 * _2398;
    float _2502 = _2488 * _2398;
    float _2504 = fma(_1783, _1249, _2490);
    float _2506 = fma(_2474, _2430, _2492);
    float _2508 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2494);
    float _2510 = fma(_2468, _2430, _2500);
    float _2512 = fma(_2498, _2430, _2502);
    float _2514 = fma(_2476, _2416, _2506);
    float _2516 = _2508 + _2169;
    float _2518 = _2229 + _2169;
    float _2520 = fma(_2464, _2416, _2510);
    float _2522 = fma(_2504, _2416, _2512);
    if (_2384)
    {
        _2001 = 1.0;
    }
    float _2524 = _2001;
    float _2526 = _2516 * 0.5;
    float _2528 = _2518 * 0.5;
    float _2530 = fma(_2237, -0.5, _2334);
    float _2532 = _2524;
    float _2534 = _2169;
    float _2536 = _2526;
    if (_2384)
    {
        _2392 = 1.0;
    }
    float _2538 = _2392;
    float _2540 = _2538;
    if (!_2384)
    {
        float _2542 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2544 = _2542 * 0.15915493667125701904296875;
        float _2546 = _2544 * 6.283185482025146484375;
        float _2548 = cos(_2546);
        float _2550 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2552 = _2550 * 0.15915493667125701904296875;
        float _2554 = _2544 * 6.283185482025146484375;
        float _2556 = sin(_2554);
        float _2558 = 1.0 / _2548;
        float _2560 = _2552 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        float _2564 = _2556 * _2558;
        float _2566 = _2552 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = _2562 * _2564;
        float _2572 = 1.0 / _2570;
        float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2574;
        float _2578 = 1.0 / _2576;
        float _2580 = _2568 * _2572;
        float _2582 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2584 = fma(_2352, _2580, _2582);
        float _2586 = _2584 * _2578;
        float _2588 = precise::clamp(_2586, 0.0, 1.0);
        _2540 = _2588;
    }
    float _2590 = _2540;
    if (!_2384)
    {
        float _2592 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2594 = _2592 * 0.15915493667125701904296875;
        float _2596 = _2594 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2602 = _2600 * 0.15915493667125701904296875;
        float _2604 = _2594 * 6.283185482025146484375;
        float _2606 = sin(_2604);
        float _2608 = 1.0 / _2598;
        float _2610 = _2602 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = _2606 * _2608;
        float _2616 = _2602 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = _2612 * _2614;
        float _2622 = 1.0 / _2620;
        float _2624 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2626 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2624;
        float _2628 = 1.0 / _2626;
        float _2630 = _2618 * _2622;
        float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2634 = fma(_2352, _2630, _2632);
        float _2636 = _2634 * _2628;
        float _2638 = precise::clamp(_2636, 0.0, 1.0);
        float _2640 = -_2638;
        float _2642 = _2640 + 1.0;
        _2532 = _2642;
    }
    float _2644 = _2532;
    float _2646 = -_2496;
    float _2648 = _2646 + 1.0;
    out.m_87.x = _2528;
    out.m_87.y = _2530;
    out.m_87.z = _2526;
    out.m_87.w = _2169;
    float _2650 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2652 = -_2247;
    float _2654 = _2652 + 1.0;
    float _2656 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.x = _2514;
    out.m_89.y = _2520;
    out.m_89.z = _2522;
    float _2658 = _2654 * _2650;
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = _2656 * _2265;
    out.m_91.x = _1925;
    out.m_91.y = _1921;
    out.m_91.z = _1929;
    bool _2664 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2666 = isnan(_1965);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2672 = _2668 || _2670;
    float _2674 = -_2660;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2678 = _2276 * _2662;
    float _2680 = _2286 * _2662;
    float _2682 = -_2656;
    float _2684 = _2682 + 1.0;
    float _2686 = fma(_2282, _2678, _2270);
    float _2688 = fma(_2284, _2678, _2272);
    float _2690 = fma(_2276, _2680, _2274);
    float _2692 = _2276 * _2684;
    float _2694 = _2676 * _2472;
    float _2696 = _2590 * _2644;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2508;
    out.gl_Position.w = _2169;
    float _2698 = _2694;
    float _2700 = _2696;
    if (!_2672)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2702 = _2534;
    float _2704 = _2694 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2706 = _2704;
    float _2708 = _2702;
    float _2710 = _2702;
    if (!_2672)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2712 = _2698;
    out.m_93.x = _2686;
    out.m_93.y = _2688;
    out.m_93.z = _2690;
    out.m_93.w = _2692;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2672)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2536;
    out.m_95.x = _2704;
    float _2720 = _2696 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2722 = _2718;
    float _2724 = _2718;
    if (!_2672)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2726 = _2394;
    float _2728 = _2726;
    float _2730 = _2726;
    if (!_2672)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2732 = _2706;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2672)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2738 = _2700;
    bool _2740 = !_2672;
    float _2742 = _2738;
    float _2744 = _2738;
    if (!_2740)
    {
        bool _2746 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2748 = isnan(_1965);
        bool _2750 = _2746 || _2748;
        bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2754 = _2750 || _2752;
        if (!_2754)
        {
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2758 = _1965 + _2756;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2762 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2760;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2768 = 1.0 / _2762;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2786 = _2758 * _2768;
            float _2788 = precise::clamp(_2786, 0.0, 1.0);
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2794 = fma(_2788, _2766, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2796 = fma(_2788, _2792, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2798 = fma(_2788, _2772, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2800 = fma(_2788, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2802 = fma(_2788, _2780, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2804 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2730 = _2798;
            _2736 = _2802;
            _2716 = _2794;
            _2724 = _2800;
            _2710 = _2796;
            _2744 = _2804;
            _2806 = true;
        }
        else
        {
            bool _2808 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2810 = isnan(_1965);
            bool _2812 = _2808 || _2810;
            bool _2814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2816 = _2812 || _2814;
            if (!_2816)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2818 = _2714;
            _2716 = _2818;
            if (!_2816)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2820 = _2728;
            _2730 = _2820;
            if (!_2816)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2822 = _2708;
            _2710 = _2822;
            if (!_2816)
            {
                _2722 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2824 = _2722;
            _2724 = _2824;
            if (!_2816)
            {
                _2734 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2826 = _2734;
            _2736 = _2826;
            if (!_2816)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2828 = _2742;
            bool _2830 = !_2816;
            _2744 = _2828;
            if (!_2830)
            {
                bool _2832 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2834 = isnan(_1965);
                bool _2836 = _2832 || _2834;
                bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2840 = _2836 || _2838;
                if (!_2840)
                {
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2844 = _1965 + _2842;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2846;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2854 = 1.0 / _2848;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2872 = _2844 * _2854;
                    float _2874 = precise::clamp(_2872, 0.0, 1.0);
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2880 = fma(_2874, _2852, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2730 = _2884;
                    _2736 = _2888;
                    _2716 = _2880;
                    _2724 = _2886;
                    _2710 = _2882;
                    _2744 = _2890;
                    _2806 = true;
                }
                else
                {
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2736 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2724 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2806 = false;
    float _2892 = _2730;
    float _2894 = _2736;
    float _2896 = _2716;
    float _2898 = _2724;
    float _2900 = _2710;
    float _2902 = _2744;
    float _2904 = fma(_2520, -0.5, 0.5);
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = -_2892;
    float _2910 = _2908 + _2894;
    float _2912 = _2720 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2914 = -_2896;
    float _2916 = _2914 + _2898;
    float _2918 = fma(_2906, _2910, _2892);
    out.m_97.x = 0.0;
    float _2920 = -_2900;
    float _2922 = _2920 + _2902;
    float _2924 = fma(_2906, _2916, _2896);
    float _2926 = _2918 * 0.586610972881317138671875;
    out.m_53.x = _2912;
    bool _2928 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2930 = fma(_2906, _2922, _2900);
    float _2932 = fma(_2924, 0.298911988735198974609375, _2926);
    bool _2934 = _2590 > 0.0;
    bool _2936 = isnan(_2590);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.0);
    bool _2942 = _2938 || _2940;
    float _2944 = fma(_2930, 0.114477999508380889892578125, _2932);
    bool _2946 = _2644 <= 0.0;
    bool _2948 = !_2942;
    bool _2950 = _2946 || _2948;
    float _2952 = -_2944;
    float _2954 = _2924 + _2952;
    float _2956 = -_2944;
    float _2958 = _2918 + _2956;
    float _2960 = -_2944;
    float _2962 = _2930 + _2960;
    float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    float _2966 = fma(_2958, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    float _2968 = fma(_2962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    bool _2970 = !_2928;
    if (!_2970)
    {
        float _2972 = -_1921;
        float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2976 = -_1925;
        float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2980 = -_1929;
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2984 = _2974 * _2974;
        float _2986 = fma(_2978, _2978, _2984);
        float _2988 = fma(_2982, _2982, _2986);
        float _2990 = sqrt(_2988);
        float _2992 = rsqrt(_2988);
        float _2994 = -_2990;
        float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = _2978 * _2992;
        float _3004 = _2974 * _2992;
        float _3006 = abs(_3000);
        float _3008 = log2(_3006);
        float _3010 = _2982 * _2992;
        float _3012 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3014 = _2520 * _3004;
        float _3016 = -_3004;
        float _3018 = -_3012;
        float _3020 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3018);
        float _3022 = fma(_2514, _3002, _3014);
        float _3024 = -_3010;
        float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3020);
        float _3028 = fma(_2522, _3010, _3022);
        float _3030 = precise::clamp(_3028, 0.0, 1.0);
        float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3034 = _3026 + _3032;
        float _3036 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3038 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = exp2(_3036);
        float _3044 = _3042 * _3040;
        float _3046 = _3030 * _3044;
        float _3048 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3050 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3052 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3048;
        out.m_97.y = _3050;
        out.m_97.z = _3052;
    }
    out.m_67.x = _2964;
    out.m_67.y = _2966;
    out.m_67.z = _2968;
    if (!_2950)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3054 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3054;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2806 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3122 = as_type<float>(_140);
        out.gl_Position.z = _3122;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_166);
        out.gl_Position.z = _3177;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _178 = _122 * _174;
    float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _186 = !_176;
    float _188 = _178;
    if (!_186)
    {
        float _190 = in.m_57.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _188 = _204;
    }
    float _206 = _188;
    float _208 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _210 = int(_208);
    float _212 = in.m_59.y;
    float _214 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _216 = int(_214);
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _220 = float(_210);
    float _222 = 1.0 / _220;
    float _224 = float(uint(_216));
    int _226 = ~_216;
    int _228 = _226 + 1;
    int _230 = ~_216;
    int _232 = _230 + 1;
    float _234 = 1.0 / _224;
    int _236 = ~_216;
    int _238 = _236 + 1;
    float _240 = _222 * _122;
    float _242 = trunc(_240);
    int _244 = int(_242);
    int _246 = as_type<int>(_234) + (-2);
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _250 = _248 != 0;
    bool _252 = !_250;
    float _254 = _252 ? 7.345489978790283203125 : 1.0;
    float _256 = float(uint(_244));
    float _258 = as_type<float>(_246) * _256;
    float _260 = in.m_57.x;
    float _262 = in.m_57.y;
    float _264 = in.m_57.z;
    float _266 = trunc(_258);
    float _268 = precise::max(_266, 0.0);
    uint _271 = uint(_268);
    int _273 = _228 * int(_271);
    int _275 = _273 + _244;
    float _277 = float(uint(_275));
    float _279 = _254 * _260;
    float _281 = as_type<float>(_246) * _277;
    float _283 = float(_216);
    float _285 = floor(_279);
    float _287 = trunc(_281);
    float _289 = precise::max(_287, 0.0);
    uint _291 = uint(_289);
    float _293 = -_285;
    float _295 = _279 + _293;
    int _297 = int(_271) + int(_291);
    float _299 = float(_244);
    int _301 = _232 * _297;
    int _303 = _301 + _244;
    bool _305 = _299 >= _283;
    bool _307 = isnan(_299);
    bool _309 = _305 || _307;
    bool _311 = isnan(_283);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    bool _317 = uint(_303) >= uint(_216);
    float _319 = trunc(_315);
    int _321 = int(_319);
    bool _323 = !_317;
    int _325 = _323 ? 0 : (-1);
    bool _327 = _216 == 0;
    int _329 = ~_297;
    int _331 = _329 + _325;
    int _333 = _331 + 1;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _341 = _339 != 0;
    int _343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _345 = _343 != 0;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _349 = _347 != 0;
    int _351 = _216 * _333;
    int _353 = _351 + _244;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _357 = _355 != 0;
    bool _359 = _262 > 0.5;
    int _361 = ~_321;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    bool _367 = !_327;
    int _369 = _367 ? _353 : (-1);
    float _371 = _295 * _283;
    int _373 = _369 * _365;
    float _375 = _283 * _122;
    float _377 = trunc(_371);
    int _379 = int(_377);
    int _381 = _216 + (-1);
    float _383 = 0.0;
    float _385 = _212;
    if (_357)
    {
        float _387 = in.m_57.x;
        _383 = _387;
    }
    float _389 = _383;
    float _391 = _375 * _174;
    bool _393 = !_341;
    int _395 = _393 ? 0 : 1;
    int _397 = _321 * _381;
    int _399 = _397 + _373;
    bool _401 = !_349;
    int _403 = _401 ? 0 : 1;
    float _405 = in.m_61.w;
    float _407 = trunc(_391);
    int _409 = int(_407);
    bool _411 = !_337;
    int _413 = _411 ? 0 : 1;
    int _415 = abs(_395);
    int _417 = abs(_403);
    int _419 = abs(_413);
    int _421 = _399 * _415;
    bool _423 = !_345;
    int _425 = _423 ? 0 : 1;
    int _427 = _379 * _417;
    int _429 = _427 + _244;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _433 = _431 != 0;
    int _435 = abs(_425);
    bool _437 = !_433;
    int _439 = _437 ? 0 : 1;
    int _441 = _409 * _419;
    int _443 = _441 + _421;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    float _449 = in.m_46.x;
    float _451 = in.m_46.y;
    float _453 = in.m_46.z;
    int _455 = abs(_439);
    int _457 = _429 * _435;
    int _459 = _457 + _443;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _463 = _461 != 0;
    float _465 = _260 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _467 = _379 * _455;
    int _469 = _467 + _459;
    float _471 = -_212;
    float _473 = _471 + 1.0;
    out.m_63.w = _405;
    float _475 = _262 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _479 = float(uint(_469));
    if (_447)
    {
        float _481 = _359 ? _473 : _212;
        _385 = _481;
    }
    float _483 = _385;
    float _485 = -_477;
    float _487 = fma(_465, 2.0, _485);
    float _489 = as_type<float>(_246) * _479;
    int _491 = ~_216;
    int _493 = _491 + 1;
    float _495 = fma(_475, -2.0, _218);
    float _497 = trunc(_489);
    float _499 = precise::max(_497, 0.0);
    uint _501 = uint(_499);
    bool _503 = _389 > 0.5;
    bool _505 = _503 && _357;
    float _507 = _451 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _509 = _451 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _511 = _451 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
    float _527 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
    float _529 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _511);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
    bool _537 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _539 = isnan(_206);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = 1.0 / _533;
    int _551 = ~_216;
    int _553 = _551 + 1;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _559 = _493 * int(_501);
    int _561 = _559 + _469;
    float _563 = float(uint(_561));
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _571 = 1.0 / _557;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _575 = as_type<float>(_246) * _563;
    float _577 = in.m_59.x;
    float _579 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _583 = _569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _589 = trunc(_575);
    float _591 = precise::max(_589, 0.0);
    uint _593 = uint(_591);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    out.m_65.x = _579;
    out.m_65.y = _581;
    out.m_65.z = _583;
    out.m_65.w = _573;
    float _599 = _597 * _549;
    bool _601 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _603 = isnan(_206);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _587 * _571;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _206 + _615;
    float _619 = fma(_599, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _623 = int(_501) + int(_593);
    float _625 = -_611;
    float _627 = _625 + 1.0;
    bool _629 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_206);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = -_547;
    float _643 = _641 + 1.0;
    float _645 = 0.0;
    float _647 = _577;
    if (_357)
    {
        _645 = _577;
    }
    float _649 = _645;
    float _651 = _547 * _627;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = _206 + _653;
    float _657 = _639 * _643;
    float _659 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
    int _661 = _553 * _623;
    int _663 = _661 + _469;
    float _665 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].z, _529);
    float _667 = _619 * _657;
    float _669 = _659 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _671 = fma(_613, _655, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _673 = _649;
    if (_505)
    {
        float _675 = -_649;
        float _677 = _675 + 1.0;
        _673 = _677;
    }
    float _679 = _673;
    float _681 = _535 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _685 = _669 + _683;
    bool _687 = uint(_663) >= uint(_216);
    float _689 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[79].z, _621);
    float _691 = float(uint(_429));
    float _693 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _681 + _695;
    float _699 = _685 * _685;
    bool _701 = !_687;
    int _703 = _701 ? 0 : (-1);
    float _705 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _689);
    float _707 = as_type<float>(_246) * _691;
    float _709 = fma(_697, _697, _699);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _693 + _711;
    int _715 = ~_623;
    int _717 = _715 + _703;
    int _719 = _717 + 1;
    float _721 = _705 * (-0.15915493667125701904296875);
    float _723 = trunc(_707);
    float _725 = precise::max(_723, 0.0);
    uint _727 = uint(_725);
    float _729 = fma(_713, _713, _709);
    float _731 = -_639;
    float _733 = _731 + 1.0;
    int _735 = _216 * _719;
    int _737 = _735 + _469;
    float _739 = _681;
    if (_357)
    {
        _647 = _679;
    }
    float _741 = _647;
    float _743 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _745 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _747 = _721 * 6.283185482025146484375;
    float _749 = sin(_747);
    bool _751 = !_327;
    int _753 = _751 ? _737 : (-1);
    float _755 = fma(_671, _651, _745);
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _759 = _753 >> 31;
    int _761 = _753 & 3;
    bool _763 = _761 != 0;
    float _765 = _721 * 6.283185482025146484375;
    float _767 = cos(_765);
    int _769 = _759 & 3;
    float _771 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _773 = _753 + _769;
    float _775 = _771 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _777 = rsqrt(_729);
    int _779 = ~_216;
    int _781 = _779 + 1;
    float _783 = _749 * _743;
    int _785 = _773 >> 2;
    int _787 = _781 * int(_727);
    int _789 = _787 + _429;
    int _791 = _785 << 4;
    int _793 = _791 + 368;
    float _795 = sqrt(_729);
    float _797 = _767 * _743;
    float _799 = -_783;
    float _801 = fma(_767, _757, _799);
    float _803 = float(uint(_789));
    float _805 = fma(_749, _757, _797);
    float _807 = as_type<float>(_246) * _803;
    float _809 = _685 * _777;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _813 = trunc(_807);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    uint _819 = uint(int(uint(_793) >> uint(2)));
    uint _821 = uint(int(uint(int(_819)) >> uint(2)));
    int _823 = int(_819) & 3;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[int(_821)][_823];
    int _827 = int(_819) + 1;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    int _831 = _827 & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    float _835 = -_809;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _685);
    float _839 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    float _841 = _795 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _843 = _697 * _777;
    float _845 = _685 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _847 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _839);
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _853 = _837 * _837;
    float _855 = precise::min(_775, _841);
    float _857 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _845);
    float _859 = fma(_851, _851, _853);
    int _861 = _753 & 3;
    bool _863 = _861 != 0;
    float _865 = _809 * _855;
    int _867 = int(_727) + int(_817);
    float _869 = -_122;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[76].x, _487);
    int _873 = _763 ? 0 : 1;
    float _875 = -_865;
    float _877 = _685 + _875;
    bool _879 = uint(_861) > 1u;
    int _881 = _793 + 8;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[int(_893)][_895];
    float _899 = _843 * _855;
    float _901 = _713 * _777;
    float _903 = _877 * _877;
    float _905 = fma(_847, _801, _871);
    float _907 = -_899;
    float _909 = _697 + _907;
    float _911 = -_901;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    int _915 = ~_873;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    float _921 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _857);
    bool _923 = !_863;
    int _925 = _923 ? 0 : 1;
    float _927 = fma(_909, _909, _903);
    bool _929 = uint(_861) >= 2u;
    int _931 = _238 * _867;
    int _933 = _931 + _429;
    int _935 = _919;
    if (!_879)
    {
        int _937 = ~_873;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = fma(_913, _913, _859);
    float _945 = _901 * _855;
    int _947 = abs(_925);
    out.m_67.w = _855;
    int _949 = abs(_941);
    int _951 = _929 ? 0 : 1;
    bool _953 = _861 != 3;
    bool _955 = uint(_933) >= uint(_216);
    float _957 = -_945;
    float _959 = _713 + _957;
    int _961 = ~_947;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_959, _959, _927);
    int _969 = ~_949;
    int _971 = _969 + 1;
    int _973 = _971 + 1;
    bool _975 = !_955;
    int _977 = _975 ? 0 : (-1);
    bool _979 = _861 != 3;
    int _981 = _973 * as_type<int>(_833);
    int _983 = ~_867;
    int _985 = _983 + _977;
    int _987 = _985 + 1;
    float _989 = sqrt(_967);
    int _991 = ~_951;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    int _997 = _965 * as_type<int>(_825);
    int _999 = _997 + _981;
    int _1001 = _995;
    if (_953)
    {
        int _1003 = ~_951;
        int _1005 = _1003 + 1;
        _1001 = _1005;
    }
    int _1007 = _1001;
    int _1009 = _216 * _987;
    int _1011 = _1009 + _429;
    bool _1013 = !_979;
    int _1015 = _1013 ? 0 : (-1);
    int _1017 = abs(_1007);
    float _1019 = sqrt(_943);
    bool _1021 = !_463;
    int _1023 = _1021 ? 0 : 1;
    int _1025 = abs(_1015);
    int _1027 = abs(_1023);
    float _1029 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _495);
    int _1031 = ~_1017;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    float _1037 = _777 * _989;
    int _1039 = ~_1025;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    int _1045 = _1035 * as_type<int>(_889);
    int _1047 = _1045 + _999;
    int _1049 = ~_1027;
    int _1051 = _1049 + 1;
    int _1053 = _1051 + 1;
    float _1055 = _777 * _1019;
    bool _1057 = _921 >= 0.0;
    int _1059 = _1043 * as_type<int>(_897);
    int _1061 = _1059 + _1047;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1065 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[117].x, _755);
    int _1067 = _1061 * _1053;
    bool _1069 = !_327;
    int _1071 = _1069 ? _1011 : (-1);
    float _1073 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1063);
    float _1075 = _1037 * _1055;
    int _1077 = _1071 * _1027;
    int _1079 = _1077 + _1067;
    float _1081 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1073);
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1057)
    {
        _1089 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1091 = _1089;
    float _1093 = -_1029;
    float _1095 = fma(_1081, _805, _1093);
    float _1097 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1099 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1105 = _905 + 0.5;
    float _1107 = _1095 + 0.5;
    int _1109 = as_type<int>(_1091);
    if (_1057)
    {
        float _1111 = _1091 * 5.0;
        _1109 = as_type<int>(_1111);
    }
    int _1113 = _1109;
    float _1115 = float(_1079);
    float _1117 = _771 * _1075;
    out.m_69.x = _1097;
    out.m_69.y = _1099;
    out.m_69.z = _1101;
    out.m_69.w = _1103;
    bool _1119 = !_519;
    int _1121 = _1119 ? 0 : 1;
    bool _1123 = !_523;
    int _1125 = _1123 ? 0 : 1;
    out.m_71.x = _1105;
    out.m_71.y = _1107;
    bool _1127 = !_515;
    int _1129 = _1127 ? 0 : 1;
    if (_1057)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4647 = as_type<float>(_1113);
        out.gl_Position.z = _4647;
    }
    out.m_73.x = _1115;
    if (_1057)
    {
        out.m_53.x = 0.0;
    }
    out.m_75.x = _1117;
    if (_1057)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1131 = -_809;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _669);
    float _1135 = -_843;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _681);
    float _1139 = -_901;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1145 = _1133 + _1143;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1149 = _1137 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1153 = _1141 + _1151;
    float _1155 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1157 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1155);
    float _1159 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1157);
    bool _1161 = _1159 >= 0.0;
    float _1163 = _1153;
    if (_1161)
    {
        _1163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1165 = _1163;
    int _1167 = as_type<int>(_1165);
    if (_1161)
    {
        out.m_53.x = 0.0;
    }
    if (_1161)
    {
        float _1169 = _1165 * 5.0;
        _1167 = as_type<int>(_1169);
    }
    int _1171 = _1167;
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4742 = as_type<float>(_1171);
        out.gl_Position.z = _4742;
    }
    if (_1161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1173 = -_669;
    float _1175 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1177 = -_681;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1181 = -_693;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1185 = _1175 * _1175;
    float _1187 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1189 = fma(_1179, _1179, _1185);
    float _1191 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1193 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1195 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1197 = fma(_1183, _1183, _1189);
    float _1199 = -_1191;
    float _1201 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1199);
    float _1203 = -_1195;
    float _1205 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1203);
    float _1207 = rsqrt(_1197);
    float _1209 = -_1193;
    float _1211 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1209);
    float _1213 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1215 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1217 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1221 = -_1213;
    float _1223 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1221);
    float _1225 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1227 = log2(_1225);
    float _1229 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1231 = -_1215;
    float _1233 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1231);
    float _1235 = -_1217;
    float _1237 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1235);
    float _1239 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1241 = -_1229;
    float _1243 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1241);
    float _1245 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1247 = _1179 * _1207;
    float _1249 = _1183 * _1207;
    float _1251 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1243);
    float _1253 = _1175 * _1207;
    float _1255 = _1247 * _1247;
    float _1257 = -_1239;
    float _1259 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1257);
    float _1261 = -_1245;
    float _1263 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1261);
    bool _1265 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1267 = isnan(0.0);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1273 = _1269 || _1271;
    float _1275 = fma(_1249, _1249, _1255);
    float _1277 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1279 = _1227 * _122;
    float _1281 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1263);
    float _1283 = _1187 * _1075;
    float _1285 = -_1277;
    float _1287 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1285);
    float _1289 = rsqrt(_1275);
    float _1291 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1293 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1287);
    float _1295 = -_1291;
    float _1297 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1295);
    float _1299 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1301 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1297);
    float _1303 = -_1299;
    float _1305 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1303);
    float _1307 = _260 * 2.0;
    float _1309 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1305);
    float _1311 = _1249 * _1289;
    float _1313 = _1247 * _1289;
    float _1315 = exp2(_1279);
    float _1317 = -_1311;
    float _1319 = _1249 * _1317;
    float _1321 = -_1311;
    float _1323 = _1253 * _1321;
    float _1325 = -_1319;
    float _1327 = fma(_1247, _1313, _1325);
    float _1329 = _1253 * _1313;
    float _1331 = _1327 * _1327;
    float _1333 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1259);
    float _1335 = fma(_1329, _1329, _1331);
    float _1337 = -_1333;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1309);
    float _1341 = floor(_1307);
    float _1343 = _264 + _260;
    float _1345 = fma(_1323, _1323, _1335);
    float _1347 = _262 + _260;
    float _1349 = _260 + (-0.5);
    float _1351 = _262 + _264;
    float _1353 = _262 + (-0.5);
    float _1355 = rsqrt(_1345);
    float _1357 = _1347 + (-1.0);
    float _1359 = _1351 + (-1.0);
    float _1361 = _264 + (-0.5);
    float _1363 = _262 * 2.0;
    float _1365 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1367 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1369 = _264 * 2.0;
    float _1371 = 1.0 / _1339;
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = -_1367;
    float _1377 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1375);
    float _1379 = -_1219;
    float _1381 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1379);
    float _1383 = -_1315;
    float _1385 = _1383 + 1.0;
    float _1387 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1377);
    float _1389 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1381);
    float _1391 = _1327 * _1355;
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    bool _1395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(1.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = floor(_1363);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1409 = 1.0 + _1407;
    float _1411 = -_1393;
    float _1413 = _1411 + 1.0;
    bool _1415 = _1341 > 0.0;
    float _1417 = _1343 + (-1.0);
    bool _1419 = _1341 >= 0.0;
    bool _1421 = isnan(_1341);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan(0.0);
    bool _1427 = _1423 || _1425;
    float _1429 = fma(_1389, _1371, -1.0);
    float _1431 = _1413 * _1371;
    float _1433 = floor(_1369);
    float _1435 = _1273 ? _1385 : 0.0;
    float _1437 = fma(_1413, _1429, 1.0);
    float _1439 = _1387 * _1431;
    float _1441 = _1281 * _1431;
    float _1443 = _1437 * _1437;
    float _1445 = 1.0 / _1409;
    bool _1447 = _1405 > 0.0;
    float _1449 = fma(_1439, _1439, _1443);
    bool _1451 = _1405 >= 0.0;
    bool _1453 = isnan(_1405);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan(0.0);
    bool _1459 = _1455 || _1457;
    int _1461 = _1427 ? 0 : 1;
    float _1463 = fma(_1441, _1441, _1449);
    int _1465 = _1459 ? 0 : 1;
    bool _1467 = _1433 > 0.0;
    bool _1469 = _1433 >= 0.0;
    bool _1471 = isnan(_1433);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan(0.0);
    bool _1477 = _1473 || _1475;
    float _1479 = rsqrt(_1463);
    int _1481 = ~_1461;
    int _1483 = _1481 + 1;
    int _1485 = _1483 + 1;
    int _1487 = _1485;
    if (!_1415)
    {
        int _1489 = ~_1461;
        int _1491 = _1489 + 1;
        _1487 = _1491;
    }
    int _1493 = _1487;
    if (_1403)
    {
        float _1495 = _1435 * _1445;
        _132 = _1495;
    }
    float _1497 = _132;
    int _1499 = _1477 ? 0 : 1;
    float _1501 = in.m_77.x;
    float _1503 = in.m_77.y;
    float _1505 = in.m_77.z;
    int _1507 = abs(_1121);
    int _1509 = abs(_1129);
    int _1511 = ~_1499;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    int _1517 = _1515;
    if (!_1467)
    {
        int _1519 = ~_1499;
        int _1521 = _1519 + 1;
        _1517 = _1521;
    }
    int _1523 = _1517;
    float _1525 = float(_1507);
    float _1527 = _1437 * _1479;
    int _1529 = ~_1465;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = _1441 * _1479;
    int _1537 = _1533;
    if (!_1447)
    {
        int _1539 = ~_1465;
        int _1541 = _1539 + 1;
        _1537 = _1541;
    }
    int _1543 = _1537;
    float _1545 = _1439 * _1479;
    float _1547 = float(_1493);
    float _1549 = _1249 * _1527;
    float _1551 = float(_1509);
    float _1553 = float(_1523);
    float _1555 = -_1535;
    float _1557 = _1247 * _1555;
    float _1559 = _1525 * _1547;
    float _1561 = float(_1543);
    float _1563 = _1551 * _1553;
    float _1565 = -_1545;
    float _1567 = -_1557;
    float _1569 = fma(_1249, _1565, _1567);
    float _1571 = -_1535;
    float _1573 = -_1549;
    float _1575 = fma(_1253, _1571, _1573);
    float _1577 = _1559 * (-2.0);
    float _1579 = -_1545;
    float _1581 = _1253 * _1579;
    float _1583 = _1569 * _1569;
    int _1585 = abs(_1125);
    float _1587 = fma(_1373, _1577, _1373);
    float _1589 = fma(_1577, _1503, _1503);
    float _1591 = -_1581;
    float _1593 = fma(_1247, _1527, _1591);
    float _1595 = fma(_1575, _1575, _1583);
    float _1597 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1589);
    float _1599 = fma(_1593, _1593, _1595);
    float _1601 = float(_1585);
    float _1603 = fma(_1587, _1497, _1597);
    float _1605 = _1563 * (-2.0);
    float _1607 = rsqrt(_1599);
    float _1609 = _1601 * _1561;
    float _1611 = fma(_1605, _1501, _1501);
    float _1613 = fma(_1365, _1605, _1365);
    float _1615 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = _1609 * (-2.0);
    float _1619 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1611);
    float _1621 = _1603 * 0.15915493667125701904296875;
    float _1623 = fma(_1617, _1505, _1505);
    float _1625 = fma(_1615, _1617, _1615);
    float _1627 = fma(_1613, _1497, _1619);
    float _1629 = _1621 * 6.283185482025146484375;
    float _1631 = sin(_1629);
    float _1633 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1623);
    float _1635 = _1627 * 0.15915493667125701904296875;
    float _1637 = _1575 * _1607;
    float _1639 = _1593 * _1607;
    float _1641 = _1569 * _1607;
    float _1643 = fma(_1625, _1497, _1633);
    float _1645 = _1249 * _1637;
    float _1647 = _1253 * _1639;
    float _1649 = _1621 * 6.283185482025146484375;
    float _1651 = cos(_1649);
    float _1653 = -_1645;
    float _1655 = fma(_1247, _1639, _1653);
    float _1657 = -_1647;
    float _1659 = fma(_1249, _1641, _1657);
    float _1661 = _1247 * _1641;
    float _1663 = -_1661;
    float _1665 = fma(_1253, _1637, _1663);
    float _1667 = _1643 * 0.15915493667125701904296875;
    float _1669 = _1655 * _1655;
    float _1671 = _1635 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = fma(_1659, _1659, _1669);
    float _1677 = fma(_1665, _1665, _1675);
    float _1679 = _1635 * 6.283185482025146484375;
    float _1681 = cos(_1679);
    float _1683 = in.m_79.x;
    float _1685 = in.m_79.y;
    float _1687 = in.m_79.z;
    float _1689 = rsqrt(_1677);
    float _1691 = _1673 * _1631;
    float _1693 = _1673 * _1651;
    float _1695 = _1667 * 6.283185482025146484375;
    float _1697 = cos(_1695);
    float _1699 = _1681 * _1651;
    float _1701 = _1681 * _1631;
    float _1703 = _1665 * _1689;
    float _1705 = _1659 * _1689;
    float _1707 = _1655 * _1689;
    float _1709 = _1667 * 6.283185482025146484375;
    float _1711 = sin(_1709);
    float _1713 = _1247 * _1703;
    float _1715 = _1253 * _1705;
    float _1717 = _1249 * _1707;
    float _1719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1685);
    float _1721 = -_1713;
    float _1723 = fma(_1249, _1705, _1721);
    float _1725 = _1673 * _1697;
    float _1727 = _1651 * _1697;
    float _1729 = _1681 * _1697;
    float _1731 = -_1717;
    float _1733 = fma(_1253, _1703, _1731);
    float _1735 = _1723 * _1723;
    float _1737 = _1631 * _1697;
    float _1739 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1741 = -_1715;
    float _1743 = fma(_1247, _1707, _1741);
    float _1745 = fma(_1733, _1733, _1735);
    float _1747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1683);
    float _1749 = _1739 * _1075;
    float _1751 = fma(_1711, _1699, _1691);
    float _1753 = fma(_1743, _1743, _1745);
    float _1755 = _1117 * _1747;
    float _1757 = _1749 * _1719;
    float _1759 = -_1693;
    float _1761 = fma(_1711, _1701, _1759);
    float _1763 = rsqrt(_1753);
    float _1765 = _1283 * _1687;
    float _1767 = _1729 * _1757;
    float _1769 = -_1757;
    float _1771 = _1711 * _1769;
    float _1773 = -_1701;
    float _1775 = fma(_1711, _1693, _1773);
    float _1777 = _1725 * _1757;
    float _1779 = fma(_1751, _1755, _1767);
    float _1781 = fma(_1727, _1755, _1771);
    float _1783 = fma(_1711, _1691, _1699);
    float _1785 = fma(_1775, _1755, _1777);
    float _1787 = fma(_1761, _1765, _1779);
    float _1789 = fma(_1737, _1765, _1781);
    float _1791 = fma(_1783, _1765, _1785);
    float _1793 = _1703 * _1787;
    float _1795 = _1705 * _1787;
    float _1797 = _1743 * _1763;
    float _1799 = _1733 * _1763;
    float _1801 = _1723 * _1763;
    float _1803 = fma(_1797, _1789, _1793);
    float _1805 = fma(_1799, _1789, _1795);
    float _1807 = fma(_1249, _1791, _1803);
    float _1809 = fma(_1247, _1791, _1805);
    float _1811 = _693 + _1807;
    float _1813 = _681 + _1809;
    float _1815 = _1707 * _1787;
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1819 = _1811 + _1817;
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1823 = _1813 + _1821;
    float _1825 = fma(_1801, _1789, _1815);
    float _1827 = _1819 * _1819;
    float _1829 = fma(_1253, _1791, _1825);
    float _1831 = fma(_1823, _1823, _1827);
    float _1833 = _669 + _1829;
    float _1835 = sqrt(_1831);
    bool _1837 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = _1829;
    float _1841 = _1791;
    float _1843 = _1825;
    float _1845 = _1639;
    if (!_1837)
    {
        _1839 = _1813;
    }
    float _1847 = _1839;
    float _1849 = _1847;
    if (!_1837)
    {
        _1841 = _1811;
    }
    float _1851 = _1841;
    float _1853 = _1851;
    if (!_1837)
    {
        _1843 = _1833;
    }
    float _1855 = _1843;
    bool _1857 = !_1837;
    float _1859 = _1855;
    if (!_1857)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1865 = _1835 + _1863;
        float _1867 = rsqrt(_1831);
        float _1869 = _1865 * _1861;
        float _1871 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1873 = _1869 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = _1873 * 6.283185482025146484375;
        float _1881 = sin(_1879);
        float _1883 = _1877 + (-1.0);
        float _1885 = fma(_1881, _1871, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = _1867 * _1885;
        float _1891 = fma(_1833, _1877, _1887);
        float _1893 = fma(_1823, _1889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1895 = fma(_1819, _1889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1859 = _1891;
        _1849 = _1893;
        _1853 = _1895;
    }
    float _1897 = _1859;
    float _1899 = _1849;
    float _1901 = _1853;
    float _1903 = -_865;
    float _1905 = _1903 + _1897;
    float _1907 = -_899;
    float _1909 = _1907 + _1899;
    float _1911 = -_945;
    float _1913 = _1911 + _1901;
    float _1915 = -_899;
    float _1917 = _681 + _1915;
    float _1919 = -_809;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1905);
    float _1923 = -_843;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1909);
    float _1927 = -_901;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1913);
    float _1931 = -_945;
    float _1933 = _693 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1937 = _1921 + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1941 = _1925 + _1939;
    float _1943 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1945 = _1929 + _1943;
    float _1947 = _1937 * _1937;
    float _1949 = -_843;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1917);
    float _1953 = -_901;
    float _1955 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1933);
    float _1957 = fma(_1941, _1941, _1947);
    float _1959 = fma(_1945, _1945, _1957);
    float _1961 = fma(_1955, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1963 = rsqrt(_1959);
    float _1965 = sqrt(_1959);
    float _1967 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1941 * _1967;
    float _1971 = _1945 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1819;
    float _1989 = _1985;
    float _1991 = _1937;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1995 = _1971;
    float _1997 = _1973;
    float _1999 = _1975;
    float _2001 = _1951;
    if (_1981)
    {
        float _2003 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _2003;
    }
    float _2005 = _1987;
    if (_1981)
    {
        float _2007 = _1985 * _2005;
        _1989 = _2007;
    }
    float _2009 = _1989;
    if (_1981)
    {
        float _2011 = _2009 * 0.15915493667125701904296875;
        _1845 = _2011;
    }
    float _2013 = _1845;
    float _2015 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2017 = _1831;
    if (_1981)
    {
        float _2019 = _2013 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        _2017 = _2021;
    }
    float _2023 = _2017;
    float _2025 = precise::max(0.0, _2015);
    float _2027 = _2009;
    float _2029 = _2025;
    if (_1981)
    {
        float _2031 = _2013 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        _2027 = _2033;
    }
    float _2035 = _2027;
    float _2037 = -_1967;
    float _2039 = -_2025;
    float _2041 = fma(_1937, _2037, _2039);
    if (_1981)
    {
        float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2029 = _2043;
    }
    float _2045 = _2029;
    float _2047 = _2045;
    if (!_1981)
    {
        _739 = _2041;
    }
    float _2049 = _739;
    float _2051 = _2015;
    float _2053 = _2049;
    if (_1981)
    {
        float _2055 = rsqrt(_1977);
        _2051 = _2055;
    }
    float _2057 = _2051;
    if (_1981)
    {
        float _2059 = fma(_2023, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2047 = _2059;
    }
    float _2061 = _2047;
    float _2063 = _2061;
    if (_1981)
    {
        float _2065 = _2035 + (-1.0);
        _1991 = _2065;
    }
    float _2067 = _1991;
    float _2069 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2071 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2069);
    float _2073 = _2057;
    if (_1981)
    {
        float _2075 = _2057 * _2061;
        _2063 = _2075;
    }
    float _2077 = _2063;
    if (_1981)
    {
        float _2079 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2073 = _2079;
    }
    float _2081 = _2073;
    float _2083 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1981)
    {
        _1993 = _1969;
    }
    float _2085 = _1993;
    float _2087 = _2085;
    if (_1981)
    {
        float _2089 = _1969 * _2077;
        _2087 = _2089;
    }
    float _2091 = _2087;
    if (_1981)
    {
        float _2093 = fma(_2041, _2035, _2081);
        _2053 = _2093;
    }
    float _2095 = _2053;
    if (_1981)
    {
        float _2097 = _1971 * _2077;
        _1995 = _2097;
    }
    float _2099 = _1995;
    float _2101 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1981)
    {
        float _2103 = _2091 * _2091;
        _1997 = _2103;
    }
    float _2105 = _1997;
    float _2107 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1981)
    {
        float _2109 = _2099 * _2099;
        _1999 = _2109;
    }
    float _2111 = _1999;
    float _2113 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2101);
    float _2115 = fma(_2095, _2095, _2105);
    float _2117 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2121 = _2115 + _2111;
    float _2123 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2113);
    float _2125 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2129 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2127);
    float _2131 = precise::clamp(_2129, 0.0, 1.0);
    float _2133 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2137 = rsqrt(_2121);
    float _2139 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2125);
    float _2141 = -_2131;
    float _2143 = _2141 + 1.0;
    float _2145 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2151 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2071);
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2155 = abs(_2143);
    float _2157 = log2(_2155);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2163 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2153);
    float _2165 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2167 = _2137 * _2091;
    float _2169 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2163);
    float _2171 = floor(_2083);
    float _2173 = _2137 * _2095;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2177 = _2137 * _2099;
    float _2179 = -_2161;
    float _2181 = fma(_2179, _2165, 1.0);
    float _2183 = -_2175;
    float _2185 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2183);
    float _2187 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2189 = floor(_1961);
    float _2191 = -_2177;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2185);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = fma(_2193, -0.5, 0.5);
    float _2199 = fma(_2193, 0.5, 0.5);
    float _2201 = exp2(_2187);
    float _2203 = -_2171;
    float _2205 = _2083 + _2203;
    float _2207 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2209 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2211 = _2173 + 1.0;
    float _2213 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2207);
    float _2215 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2209);
    float _2217 = log2(_2181);
    float _2219 = -_2189;
    float _2221 = _1961 + _2219;
    float _2223 = fma(_2199, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2225 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2213);
    float _2227 = fma(_2199, _2223, -0.212114393711090087890625);
    float _2229 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2225);
    float _2231 = 1.0 / _2169;
    float _2233 = -_2173;
    float _2235 = fma(_2201, _2211, _2233);
    float _2237 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2239 = fma(_2199, _2227, 1.570728778839111328125);
    float _2241 = fma(_2235, 0.5, 0.5);
    float _2243 = sqrt(_2197);
    float _2245 = _2217 * 0.693147182464599609375;
    float2 _6428 = float2(_2205, _2221);
    float _2247 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6428, float2(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6428, float2(0.0), isnan(_6428)), level(0.0)).x;
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2251 = _2229 * _2231;
    float _2253 = _2237 * _2231;
    float _2255 = fma(_2251, 0.5, 0.5);
    float _2257 = fma(_2253, -0.5, 0.5);
    float _2259 = _2243 * 0.636619746685028076171875;
    float _2261 = -_2239;
    float _2263 = fma(_2259, _2261, 1.0);
    float3 _6461 = float3(_2255, _2257, _2249);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6461, float3(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6461, float3(0.0), isnan(_6461)), level(0.0)).x;
    float3 _6472 = float3(_2255, _2257, _2249);
    float4 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6472, float3(0.0), isnan(_6472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6472, float3(0.0), isnan(_6472)), level(0.0)).xyzw;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _2268.w;
    float2 _6488 = float2(_2263, _2241);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6488, float2(0.0), isnan(_6488)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6488, float2(0.0), isnan(_6488)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = -_865;
    float _2290 = _669 + _2288;
    float _2292 = _1761 * _1705;
    bool _2294 = _1685 != 0.0;
    bool _2296 = isnan(_1685);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan(0.0);
    bool _2302 = _2298 || _2300;
    float _2304 = -_809;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2290);
    bool _2308 = _1683 == 0.0;
    bool _2310 = !_2302;
    bool _2312 = _2308 && _2310;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_81.x = _1951;
    out.m_81.y = _2306;
    out.m_81.z = _1955;
    bool _2316 = _1687 == 0.0;
    bool _2318 = _2316 && _2312;
    float _2320 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2314);
    float _2322 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2320);
    float _2324 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2328 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2324);
    float _2330 = 1.0 / _2326;
    float _2332 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2328);
    float _2334 = _2169 * 0.5;
    float _2336 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2338 = _2336 + _2326;
    float _2340 = _2338 * _2330;
    float _2342 = _2340 * 0.5;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2346 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2344);
    float _2348 = 1.0 / _2346;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2348 * _2350;
    float _2354 = abs(_2352);
    float _2356 = log2(_2354);
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2360 = in.m_83.x;
    float _2362 = in.m_83.y;
    float _2364 = in.m_83.z;
    float _2366 = exp2(_2358);
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = fma(_2370, -2.0, 3.0);
    float _2374 = _2370 * _2370;
    bool _2376 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.5);
    bool _2384 = _2380 || _2382;
    float _2386 = _2362;
    float _2388 = _2364;
    float _2390 = _2360;
    float _2392 = _2306;
    float _2394 = _2229;
    if (!_2318)
    {
        float _2396 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2362);
        _2386 = _2396;
    }
    float _2398 = _2386;
    bool _2400 = _2352 <= 8000.0;
    bool _2402 = isnan(_2352);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan(8000.0);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = _2374 * _2372;
    if (!_2318)
    {
        float _2414 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2364);
        _2388 = _2414;
    }
    float _2416 = _2388;
    float _2418 = _1729 * _1707;
    float _2420 = _1751 * _1707;
    float _2422 = -_2412;
    float _2424 = _2422 + 1.0;
    float _2426 = _1761 * _1707;
    if (!_2318)
    {
        float _2428 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2360);
        _2390 = _2428;
    }
    float _2430 = _2390;
    float _2432 = _1729 * _1703;
    float _2434 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2412);
    float _2436 = _1751 * _1705;
    float _2438 = fma(_1727, _1801, _2420);
    float _2440 = fma(_1737, _1801, _2426);
    float _2442 = _2410 * _2434;
    float _2444 = _1729 * _1705;
    float _2446 = -_1711;
    float _2448 = fma(_2446, _1801, _2418);
    float _2450 = -_1711;
    float _2452 = fma(_2450, _1797, _2432);
    float _2454 = fma(_1727, _1799, _2436);
    float _2456 = -_1711;
    float _2458 = fma(_2456, _1799, _2444);
    float _2460 = fma(_1737, _1799, _2292);
    float _2462 = fma(_1725, _1253, _2448);
    float _2464 = fma(_1783, _1253, _2440);
    float _2466 = fma(_1725, _1247, _2458);
    float _2468 = fma(_1775, _1253, _2438);
    float _2470 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2472 = in.m_85.x;
    float _2474 = fma(_1775, _1247, _2454);
    float _2476 = fma(_1783, _1247, _2460);
    float _2478 = _1751 * _1703;
    float _2480 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2482 = _1761 * _1703;
    float _2484 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2470);
    float _2486 = fma(_1727, _1797, _2478);
    float _2488 = fma(_1725, _1249, _2452);
    float _2490 = fma(_1737, _1797, _2482);
    float _2492 = _2466 * _2398;
    float _2494 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2484);
    float _2496 = exp2(_2480);
    float _2498 = fma(_1775, _1249, _2486);
    float _2500 = _2462 * _2398;
    float _2502 = _2488 * _2398;
    float _2504 = fma(_1783, _1249, _2490);
    float _2506 = fma(_2474, _2430, _2492);
    float _2508 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2494);
    float _2510 = fma(_2468, _2430, _2500);
    float _2512 = fma(_2498, _2430, _2502);
    float _2514 = fma(_2476, _2416, _2506);
    float _2516 = _2508 + _2169;
    float _2518 = _2229 + _2169;
    float _2520 = fma(_2464, _2416, _2510);
    float _2522 = fma(_2504, _2416, _2512);
    if (_2384)
    {
        _2001 = 1.0;
    }
    float _2524 = _2001;
    float _2526 = _2516 * 0.5;
    float _2528 = _2518 * 0.5;
    float _2530 = fma(_2237, -0.5, _2334);
    float _2532 = _2524;
    float _2534 = _2169;
    float _2536 = _2526;
    if (_2384)
    {
        _2392 = 1.0;
    }
    float _2538 = _2392;
    float _2540 = _2538;
    if (!_2384)
    {
        float _2542 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2544 = _2542 * 0.15915493667125701904296875;
        float _2546 = _2544 * 6.283185482025146484375;
        float _2548 = cos(_2546);
        float _2550 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2552 = _2550 * 0.15915493667125701904296875;
        float _2554 = _2544 * 6.283185482025146484375;
        float _2556 = sin(_2554);
        float _2558 = 1.0 / _2548;
        float _2560 = _2552 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        float _2564 = _2556 * _2558;
        float _2566 = _2552 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = _2562 * _2564;
        float _2572 = 1.0 / _2570;
        float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2574;
        float _2578 = 1.0 / _2576;
        float _2580 = _2568 * _2572;
        float _2582 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2584 = fma(_2352, _2580, _2582);
        float _2586 = _2584 * _2578;
        float _2588 = precise::clamp(_2586, 0.0, 1.0);
        _2540 = _2588;
    }
    float _2590 = _2540;
    if (!_2384)
    {
        float _2592 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2594 = _2592 * 0.15915493667125701904296875;
        float _2596 = _2594 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2602 = _2600 * 0.15915493667125701904296875;
        float _2604 = _2594 * 6.283185482025146484375;
        float _2606 = sin(_2604);
        float _2608 = 1.0 / _2598;
        float _2610 = _2602 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = _2606 * _2608;
        float _2616 = _2602 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = _2612 * _2614;
        float _2622 = 1.0 / _2620;
        float _2624 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2626 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2624;
        float _2628 = 1.0 / _2626;
        float _2630 = _2618 * _2622;
        float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2634 = fma(_2352, _2630, _2632);
        float _2636 = _2634 * _2628;
        float _2638 = precise::clamp(_2636, 0.0, 1.0);
        float _2640 = -_2638;
        float _2642 = _2640 + 1.0;
        _2532 = _2642;
    }
    float _2644 = _2532;
    float _2646 = -_2496;
    float _2648 = _2646 + 1.0;
    out.m_87.x = _2528;
    out.m_87.y = _2530;
    out.m_87.z = _2526;
    out.m_87.w = _2169;
    float _2650 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2652 = -_2247;
    float _2654 = _2652 + 1.0;
    float _2656 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.x = _2514;
    out.m_89.y = _2520;
    out.m_89.z = _2522;
    float _2658 = _2654 * _2650;
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = _2656 * _2265;
    out.m_91.x = _1925;
    out.m_91.y = _1921;
    out.m_91.z = _1929;
    bool _2664 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2666 = isnan(_1965);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2672 = _2668 || _2670;
    float _2674 = -_2660;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2678 = _2276 * _2662;
    float _2680 = _2286 * _2662;
    float _2682 = -_2656;
    float _2684 = _2682 + 1.0;
    float _2686 = fma(_2282, _2678, _2270);
    float _2688 = fma(_2284, _2678, _2272);
    float _2690 = fma(_2276, _2680, _2274);
    float _2692 = _2276 * _2684;
    float _2694 = _2676 * _2472;
    float _2696 = _2590 * _2644;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2508;
    out.gl_Position.w = _2169;
    float _2698 = _2694;
    float _2700 = _2696;
    if (!_2672)
    {
        _2534 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2702 = _2534;
    float _2704 = _2694 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2706 = _2704;
    float _2708 = _2702;
    float _2710 = _2702;
    if (!_2672)
    {
        _2698 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2712 = _2698;
    out.m_93.x = _2686;
    out.m_93.y = _2688;
    out.m_93.z = _2690;
    out.m_93.w = _2692;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2672)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2536;
    out.m_95.x = _2704;
    float _2720 = _2696 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2722 = _2718;
    float _2724 = _2718;
    if (!_2672)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2726 = _2394;
    float _2728 = _2726;
    float _2730 = _2726;
    if (!_2672)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2732 = _2706;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2672)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2738 = _2700;
    bool _2740 = !_2672;
    float _2742 = _2738;
    float _2744 = _2738;
    if (!_2740)
    {
        bool _2746 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2748 = isnan(_1965);
        bool _2750 = _2746 || _2748;
        bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2754 = _2750 || _2752;
        if (!_2754)
        {
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2758 = _1965 + _2756;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2762 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2760;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2768 = 1.0 / _2762;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2786 = _2758 * _2768;
            float _2788 = precise::clamp(_2786, 0.0, 1.0);
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2794 = fma(_2788, _2766, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2796 = fma(_2788, _2792, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2798 = fma(_2788, _2772, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2800 = fma(_2788, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2802 = fma(_2788, _2780, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2804 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2730 = _2798;
            _2736 = _2802;
            _2716 = _2794;
            _2724 = _2800;
            _2710 = _2796;
            _2744 = _2804;
            _2806 = true;
        }
        else
        {
            bool _2808 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2810 = isnan(_1965);
            bool _2812 = _2808 || _2810;
            bool _2814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2816 = _2812 || _2814;
            if (!_2816)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2818 = _2714;
            _2716 = _2818;
            if (!_2816)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2820 = _2728;
            _2730 = _2820;
            if (!_2816)
            {
                _2708 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2822 = _2708;
            _2710 = _2822;
            if (!_2816)
            {
                _2722 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2824 = _2722;
            _2724 = _2824;
            if (!_2816)
            {
                _2734 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2826 = _2734;
            _2736 = _2826;
            if (!_2816)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2828 = _2742;
            bool _2830 = !_2816;
            _2744 = _2828;
            if (!_2830)
            {
                bool _2832 = _1965 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2834 = isnan(_1965);
                bool _2836 = _2832 || _2834;
                bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2840 = _2836 || _2838;
                if (!_2840)
                {
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2844 = _1965 + _2842;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2846;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2854 = 1.0 / _2848;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2872 = _2844 * _2854;
                    float _2874 = precise::clamp(_2872, 0.0, 1.0);
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2880 = fma(_2874, _2852, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2730 = _2884;
                    _2736 = _2888;
                    _2716 = _2880;
                    _2724 = _2886;
                    _2710 = _2882;
                    _2744 = _2890;
                    _2806 = true;
                }
                else
                {
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2736 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2724 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2710 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2806 = false;
    float _2892 = _2730;
    float _2894 = _2736;
    float _2896 = _2716;
    float _2898 = _2724;
    float _2900 = _2710;
    float _2902 = _2744;
    float _2904 = fma(_2520, -0.5, 0.5);
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = -_2892;
    float _2910 = _2908 + _2894;
    float _2912 = _2720 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2914 = -_2896;
    float _2916 = _2914 + _2898;
    float _2918 = fma(_2906, _2910, _2892);
    out.m_97.x = 0.0;
    float _2920 = -_2900;
    float _2922 = _2920 + _2902;
    float _2924 = fma(_2906, _2916, _2896);
    float _2926 = _2918 * 0.586610972881317138671875;
    out.m_53.x = _2912;
    bool _2928 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2930 = fma(_2906, _2922, _2900);
    float _2932 = fma(_2924, 0.298911988735198974609375, _2926);
    bool _2934 = _2590 > 0.0;
    bool _2936 = isnan(_2590);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.0);
    bool _2942 = _2938 || _2940;
    float _2944 = fma(_2930, 0.114477999508380889892578125, _2932);
    bool _2946 = _2644 <= 0.0;
    bool _2948 = !_2942;
    bool _2950 = _2946 || _2948;
    float _2952 = -_2944;
    float _2954 = _2924 + _2952;
    float _2956 = -_2944;
    float _2958 = _2918 + _2956;
    float _2960 = -_2944;
    float _2962 = _2930 + _2960;
    float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    float _2966 = fma(_2958, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    float _2968 = fma(_2962, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2944);
    bool _2970 = !_2928;
    if (!_2970)
    {
        float _2972 = -_1921;
        float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2976 = -_1925;
        float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2980 = -_1929;
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2984 = _2974 * _2974;
        float _2986 = fma(_2978, _2978, _2984);
        float _2988 = fma(_2982, _2982, _2986);
        float _2990 = sqrt(_2988);
        float _2992 = rsqrt(_2988);
        float _2994 = -_2990;
        float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = _2978 * _2992;
        float _3004 = _2974 * _2992;
        float _3006 = abs(_3000);
        float _3008 = log2(_3006);
        float _3010 = _2982 * _2992;
        float _3012 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3014 = _2520 * _3004;
        float _3016 = -_3004;
        float _3018 = -_3012;
        float _3020 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3018);
        float _3022 = fma(_2514, _3002, _3014);
        float _3024 = -_3010;
        float _3026 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3020);
        float _3028 = fma(_2522, _3010, _3022);
        float _3030 = precise::clamp(_3028, 0.0, 1.0);
        float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3034 = _3026 + _3032;
        float _3036 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3038 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = exp2(_3036);
        float _3044 = _3042 * _3040;
        float _3046 = _3030 * _3044;
        float _3048 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3050 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3052 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3048;
        out.m_97.y = _3050;
        out.m_97.z = _3052;
    }
    out.m_67.x = _2964;
    out.m_67.y = _2966;
    out.m_67.z = _2968;
    if (!_2950)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3054 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3054;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

